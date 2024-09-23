@implementation RTLifeCycleManager

- (RTLifeCycleManager)init
{
  RTLifeCycleManager *v2;
  RTLifeCycleManager *v3;
  RTLifeCycleManager *v4;
  NSObject *v5;
  const char *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableArray *signals;
  uint64_t v12;
  NSMutableDictionary *listeners;
  uint64_t v14;
  NSMutableSet *services;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)RTLifeCycleManager;
  v2 = -[RTLifeCycleManager init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (const char *)-[RTLifeCycleManager UTF8String](objc_retainAutorelease(v4), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v4);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = (const char *)objc_msgSend(v7, "UTF8String");

    }
    v8 = dispatch_queue_create(v6, v5);

    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_opt_new();
    signals = v4->_signals;
    v4->_signals = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    listeners = v4->_listeners;
    v4->_listeners = (NSMutableDictionary *)v12;

    v14 = objc_opt_new();
    services = v4->_services;
    v4->_services = (NSMutableSet *)v14;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray enumerateObjectsUsingBlock:](self->_signals, "enumerateObjectsUsingBlock:", &__block_literal_global_12);
  v3.receiver = self;
  v3.super_class = (Class)RTLifeCycleManager;
  -[RTLifeCycleManager dealloc](&v3, sel_dealloc);
}

void __29__RTLifeCycleManager_dealloc__block_invoke(int a1, dispatch_source_t source)
{
  if (source)
    dispatch_source_cancel(source);
}

- (id)createSourceForSignal:(int)a3 withBlock:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  signal(a3, (void (__cdecl *)(int))1);
  v6 = dispatch_source_create(MEMORY[0x1E0C80DC0], a3, 0, MEMORY[0x1E0C80D38]);
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);
  return v6;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[RTLifeCycleManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__RTLifeCycleManager_start__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __27__RTLifeCycleManager_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)addService:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTLifeCycleManager watchdogManager](self, "watchdogManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[RTLifeCycleManager addService:]";
      v14 = 1024;
      v15 = 203;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.watchdogManager (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }

  }
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RTLifeCycleManager services](self, "services");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsObject:", v4);

      if (v8)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v12 = 136315394;
          v13 = "-[RTLifeCycleManager addService:]";
          v14 = 1024;
          v15 = 205;
          _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Service already added to services set. (in %s:%d)", (uint8_t *)&v12, 0x12u);
        }

      }
      -[RTLifeCycleManager services](self, "services");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v4);

      -[RTLifeCycleManager watchdogManager](self, "watchdogManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v4);

    }
  }

}

- (void)addListener:(id)a3 machPort:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RTLifeCycleManager listeners](self, "listeners");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, v6);

      -[RTLifeCycleManager watchdogManager](self, "watchdogManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

- (id)serviceWithClass:(Class)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[RTLifeCycleManager services](self, "services", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = v8;
            goto LABEL_15;
          }
        }
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: serviceClass", buf, 2u);
    }
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)submitUptimeMetricsWithDefaultsMananger:(id)a3
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
  double v14;
  double v15;
  double v16;
  double v17;
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
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("LastLaunchDate"), "stringByAppendingPathExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("LastExitDate"), "stringByAppendingPathExtension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = v11;
    else
      v12 = v3;
    if (v11)
      v13 = v11;
    else
      v13 = v7;
    objc_msgSend(v12, "timeIntervalSinceDate:", v7);
    v15 = v14;
    objc_msgSend(v3, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "processName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("processName"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("processUptime"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("durationSincePreviousLaunch"));

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("previousExitWasUnclean"));

    }
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    v25 = (void *)objc_msgSend(v24, "initWithCString:encoding:", RTAnalyticsEventProcessUptime, 1);
    log_analytics_submission(v25, v18);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "processName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("LastLaunchDate"), "stringByAppendingPathExtension:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKey:", v3, v29);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "processName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("LastExitDate"), "stringByAppendingPathExtension:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKey:", 0, v32);

}

