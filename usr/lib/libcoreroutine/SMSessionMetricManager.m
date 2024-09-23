@implementation SMSessionMetricManager

- (SMSessionMetricManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 sessionStore:(id)a5 locationManager:(id)a6 currentDeviceIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SMSessionMetricManager *v18;
  SMSessionMetricManager *v19;
  uint64_t v20;
  RTDistanceCalculator *distanceCalculator;
  id *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  SMSessionMetricManager *v28;
  NSObject *v29;
  id v30;
  dispatch_queue_t v31;
  id v32;
  id v34;
  objc_super v35;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v25 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: defaultsManager";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, v27, buf, 2u);
    goto LABEL_15;
  }
  if (!v14)
  {
    v25 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v27 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_14;
  }
  if (!v15)
  {
    v25 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "Invalid parameter not satisfying: sessionStore";
      goto LABEL_14;
    }
LABEL_15:

    v28 = 0;
    goto LABEL_23;
  }
  v34 = v17;
  if (v16)
  {
    v35.receiver = self;
    v35.super_class = (Class)SMSessionMetricManager;
    v18 = -[SMSessionMetricManager init](&v35, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_defaultsManager, a3);
      v20 = objc_opt_new();
      distanceCalculator = v19->_distanceCalculator;
      v19->_distanceCalculator = (RTDistanceCalculator *)v20;

      objc_storeStrong((id *)&v19->_learnedLocationManager, a4);
      objc_storeStrong((id *)&v19->_sessionStore, a5);
      objc_storeStrong((id *)&v19->_locationManager, a6);
      v22 = v19;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v23 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v22);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = (const char *)objc_msgSend(v30, "UTF8String");

      }
      v31 = dispatch_queue_create(v24, v23);

      v32 = v22[9];
      v22[9] = v31;

      objc_storeStrong(v22 + 10, a7);
      objc_msgSend(v22, "setup");
    }
    self = v19;
    v28 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager", buf, 2u);
    }

    v28 = 0;
  }
  v25 = v34;
LABEL_23:

  return v28;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SMSessionMetricManager_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __31__SMSessionMetricManager_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
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
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  RTFixedSizeQueue *etaUpdateStateQueue;
  RTFixedSizeQueue *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  RTFixedSizeQueue *etaUpdateSubmissionQueue;
  RTFixedSizeQueue *v81;
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
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  double v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *workoutActivityTypeString;
  void *v193;
  void *v194;
  id v195;
  id v196;
  RTFixedSizeQueue *v197;
  RTFixedSizeQueue *v198;
  void *v199;
  void *v200;
  id v201;
  id v202;
  uint8_t buf[4];
  const char *v204;
  __int16 v205;
  id v206;
  uint64_t v207;

  v207 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerSessionStartDateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_sessionStartDate, v5);

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerSessionEndDateKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_sessionEndDate, v7);

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerInitialDestinationExpectedTravelTimeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerInitialDestinationExpectedTravelTimeKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    self->_initialDestinationExpectedTravelTime = v12;

  }
  else
  {
    self->_initialDestinationExpectedTravelTime = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    self->_maxCrowFliesScaleFactor = v17;

  }
  else
  {
    self->_maxCrowFliesScaleFactor = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    self->_maxMapsETAScaleFactor = v22;

  }
  else
  {
    self->_maxMapsETAScaleFactor = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    self->_closestTimeIntervalToExceedingETA = v27;

  }
  else
  {
    self->_closestTimeIntervalToExceedingETA = 1.79769313e308;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    self->_didDestinationAnomalyTrigger = objc_msgSend(v31, "BOOLValue");

  }
  else
  {
    self->_didDestinationAnomalyTrigger = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNoProgressTriggeredKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNoProgressTriggeredKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    self->_noProgressTriggered = objc_msgSend(v35, "BOOLValue");

  }
  else
  {
    self->_noProgressTriggered = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    self->_routeDeviationTriggered = objc_msgSend(v39, "BOOLValue");

  }
  else
  {
    self->_routeDeviationTriggered = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidArriveSafelyKey"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidArriveSafelyKey"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    self->_didArriveSafely = objc_msgSend(v43, "BOOLValue");

  }
  else
  {
    self->_didArriveSafely = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerSosTriggeredKey"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerSosTriggeredKey"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    self->_sosTriggered = objc_msgSend(v47, "BOOLValue");

  }
  else
  {
    self->_sosTriggered = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerUserEndedSessionKey"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerUserEndedSessionKey"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    self->_userEndedSession = objc_msgSend(v51, "BOOLValue");

  }
  else
  {
    self->_userEndedSession = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "doubleValue");
    self->_previousCrowFliesETA = v56;

  }
  else
  {
    self->_previousCrowFliesETA = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "doubleValue");
    self->_previousMapsExpectedETA = v61;

  }
  else
  {
    self->_previousMapsExpectedETA = -1.0;
  }

  v62 = (void *)MEMORY[0x1E0C99E60];
  v63 = objc_opt_class();
  v64 = objc_opt_class();
  objc_msgSend(v62, "setWithObjects:", v63, v64, objc_opt_class(), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)MEMORY[0x1E0CB3710];
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = 0;
  objc_msgSend(v66, "unarchivedObjectOfClasses:fromData:error:", v65, v68, &v202);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v202;

  if (v70)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v204 = "-[SMSessionMetricManager _setup]";
      v205 = 2112;
      v206 = v70;
      _os_log_error_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_ERROR, "%s, Decoding error for etaUpdateStateQueue, %@", buf, 0x16u);
    }

    goto LABEL_41;
  }
  if (!v69)
  {
LABEL_41:
    etaUpdateStateQueue = -[RTFixedSizeQueue initWithCapacity:]([RTFixedSizeQueue alloc], "initWithCapacity:", 2);
    objc_storeStrong((id *)&self->_etaUpdateStateQueue, etaUpdateStateQueue);
    v73 = 0;
    goto LABEL_44;
  }
  v73 = v69;
  etaUpdateStateQueue = self->_etaUpdateStateQueue;
  self->_etaUpdateStateQueue = v73;
LABEL_44:

  v74 = (void *)MEMORY[0x1E0CB3710];
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerEtaUpdateSubmissionQueueKey"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = 0;
  objc_msgSend(v74, "unarchivedObjectOfClasses:fromData:error:", v65, v76, &v201);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v201;

  if (v78)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v204 = "-[SMSessionMetricManager _setup]";
      v205 = 2112;
      v206 = v78;
      _os_log_error_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_ERROR, "%s, Decoding error for etaUpdateSubmissionQueue, %@", buf, 0x16u);
    }

    goto LABEL_48;
  }
  if (!v77)
  {
LABEL_48:
    etaUpdateSubmissionQueue = -[RTFixedSizeQueue initWithCapacity:]([RTFixedSizeQueue alloc], "initWithCapacity:", 2);
    objc_storeStrong((id *)&self->_etaUpdateSubmissionQueue, etaUpdateSubmissionQueue);
    v81 = 0;
    goto LABEL_51;
  }
  v81 = v77;
  etaUpdateSubmissionQueue = self->_etaUpdateSubmissionQueue;
  self->_etaUpdateSubmissionQueue = v81;
LABEL_51:

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerSessionTypeKey"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerSessionTypeKey"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    self->_sessionType = objc_msgSend(v85, "integerValue");

  }
  else
  {
    self->_sessionType = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidTriggerOccurKey"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (v87)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidTriggerOccurKey"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    self->_didTriggerOccur = objc_msgSend(v89, "BOOLValue");

  }
  else
  {
    self->_didTriggerOccur = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "doubleValue");
    self->_sessionDestinationType = (unint64_t)v94;

  }
  else
  {
    self->_sessionDestinationType = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "doubleValue");
    self->_firstAnomalyTriggerCategoryEnum = (unint64_t)v99;

  }
  else
  {
    self->_firstAnomalyTriggerCategoryEnum = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "doubleValue");
    self->_mostRecentLocationDistance = v104;

  }
  else
  {
    self->_mostRecentLocationDistance = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumExtensionsKey"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumExtensionsKey"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "doubleValue");
    self->_numExtensions = (int)v109;

  }
  else
  {
    self->_numExtensions = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "doubleValue");
    self->_originatingLocationTypeEnum = (unint64_t)v114;

  }
  else
  {
    self->_originatingLocationTypeEnum = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v116)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "doubleValue");
    self->_originalNominalTravelTime = v119;

  }
  else
  {
    self->_originalNominalTravelTime = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  if (v121)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "doubleValue");
    self->_ratioOfFirstAnomalyDistanceToTotalDistance = v124;

  }
  else
  {
    self->_ratioOfFirstAnomalyDistanceToTotalDistance = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerInitialDistanceKey"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if (v126)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerInitialDistanceKey"));
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "doubleValue");
    self->_initialDistance = v129;

  }
  else
  {
    self->_initialDistance = -1.0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidHandoffOccurKey"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidHandoffOccurKey"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    self->_didHandoffOccur = objc_msgSend(v133, "BOOLValue");

  }
  else
  {
    self->_didHandoffOccur = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerWasActiveAtStartKey"));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (v135)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerWasActiveAtStartKey"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wasActiveAtStart = objc_msgSend(v137, "BOOLValue");

  }
  else
  {
    self->_wasActiveAtStart = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerWasActiveAtEndKey"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if (v139)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerWasActiveAtEndKey"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    self->_wasActiveAtEnd = objc_msgSend(v141, "BOOLValue");

  }
  else
  {
    self->_wasActiveAtEnd = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptKey"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  if (v143)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptKey"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numAnomalyPrompt = objc_msgSend(v145, "unsignedIntValue");

  }
  else
  {
    self->_numAnomalyPrompt = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  if (v147)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numAnomalyPromptDuringHysteresis = objc_msgSend(v149, "unsignedIntValue");

  }
  else
  {
    self->_numAnomalyPromptDuringHysteresis = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumHandoffKey"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v151)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumHandoffKey"));
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numHandoff = objc_msgSend(v153, "unsignedIntValue");

  }
  else
  {
    self->_numHandoff = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumLPMSeparationKey"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumLPMSeparationKey"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numLPMSeparation = objc_msgSend(v157, "unsignedIntValue");

  }
  else
  {
    self->_numLPMSeparation = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumTakeoverKey"));
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (v159)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumTakeoverKey"));
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numTakeover = objc_msgSend(v161, "unsignedIntValue");

  }
  else
  {
    self->_numTakeover = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"));
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  if (v163)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numUnsupportedDeviceSeparation = objc_msgSend(v165, "unsignedIntValue");

  }
  else
  {
    self->_numUnsupportedDeviceSeparation = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  if (v167)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"));
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numUserDisabledConnectivity = objc_msgSend(v169, "unsignedIntValue");

  }
  else
  {
    self->_numUserDisabledConnectivity = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidWorkoutEndKey"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  if (v171)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidWorkoutEndKey"));
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    self->_didWorkoutEnd = objc_msgSend(v173, "BOOLValue");

  }
  else
  {
    self->_didWorkoutEnd = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidWorkoutPauseKey"));
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  if (v175)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerDidWorkoutPauseKey"));
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    self->_didWorkoutPause = objc_msgSend(v177, "BOOLValue");

  }
  else
  {
    self->_didWorkoutPause = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  if (v179)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v180, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"));
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isWorkoutAlwaysOn = objc_msgSend(v181, "BOOLValue");

  }
  else
  {
    self->_isWorkoutAlwaysOn = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerModeOfTransportationKey"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerModeOfTransportationKey"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    self->_modeOfTransportation = objc_msgSend(v185, "unsignedIntValue");

  }
  else
  {
    self->_modeOfTransportation = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumRecipientsKey"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (v187)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerNumRecipientsKey"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    self->_numRecipients = objc_msgSend(v189, "unsignedIntValue");

  }
  else
  {
    self->_numRecipients = 0;
  }

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v190, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (v191)
  {
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    workoutActivityTypeString = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(workoutActivityTypeString, "objectForKey:", CFSTR("RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"));
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "stringValue");
    v200 = v190;
    v194 = v65;
    v195 = v78;
    v196 = v70;
    v197 = v81;
    v198 = v73;
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_workoutActivityTypeString, v199);

    v73 = v198;
    v81 = v197;
    v70 = v196;
    v78 = v195;
    v65 = v194;
    v190 = v200;

  }
  else
  {
    workoutActivityTypeString = self->_workoutActivityTypeString;
    self->_workoutActivityTypeString = (NSString *)CFSTR("Unknown");
  }

}

- (void)_reset
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
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
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

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerSessionStartDateKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerSessionEndDateKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNoProgressTriggeredKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerDidArriveSafelyKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerSosTriggeredKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerUserEndedSessionKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerEtaUpdateSubmissionQueueKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerSessionTypeKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerDidHandoffOccurKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerWasActiveAtStartKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerWasActiveAtEndKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerDidTriggerOccurKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerInitialDistanceKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumExtensionsKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumHandoffKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumLPMSeparationKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumTakeoverKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerDidWorkoutEndKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerDidWorkoutPauseKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerModeOfTransportationKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerNumRecipientsKey"));

  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKey:", 0, CFSTR("RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"));

  -[SMSessionMetricManager _setup](self, "_setup");
}

- (id)_createDestinationMetricDictionary
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("sessionDuration"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("anyTrigger"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("actualETAScaleFactor"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("initialETA"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("maxCrowFliesETAScaleFactor"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("maxMapsExpectedETAScaleFactor"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("noProgressTriggered"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("routeDeviationTriggered"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("safeArrivalOccurred"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("SOSTriggered"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("userEndedSession"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("nominalTravelTimeRemainingDifference"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("nominalTravelTimeRemaining"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("distanceRemainingDifference"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("distanceRemaining"));
  v3 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("nominalTravelTimeShorter"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("remainingDistanceShorter"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("shouldUpdateUpperBoundETA"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("nominalTravelTimeRemainingDifferencePrior"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("nominalTravelTimeRemainingPrior"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("distanceRemainingDifferencePrior"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("distanceRemainingPrior"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("nominalTravelTimeShorterPrior"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("remainingDistanceShorterPrior"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("shouldUpdateUpperBoundETAPrior"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("didHandoffOccur"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("wasActiveAtStart"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("wasActiveAtEnd"));
  return v2;
}

- (id)_createInitiatorPerSessionDetailsMetricDictionary
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numExtensions"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("originalNominalTravelTime"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("originatingLocationTypeEnum"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("sessionDuration"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("ratioOfFirstAnomalyDistanceToTotalDistance"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("destinationLocationTypeEnum"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("didAnomalyPrompt"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("didSafeArrival"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("firstAnomalyTriggerCategoryEnum"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("sessionTypeEnum"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("sessionStartTimeOfDay"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numAnomalyPrompt"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numAnomalyPromptDuringHysteresis"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numHandoff"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numLPMSeparation"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numTakeover"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numUnsupportedDeviceSeparation"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numUserDisabledConnectivity"));
  v3 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("didWorkoutEnd"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("didWorkoutPause"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("isCellularActivated"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("isStandalone"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("isWorkoutAlwaysOn"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D60, CFSTR("modeOfTransportation"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9328D48, CFSTR("numRecipients"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("wasActiveAtEnd"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("wasActiveAtStart"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("workoutActivityTypeString"));
  return v2;
}

- (void)_updateETASubmissionStates
{
  void *v3;
  id v4;

  -[SMSessionMetricManager etaUpdateStateQueue](self, "etaUpdateStateQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v4, "copy");
  -[SMSessionMetricManager setEtaUpdateSubmissionQueue:](self, "setEtaUpdateSubmissionQueue:", v3);

}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SMSessionMetricManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__SMSessionMetricManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricsNotification:", *(_QWORD *)(a1 + 40));
}

- (id)getLocationsForInterval:(id)a3 nearBoundingLocation:(id)a4
{
  id v6;
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
  void *v26;
  id v27;
  void *v29;
  _QWORD v30[4];
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint8_t buf[8];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v29 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v6, 0, v7, 250.0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__124;
  v37 = __Block_byref_object_dispose__124;
  v38 = 0;
  v9 = dispatch_semaphore_create(0);
  -[SMSessionMetricManager locationManager](self, "locationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __71__SMSessionMetricManager_getLocationsForInterval_nearBoundingLocation___block_invoke;
  v30[3] = &unk_1E9297010;
  v32 = &v33;
  v11 = v9;
  v31 = v11;
  objc_msgSend(v10, "fetchStoredLocationsWithOptions:handler:", v8, v30);

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
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
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
    v39 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v39, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
  }

  v27 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v27;
}

void __71__SMSessionMetricManager_getLocationsForInterval_nearBoundingLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (!a3)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)getRTLocationOfInterestForCLLocation:(id)a3
{
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  id *v7;
  id v8;
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
  void *v22;
  void *v23;
  id v24;
  id v26;
  void *v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint8_t buf[16];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v26);
  v4 = dispatch_semaphore_create(0);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__124;
  v42 = __Block_byref_object_dispose__124;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__124;
  v36 = __Block_byref_object_dispose__124;
  v37 = 0;
  -[SMSessionMetricManager learnedLocationManager](self, "learnedLocationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __63__SMSessionMetricManager_getRTLocationOfInterestForCLLocation___block_invoke;
  v28[3] = &unk_1E9297478;
  v30 = &v38;
  v31 = &v32;
  v6 = v4;
  v29 = v6;
  objc_msgSend(v5, "fetchLocationOfInterestAtLocation:handler:", v27, v28);

  v7 = (id *)(v33 + 5);
  v8 = (id)v33[5];
  v9 = v6;
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
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
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
    v44 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v44, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v8 = objc_retainAutorelease(v23);

    }
  }

  objc_storeStrong(v7, v8);
  v24 = (id)v39[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v24;
}

void __63__SMSessionMetricManager_getRTLocationOfInterestForCLLocation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_gatherSessionDestinationStats:(id)a3
{
  dispatch_semaphore_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  id *v7;
  id v8;
  void *v9;
  dispatch_time_t v10;
  intptr_t v11;
  uint64_t *v12;
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
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  dispatch_semaphore_t v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id *v38;
  id v39;
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
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  double v72;
  double v73;
  uint64_t i;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  uint64_t j;
  void *v101;
  void *v102;
  void *v103;
  _BOOL4 v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t k;
  void *v116;
  void *v117;
  void *v118;
  _BOOL4 v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  int v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  id v147;
  NSObject *dsema;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unsigned int v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  void *v161;
  id v162;
  id v163;
  id obj;
  id v165;
  void *v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v171;
  NSObject *v172;
  void *v173;
  void *context;
  uint64_t v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _QWORD v188[4];
  id v189;
  void *v190;
  NSObject *v191;
  _BYTE *v192;
  uint64_t *v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  _QWORD v198[4];
  NSObject *v199;
  uint64_t *v200;
  uint64_t *v201;
  uint64_t v202;
  uint64_t *v203;
  uint64_t v204;
  uint64_t (*v205)(uint64_t, uint64_t);
  void (*v206)(uint64_t);
  id v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  uint64_t (*v211)(uint64_t, uint64_t);
  void (*v212)(uint64_t);
  id v213;
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  char v220;
  _BYTE buf[24];
  char v222;
  _BYTE v223[128];
  uint64_t v224;
  uint8_t v225[8];
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v147 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = dispatch_semaphore_create(0);
  v208 = 0;
  v209 = &v208;
  v210 = 0x3032000000;
  v211 = __Block_byref_object_copy__124;
  v212 = __Block_byref_object_dispose__124;
  v213 = 0;
  v4 = objc_alloc(MEMORY[0x1E0D8B9F8]);
  LOBYTE(v145) = 0;
  v146 = (void *)objc_msgSend(v4, "initWithBatchSize:fetchLimit:sortBySessionStartDate:ascending:sessionTypes:timeInADayInterval:pickOneConfigInTimeInADayInterval:dateInterval:startBoundingBoxLocation:destinationBoundingBoxLocation:boundingBoxRadius:sessionIdentifier:", *MEMORY[0x1E0D8BD30], *MEMORY[0x1E0D8BD30], 0, 0, &unk_1E932C9A0, 0, v145, v147, 0, 0, 0, 0);
  v202 = 0;
  v203 = &v202;
  v204 = 0x3032000000;
  v205 = __Block_byref_object_copy__124;
  v206 = __Block_byref_object_dispose__124;
  v207 = 0;
  -[SMSessionMetricManager sessionStore](self, "sessionStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v198[0] = MEMORY[0x1E0C809B0];
  v198[1] = 3221225472;
  v198[2] = __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke;
  v198[3] = &unk_1E9296EE0;
  v200 = &v202;
  v201 = &v208;
  v6 = v3;
  v199 = v6;
  objc_msgSend(v5, "fetchSessionConfigurationsWithOptions:handler:", v146, v198);

  v7 = (id *)(v209 + 5);
  v8 = (id)v209[5];
  dsema = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  v11 = dispatch_semaphore_wait(dsema, v10);
  v12 = (uint64_t *)MEMORY[0x1E0D18598];
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v9);
    v15 = v14;
    v16 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
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
    v217 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v217, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *v12, 15, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v8 = objc_retainAutorelease(v24);

    }
  }

  objc_storeStrong(v7, v8);
  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  obj = (id)v203[5];
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v194, v223, 16);
  if (v25)
  {
    v169 = *(_QWORD *)v195;
    v159 = *MEMORY[0x1E0D8BD38];
    v156 = *v12;
    v157 = *MEMORY[0x1E0CB2D50];
    v153 = *MEMORY[0x1E0D8BB90];
    v154 = *MEMORY[0x1E0D8BB78];
    v152 = *MEMORY[0x1E0D8BB80];
    v151 = *MEMORY[0x1E0D8BB88];
    v150 = *MEMORY[0x1E0D8BBA0];
    v149 = *MEMORY[0x1E0D8BB98];
    do
    {
      v175 = 0;
      v171 = v25;
      do
      {
        if (*(_QWORD *)v195 != v169)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * v175);
        context = (void *)MEMORY[0x1D8231EA8]();
        if (objc_msgSend(v26, "sessionType") == 2)
        {
          objc_msgSend(v26, "sessionID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (!v28)
          {
            _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v26, "sessionID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = "-[SMSessionMetricManager _gatherSessionDestinationStats:]";
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v30;
              _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%{public}s, fetching session states for sessionID %{public}@", buf, 0x16u);

            }
            v31 = objc_alloc(MEMORY[0x1E0D8BA70]);
            objc_msgSend(v26, "sessionID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v167 = (void *)objc_msgSend(v31, "initWithBatchSize:fetchLimit:sortByCreationDate:ascending:dateInterval:sessionState:locationBoundingBox:boundingBoxRadius:sessionIdentifier:", v159, v159, 1, 1, 0, 0, 0, 0, v32);

            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v222 = 0;
            v217 = 0;
            v218 = &v217;
            v219 = 0x2020000000;
            v220 = 0;
            v33 = dispatch_semaphore_create(0);
            -[SMSessionMetricManager currentDeviceIdentifier](self, "currentDeviceIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMSessionMetricManager sessionStore](self, "sessionStore");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v188[0] = MEMORY[0x1E0C809B0];
            v188[1] = 3221225472;
            v188[2] = __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke_465;
            v188[3] = &unk_1E92A2FD0;
            v192 = buf;
            v36 = v34;
            v193 = &v217;
            v165 = v36;
            v189 = v36;
            v190 = v26;
            v37 = v33;
            v191 = v37;
            objc_msgSend(v35, "fetchSessionManagerStatesWithOptions:handler:", v167, v188);

            v38 = (id *)(v209 + 5);
            v39 = (id)v209[5];
            v172 = v37;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = dispatch_time(0, 3600000000000);
            if (dispatch_semaphore_wait(v172, v41))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "timeIntervalSinceDate:", v40);
              v44 = v43;
              v45 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
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
                *(_WORD *)v225 = 0;
                _os_log_fault_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v225, 2u);
              }

              v51 = (void *)MEMORY[0x1E0CB35C8];
              v224 = v157;
              *(_QWORD *)v225 = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v225, &v224, 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "errorWithDomain:code:userInfo:", v156, 15, v52);
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              if (v53)
              {
                v39 = objc_retainAutorelease(v53);

              }
            }

            objc_storeStrong(v38, v39);
            objc_msgSend(v26, "destination");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_alloc(MEMORY[0x1E0CB3588]);
            objc_msgSend(v26, "sessionStartDate");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v166 = (void *)objc_msgSend(v54, "initWithStartDate:endDate:", v55, v160);

            -[SMSessionMetricManager getLocationsForInterval:nearBoundingLocation:](self, "getLocationsForInterval:nearBoundingLocation:", v166, 0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v56;
            if (v56 && objc_msgSend(v56, "count"))
            {
              v158 = v57;
              objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v26, "sessionStartDate");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v168, "timestamp");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v161 = (void *)objc_msgSend(v58, "initWithStartDate:endDate:", v59, v60);

              objc_msgSend(v161, "duration");
              if (v61 <= 10.0)
              {
                objc_msgSend(v173, "eta");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "expectedTravelTime");
                v64 = v63;
                objc_msgSend(v173, "eta");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "additionalTravelTime");
                v67 = v66;

                v68 = v64 + v67;
                if (v64 + v67 > 0.0)
                {
                  v186 = 0u;
                  v187 = 0u;
                  v184 = 0u;
                  v185 = 0u;
                  v162 = v158;
                  v69 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v184, v216, 16);
                  if (v69)
                  {
                    v70 = 0;
                    v71 = *(_QWORD *)v185;
                    v72 = -1.0;
                    v73 = -1.0;
                    while (2)
                    {
                      for (i = 0; i != v69; ++i)
                      {
                        if (*(_QWORD *)v185 != v71)
                          objc_enumerationMutation(v162);
                        v75 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * i);
                        v76 = (void *)MEMORY[0x1D8231EA8]();
                        objc_msgSend(v173, "clLocation");
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v77, "distanceFromLocation:", v75);
                        v79 = v78;

                        objc_msgSend(v168, "distanceFromLocation:", v75);
                        v81 = v80;
                        objc_msgSend(v173, "radius");
                        v83 = v82;
                        if (v79 < v82)
                        {
                          v84 = objc_alloc(MEMORY[0x1E0CB3588]);
                          objc_msgSend(v26, "sessionStartDate");
                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v75, "timestamp");
                          v86 = (void *)objc_claimAutoreleasedReturnValue();
                          v87 = (void *)objc_msgSend(v84, "initWithStartDate:endDate:", v85, v86);

                          objc_msgSend(v87, "duration");
                          v89 = v88;

                          v73 = v89 / v68;
                        }
                        if (!((v81 <= 250.0) | v70 & 1))
                        {
                          v90 = objc_alloc(MEMORY[0x1E0CB3588]);
                          objc_msgSend(v26, "sessionStartDate");
                          v91 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v75, "timestamp");
                          v92 = (void *)objc_claimAutoreleasedReturnValue();
                          v93 = (void *)objc_msgSend(v90, "initWithStartDate:endDate:", v91, v92);

                          objc_msgSend(v93, "duration");
                          v72 = v94;

                          v70 = 1;
                        }
                        objc_autoreleasePoolPop(v76);
                        if (v79 < v83)
                        {
                          v155 = 1;
                          goto LABEL_39;
                        }
                      }
                      v69 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v184, v216, 16);
                      if (v69)
                        continue;
                      break;
                    }
                    v155 = 0;
                  }
                  else
                  {
                    v155 = 0;
                    v72 = -1.0;
                    v73 = -1.0;
                  }
LABEL_39:

                  -[SMSessionMetricManager getRTLocationOfInterestForCLLocation:](self, "getRTLocationOfInterestForCLLocation:", v168);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v182 = 0u;
                  v183 = 0u;
                  v180 = 0u;
                  v181 = 0u;
                  objc_msgSend(v95, "visits");
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v180, v215, 16);
                  v98 = -1.0;
                  if (v97)
                  {
                    v99 = *(_QWORD *)v181;
                    while (2)
                    {
                      for (j = 0; j != v97; ++j)
                      {
                        if (*(_QWORD *)v181 != v99)
                          objc_enumerationMutation(v96);
                        v101 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * j);
                        objc_msgSend(v101, "exitDate");
                        v102 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "sessionStartDate");
                        v103 = (void *)objc_claimAutoreleasedReturnValue();
                        v104 = objc_msgSend(v102, "compare:", v103) == 1;

                        if (v104)
                        {
                          v105 = objc_alloc(MEMORY[0x1E0CB3588]);
                          objc_msgSend(v26, "sessionStartDate");
                          v106 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v101, "exitDate");
                          v107 = (void *)objc_claimAutoreleasedReturnValue();
                          v108 = (void *)objc_msgSend(v105, "initWithStartDate:endDate:", v106, v107);

                          objc_msgSend(v108, "duration");
                          v98 = v109;

                          goto LABEL_49;
                        }
                      }
                      v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v180, v215, 16);
                      if (v97)
                        continue;
                      break;
                    }
                  }
LABEL_49:

                  objc_msgSend(v26, "destination");
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v110, "clLocation");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SMSessionMetricManager getRTLocationOfInterestForCLLocation:](self, "getRTLocationOfInterestForCLLocation:", v111);
                  v163 = (id)objc_claimAutoreleasedReturnValue();

                  v178 = 0u;
                  v179 = 0u;
                  v176 = 0u;
                  v177 = 0u;
                  objc_msgSend(v163, "visits");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v176, v214, 16);
                  if (v113)
                  {
                    v114 = *(_QWORD *)v177;
                    while (2)
                    {
                      for (k = 0; k != v113; ++k)
                      {
                        if (*(_QWORD *)v177 != v114)
                          objc_enumerationMutation(v112);
                        v116 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * k);
                        objc_msgSend(v116, "entryDate");
                        v117 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v26, "sessionStartDate");
                        v118 = (void *)objc_claimAutoreleasedReturnValue();
                        v119 = objc_msgSend(v117, "compare:", v118) == 1;

                        if (v119)
                        {
                          v120 = objc_alloc(MEMORY[0x1E0CB3588]);
                          objc_msgSend(v26, "sessionStartDate");
                          v121 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v116, "entryDate");
                          v122 = (void *)objc_claimAutoreleasedReturnValue();
                          v123 = (void *)objc_msgSend(v120, "initWithStartDate:endDate:", v121, v122);

                          objc_msgSend(v123, "duration");
                          v125 = v124;
                          objc_msgSend(v173, "eta");
                          v126 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v126, "expectedTravelTime");
                          v128 = v127;
                          objc_msgSend(v173, "eta");
                          v129 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v129, "additionalTravelTime");
                          v131 = v130;

                          v132 = v155 ^ 1;
                          if (v125 / (v128 + v131) < v73)
                            v132 = 1;
                          if (v132)
                            v73 = v125 / (v128 + v131);
                          v155 |= v132;
                          goto LABEL_63;
                        }
                      }
                      v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v176, v214, 16);
                      if (v113)
                        continue;
                      break;
                    }
                  }

LABEL_63:
                  if (v72 == -1.0)
                    v133 = -1.0;
                  else
                    v133 = v72 / 60.0;
                  if (v98 == -1.0)
                    v134 = -1.0;
                  else
                    v134 = v98 / 60.0;
                  v135 = (void *)objc_opt_new();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v155);
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "setObject:forKeyedSubscript:", v136, v154);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v73);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "setObject:forKeyedSubscript:", v137, v153);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v134);
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "setObject:forKeyedSubscript:", v138, v152);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v133);
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "setObject:forKeyedSubscript:", v139, v151);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24));
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "setObject:forKeyedSubscript:", v140, v150);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v218 + 24));
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v135, "setObject:forKeyedSubscript:", v141, v149);

                  v142 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v143 = (void *)objc_msgSend(v142, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorInitiatorExitAndArrivalMetrics, 1);
                  log_analytics_submission(v143, v135);
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v143);
                  v144 = (void *)objc_claimAutoreleasedReturnValue();
                  AnalyticsSendEvent();

                }
              }

              v57 = v158;
            }

            _Block_object_dispose(&v217, 8);
            _Block_object_dispose(buf, 8);

          }
        }
        objc_autoreleasePoolPop(context);
        ++v175;
      }
      while (v175 != v171);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v194, v223, 16);
    }
    while (v25);
  }

  _Block_object_dispose(&v202, 8);
  _Block_object_dispose(&v208, 8);

}