- (void)_start
{
  NSObject *v3;
  void *v4;
  RTDefaultsManager *v5;
  RTWatchdogManager *v6;
  RTWatchdogManager *watchdogManager;
  NSObject *v8;
  void *v9;
  void *v10;
  RTWiFiManager *v11;
  RTLocationStore *v12;
  RTLocationManager *v13;
  void *v14;
  RTTripSegmentInertialDataStore *v15;
  RTTripSegmentInertialDataManager *v16;
  RTBackgroundInertialOdometryStore *v17;
  RTBackgroundInertialOdometryManager *v18;
  RTMapServiceManager *v19;
  uint64_t v20;
  RTContactsManager *v21;
  RTBuildingPolygonManager *v22;
  RTMapsSupportManager *v23;
  RTVehicleStore *v24;
  RTMotionActivityManager *v25;
  RTStarkManager *v26;
  RTBatteryManager *v27;
  NSObject *v28;
  const char *v29;
  id v30;
  dispatch_queue_t v31;
  RTBluetoothManager *v32;
  RTWalletManager *v33;
  RTNavigationManager *v34;
  uint64_t v35;
  RTEventManager *v36;
  RTVisitStore *v37;
  RTFingerprintStore *v38;
  RTFingerprintManager *v39;
  void *v40;
  RTLearnedLocationStore *v41;
  RTPersistenceExpirationEnforcer *v42;
  void *v43;
  void *v44;
  char v45;
  RTLocationAwarenessManager *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  RTPlaceInferenceQueryStore *v50;
  NSObject *v51;
  const char *v52;
  id v53;
  RTPlaceInferenceManager *v54;
  RTLearnedPlaceTypeInferenceStore *v55;
  NSObject *v56;
  const char *v57;
  id v58;
  RTLearnedLocationManager *v59;
  RTVehicleLocationProvider *v60;
  void *v61;
  RTEventModelProvider *v62;
  NSObject *v63;
  const char *v64;
  id v65;
  RTDeviceLocationPredictor *v66;
  RTHintManager *v67;
  RTAppClipManager *v68;
  RTPointOfInterestMonitor *v69;
  RTVisitManager *v70;
  RTAuthorizedLocationManager *v71;
  void *v72;
  RTHealthKitManager *v73;
  id v74;
  RTElevationManager *v75;
  RTElevationAdjuster *v76;
  RTTripSegmentManager *v77;
  RTEventAgentManager *v78;
  RTDeviceMetricManager *v79;
  RTBiomeManager *v80;
  RTPointOfInterestSampler *v81;
  void *v82;
  RTPointOfInterestMetricsManager *v83;
  void *v84;
  RTLearnedLocationEngine *v85;
  RTIntermittentGNSSManager *v86;
  RTWorkoutDistanceStore *v87;
  RTWorkoutRouteManager *v88;
  RTWorkoutScheduler *v89;
  RTProximityEventStore *v90;
  RTPeopleDensityStore *v91;
  RTPeopleDiscoveryProvider *v92;
  void *v93;
  RTNetworkOfInterestManager *v94;
  SMMessagingService *v95;
  SMSafetyCacheStore *v96;
  void *v97;
  SMSessionStore *v98;
  id v99;
  NSObject *v100;
  const char *v101;
  id v102;
  dispatch_queue_t v103;
  id v104;
  NSObject *v105;
  const char *v106;
  id v107;
  dispatch_queue_t v108;
  RTLocationManager *v109;
  void *v110;
  SMSuggestionsStore *v111;
  SMSuggestionsHelper *v112;
  SMSuggestionsManager *v113;
  SMInitiatorService *v114;
  SMReceiverService *v115;
  SMClientListener *v116;
  RTPurgeManager *v117;
  RTLocationContextManager *v118;
  void *v119;
  RTLocationContextManager *v120;
  RTClientListener *v121;
  void *v122;
  RTClientListener *v123;
  RTClientListenerInternal *v124;
  NSObject *v125;
  id v126;
  void *v127;
  uint64_t v128;
  SMClientListener *v129;
  RTLearnedLocationEngine *v130;
  RTDeviceMetricManager *v131;
  RTPredictedLocationOfInterestProviderVehicleLocation *v132;
  RTWorkoutScheduler *v134;
  void *v135;
  void *v136;
  SMReceiverService *v137;
  void *v138;
  void *v139;
  RTNetworkOfInterestManager *v140;
  RTPeopleDensityStore *v141;
  RTProximityEventStore *v142;
  id v143;
  RTWorkoutDistanceStore *v144;
  RTWorkoutMetricsManager *v145;
  RTDailyTrainingSessionCounter *v146;
  RTTransitMetricManager *v147;
  RTTripSegmentProvider *v148;
  RTSynthesizedLocationStore *v149;
  RTTripSegmentStore *v150;
  RTElevationProvider *v151;
  RTElevationStore *v152;
  RTLearnedLocationReconcilerPerVisit *v153;
  RTLearnedLocationReconcilerPerDevice *v154;
  RTAuthorizedLocationVisitLogStore *v155;
  RTPointOfInterestMonitor *v156;
  RTAppClipManager *v157;
  void *v158;
  RTPredictedLocationOfInterestProviderMaps *v159;
  RTPredictedLocationOfInterestProviderCalendar *v160;
  RTPredictedLocationOfInterestProviderStateModel *v161;
  RTNextPredictedLocationsOfInterestCache *v162;
  RTHintStore *v163;
  void *v164;
  RTWalletManager *v165;
  RTBluetoothManager *v166;
  RTInferredMapItemFuser *v167;
  RTFingerprintStore *v168;
  RTWiFiFootprintMonitor *v169;
  RTBackgroundInertialOdometryStore *v170;
  RTTripSegmentInertialDataStore *v171;
  void *v172;
  void *v173;
  void *v174;
  RTAssetProcessor *v175;
  RTLocationAwarenessManager *v176;
  RTIntermittentGNSSManager *v177;
  RTEventAgentManager *v178;
  RTWorkoutRouteManager *v179;
  RTPointOfInterestSampler *v180;
  RTElevationAdjuster *v181;
  RTTripSegmentInertialDataManager *v182;
  RTBuildingPolygonManager *v183;
  RTXPCActivityManager *v184;
  SMSuggestionsStore *v185;
  void *v186;
  RTBiomeManager *v187;
  RTPointOfInterestMetricsManager *v188;
  RTStarkManager *v189;
  RTLearnedPlaceTypeInferenceStore *v190;
  RTVisitLabeler *v191;
  dispatch_queue_t v192;
  void *v193;
  RTSettledStateTransitionStore *v194;
  void *v195;
  void *v196;
  RTTripSegmentManager *v197;
  RTAuthorizedLocationManager *v198;
  RTBackgroundInertialOdometryManager *v199;
  RTAssetManager *v200;
  NSObject *v201;
  NSObject *object;
  RTPeopleDiscoveryProvider *v203;
  RTHintManager *v204;
  RTEventModelProvider *v205;
  RTVehicleStore *v206;
  RTPlaceInferenceQueryStore *v207;
  SMMessagingService *v208;
  SMSessionStore *v209;
  RTLocationManager *v210;
  RTElevationManager *v211;
  RTVisitStore *v212;
  RTEventManager *v213;
  RTMapsSupportManager *v214;
  RTReachabilityManager *v215;
  RTPersistenceDriver *v216;
  void *v217;
  SMSafetyCacheStore *v218;
  RTScenarioTriggerManager *v219;
  RTLocationStore *v220;
  RTNavigationManager *v221;
  RTBatteryManager *v222;
  RTDeviceLocationPredictor *v223;
  RTFingerprintManager *v224;
  RTAccountManager *v225;
  RTHealthKitManager *v226;
  RTPlaceInferenceManager *v227;
  RTPersistenceMirroringManager *v228;
  RTWiFiManager *v229;
  RTContactsManager *v230;
  RTVehicleLocationProvider *v231;
  RTVisitManager *v232;
  RTXPCActivityManager *v233;
  RTDataProtectionManager *v234;
  RTMetricManager *v235;
  RTDiagnostics *v236;
  RTAuthorizationManager *v237;
  RTMotionActivityManager *v238;
  RTLearnedLocationStore *v239;
  RTMapServiceManager *v240;
  RTLearnedLocationManager *v241;
  RTLocationManager *v242;
  void *v243;
  void *v244;
  void *v245;
  _QWORD v246[4];
  id v247;
  id location;
  uint8_t buf[4];
  id v250;
  __int16 v251;
  uint64_t v252;
  uint64_t v253;

  v253 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v250 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  +[RTPlatform currentPlatform](RTPlatform, "currentPlatform");
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(RTDefaultsManager);
  v6 = -[RTWatchdogManager initWithLifeCycleManager:defaultsManager:platform:]([RTWatchdogManager alloc], "initWithLifeCycleManager:defaultsManager:platform:", self, v5, v244);
  watchdogManager = self->_watchdogManager;
  self->_watchdogManager = v6;

  -[RTLifeCycleManager addService:](self, "addService:", v5);
  v215 = objc_alloc_init(RTReachabilityManager);
  -[RTLifeCycleManager addService:](self, "addService:", v215);
  -[RTLifeCycleManager submitUptimeMetricsWithDefaultsMananger:](self, "submitUptimeMetricsWithDefaultsMananger:", v5);
  v236 = -[RTDiagnostics initWithDefaultsManager:platform:]([RTDiagnostics alloc], "initWithDefaultsManager:platform:", v5, v244);
  -[RTDiagnostics addDiagnosticProvider:](v236, "addDiagnosticProvider:", v5);
  -[RTLifeCycleManager addService:](self, "addService:", v236);
  -[RTDiagnostics logProcessDiagnosticInformation](v236, "logProcessDiagnosticInformation");
  v233 = -[RTXPCActivityManager initWithDefaultsManager:diagnostics:identifier:]([RTXPCActivityManager alloc], "initWithDefaultsManager:diagnostics:identifier:", v5, v236, CFSTR("Default"));
  v235 = -[RTMetricManager initWithPlatform:xpcActivityManager:]([RTMetricManager alloc], "initWithPlatform:xpcActivityManager:", v244, v233);
  -[RTLifeCycleManager addService:](self, "addService:", v235);
  v175 = -[RTAssetProcessor initWithDefaultsManager:]([RTAssetProcessor alloc], "initWithDefaultsManager:", v5);
  v200 = -[RTAssetManager initWithDefaultsManager:assetProcessor:xpcActivityManager:]([RTAssetManager alloc], "initWithDefaultsManager:assetProcessor:xpcActivityManager:", v5, v175, v233);
  -[RTLifeCycleManager addService:](self, "addService:", v200);
  -[RTLifeCycleManager addService:](self, "addService:", v233);
  v225 = -[RTAccountManager initWithLifecycleManager:defaultsManager:]([RTAccountManager alloc], "initWithLifecycleManager:defaultsManager:", self, v5);
  -[RTLifeCycleManager addService:](self, "addService:", v225);
  v174 = (void *)objc_opt_new();
  v173 = (void *)objc_opt_new();
  v234 = -[RTDataProtectionManager initWithKeybagMonitor:notificationHelper:]([RTDataProtectionManager alloc], "initWithKeybagMonitor:notificationHelper:", v174, v173);
  -[RTLifeCycleManager addService:](self, "addService:", v234);
  v172 = (void *)objc_opt_new();
  v237 = -[RTAuthorizationManager initWithPlatform:userSessionMonitor:]([RTAuthorizationManager alloc], "initWithPlatform:userSessionMonitor:", v244, v172);
  -[RTLifeCycleManager addService:](self, "addService:", v237);
  v217 = (void *)objc_opt_new();
  -[RTLifeCycleManager addService:](self, "addService:", v217);
  -[RTDiagnostics addDiagnosticProvider:](v236, "addDiagnosticProvider:", v217);
  v245 = (void *)objc_opt_new();
  v216 = -[RTPersistenceDriver initWithPersistenceManager:dataProtectionManager:accountManager:platform:keychainManager:defaultsManager:lifecycleManager:]([RTPersistenceDriver alloc], "initWithPersistenceManager:dataProtectionManager:accountManager:platform:keychainManager:defaultsManager:lifecycleManager:", v245, v234, v225, v244, v217, v5, self);
  v228 = -[RTPersistenceMirroringManager initWithAccountManager:defaultsManager:persistenceManager:platform:reachabilityManager:xpcActivityManager:]([RTPersistenceMirroringManager alloc], "initWithAccountManager:defaultsManager:persistenceManager:platform:reachabilityManager:xpcActivityManager:", v225, v5, v245, v244, v215, v233);
  objc_msgSend(v245, "setDelegate:", v216);
  objc_msgSend(v245, "setMirroringDelegate:", v228);
  if ((objc_msgSend(v245, "initializeContainer") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "persistence failed to setup.", buf, 2u);
    }

    -[RTLifeCycleManager exit](self, "exit");
  }
  -[RTPersistenceDriver start](v216, "start");
  -[RTLifeCycleManager addService:](self, "addService:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v216);
  -[RTLifeCycleManager addService:](self, "addService:", v228);
  -[RTDiagnostics addDiagnosticProvider:](v236, "addDiagnosticProvider:", v245);
  -[RTDiagnostics addDiagnosticProvider:](v236, "addDiagnosticProvider:", v228);
  objc_initWeak(&location, self);
  -[RTLifeCycleManager signals](self, "signals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v246[0] = MEMORY[0x1E0C809B0];
  v246[1] = 3221225472;
  v246[2] = __28__RTLifeCycleManager__start__block_invoke;
  v246[3] = &unk_1E92983E8;
  objc_copyWeak(&v247, &location);
  -[RTLifeCycleManager createSourceForSignal:withBlock:](self, "createSourceForSignal:withBlock:", 15, v246);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  v11 = objc_alloc_init(RTWiFiManager);
  -[RTLifeCycleManager addService:](self, "addService:", v11);
  v229 = v11;
  v12 = -[RTLocationStore initWithPersistenceManager:]([RTLocationStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v12);
  v220 = v12;
  v195 = (void *)objc_opt_new();
  v196 = (void *)objc_opt_new();
  v13 = [RTLocationManager alloc];
  v14 = (void *)objc_opt_new();
  v242 = -[RTLocationManager initWithAuthorizationManager:defaultsManager:locationSmoother:locationStore:platform:routineLocationManager:timerManager:](v13, "initWithAuthorizationManager:defaultsManager:locationSmoother:locationStore:platform:routineLocationManager:timerManager:", v237, v5, v195, v220, v244, v196, v14);

  -[RTLifeCycleManager addService:](self, "addService:", v242);
  v15 = -[RTTripSegmentInertialDataStore initWithPersistenceManager:]([RTTripSegmentInertialDataStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v15);
  v171 = v15;
  v16 = -[RTTripSegmentInertialDataManager initWithInertialDataStore:routineLocationManager:]([RTTripSegmentInertialDataManager alloc], "initWithInertialDataStore:routineLocationManager:", v15, v196);
  -[RTLifeCycleManager addService:](self, "addService:", v16);
  v182 = v16;
  v17 = -[RTBackgroundInertialOdometryStore initWithPersistenceManager:]([RTBackgroundInertialOdometryStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v17);
  v170 = v17;
  v18 = -[RTBackgroundInertialOdometryManager initWithBackgroundInertialOdometryStore:]([RTBackgroundInertialOdometryManager alloc], "initWithBackgroundInertialOdometryStore:", v17);
  -[RTLifeCycleManager addService:](self, "addService:", v18);
  v199 = v18;
  v19 = objc_alloc_init(RTMapServiceManager);
  -[RTLifeCycleManager addService:](self, "addService:", v19);
  v240 = v19;
  v20 = objc_opt_new();
  -[RTLifeCycleManager addService:](self, "addService:", v20);
  v243 = (void *)v20;
  v21 = -[RTContactsManager initWithDataProtectionManager:mapServiceManager:distanceCalculator:]([RTContactsManager alloc], "initWithDataProtectionManager:mapServiceManager:distanceCalculator:", v234, v240, v20);
  -[RTLifeCycleManager addService:](self, "addService:", v21);
  v230 = v21;
  v22 = -[RTBuildingPolygonManager initWithDistanceCalculator:MapServiceManager:]([RTBuildingPolygonManager alloc], "initWithDistanceCalculator:MapServiceManager:", v243, v240);
  -[RTLifeCycleManager addService:](self, "addService:", v22);
  v183 = v22;
  v23 = -[RTMapsSupportManager initWithMapServiceManager:]([RTMapsSupportManager alloc], "initWithMapServiceManager:", v240);
  -[RTLifeCycleManager addService:](self, "addService:", v23);
  v214 = v23;
  v24 = -[RTVehicleStore initWithPersistenceManager:]([RTVehicleStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v24);
  v206 = v24;
  v25 = -[RTMotionActivityManager initWithPlatform:vehicleStore:]([RTMotionActivityManager alloc], "initWithPlatform:vehicleStore:", v244, v24);
  -[RTLifeCycleManager addService:](self, "addService:", v25);
  v238 = v25;
  v26 = -[RTStarkManager initWithDefaultsManager:]([RTStarkManager alloc], "initWithDefaultsManager:", v5);
  -[RTLifeCycleManager addService:](self, "addService:", v26);
  v189 = v26;
  v27 = [RTBatteryManager alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = (const char *)objc_msgSend(CFSTR("BatteryManager"), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), CFSTR("BatteryManager"));
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = (const char *)objc_msgSend(v30, "UTF8String");

  }
  v31 = dispatch_queue_create(v29, v28);

  v222 = -[RTBatteryManager initWithQueue:](v27, "initWithQueue:", v31);
  -[RTLifeCycleManager addService:](self, "addService:", v222);
  v32 = objc_alloc_init(RTBluetoothManager);
  -[RTLifeCycleManager addService:](self, "addService:", v32);
  v166 = v32;
  v33 = -[RTWalletManager initWithDefaultsManager:]([RTWalletManager alloc], "initWithDefaultsManager:", v5);
  -[RTLifeCycleManager addService:](self, "addService:", v33);
  v165 = v33;
  v34 = -[RTNavigationManager initWithAuthorizationManager:mapServiceManager:]([RTNavigationManager alloc], "initWithAuthorizationManager:mapServiceManager:", v237, v240);
  -[RTLifeCycleManager addService:](self, "addService:", v34);
  v221 = v34;
  v35 = objc_opt_new();
  -[RTLifeCycleManager addService:](self, "addService:", v35);
  v164 = (void *)v35;
  v36 = objc_alloc_init(RTEventManager);
  -[RTLifeCycleManager addService:](self, "addService:", v36);
  v213 = v36;
  v37 = -[RTStore initWithPersistenceManager:]([RTVisitStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v37);
  v212 = v37;
  v194 = -[RTStore initWithPersistenceManager:]([RTSettledStateTransitionStore alloc], "initWithPersistenceManager:", v245);
  v169 = -[RTWiFiFootprintMonitor initWithWiFiManager:]([RTWiFiFootprintMonitor alloc], "initWithWiFiManager:", v229);
  v219 = -[RTScenarioTriggerManager initWithLocationStore:motionActivityManager:settledStateTransitionStore:wifiFootprintMonitor:platform:]([RTScenarioTriggerManager alloc], "initWithLocationStore:motionActivityManager:settledStateTransitionStore:wifiFootprintMonitor:platform:", v220, v238, v194, v169, v244);
  v38 = -[RTStore initWithPersistenceManager:]([RTFingerprintStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v38);
  v168 = v38;
  v39 = [RTFingerprintManager alloc];
  v40 = (void *)objc_opt_new();
  v224 = -[RTFingerprintManager initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:](v39, "initWithDefaultsManager:fingerprintStore:scenarioTriggerManager:timerManager:wifiManager:", v5, v168, v219, v40, v229);

  -[RTLifeCycleManager addService:](self, "addService:", v224);
  v41 = [RTLearnedLocationStore alloc];
  v42 = -[RTPersistenceExpirationEnforcer initWithPersistenceManager:]([RTPersistenceExpirationEnforcer alloc], "initWithPersistenceManager:", v245);
  v239 = -[RTLearnedLocationStore initWithDistanceCalculator:expirationEnforcer:mirroringManager:](v41, "initWithDistanceCalculator:expirationEnforcer:mirroringManager:", v243, v42, v228);

  -[RTLifeCycleManager addService:](self, "addService:", v239);
  objc_msgSend(v244, "productType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "isEqualToString:", CFSTR("Watch1,1")))
  {

LABEL_13:
    v176 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v244, "productType");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("Watch1,2"));

  if ((v45 & 1) != 0)
    goto LABEL_13;
  v46 = [RTLocationAwarenessManager alloc];
  v47 = (void *)objc_opt_new();
  v48 = (void *)objc_opt_new();
  v176 = -[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizationManager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:](v46, "initWithLocationManager:config:metricManager:motionActivityManager:authorizationManager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:", v242, v47, v235, v238, v237, v229, v233, v48, v239);

  -[RTLifeCycleManager addService:](self, "addService:", v176);
LABEL_15:
  v167 = -[RTInferredMapItemFuser initWithDefaultsManager:distanceCalculator:learnedLocationStore:]([RTInferredMapItemFuser alloc], "initWithDefaultsManager:distanceCalculator:learnedLocationStore:", v5, v243, v239);
  v49 = objc_opt_new();
  -[RTLifeCycleManager addService:](self, "addService:", v49);
  v193 = (void *)v49;
  v50 = -[RTStore initWithPersistenceManager:]([RTPlaceInferenceQueryStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v50);
  v207 = v50;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = (const char *)objc_msgSend(CFSTR("placeInferenceManagerQueue"), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), CFSTR("placeInferenceManagerQueue"));
    v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v52 = (const char *)objc_msgSend(v53, "UTF8String");

  }
  object = dispatch_queue_create(v52, v51);

  dispatch_suspend(object);
  v54 = -[RTPlaceInferenceManager initWithQueue:defaultsManager:distanceCalculator:eventManager:fingerprintManager:inferredMapItemFuser:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:portraitManager:visitStore:]([RTPlaceInferenceManager alloc], "initWithQueue:defaultsManager:distanceCalculator:eventManager:fingerprintManager:inferredMapItemFuser:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:portraitManager:visitStore:", object, v5, v243, v213, v224, v167, v239, v242, v240, v214, v235, v238, v207, v244, v193,
          v212);
  -[RTLifeCycleManager addService:](self, "addService:", v54);
  v227 = v54;
  v55 = -[RTLearnedPlaceTypeInferenceStore initWithPersistenceManager:learnedLocationStore:]([RTLearnedPlaceTypeInferenceStore alloc], "initWithPersistenceManager:learnedLocationStore:", v245, v239);
  -[RTLifeCycleManager addService:](self, "addService:", v55);
  v190 = v55;
  v191 = -[RTVisitLabeler initWithDefaultsManager:placeInferenceManager:locationManager:wifiManager:]([RTVisitLabeler alloc], "initWithDefaultsManager:placeInferenceManager:locationManager:wifiManager:", v5, v227, v242, v229);
  v154 = -[RTLearnedLocationReconcilerPerDevice initWithPersistenceManager:]([RTLearnedLocationReconcilerPerDevice alloc], "initWithPersistenceManager:", v245);
  v153 = -[RTLearnedLocationReconcilerPerVisit initWithPersistenceManager:defaultsManager:]([RTLearnedLocationReconcilerPerVisit alloc], "initWithPersistenceManager:defaultsManager:", v245, v5);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = (const char *)objc_msgSend(CFSTR("RTLearnedLocationManager"), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), CFSTR("RTLearnedLocationManager"));
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v57 = (const char *)objc_msgSend(v58, "UTF8String");

  }
  v201 = dispatch_queue_create(v57, v56);

  dispatch_suspend(v201);
  v59 = -[RTLearnedLocationManager initWithQueue:contactsManager:distanceCalculator:learnedLocationStore:learnedPlaceTypeInferenceStore:mapServiceManager:]([RTLearnedLocationManager alloc], "initWithQueue:contactsManager:distanceCalculator:learnedLocationStore:learnedPlaceTypeInferenceStore:mapServiceManager:", v201, v230, v243, v239, v190, v240);
  -[RTLifeCycleManager addService:](self, "addService:", v59);
  -[RTDiagnostics addDiagnosticProvider:](v236, "addDiagnosticProvider:", v59);
  v241 = v59;
  v163 = -[RTStore initWithPersistenceManager:]([RTHintStore alloc], "initWithPersistenceManager:", v245);
  v60 = [RTVehicleLocationProvider alloc];
  v61 = (void *)objc_opt_new();
  v231 = -[RTVehicleLocationProvider initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:managedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfiguration:defaultsManager:keychainManager:](v60, "initWithLocationManager:motionActivityManager:mapsSupportManager:metricManager:managedObjectContext:persistenceManager:vehicleLocationHistoryController:learnedLocationManager:managedConfiguration:defaultsManager:keychainManager:", v242, v238, v214, v235, 0, v245, 0, v241, v61, v5, v217);

  -[RTLifeCycleManager addService:](self, "addService:", v231);
  v62 = -[RTEventModelProvider initWithDefaultsManager:eventManager:learnedLocationManager:managedObjectContext:metricManager:persistenceManager:]([RTEventModelProvider alloc], "initWithDefaultsManager:eventManager:learnedLocationManager:managedObjectContext:metricManager:persistenceManager:", v5, v213, v241, 0, v235, v245);
  -[RTLifeCycleManager addService:](self, "addService:", v62);
  v205 = v62;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v63 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v64 = (const char *)objc_msgSend(CFSTR("RTDeviceLocationPredictor"), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), CFSTR("RTDeviceLocationPredictor"));
    v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v64 = (const char *)objc_msgSend(v65, "UTF8String");

  }
  v192 = dispatch_queue_create(v64, v63);

  v162 = -[RTNextPredictedLocationsOfInterestCache initWithQueue:dataProtectionManager:starkManager:]([RTNextPredictedLocationsOfInterestCache alloc], "initWithQueue:dataProtectionManager:starkManager:", v192, v234, v189);
  v161 = -[RTPredictedLocationOfInterestProviderStateModel initWithDataProtectionManager:learnedLocationManager:locationManager:metricManager:cache:]([RTPredictedLocationOfInterestProviderStateModel alloc], "initWithDataProtectionManager:learnedLocationManager:locationManager:metricManager:cache:", v234, v241, v242, v235, v162);
  v160 = -[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationManager:mapServiceManager:]([RTPredictedLocationOfInterestProviderCalendar alloc], "initWithEventManager:eventModelProvider:learnedLocationManager:mapServiceManager:", v213, v205, v241, v240);
  v159 = -[RTPredictedLocationOfInterestProviderMaps initWithMapsSupportManager:]([RTPredictedLocationOfInterestProviderMaps alloc], "initWithMapsSupportManager:", v214);
  v132 = -[RTPredictedLocationOfInterestProviderVehicleLocation initWithVehicleLocationProvider:distanceCalculator:]([RTPredictedLocationOfInterestProviderVehicleLocation alloc], "initWithVehicleLocationProvider:distanceCalculator:", v231, v243);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v160, v161, v159, v132, 0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[RTDeviceLocationPredictor initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocationManager:locationManager:mapServiceManager:metricManager:platform:providers:]([RTDeviceLocationPredictor alloc], "initWithQueue:authorizationManager:defaultsManager:distanceCalculator:learnedLocationManager:locationManager:mapServiceManager:metricManager:platform:providers:", v192, v237, v5, v243, v241, v242, v240, v235, v244, v158);
  -[RTLifeCycleManager addService:](self, "addService:", v66);
  v223 = v66;
  v67 = -[RTHintManager initWithBatteryManager:bluetoothManager:cameraManager:hintStore:learnedLocationManager:locationManager:metricManager:navigationManager:reachabilityManager:walletManager:]([RTHintManager alloc], "initWithBatteryManager:bluetoothManager:cameraManager:hintStore:learnedLocationManager:locationManager:metricManager:navigationManager:reachabilityManager:walletManager:", v222, v166, v164, v163, v241, v242, v235, v221, v215, v165);
  -[RTLifeCycleManager addService:](self, "addService:", v67);
  v204 = v67;
  v68 = -[RTAppClipManager initWithDistanceCalculator:]([RTAppClipManager alloc], "initWithDistanceCalculator:", v243);
  -[RTLifeCycleManager addService:](self, "addService:", v68);
  v157 = v68;
  v69 = -[RTPointOfInterestMonitor initWithAppClipManager:buildingPolygonManager:defaultsManager:distanceCalculator:learnedLocationManager:locationManager:mapServiceManager:motionActivityManager:navigationManager:platform:vehicleLocationProvider:visitLabeler:visitStore:]([RTPointOfInterestMonitor alloc], "initWithAppClipManager:buildingPolygonManager:defaultsManager:distanceCalculator:learnedLocationManager:locationManager:mapServiceManager:motionActivityManager:navigationManager:platform:vehicleLocationProvider:visitLabeler:visitStore:", v68, v183, v5, v243, v241, v242, v240, v238, v221, v244, v231, v191, v212);
  -[RTLifeCycleManager addService:](self, "addService:", v69);
  v156 = v69;
  v70 = -[RTVisitManager initWithDefaultsManager:deviceLocationPredictor:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:pointOfInterestMonitor:visitLabeler:visitStore:xpcActivityManager:]([RTVisitManager alloc], "initWithDefaultsManager:deviceLocationPredictor:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:pointOfInterestMonitor:visitLabeler:visitStore:xpcActivityManager:", v5, v223, v204, v241, v176, v242, v235, v238, v244, v69, v191, v212, v233);
  -[RTPlaceInferenceManager setVisitManager:](v227, "setVisitManager:", v70);
  v232 = v70;
  dispatch_resume(object);
  v155 = -[RTAuthorizedLocationVisitLogStore initWithPersistenceManager:]([RTAuthorizedLocationVisitLogStore alloc], "initWithPersistenceManager:", v245);
  v71 = [RTAuthorizedLocationManager alloc];
  +[RTPlatform currentPlatform](RTPlatform, "currentPlatform");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = -[RTAuthorizedLocationManager initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirroringManager:platform:authorizationManager:](v71, "initWithVisitManager:locationManager:distanceCalculator:learnedLocationManager:motionActivityManager:visitLogStore:defaultsManager:xpcActivityManager:dataProtectionManager:persistenceMirroringManager:platform:authorizationManager:", v232, v242, v243, v241, v238, v155, v5, v233, v234, v228, v72, v237);

  -[RTLifeCycleManager addService:](self, "addService:", v198);
  v73 = -[RTHealthKitManager initWithContactsManager:defaultsManager:distanceCalculator:platform:]([RTHealthKitManager alloc], "initWithContactsManager:defaultsManager:distanceCalculator:platform:", v230, v5, v243, v244);
  -[RTDiagnostics addDiagnosticProvider:](v236, "addDiagnosticProvider:", v73);
  v226 = v73;
  v152 = -[RTElevationStore initWithPersistenceManager:]([RTElevationStore alloc], "initWithPersistenceManager:", v245);
  if (objc_msgSend(MEMORY[0x1E0CA55E0], "isAbsoluteAltitudeAvailable")
    && objc_msgSend(v244, "iPhoneDevice")
    && objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"))
  {
    v74 = objc_alloc_init(MEMORY[0x1E0CA55E0]);
    v151 = -[RTElevationProvider initWithAltimeter:]([RTElevationProvider alloc], "initWithAltimeter:", v74);

  }
  else
  {
    v151 = 0;
  }
  v75 = -[RTElevationManager initWithElevationStore:elevationProvider:]([RTElevationManager alloc], "initWithElevationStore:elevationProvider:", v152, v151);
  -[RTLifeCycleManager addService:](self, "addService:", v75);
  v211 = v75;
  v76 = -[RTElevationAdjuster initWithElevationManager:]([RTElevationAdjuster alloc], "initWithElevationManager:", v75);
  -[RTLifeCycleManager addService:](self, "addService:", v76);
  v181 = v76;
  v150 = -[RTTripSegmentStore initWithPersistenceManager:]([RTTripSegmentStore alloc], "initWithPersistenceManager:", v245);
  v149 = -[RTSynthesizedLocationStore initWithPersistenceManager:]([RTSynthesizedLocationStore alloc], "initWithPersistenceManager:", v245);
  v77 = -[RTTripSegmentManager initWithTripSegmentStore:synthesizedLocationStore:defaultsManager:elevationAdjuster:learnedLocationStore:distanceCalculator:]([RTTripSegmentManager alloc], "initWithTripSegmentStore:synthesizedLocationStore:defaultsManager:elevationAdjuster:learnedLocationStore:distanceCalculator:", v150, v149, v5, v76, v239, v243);
  -[RTLifeCycleManager addService:](self, "addService:", v77);
  v197 = v77;
  v78 = -[RTEventAgentManager initWithPlatform:]([RTEventAgentManager alloc], "initWithPlatform:", v244);
  -[RTLifeCycleManager addService:](self, "addService:", v78);
  v178 = v78;
  if (+[RTTripSegmentProvider isTripSegmentGenerationSupportedOnPlatform:](RTTripSegmentProvider, "isTripSegmentGenerationSupportedOnPlatform:", v244))
  {
    v148 = -[RTTripSegmentProvider initWithLearnedLocationManager:locationManager:motionActivityManager:tripSegmentInertialDataManager:inertialOdometryManager:vehicleStore:tripSegmentManager:elevationAdjuster:distanceCalculator:defaultsManager:visitManager:]([RTTripSegmentProvider alloc], "initWithLearnedLocationManager:locationManager:motionActivityManager:tripSegmentInertialDataManager:inertialOdometryManager:vehicleStore:tripSegmentManager:elevationAdjuster:distanceCalculator:defaultsManager:visitManager:", v241, v242, v238, v182, v199, v206, v197, v181, v243, v5, v232);
  }
  else
  {
    v148 = 0;
  }
  v147 = -[RTTransitMetricManager initWithDefaultsManager:distanceCalculator:learnedLocationManager:learnedLocationStore:]([RTTransitMetricManager alloc], "initWithDefaultsManager:distanceCalculator:learnedLocationManager:learnedLocationStore:", v5, v243, v241, v239);
  v79 = -[RTDeviceMetricManager initWithDefaultsManager:motionActivityManager:reachabilityManager:]([RTDeviceMetricManager alloc], "initWithDefaultsManager:motionActivityManager:reachabilityManager:", v5, v238, v215);
  -[RTLifeCycleManager addService:](self, "addService:", v79);
  v131 = v79;
  v80 = -[RTBiomeManager initWithAuthorizationManager:dataProtectionManager:defaultsManager:learnedLocationManager:platform:]([RTBiomeManager alloc], "initWithAuthorizationManager:dataProtectionManager:defaultsManager:learnedLocationManager:platform:", v237, v234, v5, v241, v244);
  -[RTLifeCycleManager addService:](self, "addService:", v80);
  v187 = v80;
  v146 = -[RTDailyTrainingSessionCounter initWithDefaultsManager:]([RTDailyTrainingSessionCounter alloc], "initWithDefaultsManager:", v5);
  v81 = [RTPointOfInterestSampler alloc];
  v82 = (void *)objc_opt_new();
  v180 = -[RTPointOfInterestSampler initWithDefaultsManager:locationManager:placeInferenceManager:timerManager:wifiManager:](v81, "initWithDefaultsManager:locationManager:placeInferenceManager:timerManager:wifiManager:", v5, v242, v227, v82, v229);

  v83 = [RTPointOfInterestMetricsManager alloc];
  v84 = (void *)objc_opt_new();
  v188 = -[RTPointOfInterestMetricsManager initWithBatteryManager:defaultsManager:distanceCalculator:learnedLocationStore:locationManager:mapServiceManager:navigationManager:placeInferenceQueryStore:pointOfInterestSampler:scenarioTriggerManager:timerManager:visitManager:](v83, "initWithBatteryManager:defaultsManager:distanceCalculator:learnedLocationStore:locationManager:mapServiceManager:navigationManager:placeInferenceQueryStore:pointOfInterestSampler:scenarioTriggerManager:timerManager:visitManager:", v222, v5, v243, v239, v242, v240, v221, v207, v180, v219, v84, v232);

  -[RTLifeCycleManager addService:](self, "addService:", v188);
  v85 = -[RTLearnedLocationEngine initWithAccountManager:biomeManager:contactsManager:dailyTrainingSessionCounter:defaultsManager:diagnostics:distanceCalculator:elevationManager:eventManager:fingerprintManager:learnedLocationStore:learnedPlaceTypeInferenceStore:locationManager:locationStore:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:pointOfInterestMetricsManager:portraitManager:reconcilerPerVisit:reconcilerPerDevice:settledStateTransitionStore:transitMetricManager:tripSegmentProvider:visitManager:xpcActivityManager:]([RTLearnedLocationEngine alloc], "initWithAccountManager:biomeManager:contactsManager:dailyTrainingSessionCounter:defaultsManager:diagnostics:distanceCalculator:elevationManager:eventManager:fingerprintManager:learnedLocationStore:learnedPlaceTypeInferenceStore:locationManager:locationStore:mapServiceManager:mapsSupportManager:metricManager:motionActivityManager:placeInferenceQueryStore:platform:pointOfInterestMetricsManager:portraitManager:reconcilerPerVisit:reconcilerPerDevice:settledStateTransitionStore:transitMetricManager:tripSegmentProvider:visitManager:xpcActivityManager:", v225, v187, v230, v146, v5, v236, v243, v211, v213, v224, v239, v190, v242,
          v220,
          v240,
          v214,
          v235,
          v238,
          v207,
          v244,
          v188,
          v193,
          v153,
          v154,
          v194,
          v147,
          v148,
          v232,
          v233);
  -[RTLearnedLocationManager setLearnedLocationEngine:](v241, "setLearnedLocationEngine:", v85);
  v130 = v85;
  dispatch_resume(v201);
  v86 = -[RTIntermittentGNSSManager initWithDefaultsManager:learnedLocationManager:locationManager:motionActivityManager:platform:vehicleLocationProvider:wifiManager:]([RTIntermittentGNSSManager alloc], "initWithDefaultsManager:learnedLocationManager:locationManager:motionActivityManager:platform:vehicleLocationProvider:wifiManager:", v5, v241, v242, v238, v244, v231, v229);
  -[RTLifeCycleManager addService:](self, "addService:", v86);
  v177 = v86;
  v145 = objc_alloc_init(RTWorkoutMetricsManager);
  v87 = -[RTStore initWithPersistenceManager:]([RTWorkoutDistanceStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v87);
  v144 = v87;
  v88 = -[RTWorkoutRouteManager initWithDefaultsManager:distanceCalculator:healthKitManager:locationManager:mapServiceManager:platform:workoutDistanceStore:workoutMetricsManager:]([RTWorkoutRouteManager alloc], "initWithDefaultsManager:distanceCalculator:healthKitManager:locationManager:mapServiceManager:platform:workoutDistanceStore:workoutMetricsManager:", v5, v243, v226, v242, v240, v244, v87, v145);
  -[RTLifeCycleManager addService:](self, "addService:", v88);
  v179 = v88;
  v89 = -[RTWorkoutScheduler initWithBatteryManager:dataProtectionManager:workoutRouteManager:healthKitManager:locationManager:defaultsManager:platform:xpcActivityManager:]([RTWorkoutScheduler alloc], "initWithBatteryManager:dataProtectionManager:workoutRouteManager:healthKitManager:locationManager:defaultsManager:platform:xpcActivityManager:", v222, v234, v88, v226, v242, v5, v244, v233);
  -[RTLifeCycleManager addService:](self, "addService:", v89);
  v134 = v89;
  v143 = objc_alloc_init(MEMORY[0x1E0C9E3D0]);
  v90 = -[RTStore initWithPersistenceManager:]([RTProximityEventStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v90);
  v142 = v90;
  v91 = -[RTStore initWithPersistenceManager:]([RTPeopleDensityStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v91);
  v141 = v91;
  v92 = [RTPeopleDiscoveryProvider alloc];
  v93 = (void *)objc_opt_new();
  v203 = -[RTPeopleDiscoveryProvider initWithDefaultManager:proximityEventStore:peopleDensityStore:advertisementManager:dataProtectionManager:timerManager:](v92, "initWithDefaultManager:proximityEventStore:peopleDensityStore:advertisementManager:dataProtectionManager:timerManager:", v5, v142, v141, v143, v234, v93);

  -[RTLifeCycleManager addService:](self, "addService:", v203);
  v94 = objc_alloc_init(RTNetworkOfInterestManager);
  -[RTLifeCycleManager addService:](self, "addService:", v94);
  v140 = v94;
  v95 = objc_alloc_init(SMMessagingService);
  -[RTLifeCycleManager addService:](self, "addService:", v95);
  v208 = v95;
  v96 = [SMSafetyCacheStore alloc];
  v97 = (void *)objc_opt_new();
  v218 = -[SMSafetyCacheStore initWithPersistenceManager:timerManager:](v96, "initWithPersistenceManager:timerManager:", v245, v97);

  -[RTLifeCycleManager addService:](self, "addService:", v218);
  v98 = -[RTStore initWithPersistenceManager:]([SMSessionStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v98);
  v209 = v98;
  v99 = objc_alloc(MEMORY[0x1E0D8B938]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v100 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v101 = (const char *)objc_msgSend(CFSTR("SMEligibilityChecker"), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), CFSTR("SMEligibilityChecker"));
    v102 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v101 = (const char *)objc_msgSend(v102, "UTF8String");

  }
  v103 = dispatch_queue_create(v101, v100);

  v139 = (void *)objc_msgSend(v99, "initWithQueue:", v103);
  v104 = objc_alloc(MEMORY[0x1E0D8B928]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v105 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v106 = (const char *)objc_msgSend(CFSTR("SMDeviceConfigurationChecker"), "UTF8String");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), CFSTR("SMDeviceConfigurationChecker"));
    v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v106 = (const char *)objc_msgSend(v107, "UTF8String");

  }
  v108 = dispatch_queue_create(v106, v105);

  v186 = (void *)objc_msgSend(v104, "initWithQueue:", v108);
  v109 = [RTLocationManager alloc];
  v110 = (void *)objc_opt_new();
  v210 = -[RTLocationManager initWithAuthorizationManager:defaultsManager:locationSmoother:locationStore:platform:routineLocationManager:timerManager:effectiveLocationBundlePath:](v109, "initWithAuthorizationManager:defaultsManager:locationSmoother:locationStore:platform:routineLocationManager:timerManager:effectiveLocationBundlePath:", 0, v5, v195, v218, v244, 0, v110, *MEMORY[0x1E0D8BBB8]);

  -[RTLifeCycleManager addService:](self, "addService:", v210);
  v111 = -[RTStore initWithPersistenceManager:]([SMSuggestionsStore alloc], "initWithPersistenceManager:", v245);
  -[RTLifeCycleManager addService:](self, "addService:", v111);
  v185 = v111;
  v112 = -[SMSuggestionsHelper initWithAuthorizationManager:contactsManager:deviceLocationPredictor:distanceCalculator:healthKitManager:learnedLocationStore:learnedLocationManager:locationManager:mapServiceManager:navigationManager:sessionStore:]([SMSuggestionsHelper alloc], "initWithAuthorizationManager:contactsManager:deviceLocationPredictor:distanceCalculator:healthKitManager:learnedLocationStore:learnedLocationManager:locationManager:mapServiceManager:navigationManager:sessionStore:", v237, v230, v223, v243, v226, v239, v241, v210, v240, v221, v209);
  -[RTLifeCycleManager addService:](self, "addService:", v112);
  v113 = -[SMSuggestionsManager initWithAuthorizationManager:contactsManager:defaultsManager:deviceLocationPredictor:distanceCalculator:healthKitManager:learnedLocationStore:learnedLocationManager:locationManager:mapServiceManager:messagingService:motionActivityManager:navigationManager:platform:visitManager:sessionStore:suggestionsStore:suggestionsHelper:]([SMSuggestionsManager alloc], "initWithAuthorizationManager:contactsManager:defaultsManager:deviceLocationPredictor:distanceCalculator:healthKitManager:learnedLocationStore:learnedLocationManager:locationManager:mapServiceManager:messagingService:motionActivityManager:navigationManager:platform:visitManager:sessionStore:suggestionsStore:suggestionsHelper:", v237, v230, v5, v223, v243, v226, v239, v241, v210, v240, v208, v238, v221, v244, v232,
           v209,
           v111,
           v112);
  -[RTLifeCycleManager addService:](self, "addService:", v113);
  v184 = -[RTXPCActivityManager initWithDefaultsManager:diagnostics:identifier:]([RTXPCActivityManager alloc], "initWithDefaultsManager:diagnostics:identifier:", v5, v236, CFSTR("SafetyMonitor"));
  v138 = (void *)objc_opt_new();
  v114 = -[SMInitiatorService initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:]([SMInitiatorService alloc], "initWithDefaultsManager:contactsManager:locationManager:motionActivityManager:platform:messagingService:safetyCacheStore:sessionStore:dataProtectionManager:batteryManager:xpcActivityManager:networkOfInterestManager:authorizationManager:wristStateManager:vehicleLocationProvider:starkManager:suggestionsManager:suggestionsHelper:learnedLocationManager:healthKitManager:deviceConfigurationChecker:noMovementMonitor:biomeManager:", v5, v230, v210, v238, v244, v208, v218, v209, v234, v222, v184, v140, v237, 0,
           v231,
           v189,
           v113,
           v112,
           v241,
           v226,
           v186,
           v138,
           v187);
  -[RTLifeCycleManager addService:](self, "addService:", v114);
  v115 = -[SMReceiverService initWithDefaultsManager:platform:messagingService:safetyCacheStore:xpcActivityManager:]([SMReceiverService alloc], "initWithDefaultsManager:platform:messagingService:safetyCacheStore:xpcActivityManager:", v5, v244, v208, v218, v184);
  -[RTLifeCycleManager addService:](self, "addService:", v115);
  v137 = v115;
  v116 = -[SMClientListener initWithDefaultsManager:authorizationManager:distanceCalculator:platform:initiatorService:messagingService:receiverService:sessionStore:suggestionsManager:suggestionsHelper:suggestionsStore:eligibilityChecker:deviceConfigurationChecker:]([SMClientListener alloc], "initWithDefaultsManager:authorizationManager:distanceCalculator:platform:initiatorService:messagingService:receiverService:sessionStore:suggestionsManager:suggestionsHelper:suggestionsStore:eligibilityChecker:deviceConfigurationChecker:", v5, v237, v243, v244, v114, v208, v115, v209, v113, v112, v185, v139, v186);
  -[RTLifeCycleManager addListener:machPort:](self, "addListener:machPort:", v116, *MEMORY[0x1E0D8BBC0]);
  v129 = v116;
  v136 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v204, v223, v211, v205, v224, v182, v199, v242, v241, v219, v232, v227, v231, v228, v216, v197, v206,
                   v114,
                   v113,
                   v203,
                   0);
  v117 = -[RTPurgeManager initWithDefaultsManager:learnedLocationStore:lifeCycleManager:platform:purgers:visitStore:xpcActivityManager:]([RTPurgeManager alloc], "initWithDefaultsManager:learnedLocationStore:lifeCycleManager:platform:purgers:visitStore:xpcActivityManager:", v5, v239, self, v244, v136, v212, v233);
  -[RTLifeCycleManager addService:](self, "addService:", v117);
  v118 = [RTLocationContextManager alloc];
  v119 = (void *)objc_opt_new();
  v120 = -[RTLocationContextManager initWithAuthorizationManager:defaultsManager:distanceCalculator:learnedLocationManager:learnedLocationStore:locationManager:placeInferenceManager:platform:timerManager:visitManager:](v118, "initWithAuthorizationManager:defaultsManager:distanceCalculator:learnedLocationManager:learnedLocationStore:locationManager:placeInferenceManager:platform:timerManager:visitManager:", v237, v5, v243, v241, v239, v242, v227, v244, v119, v232);

  -[RTLifeCycleManager addService:](self, "addService:", v120);
  v121 = [RTClientListener alloc];
  v122 = (void *)objc_opt_new();
  v123 = -[RTClientListener initWithAccountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:](v121, "initWithAccountManager:assetManager:authorizationManager:backgroundInertialOdometryManager:contactsManager:defaultsManager:deviceLocationPredictor:diagnostics:elevationManager:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:healthKitManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationContextManager:locationStore:mapServiceManager:metricManager:motionActivityManager:peopleDiscoveryProvider:placeInferenceManager:purgeManager:scenarioTriggerManager:timerManager:tripSegmentManager:vehicleLocationProvider:vehicleStore:visitManager:wifiManager:", v225, v200, v237, v199, v230, v5, v223, v236, v211, v178, v205, v198,
           v224,
           v226,
           v204,
           v177,
           v241,
           v239,
           v242,
           v120,
           v220,
           v240,
           v235,
           v238,
           v203,
           v227,
           v117,
           v219,
           v122,
           v197,
           v231,
           v206,
           v232,
           v229);

  -[RTLifeCycleManager addListener:machPort:](self, "addListener:machPort:", v123, CFSTR("com.apple.routined.registration"));
  if (objc_msgSend(v244, "internalInstall"))
  {
    v124 = -[RTClientListenerInternal initWithAccountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:platform:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:]([RTClientListenerInternal alloc], "initWithAccountManager:assetManager:authorizationManager:buildingPolygonManager:deviceLocationPredictor:diagnostics:eventAgentManager:eventModelProvider:authorizedLocationManager:fingerprintManager:hintManager:intermittentGNSSManager:learnedLocationManager:learnedLocationStore:locationManager:locationStore:mapServiceManager:motionActivityManager:peopleDiscoveryProvider:persistenceManager:placeInferenceQueryStore:platform:pointOfInterestSampler:purgeManager:safetyCacheStore:scenarioTriggerManager:vehicleLocationProvider:visitManager:workoutRouteManager:workoutScheduler:", v225, v200, v237, v183, v223, v236, v178, v205, v198, v224, v204, v177,
             v241,
             v239,
             v242,
             v220,
             v240,
             v238,
             v203,
             v245,
             v207,
             v244,
             v180,
             v117,
             v218,
             v219,
             v231,
             v232,
             v179,
             v134);
    -[RTLifeCycleManager addListener:machPort:](self, "addListener:machPort:", v124, CFSTR("com.apple.routined.internal"));

  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_queue, &__block_literal_global_384);
  xpc_set_event_stream_handler("com.apple.alarm", (dispatch_queue_t)self->_queue, &__block_literal_global_388);
  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v125 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v126 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "timeIntervalSinceDate:", v135);
    *(_DWORD *)buf = 138412546;
    v250 = v126;
    v251 = 2048;
    v252 = v128;
    _os_log_impl(&dword_1D1A22000, v125, OS_LOG_TYPE_INFO, "%@, finished, latency, %.2f", buf, 0x16u);

  }
  objc_destroyWeak(&v247);
  objc_destroyWeak(&location);

}