void __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v6 = a3;
  if (!v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;
  v9 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__SMSessionMetricManager__gatherSessionDestinationStats___block_invoke_465(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(v5, "count");
  if (!a3 && v6)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeDeviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend(v5, "count");
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v16 = 136447234;
    v17 = "-[SMSessionMetricManager _gatherSessionDestinationStats:]_block_invoke";
    v18 = 2048;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 1024;
    v23 = v14;
    v24 = 1024;
    v25 = v15;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%{public}s, found %lu states for %@, wasActiveAtStart %{Bool}d, wasActiveAtEnd %{Bool}d", (uint8_t *)&v16, 0x2Cu);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)_onDailyMetricsNotification:(id)a3
{
  NSObject *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
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
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  dispatch_semaphore_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  dispatch_time_t v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  dispatch_semaphore_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  dispatch_time_t v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  dispatch_semaphore_t v64;
  void *v65;
  NSObject *v66;
  id *v67;
  id v68;
  NSObject *v69;
  void *v70;
  dispatch_time_t v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  unint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *dsema;
  void *v116;
  _QWORD v117[4];
  NSObject *v118;
  uint64_t *v119;
  uint64_t *v120;
  _QWORD v121[4];
  NSObject *v122;
  uint64_t *v123;
  uint64_t *v124;
  _BYTE *v125;
  _QWORD v126[4];
  NSObject *v127;
  uint64_t *v128;
  uint64_t *v129;
  _BYTE *v130;
  _QWORD v131[4];
  NSObject *v132;
  uint64_t *v133;
  uint64_t *v134;
  _BYTE *v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  _BYTE v168[12];
  __int16 v169;
  uint64_t v170;
  __int16 v171;
  unint64_t v172;
  _BYTE buf[24];
  uint64_t (*v174)(uint64_t, uint64_t);
  void (*v175)(uint64_t);
  id v176;
  _QWORD v177[4];

  v177[1] = *MEMORY[0x1E0C80C00];
  v102 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v102;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, received notification, %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v116, -86400.0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v116, -604800.0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v116, -2419200.0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v116, -4838400.0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = 0;
  v165 = &v164;
  v166 = 0x2020000000;
  v167 = 0;
  v160 = 0;
  v161 = &v160;
  v162 = 0x2020000000;
  v163 = 0;
  v156 = 0;
  v157 = &v156;
  v158 = 0x2020000000;
  v159 = 0;
  v151 = 0;
  v152 = 0;
  v153 = &v152;
  v154 = 0x2020000000;
  v155 = 0;
  v148 = 0;
  v149 = &v148;
  v150 = 0x2020000000;
  v144 = 0;
  v145 = &v144;
  v146 = 0x2020000000;
  v147 = 0;
  v140 = 0;
  v141 = &v140;
  v142 = 0x2020000000;
  v143 = 0;
  v136 = 0;
  v137 = &v136;
  v138 = 0x2020000000;
  v139 = 0;
  v107 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v112, v116);
  v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v111, v112);
  v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v110, v111);
  v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v108, v110);
  v7 = dispatch_semaphore_create(0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v174 = __Block_byref_object_copy__124;
  v175 = __Block_byref_object_dispose__124;
  v176 = 0;
  -[SMSessionMetricManager sessionStore](self, "sessionStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = MEMORY[0x1E0C809B0];
  v131[1] = 3221225472;
  v131[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke;
  v131[3] = &unk_1E92A2FF8;
  v133 = &v164;
  v134 = &v148;
  v135 = buf;
  v9 = v7;
  v132 = v9;
  objc_msgSend(v8, "fetchSessionCountWithDateInterval:handler:", v107, v131);

  dsema = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v11))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v10);
  v14 = v13;
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
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
    *(_WORD *)v168 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
  }

  v21 = (void *)MEMORY[0x1E0CB35C8];
  v177[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v168 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v177, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_retainAutorelease(v23);

  }
  else
  {
LABEL_8:
    v24 = 0;
  }

  v25 = v24;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v116, -172800.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v105, v112);
  -[SMSessionMetricManager _gatherSessionDestinationStats:](self, "_gatherSessionDestinationStats:", v26);
  v101 = (void *)v26;
  v27 = dispatch_semaphore_create(0);
  -[SMSessionMetricManager sessionStore](self, "sessionStore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = MEMORY[0x1E0C809B0];
  v126[1] = 3221225472;
  v126[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_2;
  v126[3] = &unk_1E92A2FF8;
  v128 = &v160;
  v129 = &v144;
  v130 = buf;
  v29 = v27;
  v127 = v29;
  objc_msgSend(v28, "fetchSessionCountWithDateInterval:handler:", v106, v126);

  v114 = v29;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = dispatch_time(0, 3600000000000);
  v32 = v25;
  if (dispatch_semaphore_wait(v114, v31))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSinceDate:", v30);
    v35 = v34;
    v36 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "filteredArrayUsingPredicate:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "submitToCoreAnalytics:type:duration:", v40, 1, v35);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v168 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
    }

    v42 = (void *)MEMORY[0x1E0CB35C8];
    v177[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v168 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v177, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v25;
    if (v44)
    {
      v32 = objc_retainAutorelease(v44);

    }
  }

  v45 = v32;
  v46 = dispatch_semaphore_create(0);
  -[SMSessionMetricManager sessionStore](self, "sessionStore");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = MEMORY[0x1E0C809B0];
  v121[1] = 3221225472;
  v121[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_3;
  v121[3] = &unk_1E92A2FF8;
  v123 = &v156;
  v124 = &v140;
  v125 = buf;
  v48 = v46;
  v122 = v48;
  objc_msgSend(v47, "fetchSessionCountWithDateInterval:handler:", v104, v121);

  v113 = v48;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = dispatch_time(0, 3600000000000);
  v51 = v45;
  if (dispatch_semaphore_wait(v113, v50))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "timeIntervalSinceDate:", v49);
    v54 = v53;
    v55 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "filteredArrayUsingPredicate:", v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "firstObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v55, "submitToCoreAnalytics:type:duration:", v59, 1, v54);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v168 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
    }

    v61 = (void *)MEMORY[0x1E0CB35C8];
    v177[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v168 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v177, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v45;
    if (v63)
    {
      v51 = objc_retainAutorelease(v63);

    }
  }

  v109 = (unint64_t)v51;
  v64 = dispatch_semaphore_create(0);
  -[SMSessionMetricManager sessionStore](self, "sessionStore");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_4;
  v117[3] = &unk_1E92A3020;
  v119 = &v152;
  v120 = &v136;
  v66 = v64;
  v118 = v66;
  objc_msgSend(v65, "fetchSessionCountWithDateInterval:handler:", v103, v117);

  v67 = (id *)(*(_QWORD *)&buf[8] + 40);
  v68 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v69 = v66;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v69, v71))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "timeIntervalSinceDate:", v70);
    v74 = v73;
    v75 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "filteredArrayUsingPredicate:", v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "firstObject");
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "submitToCoreAnalytics:type:duration:", v79, 1, v74);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v168 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v168, 2u);
    }

    v81 = (void *)MEMORY[0x1E0CB35C8];
    v177[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v168 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v177, 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v83)
    {
      v68 = objc_retainAutorelease(v83);

    }
  }

  objc_storeStrong(v67, v68);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) | v109)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      v85 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v168 = 136315650;
      *(_QWORD *)&v168[4] = "-[SMSessionMetricManager _onDailyMetricsNotification:]";
      v169 = 2112;
      v170 = v85;
      v171 = 2112;
      v172 = v109;
      _os_log_error_impl(&dword_1D1A22000, v84, OS_LOG_TYPE_ERROR, "%s, encountered errors fetching for session count, fetchError, %@, fetchTimeoutError, %@", v168, 0x20u);
    }
  }
  else
  {
    v86 = v165[3] + v161[3];
    v161[3] = v86;
    v87 = v157[3] + v86;
    v157[3] = v87;
    v153[3] += v87;
    v88 = v149[3] + v145[3];
    v145[3] = v88;
    v89 = v141[3] + v88;
    v141[3] = v89;
    v137[3] += v89;
    v84 = objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v165[3]);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v90, *MEMORY[0x1E0D8BC38]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v161[3]);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v91, *MEMORY[0x1E0D8BCA0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v157[3]);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v92, *MEMORY[0x1E0D8BC98]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v153[3]);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v93, *MEMORY[0x1E0D8BC30]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v149[3]);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v94, *MEMORY[0x1E0D8BC60]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v145[3]);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v95, *MEMORY[0x1E0D8BC70]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v141[3]);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v96, *MEMORY[0x1E0D8BC68]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v137[3]);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v84, "setObject:forKeyedSubscript:", v97, *MEMORY[0x1E0D8BC58]);

    v98 = objc_alloc(MEMORY[0x1E0CB3940]);
    v99 = (void *)objc_msgSend(v98, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorInitiatorSessionCount, 1);
    log_analytics_submission(v99, v84);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v99, v101);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v140, 8);
  _Block_object_dispose(&v144, 8);
  _Block_object_dispose(&v148, 8);
  _Block_object_dispose(&v152, 8);
  _Block_object_dispose(&v156, 8);
  _Block_object_dispose(&v160, 8);
  _Block_object_dispose(&v164, 8);

}

void __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a4;
  if (!v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;
  v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a4;
  if (!v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;
  v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v7 = a4;
  if (!v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;
  v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __54__SMSessionMetricManager__onDailyMetricsNotification___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)onSessionStartedWithState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SMSessionMetricManager *v9;

  v4 = a3;
  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke(uint64_t a1)
{
  void *v2;
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
  void *v15;
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
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  dispatch_semaphore_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  dispatch_time_t v37;
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
  char v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  BOOL v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  _BOOL4 v83;
  id *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  id v91;
  id v92;
  _QWORD v93[4];
  NSObject *v94;
  uint8_t *v95;
  uint64_t *v96;
  uint64_t v97;
  id *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint8_t buf[8];
  uint8_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  _BYTE v109[12];
  __int16 v110;
  id v111;
  _QWORD v112[4];

  v112[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSessionStartDate:", v4);

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSessionType:", objc_msgSend(v5, "sessionType"));

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSessionDestinationType:", objc_msgSend(v7, "destinationType"));

    objc_msgSend(*(id *)(a1 + 32), "activeDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "currentDeviceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setWasActiveAtStart:", objc_msgSend(v8, "isEqual:", v9));

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "receiverHandles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setNumRecipients:", objc_msgSend(v12, "count"));

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "sessionType") == 2;

    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((_DWORD)v11)
    {
      objc_msgSend(v14, "destination");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "eta");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "expectedTravelTime");
      objc_msgSend(*(id *)(a1 + 40), "setInitialDestinationExpectedTravelTime:");

      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "destination");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "eta");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setModeOfTransportation:", objc_msgSend(v20, "transportType"));

      objc_msgSend(*(id *)(a1 + 32), "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "destination");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(*(id *)(a1 + 32), "location");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "configuration");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "destination");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "clLocation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "distanceFromLocation:", v28);
          objc_msgSend(*(id *)(a1 + 40), "setInitialDistance:");

        }
        v29 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(*(id *)(a1 + 32), "location");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithCLLocation:", v30);

        v32 = dispatch_semaphore_create(0);
        *(_QWORD *)buf = 0;
        v104 = buf;
        v105 = 0x3032000000;
        v106 = __Block_byref_object_copy__124;
        v107 = __Block_byref_object_dispose__124;
        v108 = 0;
        v97 = 0;
        v98 = (id *)&v97;
        v99 = 0x3032000000;
        v100 = __Block_byref_object_copy__124;
        v101 = __Block_byref_object_dispose__124;
        v102 = 0;
        objc_msgSend(*(id *)(a1 + 40), "learnedLocationManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke_472;
        v93[3] = &unk_1E9297478;
        v95 = buf;
        v96 = &v97;
        v34 = v32;
        v94 = v34;
        objc_msgSend(v33, "fetchLocationOfInterestAtLocation:handler:", v31, v93);

        v35 = v34;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v35, v37))
          goto LABEL_16;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeIntervalSinceDate:", v36);
        v40 = v39;
        v41 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
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
          *(_WORD *)v109 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v46, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v109, 2u);
        }

        v47 = (void *)MEMORY[0x1E0CB35C8];
        v112[0] = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v109 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v112, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          v50 = objc_retainAutorelease(v49);

          v51 = 0;
        }
        else
        {
LABEL_16:
          v50 = 0;
          v51 = 1;
        }

        v62 = v50;
        if ((v51 & 1) == 0)
          objc_storeStrong(v98 + 5, v50);
        if (v98[5])
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            v91 = v98[5];
            *(_DWORD *)v109 = 136315394;
            *(_QWORD *)&v109[4] = "-[SMSessionMetricManager onSessionStartedWithState:]_block_invoke_2";
            v110 = 2112;
            v111 = v91;
            _os_log_error_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_ERROR, "%s, attempt to fetch LOI at location failed with error, %@", v109, 0x16u);
          }

        }
        v64 = (void *)*((_QWORD *)v104 + 5);
        if (v64)
        {
          objc_msgSend(v64, "place");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v65 == 0;

          if (!v66)
          {
            objc_msgSend(*((id *)v104 + 5), "place");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setOriginatingLocationTypeEnum:", objc_msgSend(v67, "type"));

          }
        }

        _Block_object_dispose(&v97, 8);
        _Block_object_dispose(buf, 8);

      }
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "destination");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "eta");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "destination");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "eta");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "expectedTravelTime");
        v75 = v74 > 0.0;

        if (v75)
        {
          objc_msgSend(*(id *)(a1 + 32), "configuration");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "destination");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "eta");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "expectedTravelTime");
          objc_msgSend(*(id *)(a1 + 40), "setOriginalNominalTravelTime:");

          objc_msgSend(*(id *)(a1 + 32), "configuration");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "destination");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "eta");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "additionalTravelTime");
          v83 = v82 > 0.0;

          if (v83)
          {
            v84 = (id *)(a1 + 40);
            objc_msgSend(*(id *)(a1 + 40), "originalNominalTravelTime");
            v86 = v85;
            objc_msgSend(*(id *)(a1 + 32), "configuration");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "destination");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "eta");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "additionalTravelTime");
            objc_msgSend(*v84, "setOriginalNominalTravelTime:", v86 + v90);

          }
        }
      }
      else
      {

      }
    }
    else
    {
      v53 = objc_msgSend(v14, "sessionType");

      if (v53 == 4)
      {
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "sessionWorkoutType");
        _HKWorkoutActivityNameForActivityType();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setWorkoutActivityTypeString:", v55);

        v56 = (void *)MEMORY[0x1E0CB6DD0];
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "sessionWorkoutType");
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "workoutWithActivityType:startDate:endDate:", v58, v59, v60);
        v92 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D217A0], "effectiveActivityTypeWithWorkout:", v92);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setIsWorkoutAlwaysOn:", objc_msgSend(v61, "supportsSafetyCheckInPrompt"));

      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

  }
}