void __28__RTLifeCycleManager__start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "handle SIGTERM", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "exit");

}

void __28__RTLifeCycleManager__start__block_invoke_382(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MEMORY[0x1D82324D8]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81298]);
    _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = string;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "--- handle event %s ---", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", v6, 0);

  }
}

void __28__RTLifeCycleManager__start__block_invoke_387(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MEMORY[0x1D82324D8]() == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81298]);
    _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = string;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "--- handle event, com.apple.alarm, name, %s ---", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", v6, 0);

  }
}

- (void)exitWithDelay:(double)a3
{
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  -[RTLifeCycleManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__RTLifeCycleManager_exitWithDelay___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

uint64_t __36__RTLifeCycleManager_exitWithDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exit");
}

- (void)exit
{
  NSObject *v3;
  _QWORD block[5];

  -[RTLifeCycleManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__RTLifeCycleManager_exit__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __26__RTLifeCycleManager_exit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exit");
}

- (void)_exit
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *queue;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  RTLifeCycleManager *v43;
  SEL v44;
  _QWORD v45[6];
  id v46;
  id v47;
  NSObject *v48;
  SEL v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[6];
  id v55;
  id v56;
  NSObject *v57;
  SEL v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD block[4];
  id v64;
  id v65;
  id v66;
  SEL v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v71 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLifeCycleManager serviceWithClass:](self, "serviceWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLifeCycleManager listeners](self, "listeners");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[RTLifeCycleManager services](self, "services");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = dispatch_time(0, 10000000000);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__RTLifeCycleManager__exit__block_invoke;
  block[3] = &unk_1E9298238;
  v67 = a2;
  v36 = v6;
  v64 = v36;
  v39 = v11;
  v65 = v39;
  v38 = v9;
  v66 = v38;
  dispatch_after(v12, queue, block);
  v14 = dispatch_group_create();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[RTLifeCycleManager listeners](self, "listeners");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v16;
  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v60;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v60 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v21);
        objc_msgSend(MEMORY[0x1E0C99D68], "now", v36);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v14);
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __27__RTLifeCycleManager__exit__block_invoke_389;
        v54[3] = &unk_1E92989F8;
        v54[4] = self;
        v54[5] = v22;
        v58 = a2;
        v55 = v23;
        v56 = v38;
        v57 = v14;
        v24 = v23;
        objc_msgSend(v22, "shutdownWithHandler:", v54);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v19);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[RTLifeCycleManager services](self, "services");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v51;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v51 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v29);
        objc_msgSend(MEMORY[0x1E0C99D68], "now", v36);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v14);
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __27__RTLifeCycleManager__exit__block_invoke_394;
        v45[3] = &unk_1E92989F8;
        v45[4] = self;
        v45[5] = v30;
        v49 = a2;
        v46 = v31;
        v47 = v39;
        v48 = v14;
        v32 = v31;
        objc_msgSend(v30, "shutdownWithHandler:", v45);

        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
    }
    while (v27);
  }

  -[RTLifeCycleManager queue](self, "queue");
  v33 = objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __27__RTLifeCycleManager__exit__block_invoke_396;
  v40[3] = &unk_1E9298238;
  v41 = v37;
  v42 = v36;
  v43 = self;
  v44 = a2;
  v34 = v36;
  v35 = v37;
  dispatch_group_notify(v14, v33, v40);

}