void __52__SMSessionMetricManager_onSessionStartedWithState___block_invoke_472(uint64_t a1, void *a2, void *a3)
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

- (void)onSessionChangedWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SMSessionMetricManager_onSessionChangedWithConfiguration___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__SMSessionMetricManager_onSessionChangedWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setNumExtensions:", objc_msgSend(*(id *)(a1 + 32), "numExtensions") + 1);
  objc_msgSend(*(id *)(a1 + 40), "conversation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "receiverHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNumRecipients:", objc_msgSend(v2, "count"));

}

- (void)onSessionTerminatedWithReason:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SMSessionMetricManager_onSessionTerminatedWithReason___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __56__SMSessionMetricManager_onSessionTerminatedWithReason___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1 == 1)
    return objc_msgSend(*(id *)(result + 32), "setDidArriveSafely:", 1);
  if (v1 == 5 || v1 == 2)
    return objc_msgSend(*(id *)(result + 32), "setUserEndedSession:", 1);
  return result;
}

- (void)onBecomingActiveDevice:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SMSessionMetricManager_onBecomingActiveDevice___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __49__SMSessionMetricManager_onBecomingActiveDevice___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDidHandoffOccur:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setNumTakeover:", objc_msgSend(*(id *)(a1 + 32), "numTakeover") + 1);
}

- (void)onBecomingNonActiveDevice:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SMSessionMetricManager_onBecomingNonActiveDevice___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __52__SMSessionMetricManager_onBecomingNonActiveDevice___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDidHandoffOccur:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setNumHandoff:", objc_msgSend(*(id *)(a1 + 32), "numHandoff") + 1);
}

- (void)onSessionEndedForActiveDevice:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SMSessionMetricManager_onSessionEndedForActiveDevice___block_invoke;
  v6[3] = &unk_1E9297870;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __56__SMSessionMetricManager_onSessionEndedForActiveDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setWasActiveAtEnd:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionEndDate:", v2);

}

- (void)onLPMSeparation
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SMSessionMetricManager_onLPMSeparation__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__SMSessionMetricManager_onLPMSeparation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNumLPMSeparation:", objc_msgSend(*(id *)(a1 + 32), "numLPMSeparation") + 1);
}

- (void)onUnsupportedDeviceSeparation
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SMSessionMetricManager_onUnsupportedDeviceSeparation__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __55__SMSessionMetricManager_onUnsupportedDeviceSeparation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNumUnsupportedDeviceSeparation:", objc_msgSend(*(id *)(a1 + 32), "numUnsupportedDeviceSeparation") + 1);
}

- (void)onUserDisabledConnectivity
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SMSessionMetricManager_onUserDisabledConnectivity__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __52__SMSessionMetricManager_onUserDisabledConnectivity__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNumUserDisabledConnectivity:", objc_msgSend(*(id *)(a1 + 32), "numUserDisabledConnectivity") + 1);
}

- (void)cacheMostRecentLocationDistance:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SMSessionMetricManager_cacheMostRecentLocationDistance___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __58__SMSessionMetricManager_cacheMostRecentLocationDistance___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMostRecentLocationDistance:", *(double *)(a1 + 40));
}

- (void)onCrowFliesETAUpdate:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SMSessionMetricManager_onCrowFliesETAUpdate___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __47__SMSessionMetricManager_onCrowFliesETAUpdate___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "maxCrowFliesScaleFactor");
  if (v2 >= 0.0)
  {
    v5 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "previousCrowFliesETA");
    v7 = v5 / v6;
    objc_msgSend(*(id *)(a1 + 32), "maxCrowFliesScaleFactor");
    if (v7 >= v4)
      v4 = v7;
    v3 = *(void **)(a1 + 32);
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = 1.0;
  }
  objc_msgSend(v3, "setMaxCrowFliesScaleFactor:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "setPreviousCrowFliesETA:", *(double *)(a1 + 40));
}

- (void)onMapsETAUpdate:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SMSessionMetricManager_onMapsETAUpdate___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __42__SMSessionMetricManager_onMapsETAUpdate___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "maxMapsETAScaleFactor");
  if (v2 >= 0.0)
  {
    v5 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "previousMapsExpectedETA");
    v7 = v5 / v6;
    objc_msgSend(*(id *)(a1 + 32), "maxMapsETAScaleFactor");
    if (v7 >= v4)
      v4 = v7;
    v3 = *(void **)(a1 + 32);
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = 1.0;
  }
  objc_msgSend(v3, "setMaxMapsETAScaleFactor:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "setPreviousMapsExpectedETA:", *(double *)(a1 + 40));
}

- (void)onShouldUpdateETAUpperBoundWithETAUpdateState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SMSessionMetricManager_onShouldUpdateETAUpperBoundWithETAUpdateState___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __72__SMSessionMetricManager_onShouldUpdateETAUpperBoundWithETAUpdateState___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "etaUpdateStateQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "enqueueObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "etaUpdateStateQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(*(id *)(a1 + 32), "etaUpdateStateQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 0, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;

    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v14 = "-[SMSessionMetricManager onShouldUpdateETAUpperBoundWithETAUpdateState:]_block_invoke";
        v15 = 2112;
        v16 = v11;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%s, error archiving etaUpdateStateQueue, error, %@", buf, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"));

  }
}

- (void)updateClosestTimeIntervalToExceedingETAWithTimeInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__SMSessionMetricManager_updateClosestTimeIntervalToExceedingETAWithTimeInterval___block_invoke;
  v6[3] = &unk_1E9297BF0;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

uint64_t __82__SMSessionMetricManager_updateClosestTimeIntervalToExceedingETAWithTimeInterval___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t result;
  double v4;

  v2 = *(double *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "closestTimeIntervalToExceedingETA");
  if (v2 < v4)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "didDestinationAnomalyTrigger");
    if ((result & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setClosestTimeIntervalToExceedingETA:", *(double *)(a1 + 40));
      return objc_msgSend(*(id *)(a1 + 32), "_updateETASubmissionStates");
    }
  }
  return result;
}

- (void)onDeclareAnomalyForTriggerCategory:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMSessionMetricManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SMSessionMetricManager_onDeclareAnomalyForTriggerCategory___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __61__SMSessionMetricManager_onDeclareAnomalyForTriggerCategory___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v15;

  objc_msgSend(*(id *)(a1 + 32), "setNumAnomalyPrompt:", objc_msgSend(*(id *)(a1 + 32), "numAnomalyPrompt") + 1);
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("RTDefaultsSessionManagerHysteresisEventTypeKey"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsSessionManagerHysteresisEventTypeKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "setNumAnomalyPromptDuringHysteresis:", objc_msgSend(*(id *)(a1 + 32), "numAnomalyPromptDuringHysteresis") + 1);
  }
  else
  {

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "didTriggerOccur") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D8BA40], "isValidAnomaly:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "setFirstAnomalyTriggerCategoryEnum:", *(_QWORD *)(a1 + 40));
      if (objc_msgSend(*(id *)(a1 + 32), "sessionType") == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "initialDistance");
        if (v8 > 0.0)
        {
          objc_msgSend(*(id *)(a1 + 32), "mostRecentLocationDistance");
          if (v9 > 0.0)
          {
            objc_msgSend(*(id *)(a1 + 32), "mostRecentLocationDistance");
            v11 = v10;
            objc_msgSend(*(id *)(a1 + 32), "initialDistance");
            objc_msgSend(*(id *)(a1 + 32), "setRatioOfFirstAnomalyDistanceToTotalDistance:", v11 / v12);
          }
        }
      }
    }
  }
  v13 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v13 - 10) < 5)
    return objc_msgSend(*(id *)(a1 + 32), "setSosTriggered:", 1);
  if (v13 == 3)
    return objc_msgSend(*(id *)(a1 + 32), "setNoProgressTriggered:", 1);
  v15 = *(void **)(a1 + 32);
  if (v13 == 4)
    return objc_msgSend(v15, "setRouteDeviationTriggered:", 1);
  else
    return objc_msgSend(v15, "setDidDestinationAnomalyTrigger:", 1);
}

- (void)onWorkoutEnded
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SMSessionMetricManager_onWorkoutEnded__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __40__SMSessionMetricManager_onWorkoutEnded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDidWorkoutEnd:", 1);
}

- (void)onWorkoutPaused
{
  NSObject *v3;
  _QWORD block[5];

  -[SMSessionMetricManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SMSessionMetricManager_onWorkoutPaused__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__SMSessionMetricManager_onWorkoutPaused__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDidWorkoutPause:", 1);
}

- (void)onUserActionWithRemoteCommand:(int64_t)a3 remoteCommandType:(int64_t)a4 error:(int64_t)a5 errorDomain:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  __CFString *v23;

  v23 = (__CFString *)a6;
  v10 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D8BBE8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D8BBF0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager _isCellularActivated](self, "_isCellularActivated"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D8BC08]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager _isStandalone](self, "_isStandalone"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D8BC10]);

  v15 = *MEMORY[0x1E0D8BC18];
  if (a5)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D8BBF8]);

    v17 = *MEMORY[0x1E0D8BC00];
    v18 = v10;
    v19 = v23;
  }
  else
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v15);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E9328D90, *MEMORY[0x1E0D8BBF8]);
    v17 = *MEMORY[0x1E0D8BC00];
    v19 = CFSTR("Unknown");
    v18 = v10;
  }
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v17);
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v21 = (void *)objc_msgSend(v20, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorRemoteUserActionsMetrics, 1);
  log_analytics_submission(v21, v10);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (BOOL)_isCellularActivated
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
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
  id v21;
  NSObject *v22;
  BOOL v23;
  objc_class *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  intptr_t (*v30)(uint64_t, char, uint64_t);
  void *v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _BYTE buf[12];
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v2 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __46__SMSessionMetricManager__isCellularActivated__block_invoke;
  v31 = &unk_1E929F3E8;
  v33 = &v34;
  v4 = v2;
  v32 = v4;
  +[SMInitiatorEligibility checkCellularEnabledWithQueue:handler:](SMInitiatorEligibility, "checkCellularEnabledWithQueue:handler:", v3, &v28);

  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v28, v29, v30, v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 60000000000);
  if (!dispatch_semaphore_wait(v5, v7))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v6);
  v10 = v9;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_98);
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
  v43[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v43, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_retainAutorelease(v19);

  }
  else
  {
LABEL_6:
    v20 = 0;
  }

  v21 = v20;
  if (v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "description");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v26;
      v39 = 2080;
      v40 = "-[SMSessionMetricManager _isCellularActivated]";
      v41 = 2112;
      v42 = v27;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "%@,%s,sema error,%@", buf, 0x20u);

    }
  }
  v23 = *((_BYTE *)v35 + 24) != 0;

  _Block_object_dispose(&v34, 8);
  return v23;
}

intptr_t __46__SMSessionMetricManager__isCellularActivated__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isStandalone
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D8B928]);
  -[SMSessionMetricManager queue](self, "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);

  LOBYTE(v4) = objc_msgSend(v5, "isEffectivePairedDeviceNearby") ^ 1;
  return (char)v4;
}

- (void)setDidTriggerOccur:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_didTriggerOccur = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerDidTriggerOccurKey"));

}

- (void)initialDistance:(double)a3
{
  void *v4;
  id v5;

  self->_initialDistance = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerInitialDistanceKey"));

}

- (void)setSessionDestinationType:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_sessionDestinationType = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerDestinationLocationTypeEnumKey"));

}

- (void)setRatioOfFirstAnomalyDistanceToTotalDistance:(double)a3
{
  void *v4;
  id v5;

  self->_ratioOfFirstAnomalyDistanceToTotalDistance = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerRatioOfFirstAnomalyDistanceToTotalDistanceKey"));

}

- (void)setMostRecentLocationDistance:(double)a3
{
  void *v4;
  id v5;

  self->_mostRecentLocationDistance = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerMostRecentLocationDistanceKey"));

}

- (void)setOriginalNominalTravelTime:(double)a3
{
  void *v4;
  id v5;

  self->_originalNominalTravelTime = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerOriginalNominalTravelTimeKey"));

}

- (void)setOriginatingLocationTypeEnum:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_originatingLocationTypeEnum = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerOriginatingLocationTypeKey"));

}

- (void)setFirstAnomalyTriggerCategoryEnum:(unint64_t)a3
{
  void *v5;
  id v6;

  self->_firstAnomalyTriggerCategoryEnum = a3;
  -[SMSessionMetricManager setDidTriggerOccur:](self, "setDidTriggerOccur:", 1);
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("RTDefaultsSessionMetricManagerFirstAnomalyTriggerCategoryEnumKey"));

}

- (void)setNumExtensions:(int)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)&a3;
  self->_numExtensions = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumExtensionsKey"));

}

- (void)setSessionStartDate:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_sessionStartDate, a3);
  v5 = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("RTDefaultsSessionMetricManagerSessionStartDateKey"));

}

- (void)setSessionEndDate:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_sessionEndDate, a3);
  v5 = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("RTDefaultsSessionMetricManagerSessionEndDateKey"));

  -[SMSessionMetricManager submitMetrics](self, "submitMetrics");
}