void __27__RTLifeCycleManager__exit__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v6 = v5;
    v7 = objc_msgSend(*(id *)(a1 + 40), "count");
    v8 = *(_QWORD *)(a1 + 40);
    v9 = objc_msgSend(*(id *)(a1 + 48), "count");
    v10 = *(_QWORD *)(a1 + 48);
    v11 = 138413570;
    v12 = v3;
    v13 = 2048;
    v14 = v6;
    v15 = 2048;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, timed out waiting for clean exit, latency, %.2f, %lu services, %@, %lu listeners, %@", (uint8_t *)&v11, 0x3Eu);

  }
  exit(0);
}

void __27__RTLifeCycleManager__exit__block_invoke_389(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__RTLifeCycleManager__exit__block_invoke_2;
  block[3] = &unk_1E92989D0;
  v15 = *(_QWORD *)(a1 + 72);
  v5 = *(void **)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v8 = v3;
  dispatch_async(v4, block);

}

void __27__RTLifeCycleManager__exit__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138413058;
    v25 = (uint64_t)v12;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2048;
    v31 = v17;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, shutdown service, %@, error, %@, latency, %.2f", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 32), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 64), "removeObject:", *(_QWORD *)(a1 + 32));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 64);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        if (v6)
        {
          objc_msgSend(v6, "appendString:", CFSTR(", "));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string", (_QWORD)v19);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v18 = objc_msgSend(*(id *)(a1 + 64), "count");
    *(_DWORD *)buf = 134218242;
    v25 = v18;
    v26 = 2112;
    v27 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "total number of listeners remaining, %lu, listeners, %@", buf, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __27__RTLifeCycleManager__exit__block_invoke_394(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __27__RTLifeCycleManager__exit__block_invoke_2_395;
  v7[3] = &unk_1E9298A20;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 72);
  v7[4] = v3;
  v7[1] = 3221225472;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  dispatch_async(v2, v7);

}