- (void)setInitialDestinationExpectedTravelTime:(double)a3
{
  void *v4;
  id v5;

  self->_initialDestinationExpectedTravelTime = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerInitialDestinationExpectedTravelTimeKey"));

}

- (void)setMaxCrowFliesScaleFactor:(double)a3
{
  void *v4;
  id v5;

  self->_maxCrowFliesScaleFactor = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerMaxCrowFliesScaleFactorKey"));

}

- (void)setMaxMapsETAScaleFactor:(double)a3
{
  void *v4;
  id v5;

  self->_maxMapsETAScaleFactor = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerMaxMapsETAScaleFactorKey"));

}

- (void)setClosestTimeIntervalToExceedingETA:(double)a3
{
  void *v4;
  id v5;

  self->_closestTimeIntervalToExceedingETA = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerClosestTimeIntervalToExceedingETAKey"));

}

- (void)setDidDestinationAnomalyTrigger:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_didDestinationAnomalyTrigger = a3;
  -[SMSessionMetricManager setDidTriggerOccur:](self, "setDidTriggerOccur:", 1);
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RTDefaultsSessionMetricManagerDidDestinationAnomalyTriggerKey"));

  if (v3)
    -[SMSessionMetricManager _updateETASubmissionStates](self, "_updateETASubmissionStates");
}

- (void)setNoProgressTriggered:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_noProgressTriggered = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RTDefaultsSessionMetricManagerNoProgressTriggeredKey"));

  -[SMSessionMetricManager setDidDestinationAnomalyTrigger:](self, "setDidDestinationAnomalyTrigger:", 1);
}

- (void)setRouteDeviationTriggered:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_routeDeviationTriggered = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RTDefaultsSessionMetricManagerRouteDeviationTriggeredKey"));

  -[SMSessionMetricManager setDidDestinationAnomalyTrigger:](self, "setDidDestinationAnomalyTrigger:", 1);
}

- (void)setDidArriveSafely:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_didArriveSafely = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerDidArriveSafelyKey"));

}

- (void)setSosTriggered:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  self->_sosTriggered = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("RTDefaultsSessionMetricManagerSosTriggeredKey"));

  -[SMSessionMetricManager setDidTriggerOccur:](self, "setDidTriggerOccur:", 1);
  if (v3)
    -[SMSessionMetricManager _updateETASubmissionStates](self, "_updateETASubmissionStates");
}

- (void)setUserEndedSession:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_userEndedSession = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerUserEndedSessionKey"));

}

- (void)setPreviousCrowFliesETA:(double)a3
{
  void *v4;
  id v5;

  self->_previousCrowFliesETA = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerPreviousCrowFliesETAKey"));

}

- (void)setPreviousMapsExpectedETA:(double)a3
{
  void *v4;
  id v5;

  self->_previousMapsExpectedETA = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerPreviousMapsExpectedETAKey"));

}

- (void)setEtaUpdateStateQueue:(id)a3
{
  id v5;
  RTFixedSizeQueue *etaUpdateStateQueue;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_etaUpdateStateQueue, a3);
  etaUpdateStateQueue = self->_etaUpdateStateQueue;
  if (etaUpdateStateQueue)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", etaUpdateStateQueue, 0, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v14 = "-[SMSessionMetricManager setEtaUpdateStateQueue:]";
        v15 = 2112;
        v16 = v11;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%s, error archiving etaUpdateStateQueue, error, %@", buf, 0x16u);

      }
    }
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("RTDefaultsSessionMetricManagerEtaUpdateStateQueueKey"));

  }
}

- (void)setEtaUpdateSubmissionQueue:(id)a3
{
  id v5;
  RTFixedSizeQueue *etaUpdateSubmissionQueue;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_etaUpdateSubmissionQueue, a3);
  etaUpdateSubmissionQueue = self->_etaUpdateSubmissionQueue;
  if (etaUpdateSubmissionQueue)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", etaUpdateSubmissionQueue, 0, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    if (v8)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v14 = "-[SMSessionMetricManager setEtaUpdateSubmissionQueue:]";
        v15 = 2112;
        v16 = v11;
        _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%s, error archiving etaUpdateSubmissionQueue, error, %@", buf, 0x16u);

      }
    }
    -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("RTDefaultsSessionMetricManagerEtaUpdateSubmissionQueueKey"));

  }
}

- (void)setDidHandoffOccur:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_didHandoffOccur = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerDidHandoffOccurKey"));

}

- (void)setWasActiveAtStart:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_wasActiveAtStart = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerWasActiveAtStartKey"));

}

- (void)setWasActiveAtEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_wasActiveAtEnd = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerWasActiveAtEndKey"));

}

- (void)setNumAnomalyPrompt:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numAnomalyPrompt = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptKey"));

}

- (void)setNumAnomalyPromptDuringHysteresis:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numAnomalyPromptDuringHysteresis = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumAnomalyPromptDuringHysteresisKey"));

}

- (void)setNumHandoff:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numHandoff = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumHandoffKey"));

}

- (void)setNumLPMSeparation:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numLPMSeparation = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumLPMSeparationKey"));

}

- (void)setNumTakeover:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numTakeover = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumTakeoverKey"));

}

- (void)setNumUnsupportedDeviceSeparation:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numUnsupportedDeviceSeparation = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumUnsupportedDeviceSeparationKey"));

}

- (void)setNumUserDisabledConnectivity:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numUserDisabledConnectivity = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumUserDisabledConnectivityKey"));

}

- (void)setDidWorkoutEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_didWorkoutEnd = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerDidWorkoutEndKey"));

}

- (void)setDidWorkoutPause:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_didWorkoutPause = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerDidWorkoutPauseKey"));

}

- (void)setIsWorkoutAlwaysOn:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  self->_isWorkoutAlwaysOn = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerIsWorkoutAlwaysOnKey"));

}

- (void)setModeOfTransportation:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_modeOfTransportation = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerModeOfTransportationKey"));

}

- (void)setNumRecipients:(unint64_t)a3
{
  void *v4;
  id v5;

  self->_numRecipients = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RTDefaultsSessionMetricManagerNumRecipientsKey"));

}

- (void)setWorkoutActivityTypeString:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_workoutActivityTypeString, a3);
  v5 = a3;
  -[SMSessionMetricManager defaultsManager](self, "defaultsManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("RTDefaultsSessionMetricManagerWorkoutActivityTypeStringKey"));

}