void __27__RTLifeCycleManager__exit__block_invoke_2_395(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    v24 = (uint64_t)v12;
    v25 = 2112;
    v26 = v14;
    v27 = 2048;
    v28 = v16;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "%@, shutdown service, %@, latency, %.2f", buf, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 56), "removeObject:", *(_QWORD *)(a1 + 32));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(a1 + 56);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        if (v6)
        {
          objc_msgSend(v6, "appendString:", CFSTR(", "));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string", (_QWORD)v18);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v17 = objc_msgSend(*(id *)(a1 + 56), "count");
    *(_DWORD *)buf = 134218242;
    v24 = v17;
    v25 = 2112;
    v26 = v6;
    _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "total number of services remaining, %lu, services, %@", buf, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __27__RTLifeCycleManager__exit__block_invoke_396(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("LastExitDate"), "stringByAppendingPathExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v6);

  _rt_log_facility_get_os_log(RTLogFacilityLifeCycle);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v12 = 138412546;
    v13 = v8;
    v14 = 2048;
    v15 = v10;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, shutdown complete, latency, %.2f", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "shutdownWithHandler:", &__block_literal_global_398);
  return xpc_transaction_exit_clean();
}

void __27__RTLifeCycleManager__exit__block_invoke_397()
{
  NSObject *v0;
  uint8_t v1[16];

  _rt_log_facility_get_os_log(RTLogFacilityWatchdog);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D1A22000, v0, OS_LOG_TYPE_INFO, "RTWatchdog finished shutdown", v1, 2u);
  }

}

- (NSMutableArray)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
  objc_storeStrong((id *)&self->_signals, a3);
}

- (NSMutableDictionary)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
  objc_storeStrong((id *)&self->_listeners, a3);
}

- (NSMutableSet)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (RTWatchdogManager)watchdogManager
{
  return self->_watchdogManager;
}

- (void)setWatchdogManager:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_watchdogManager, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_signals, 0);
}

@end