- (id)collectDestinationSessionMetrics
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  double v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
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
  void *v47;
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
  uint64_t v58;
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

  -[SMSessionMetricManager _createDestinationMetricDictionary](self, "_createDestinationMetricDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMetricManager sessionEndDate](self, "sessionEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMetricManager sessionStartDate](self, "sessionStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sessionDuration"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = -[SMSessionMetricManager didDestinationAnomalyTrigger](self, "didDestinationAnomalyTrigger")
     || -[SMSessionMetricManager noProgressTriggered](self, "noProgressTriggered")
     || -[SMSessionMetricManager routeDeviationTriggered](self, "routeDeviationTriggered")
     || -[SMSessionMetricManager sosTriggered](self, "sosTriggered");
  objc_msgSend(v9, "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("anyTrigger"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[SMSessionMetricManager initialDestinationExpectedTravelTime](self, "initialDestinationExpectedTravelTime");
  objc_msgSend(v12, "numberWithDouble:", v7 / v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("actualETAScaleFactor"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[SMSessionMetricManager initialDestinationExpectedTravelTime](self, "initialDestinationExpectedTravelTime");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("initialETA"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[SMSessionMetricManager maxCrowFliesScaleFactor](self, "maxCrowFliesScaleFactor");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("maxCrowFliesETAScaleFactor"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[SMSessionMetricManager maxMapsETAScaleFactor](self, "maxMapsETAScaleFactor");
  objc_msgSend(v19, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("maxMapsExpectedETAScaleFactor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager noProgressTriggered](self, "noProgressTriggered"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("noProgressTriggered"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager routeDeviationTriggered](self, "routeDeviationTriggered"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("routeDeviationTriggered"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager didArriveSafely](self, "didArriveSafely"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("safeArrivalOccurred"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager sosTriggered](self, "sosTriggered"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("SOSTriggered"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager userEndedSession](self, "userEndedSession"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("userEndedSession"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager didHandoffOccur](self, "didHandoffOccur"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("didHandoffOccur"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager wasActiveAtStart](self, "wasActiveAtStart"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("wasActiveAtStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager wasActiveAtEnd](self, "wasActiveAtEnd"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("wasActiveAtEnd"));

  -[SMSessionMetricManager etaUpdateSubmissionQueue](self, "etaUpdateSubmissionQueue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  -[SMSessionMetricManager etaUpdateSubmissionQueue](self, "etaUpdateSubmissionQueue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v30 >= 2)
  {
    objc_msgSend(v31, "dequeueObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[SMSessionMetricManager etaUpdateSubmissionQueue](self, "etaUpdateSubmissionQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dequeueObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "nominalTravelTimeDifference");
    objc_msgSend(v36, "numberWithDouble:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("nominalTravelTimeRemainingDifferencePrior"));

    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "nominalTravelTimeRemaining");
    objc_msgSend(v38, "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("nominalTravelTimeRemainingPrior"));

    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "distanceDifference");
    objc_msgSend(v40, "numberWithDouble:");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("distanceRemainingDifferencePrior"));

    v42 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "distanceRemaining");
    objc_msgSend(v42, "numberWithDouble:");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("distanceRemainingPrior"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "nominalTravelTimeShorter"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("nominalTravelTimeShorterPrior"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "remainingDistanceShorter"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("remainingDistanceShorterPrior"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "shouldUpdateETAUpperBound"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("shouldUpdateUpperBoundETAPrior"));

    v47 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v35, "nominalTravelTimeDifference");
    objc_msgSend(v47, "numberWithDouble:");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("nominalTravelTimeRemainingDifference"));

    v49 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v35, "nominalTravelTimeRemaining");
    objc_msgSend(v49, "numberWithDouble:");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("nominalTravelTimeRemaining"));

    v51 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v35, "distanceDifference");
    objc_msgSend(v51, "numberWithDouble:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("distanceRemainingDifference"));

    v53 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v35, "distanceRemaining");
    objc_msgSend(v53, "numberWithDouble:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, CFSTR("distanceRemaining"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v35, "nominalTravelTimeShorter"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("nominalTravelTimeShorter"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v35, "remainingDistanceShorter"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("remainingDistanceShorter"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v35, "shouldUpdateETAUpperBound"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("shouldUpdateUpperBoundETA"));

LABEL_9:
    return v3;
  }
  v58 = objc_msgSend(v31, "count");

  if (v58)
  {
    -[SMSessionMetricManager etaUpdateSubmissionQueue](self, "etaUpdateSubmissionQueue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "dequeueObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "nominalTravelTimeDifference");
    objc_msgSend(v60, "numberWithDouble:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("nominalTravelTimeRemainingDifference"));

    v62 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "nominalTravelTimeRemaining");
    objc_msgSend(v62, "numberWithDouble:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("nominalTravelTimeRemaining"));

    v64 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "distanceDifference");
    objc_msgSend(v64, "numberWithDouble:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("distanceRemainingDifference"));

    v66 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v33, "distanceRemaining");
    objc_msgSend(v66, "numberWithDouble:");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v67, CFSTR("distanceRemaining"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "nominalTravelTimeShorter"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("nominalTravelTimeShorter"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "remainingDistanceShorter"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v69, CFSTR("remainingDistanceShorter"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v33, "shouldUpdateETAUpperBound"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("shouldUpdateUpperBoundETA"));
    goto LABEL_9;
  }
  return v3;
}

- (id)collectInitiatorPerSessionMetrics
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
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
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;

  v3 = (void *)objc_opt_new();
  -[SMSessionMetricManager sessionEndDate](self, "sessionEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMetricManager sessionStartDate](self, "sessionStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[SMSessionMetricManager numExtensions](self, "numExtensions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numExtensions"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[SMSessionMetricManager originalNominalTravelTime](self, "originalNominalTravelTime");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("originalNominalTravelTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager originatingLocationTypeEnum](self, "originatingLocationTypeEnum"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("originatingLocationTypeEnum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("sessionDuration"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[SMSessionMetricManager ratioOfFirstAnomalyDistanceToTotalDistance](self, "ratioOfFirstAnomalyDistanceToTotalDistance");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("ratioOfFirstAnomalyDistanceToTotalDistance"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager sessionDestinationType](self, "sessionDestinationType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("destinationLocationTypeEnum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager didTriggerOccur](self, "didTriggerOccur"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("didAnomalyPrompt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager didArriveSafely](self, "didArriveSafely"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("didSafeArrival"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager firstAnomalyTriggerCategoryEnum](self, "firstAnomalyTriggerCategoryEnum"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("firstAnomalyTriggerCategoryEnum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager sessionType](self, "sessionType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("sessionTypeEnum"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numAnomalyPrompt](self, "numAnomalyPrompt"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("numAnomalyPrompt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numAnomalyPromptDuringHysteresis](self, "numAnomalyPromptDuringHysteresis"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("numAnomalyPromptDuringHysteresis"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numHandoff](self, "numHandoff"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("numHandoff"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numLPMSeparation](self, "numLPMSeparation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("numLPMSeparation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numTakeover](self, "numTakeover"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("numTakeover"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numUnsupportedDeviceSeparation](self, "numUnsupportedDeviceSeparation"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("numUnsupportedDeviceSeparation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numUserDisabledConnectivity](self, "numUserDisabledConnectivity"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("numUserDisabledConnectivity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager didWorkoutEnd](self, "didWorkoutEnd"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("didWorkoutEnd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager didWorkoutPause](self, "didWorkoutPause"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("didWorkoutPause"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager _isCellularActivated](self, "_isCellularActivated"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("isCellularActivated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager _isStandalone](self, "_isStandalone"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("isStandalone"));

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v31, "isHealthDataSubmissionAllowed");

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager isWorkoutAlwaysOn](self, "isWorkoutAlwaysOn"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("isWorkoutAlwaysOn"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager modeOfTransportation](self, "modeOfTransportation"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("modeOfTransportation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSessionMetricManager numRecipients](self, "numRecipients"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("numRecipients"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager wasActiveAtEnd](self, "wasActiveAtEnd"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("wasActiveAtEnd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SMSessionMetricManager wasActiveAtStart](self, "wasActiveAtStart"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("wasActiveAtStart"));

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isHealthDataSubmissionAllowed");

  if (v38)
  {
    -[SMSessionMetricManager workoutActivityTypeString](self, "workoutActivityTypeString");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v39;
    if (v39)
      v41 = (const __CFString *)v39;
    else
      v41 = CFSTR("Unknown");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("workoutActivityTypeString"));

  }
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMSessionMetricManager sessionStartDate](self, "sessionStartDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "components:fromDate:", 32, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend(v44, "hour");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("sessionStartTimeOfDay"));

  return v3;
}

- (void)submitMetrics
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (-[SMSessionMetricManager sessionType](self, "sessionType") == 2)
  {
    -[SMSessionMetricManager collectDestinationSessionMetrics](self, "collectDestinationSessionMetrics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    v5 = (void *)objc_msgSend(v4, "initWithCString:encoding:", RTAnalyticsEventSessionMonitorMetrics, 1);
    log_analytics_submission(v5, v3);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
  -[SMSessionMetricManager collectInitiatorPerSessionMetrics](self, "collectInitiatorPerSessionMetrics");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = (void *)objc_msgSend(v7, "initWithCString:encoding:", RTAnalyticsEventSafetyMonitorInitiatorPerSessionDetails, 1);
  log_analytics_submission(v8, v10);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[SMSessionMetricManager _reset](self, "_reset");
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUUID)currentDeviceIdentifier
{
  return self->_currentDeviceIdentifier;
}

- (void)setCurrentDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentDeviceIdentifier, a3);
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)sessionEndDate
{
  return self->_sessionEndDate;
}

- (RTFixedSizeQueue)etaUpdateStateQueue
{
  return self->_etaUpdateStateQueue;
}

- (RTFixedSizeQueue)etaUpdateSubmissionQueue
{
  return self->_etaUpdateSubmissionQueue;
}

- (double)closestTimeIntervalToExceedingETA
{
  return self->_closestTimeIntervalToExceedingETA;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_sessionType = a3;
}

- (double)initialDestinationExpectedTravelTime
{
  return self->_initialDestinationExpectedTravelTime;
}

- (double)previousCrowFliesETA
{
  return self->_previousCrowFliesETA;
}

- (double)previousMapsExpectedETA
{
  return self->_previousMapsExpectedETA;
}

- (double)maxCrowFliesScaleFactor
{
  return self->_maxCrowFliesScaleFactor;
}

- (double)maxMapsETAScaleFactor
{
  return self->_maxMapsETAScaleFactor;
}

- (BOOL)didDestinationAnomalyTrigger
{
  return self->_didDestinationAnomalyTrigger;
}

- (BOOL)noProgressTriggered
{
  return self->_noProgressTriggered;
}

- (BOOL)routeDeviationTriggered
{
  return self->_routeDeviationTriggered;
}

- (BOOL)didArriveSafely
{
  return self->_didArriveSafely;
}

- (BOOL)sosTriggered
{
  return self->_sosTriggered;
}

- (BOOL)userEndedSession
{
  return self->_userEndedSession;
}

- (BOOL)didTriggerOccur
{
  return self->_didTriggerOccur;
}

- (double)initialDistance
{
  return self->_initialDistance;
}

- (void)setInitialDistance:(double)a3
{
  self->_initialDistance = a3;
}

- (unint64_t)sessionDestinationType
{
  return self->_sessionDestinationType;
}

- (double)ratioOfFirstAnomalyDistanceToTotalDistance
{
  return self->_ratioOfFirstAnomalyDistanceToTotalDistance;
}

- (double)mostRecentLocationDistance
{
  return self->_mostRecentLocationDistance;
}

- (double)originalNominalTravelTime
{
  return self->_originalNominalTravelTime;
}

- (unint64_t)firstAnomalyTriggerCategoryEnum
{
  return self->_firstAnomalyTriggerCategoryEnum;
}

- (int)numExtensions
{
  return self->_numExtensions;
}

- (unint64_t)originatingLocationTypeEnum
{
  return self->_originatingLocationTypeEnum;
}

- (unint64_t)numAnomalyPrompt
{
  return self->_numAnomalyPrompt;
}

- (unint64_t)numAnomalyPromptDuringHysteresis
{
  return self->_numAnomalyPromptDuringHysteresis;
}

- (unint64_t)numHandoff
{
  return self->_numHandoff;
}

- (unint64_t)numLPMSeparation
{
  return self->_numLPMSeparation;
}

- (unint64_t)numTakeover
{
  return self->_numTakeover;
}

- (unint64_t)numUnsupportedDeviceSeparation
{
  return self->_numUnsupportedDeviceSeparation;
}

- (unint64_t)numUserDisabledConnectivity
{
  return self->_numUserDisabledConnectivity;
}

- (BOOL)didWorkoutEnd
{
  return self->_didWorkoutEnd;
}

- (BOOL)didWorkoutPause
{
  return self->_didWorkoutPause;
}

- (BOOL)isWorkoutAlwaysOn
{
  return self->_isWorkoutAlwaysOn;
}

- (unint64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (unint64_t)numRecipients
{
  return self->_numRecipients;
}

- (NSString)workoutActivityTypeString
{
  return self->_workoutActivityTypeString;
}

- (BOOL)didHandoffOccur
{
  return self->_didHandoffOccur;
}

- (BOOL)wasActiveAtStart
{
  return self->_wasActiveAtStart;
}

- (BOOL)wasActiveAtEnd
{
  return self->_wasActiveAtEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutActivityTypeString, 0);
  objc_storeStrong((id *)&self->_etaUpdateSubmissionQueue, 0);
  objc_storeStrong((id *)&self->_etaUpdateStateQueue, 0);
  objc_storeStrong((id *)&self->_sessionEndDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_currentDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
