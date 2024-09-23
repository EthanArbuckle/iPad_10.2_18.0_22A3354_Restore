@implementation SMTriggerDestination

- (SMTriggerDestination)initWithQueue:(id)a3 defaultsManager:(id)a4 dataProtectionManager:(id)a5 locationManager:(id)a6 motionActivityManager:(id)a7 distanceCalculator:(id)a8 platform:(id)a9 sessionStore:(id)a10 timerManager:(id)a11 sessionMetricManager:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  SMTriggerDestination *v26;
  NSObject *v27;
  SMTriggerDestination *v28;
  id *p_isa;
  SMTriggerDestination *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v46;
  objc_super v47;
  uint8_t buf[4];
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v37 = a4;
  v18 = a4;
  v38 = a5;
  v43 = a5;
  v39 = a6;
  v19 = a6;
  v40 = a7;
  v20 = a7;
  v41 = a8;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v46 = a11;
  v24 = a12;
  v42 = v17;
  v44 = v24;
  if (v17)
  {
    if (v18)
    {
      v25 = v43;
      v26 = self;
      if (v43)
      {
        if (v19)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v46)
                  {
                    if (v24)
                    {
                      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      v27 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        v49 = "-[SMTriggerDestination initWithQueue:defaultsManager:dataProtectionManager:locationManager"
                              ":motionActivityManager:distanceCalculator:platform:sessionStore:timerManager:sessionMetricManager:]";
                        _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
                      }

                      v47.receiver = self;
                      v47.super_class = (Class)SMTriggerDestination;
                      v28 = -[SMTriggerDestination init](&v47, sel_init);
                      p_isa = (id *)&v28->super.isa;
                      if (v28)
                      {
                        objc_storeStrong((id *)&v28->_queue, a3);
                        objc_storeStrong(p_isa + 3, v37);
                        objc_storeStrong(p_isa + 4, v38);
                        objc_storeStrong(p_isa + 5, v39);
                        objc_storeStrong(p_isa + 6, v40);
                        objc_storeStrong(p_isa + 7, v41);
                        objc_storeStrong(p_isa + 8, a9);
                        objc_storeStrong(p_isa + 9, a10);
                        objc_storeStrong(p_isa + 12, a11);
                        objc_storeStrong(p_isa + 13, a12);
                        objc_msgSend(p_isa, "setup");
                      }
                      v26 = p_isa;
                      v30 = v26;
                      goto LABEL_39;
                    }
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v34 = "Invalid parameter not satisfying: sessionMetricManager";
                      goto LABEL_37;
                    }
LABEL_38:

                    v30 = 0;
LABEL_39:
                    v32 = v42;
                    goto LABEL_40;
                  }
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    goto LABEL_38;
                  *(_WORD *)buf = 0;
                  v34 = "Invalid parameter not satisfying: timerManager";
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    goto LABEL_38;
                  *(_WORD *)buf = 0;
                  v34 = "Invalid parameter not satisfying: sessionStore";
                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v33 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  goto LABEL_38;
                *(_WORD *)buf = 0;
                v34 = "Invalid parameter not satisfying: platform";
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v33 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                goto LABEL_38;
              *(_WORD *)buf = 0;
              v34 = "Invalid parameter not satisfying: distanceCalculator";
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v33 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              goto LABEL_38;
            *(_WORD *)buf = 0;
            v34 = "Invalid parameter not satisfying: motionActivityManager";
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            goto LABEL_38;
          *(_WORD *)buf = 0;
          v34 = "Invalid parameter not satisfying: locationManager";
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          goto LABEL_38;
        *(_WORD *)buf = 0;
        v34 = "Invalid parameter not satisfying: dataProtectionManager";
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v33 = objc_claimAutoreleasedReturnValue();
      v25 = v43;
      v26 = self;
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_WORD *)buf = 0;
      v34 = "Invalid parameter not satisfying: defaultsManager";
    }
LABEL_37:
    _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, v34, buf, 2u);
    goto LABEL_38;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
  }

  v30 = 0;
  v32 = 0;
  v25 = v43;
  v26 = self;
LABEL_40:

  return v30;
}

+ (void)updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  double v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageSpeedAnyKey"), &unk_1E932D4A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 != 1.5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      v30 = 2080;
      v31 = "overriding destination average speed any";
      v32 = 2048;
      v33 = 0x3FF8000000000000;
      v34 = 2048;
      v35 = v6;
      v36 = 2112;
      v37 = CFSTR("RTDefaultsSMTriggerDestinationAverageSpeedAnyKey");
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  objc_msgSend(v3, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey"), &unk_1E932D4B0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v10 != 8.3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      v30 = 2080;
      v31 = "overriding destination average speed automobile";
      v32 = 2048;
      v33 = 0x402099999999999ALL;
      v34 = 2048;
      v35 = v10;
      v36 = 2112;
      v37 = CFSTR("RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey");
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  objc_msgSend(v3, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey"), &unk_1E932D4C0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  if (v14 != 0.4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      v30 = 2080;
      v31 = "overriding average speed walking";
      v32 = 2048;
      v33 = 0x3FD999999999999ALL;
      v34 = 2048;
      v35 = v14;
      v36 = 2112;
      v37 = CFSTR("RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey");
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  objc_msgSend(v3, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageTransitSpeedKey"), &unk_1E932D4D0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v18 != 6.3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v29 = "+[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:]";
      v30 = 2080;
      v31 = "overriding average speed transit";
      v32 = 2048;
      v33 = 0x4019333333333333;
      v34 = 2048;
      v35 = v18;
      v36 = 2112;
      v37 = CFSTR("RTDefaultsSMTriggerDestinationAverageTransitSpeedKey");
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  if (!SMTriggerDestinationTransportTypeToAvgSpeed)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6, &unk_1E93292A0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    v26[1] = &unk_1E93292B8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v21;
    v26[2] = &unk_1E93292D0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v22;
    v26[3] = &unk_1E93292E8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
    SMTriggerDestinationTransportTypeToAvgSpeed = v24;

  }
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[SMTriggerDestination queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SMTriggerDestination_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __29__SMTriggerDestination_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  NSObject *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  NSObject *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  NSObject *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  NSObject *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  NSObject *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  NSObject *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  NSObject *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  NSObject *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  NSObject *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  NSObject *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  _QWORD v74[4];
  _QWORD v75[4];
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  double v83;
  __int16 v84;
  const __CFString *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v77 = "-[SMTriggerDestination _setup]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v4 = (void *)objc_opt_new();
  -[SMTriggerDestination setTimerIdentifierToTimers:](self, "setTimerIdentifierToTimers:", v4);

  -[SMTriggerDestination setTriggerCategory:](self, "setTriggerCategory:", 0);
  v5 = (void *)objc_opt_new();
  -[SMTriggerDestination setCachedLocationEvents:](self, "setCachedLocationEvents:", v5);

  -[SMTriggerDestination setCoarseEta:](self, "setCoarseEta:", 0);
  -[SMTriggerDestination platform](self, "platform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "internalInstall");

  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationScaleFactorInternalKey"), &unk_1E932D4E0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    -[SMTriggerDestination setEtaScaleFactor:](self, "setEtaScaleFactor:");

    -[SMTriggerDestination etaScaleFactor](self, "etaScaleFactor");
    if (v11 == 2.0)
      goto LABEL_12;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    -[SMTriggerDestination etaScaleFactor](self, "etaScaleFactor");
    *(_DWORD *)buf = 136316162;
    v77 = "-[SMTriggerDestination _setup]";
    v78 = 2080;
    v79 = "overriding internal eta scale factor";
    v80 = 2048;
    v81 = 0x4000000000000000;
    v82 = 2048;
    v83 = v13;
    v84 = 2112;
    v85 = CFSTR("RTDefaultsSMTriggerDestinationScaleFactorInternalKey");
    goto LABEL_10;
  }
  objc_msgSend(v8, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationScaleFactorExternalKey"), &unk_1E932D4E0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  -[SMTriggerDestination setEtaScaleFactor:](self, "setEtaScaleFactor:");

  -[SMTriggerDestination etaScaleFactor](self, "etaScaleFactor");
  if (v15 == 2.0)
    goto LABEL_12;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SMTriggerDestination etaScaleFactor](self, "etaScaleFactor");
    *(_DWORD *)buf = 136316162;
    v77 = "-[SMTriggerDestination _setup]";
    v78 = 2080;
    v79 = "overriding external eta scale factor";
    v80 = 2048;
    v81 = 0x4000000000000000;
    v82 = 2048;
    v83 = v16;
    v84 = 2112;
    v85 = CFSTR("RTDefaultsSMTriggerDestinationScaleFactorExternalKey");
LABEL_10:
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
  }
LABEL_11:

LABEL_12:
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationSignificantMoveThresholdKey"), &unk_1E932D4F0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  -[SMTriggerDestination setSignificantMoveThreshold:](self, "setSignificantMoveThreshold:");

  -[SMTriggerDestination significantMoveThreshold](self, "significantMoveThreshold");
  if (v19 != 200.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination significantMoveThreshold](self, "significantMoveThreshold");
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding significant move threshold";
      v80 = 2048;
      v81 = 0x4069000000000000;
      v82 = 2048;
      v83 = v21;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationSignificantMoveThresholdKey");
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationIdleMaxDistanceThresholdKey"), &unk_1E932D500);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  -[SMTriggerDestination setIdleMaxDistanceThreshold:](self, "setIdleMaxDistanceThreshold:");

  -[SMTriggerDestination idleMaxDistanceThreshold](self, "idleMaxDistanceThreshold");
  if (v24 != 250.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination idleMaxDistanceThreshold](self, "idleMaxDistanceThreshold");
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding idle to progress transition max distance threshold";
      v80 = 2048;
      v81 = 0x406F400000000000;
      v82 = 2048;
      v83 = v26;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationIdleMaxDistanceThresholdKey");
      _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationStatusUpdateTimeIntervalKey"), &unk_1E932D510);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  -[SMTriggerDestination setDestinationStatusUpdateTimeInterval:](self, "setDestinationStatusUpdateTimeInterval:");

  -[SMTriggerDestination destinationStatusUpdateTimeInterval](self, "destinationStatusUpdateTimeInterval");
  if (v29 != 450.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination destinationStatusUpdateTimeInterval](self, "destinationStatusUpdateTimeInterval");
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding destination status update time interval";
      v80 = 2048;
      v81 = 0x407C200000000000;
      v82 = 2048;
      v83 = v31;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationStatusUpdateTimeIntervalKey");
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationIdleTimeoutThresholdKey"), &unk_1E932D520);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  -[SMTriggerDestination setIdleTimeoutThreshold:](self, "setIdleTimeoutThreshold:");

  -[SMTriggerDestination idleTimeoutThreshold](self, "idleTimeoutThreshold");
  if (v34 != 900.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination idleTimeoutThreshold](self, "idleTimeoutThreshold");
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding idle timeout threshold";
      v80 = 2048;
      v81 = 0x408C200000000000;
      v82 = 2048;
      v83 = v36;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationIdleTimeoutThresholdKey");
      _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationNoProgressTimeoutThresholdKey"), &unk_1E932D520);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  -[SMTriggerDestination setNoProgressTimeoutThreshold:](self, "setNoProgressTimeoutThreshold:");

  -[SMTriggerDestination noProgressTimeoutThreshold](self, "noProgressTimeoutThreshold");
  if (v39 != 900.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination noProgressTimeoutThreshold](self, "noProgressTimeoutThreshold");
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding no progress timeout threshold";
      v80 = 2048;
      v81 = 0x408C200000000000;
      v82 = 2048;
      v83 = v41;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationNoProgressTimeoutThresholdKey");
      _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey"), &unk_1E932D530);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "doubleValue");
  -[SMTriggerDestination setMinDistanceUpdateThreshold:](self, "setMinDistanceUpdateThreshold:");

  -[SMTriggerDestination minDistanceUpdateThreshold](self, "minDistanceUpdateThreshold");
  if (v44 != 2000.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination minDistanceUpdateThreshold](self, "minDistanceUpdateThreshold");
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding min distance to update threshold";
      v80 = 2048;
      v81 = 0x409F400000000000;
      v82 = 2048;
      v83 = v46;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey");
      _os_log_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageSpeedAnyKey"), &unk_1E932D4A0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "doubleValue");
  v50 = v49;

  if (v50 != 1.5)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding average speed for any";
      v80 = 2048;
      v81 = 0x3FF8000000000000;
      v82 = 2048;
      v83 = v50;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationAverageSpeedAnyKey");
      _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey"), &unk_1E932D4C0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "doubleValue");
  v55 = v54;

  if (v55 != 0.4)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding average speed for walking";
      v80 = 2048;
      v81 = 0x3FD999999999999ALL;
      v82 = 2048;
      v83 = v55;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey");
      _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey"), &unk_1E932D4B0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "doubleValue");
  v60 = v59;

  if (v60 != 8.3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding average speed for driving";
      v80 = 2048;
      v81 = 0x402099999999999ALL;
      v82 = 2048;
      v83 = v60;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey");
      _os_log_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  -[SMTriggerDestination defaultsManager](self, "defaultsManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationAverageTransitSpeedKey"), &unk_1E932D4D0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "doubleValue");
  v65 = v64;

  if (v65 != 6.3)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v77 = "-[SMTriggerDestination _setup]";
      v78 = 2080;
      v79 = "overriding average speed for transit";
      v80 = 2048;
      v81 = 0x4019333333333333;
      v82 = 2048;
      v83 = v65;
      v84 = 2112;
      v85 = CFSTR("RTDefaultsSMTriggerDestinationAverageTransitSpeedKey");
      _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", buf, 0x34u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50, &unk_1E93292A0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v67;
  v74[1] = &unk_1E93292B8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v68;
  v74[2] = &unk_1E93292D0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v75[2] = v69;
  v74[3] = &unk_1E93292E8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v65);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v75[3] = v70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 4);
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
  SMTriggerDestinationTransportTypeToAvgSpeed = v71;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v77 = "-[SMTriggerDestination _setup]";
    v78 = 2112;
    v79 = (const char *)SMTriggerDestinationTransportTypeToAvgSpeed;
    _os_log_impl(&dword_1D1A22000, v73, OS_LOG_TYPE_INFO, "%s, transport speed dictionary, %@", buf, 0x16u);
  }

}

- (void)_bootstrap
{
  NSObject *v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  char v26;
  id v27;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  NSObject *v44;
  _BYTE *v45;
  uint64_t *v46;
  uint64_t v47;
  id *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _BYTE v53[12];
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE buf[24];
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SMTriggerDestination _bootstrap]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v59 = __Block_byref_object_copy__138;
  v60 = __Block_byref_object_dispose__138;
  v61 = 0;
  v47 = 0;
  v48 = (id *)&v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__138;
  v51 = __Block_byref_object_dispose__138;
  v52 = 0;
  v5 = dispatch_semaphore_create(0);
  -[SMTriggerDestination sessionStore](self, "sessionStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __34__SMTriggerDestination__bootstrap__block_invoke;
  v43[3] = &unk_1E9296EE0;
  v45 = buf;
  v46 = &v47;
  v9 = v5;
  v44 = v9;
  objc_msgSend(v6, "fetchTriggerDestinationStateWithSessionID:handler:", v8, v43);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501_0);
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
    *(_WORD *)v53 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v53, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v62[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v53 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v62, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

    v26 = 0;
  }
  else
  {
LABEL_8:
    v25 = 0;
    v26 = 1;
  }

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong(v48 + 5, v25);
  v28 = v48[5];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
  if (v28)
  {
    if (v30)
    {
      -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "sessionID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "UUIDString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v48[5];
      *(_DWORD *)v53 = 136315650;
      *(_QWORD *)&v53[4] = "-[SMTriggerDestination _bootstrap]";
      v54 = 2112;
      v55 = v33;
      v56 = 2112;
      v57 = v34;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%s, Error while fetching triggerDestination state, session ID, %@, error, %@", v53, 0x20u);

    }
  }
  else
  {
    if (v30)
    {
      v35 = *(void **)(*(_QWORD *)&buf[8] + 40);
      -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "sessionID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "UUIDString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v53 = 136315650;
      *(_QWORD *)&v53[4] = "-[SMTriggerDestination _bootstrap]";
      v54 = 2112;
      v55 = v35;
      v56 = 2112;
      v57 = v38;
      _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%s, most recent triggerDestination state, %@, sessionID, %@", v53, 0x20u);

    }
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      -[SMTriggerDestination setTriggerState:](self, "setTriggerState:");
    }
    else
    {
      v39 = objc_alloc(MEMORY[0x1E0D8BAA8]);
      -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "sessionID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v39, "initWithSessionIdentifier:", v41);
      -[SMTriggerDestination setTriggerState:](self, "setTriggerState:", v42);

      -[SMTriggerDestination _persistState](self, "_persistState");
    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(buf, 8);

}

void __34__SMTriggerDestination__bootstrap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)locationRequestOptions
{
  RTLocationRequestOptions *v2;

  v2 = [RTLocationRequestOptions alloc];
  return -[RTLocationRequestOptions initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:](v2, "initWithDesiredAccuracy:horizontalAccuracy:maxAge:yieldLastLocation:timeout:fallback:fallbackHorizontalAccuracy:fallbackMaxAge:", 1, 1, *MEMORY[0x1E0C9E490], 100.0, 3.0, 5.0, 200.0, 3600.0);
}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SMTriggerDestination queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SMTriggerDestination_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __65__SMTriggerDestination_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMonitoringWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  char v81;
  double v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
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
  NSObject *v100;
  id v101;
  uint64_t v102;
  const __CFString *v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  void *v111;
  uint64_t v112;
  _QWORD v113[3];

  v113[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "sessionType") != 2 && objc_msgSend(v6, "sessionType") != 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
      v106 = 1024;
      LODWORD(v107) = 354;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeDestinationBound || configuration.sessionType == SMSessionTypeRoundTrip (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
    v106 = 2112;
    v107 = v6;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);
  }

  if (v7)
  {
    +[SMDateUtility date](SMDateUtility, "date");
    v10 = objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceDate:](v10, "timeIntervalSinceDate:", v12);
    v14 = v13;

    if (v14 < 0.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "sessionStartDate");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "stringFromDate");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject stringFromDate](v10, "stringFromDate");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
        v106 = 2112;
        v107 = v91;
        v108 = 2112;
        v109 = v92;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%s, sessionStartDate, %@, larger than currentDate, %@", buf, 0x20u);

      }
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v112 = *MEMORY[0x1E0CB2D50];
      v113[0] = CFSTR("sessionStartDate is larger than currentDate");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, &v112, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v19);
LABEL_44:

      goto LABEL_45;
    }
    -[SMTriggerDestination _setup](self, "_setup");
    -[SMTriggerDestination setSessionConfiguration:](self, "setSessionConfiguration:", v6);
    -[SMTriggerDestination setOriginLocation:](self, "setOriginLocation:", 0);
    -[SMTriggerDestination _bootstrap](self, "_bootstrap");
    -[SMTriggerDestination triggerState](self, "triggerState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "upperBoundEta");
    v21 = objc_claimAutoreleasedReturnValue();
    v100 = v10;
    if (v21)
    {
      v22 = (void *)v21;
    }
    else
    {
      -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "destination");
      v23 = objc_claimAutoreleasedReturnValue();
      -[NSObject eta](v23, "eta");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "destination");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "eta");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "additionalTravelTime");
        v30 = v29;

        if (v30 <= 0.0)
          goto LABEL_23;
        -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "destination");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "eta");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "expectedTravelTime");
        v35 = v34;
        -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "destination");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "eta");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "additionalTravelTime");
        v40 = v35 + v39;

        v41 = (void *)objc_opt_class();
        -[SMTriggerDestination defaultsManager](self, "defaultsManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestination etaScaleFactor](self, "etaScaleFactor");
        objc_msgSend(v41, "upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpectedTravelTime:etaScaleFactor:", v100, v42, v40, v40, v43);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[SMTriggerDestination triggerState](self, "triggerState");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setUpperBoundEta:", v20);

        -[SMTriggerDestination destinationStatusUpdateTimeInterval](self, "destinationStatusUpdateTimeInterval");
        -[NSObject dateByAddingTimeInterval:](v100, "dateByAddingTimeInterval:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestination triggerState](self, "triggerState");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setTimeToUpdateStatus:", v22);

        -[SMTriggerDestination _updateCoarseEtaWithMapsExpectedTravelTime:crowFliesExpectedTravelTime:](self, "_updateCoarseEtaWithMapsExpectedTravelTime:crowFliesExpectedTravelTime:", v40, v40);
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "destination");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMTriggerDestination triggerState](self, "triggerState");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "upperBoundEta");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMTriggerDestination triggerState](self, "triggerState");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "timeToUpdateStatus");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringFromDate");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
          v106 = 2112;
          v107 = v46;
          v108 = 2112;
          v109 = v47;
          v110 = 2112;
          v111 = v97;
          _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "%s, user-specified eta, %@, upperBoundETA, %@, timeToUpdateStatus, %@", buf, 0x2Au);

        }
      }

    }
LABEL_23:
    -[SMTriggerDestination _persistState](self, "_persistState");
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v50 = objc_claimAutoreleasedReturnValue();
    -[NSObject destination](v50, "destination");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "eta");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v53 = (void *)v52;
      -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "destination");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "eta");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "transportType");

      v10 = v100;
      if (v57 != 4)
      {
LABEL_29:
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
          _os_log_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_INFO, "%s, start current location fetch, location", buf, 0xCu);
        }

        v60 = (void *)objc_opt_class();
        -[SMTriggerDestination locationManager](self, "locationManager");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestination queue](self, "queue");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "currentLocationWithLocationManager:queue:handler:", v61, v62, &__block_literal_global_109);

        -[SMTriggerDestination _cachedLocationsDateInterval](self, "_cachedLocationsDateInterval");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0;
        -[SMTriggerDestination _locationsInDateInterval:horizontalAccuracy:error:](self, "_locationsInDateInterval:horizontalAccuracy:error:", v19, &v101, 200.0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v101;
        if (v64)
        {
          _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "startDate");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "stringFromDate");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "endDate");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "stringFromDate");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
            v106 = 2112;
            v107 = v94;
            v108 = 2112;
            v109 = v96;
            _os_log_error_impl(&dword_1D1A22000, v65, OS_LOG_TYPE_ERROR, "%s, unable to fetch locations for startDate, %@, endDate, %@", buf, 0x20u);

            v10 = v100;
          }

          v66 = (void *)MEMORY[0x1E0CB35C8];
          v67 = *MEMORY[0x1E0D18598];
          v102 = *MEMORY[0x1E0CB2D50];
          v103 = CFSTR("unable to fetch locations");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "errorWithDomain:code:userInfo:", v67, 6, v68);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          v7[2](v7, v69);
        }
        else
        {
          -[SMTriggerDestination _cacheLocations:](self, "_cacheLocations:", v63);
          -[SMTriggerDestination _addObservers](self, "_addObservers");
          -[SMTriggerDestination triggerState](self, "triggerState");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "timeToUpdateStatus");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v71)
          {
            -[NSObject dateByAddingTimeInterval:](v10, "dateByAddingTimeInterval:", 1.0);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMTriggerDestination triggerState](self, "triggerState");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setTimeToUpdateStatus:", v72);

          }
          -[SMTriggerDestination triggerState](self, "triggerState");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "timeToUpdateStatus");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "timeIntervalSinceDate:", v10);
          v77 = v76;

          -[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier"), v77);
          if (objc_msgSend(v6, "sessionType") == 3)
          {
            -[SMTriggerDestination triggerState](self, "triggerState");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "roundTripReminderDate");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v79, "isEqualToDate:", v80);

            if ((v81 & 1) != 0)
            {
              v82 = 5400.0;
              v10 = v100;
            }
            else
            {
              -[SMTriggerDestination triggerState](self, "triggerState");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "roundTripReminderDate");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v100;
              objc_msgSend(v84, "timeIntervalSinceDate:", v100);
              v86 = v85;

              v82 = fmax(v86, 1.0);
            }
            -[NSObject dateByAddingTimeInterval:](v10, "dateByAddingTimeInterval:", v82);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            -[SMTriggerDestination triggerState](self, "triggerState");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "setRoundTripReminderDate:", v87);

            -[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMTriggerDestination.roundTripReminderTimerIdentifier"), v82);
          }
          -[SMTriggerDestination _persistState](self, "_persistState");
          v7[2](v7, 0);
        }

        goto LABEL_44;
      }
      -[SMTriggerDestination triggerState](self, "triggerState");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setPredominantModeOfTransport:", 4);

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
        _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%s, user specified transport mode is transit", buf, 0xCu);
      }
    }
    else
    {

      v10 = v100;
    }

    goto LABEL_29;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v105 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]";
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%s, invalid handler", buf, 0xCu);
  }
LABEL_45:

}

void __66__SMTriggerDestination__startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[SMTriggerDestination _startMonitoringWithConfiguration:handler:]_block_invoke";
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, complete current location fetch, location, %@, error, %@", (uint8_t *)&v7, 0x20u);
  }

}

- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SMTriggerDestination queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SMTriggerDestination_modifyMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __66__SMTriggerDestination_modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modifyMonitoringWithConfiguration:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "sessionType") != 2 && objc_msgSend(v6, "sessionType") != 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v29 = 136315394;
      v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
      v31 = 1024;
      LODWORD(v32) = 507;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeDestinationBound || configuration.sessionType == SMSessionTypeRoundTrip (in %s:%d)", (uint8_t *)&v29, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v29 = 136315394;
    v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
    v31 = 2112;
    v32 = v6;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", (uint8_t *)&v29, 0x16u);
  }

  -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v6);

  if (v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v29 = 136315138;
      v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, Configuration did not change", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
    {
      -[SMTriggerDestination triggerState](self, "triggerState");
      v12 = objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination _stopMonitoringWithHandler:](self, "_stopMonitoringWithHandler:", v7);
      v17 = objc_alloc(MEMORY[0x1E0D8BAA8]);
      objc_msgSend(v6, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithSessionIdentifier:", v18);
      -[SMTriggerDestination setTriggerState:](self, "setTriggerState:", v19);

      -[NSObject lastLockDate](v12, "lastLockDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLastLockDate:", v20);

      -[NSObject lastUnlockDate](v12, "lastUnlockDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setLastUnlockDate:", v22);

      v24 = -[NSObject predominantModeOfTransport](v12, "predominantModeOfTransport");
      -[SMTriggerDestination triggerState](self, "triggerState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPredominantModeOfTransport:", v24);

      -[SMTriggerDestination _persistState](self, "_persistState");
      -[SMTriggerDestination setOriginLocation:](self, "setOriginLocation:", 0);
      -[SMTriggerDestination _startMonitoringWithConfiguration:handler:](self, "_startMonitoringWithConfiguration:handler:", v6, v7);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sessionID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sessionID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 136315650;
        v30 = "-[SMTriggerDestination _modifyMonitoringWithConfiguration:handler:]";
        v31 = 2112;
        v32 = v27;
        v33 = 2112;
        v34 = v28;
        _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, Configuration modified for wrong session, current config sessionID, %@, modified config sessionID, %@", (uint8_t *)&v29, 0x20u);

      }
    }
  }

}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SMTriggerDestination queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SMTriggerDestination_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __50__SMTriggerDestination_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopMonitoringWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SMTriggerDestination _stopMonitoringWithHandler:]";
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  -[SMTriggerDestination _removeObservers](self, "_removeObservers");
  -[SMTriggerDestination _removeTimers](self, "_removeTimers");
  -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[SMTriggerDestination setTriggerState:](self, "setTriggerState:", 0);
  -[SMTriggerDestination setOriginLocation:](self, "setOriginLocation:", 0);
  if (v4)
    v4[2](v4, 0);

}

- (void)onUserTriggerResponse:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SMTriggerDestination queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SMTriggerDestination_onUserTriggerResponse___block_invoke;
  v6[3] = &unk_1E9297BF0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __46__SMTriggerDestination_onUserTriggerResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onUserTriggerResponse:", *(_QWORD *)(a1 + 40));
}

- (void)_onUserTriggerResponse:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8BA40], "userTriggerResponseToString:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[SMTriggerDestination _onUserTriggerResponse:]";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, response %@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)postStateChange
{
  NSObject *v3;
  _QWORD block[5];

  -[SMTriggerDestination queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SMTriggerDestination_postStateChange__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __39__SMTriggerDestination_postStateChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postStateChange");
}

- (void)_postStateChange
{
  NSObject *v3;
  void *v4;
  SMTriggerNotification *v5;
  unint64_t v6;
  void *v7;
  SMTriggerNotification *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D8BA40], "triggerCategoryToString:", -[SMTriggerDestination triggerCategory](self, "triggerCategory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SMTriggerDestination _postStateChange]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, trigger category, %@", (uint8_t *)&v10, 0x16u);

  }
  v5 = [SMTriggerNotification alloc];
  v6 = -[SMTriggerDestination triggerCategory](self, "triggerCategory");
  +[SMDateUtility date](SMDateUtility, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SMTriggerNotification initWithTriggerCategory:SOSState:triggerName:date:details:](v5, "initWithTriggerCategory:SOSState:triggerName:date:details:", v6, 1, CFSTR("SMTriggerDestination"), v7, MEMORY[0x1E0C9AA70]);

  -[SMTriggerDestination sessionMonitorDelegate](self, "sessionMonitorDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "onTriggerNotification:", v8);

}

- (void)onLocationNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  SMTriggerDestination *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __47__SMTriggerDestination_onLocationNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[SMTriggerDestination queue](self, "queue", v8, v9, v10, v11, v12);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

uint64_t __47__SMTriggerDestination_onLocationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processLocationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_processLocationNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315138;
    v8 = "-[SMTriggerDestination _processLocationNotification:]";
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "leechedLocations");
    v6 = objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination _cacheLocations:](self, "_cacheLocations:", v6);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v7) = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", (uint8_t *)&v7, 2u);
    }
  }

}

- (void)onDataProtectionNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  SMTriggerDestination *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __53__SMTriggerDestination_onDataProtectionNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[SMTriggerDestination queue](self, "queue", v8, v9, v10, v11, v12);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

uint64_t __53__SMTriggerDestination_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processDataProtectionNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_processDataProtectionNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "availability");
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "-[SMTriggerDestination _processDataProtectionNotification:]";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, Received keybag notification, %@", (uint8_t *)&v12, 0x16u);

    }
    if (v5 == 1)
    {
      +[SMDateUtility date](SMDateUtility, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLastLockDate:", v8);
    }
    else
    {
      if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2)
      {
LABEL_12:
        -[SMTriggerDestination _persistState](self, "_persistState");
        goto LABEL_13;
      }
      +[SMDateUtility date](SMDateUtility, "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLastUnlockDate:", v8);
    }

    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SMTriggerDestination _processDataProtectionNotification:]";
    v14 = 2112;
    v15 = v11;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%s, unknown notification name, %@", (uint8_t *)&v12, 0x16u);

  }
LABEL_13:

}

- (void)_initializeTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  RTTimerManager *timerManager;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:]";
    v26 = 2112;
    v27 = v6;
    v28 = 2048;
    v29 = a4;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, timerIdentifier, %@, delay, %.1f", buf, 0x20u);
  }

  objc_initWeak(&location, self);
  +[SMDateUtility date](SMDateUtility, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  timerManager = self->_timerManager;
  -[SMTriggerDestination queue](self, "queue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__SMTriggerDestination__initializeTimerWithIdentifier_fireAfterDelay___block_invoke;
  v19[3] = &unk_1E92A2468;
  v11 = v6;
  v20 = v11;
  v12 = v8;
  v21 = v12;
  objc_copyWeak(&v22, &location);
  -[RTTimerManager xpcTimerAlarmWithIdentifier:queue:handler:](timerManager, "xpcTimerAlarmWithIdentifier:queue:handler:", v11, v10, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SMTriggerDestination timerIdentifierToTimers](self, "timerIdentifierToTimers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v13, v11);

  objc_msgSend(v12, "dateByAddingTimeInterval:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v13, "fireWithDate:error:", v15, &v18);
  v16 = v18;

  if (v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:]";
      v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
    }

  }
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __70__SMTriggerDestination__initializeTimerWithIdentifier_fireAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[SMDateUtility date](SMDateUtility, "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v7 = 136315650;
    v8 = "-[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:]_block_invoke";
    v9 = 2112;
    v10 = v4;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v7, 0x20u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_onTimerExpiryForTimerIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)_updateTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[SMTriggerDestination _updateTimerWithIdentifier:fireAfterDelay:]";
    v10 = 2112;
    v11 = v6;
    v12 = 2048;
    v13 = a4;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, timerIdentifier, %@, delay, %.2f", (uint8_t *)&v8, 0x20u);
  }

  -[SMTriggerDestination _tearDownTimerWithIdentifier:](self, "_tearDownTimerWithIdentifier:", v6);
  -[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", v6, a4);

}

- (void)_onTimerExpiryForTimerIdentifier:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  const char *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v24 = 136315394;
    v25 = "-[SMTriggerDestination _onTimerExpiryForTimerIdentifier:]";
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v24, 0x16u);
  }

  if (v4 == CFSTR("com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier")
    || v4 == CFSTR("com.apple.routined.SMTriggerDestination.upperBoundETATimerIdentifier"))
  {
    -[SMTriggerDestination destinationStatusUpdateTimeInterval](self, "destinationStatusUpdateTimeInterval");
    -[SMTriggerDestination _updateTimerWithIdentifier:fireAfterDelay:](self, "_updateTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier"));
    +[SMDateUtility date](SMDateUtility, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination destinationStatusUpdateTimeInterval](self, "destinationStatusUpdateTimeInterval");
    objc_msgSend(v17, "dateByAddingTimeInterval:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SMTriggerDestination triggerState](self, "triggerState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimeToUpdateStatus:", v18);

    -[SMTriggerDestination _persistState](self, "_persistState");
    -[SMTriggerDestination _updateInitiatorStatus](self, "_updateInitiatorStatus");

  }
  else
  {
    if (v4 == CFSTR("com.apple.routined.SMTriggerDestination.roundTripReminderTimerIdentifier"))
    {
      -[SMTriggerDestination triggerState](self, "triggerState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastUnlockDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "roundTripReminderDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateByAddingTimeInterval:", -5400.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "laterDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "dateByAddingTimeInterval:", 5400.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "roundTripReminderDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v12);
      v16 = v15;

      if (v16 < 0.0)
      {
        +[SMDateUtility date](SMDateUtility, "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceDate:", v20);
        v22 = v21;
        -[SMTriggerDestination triggerState](self, "triggerState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRoundTripReminderDate:", v12);

        -[SMTriggerDestination _persistState](self, "_persistState");
        -[SMTriggerDestination _updateTimerWithIdentifier:fireAfterDelay:](self, "_updateTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMTriggerDestination.roundTripReminderTimerIdentifier"), v22);

        goto LABEL_10;
      }
      -[SMTriggerDestination _persistState](self, "_persistState");
      -[SMTriggerDestination _declareAnomalyForTriggerCategory:](self, "_declareAnomalyForTriggerCategory:", 9);
      -[SMTriggerDestination _tearDownTimerWithIdentifier:](self, "_tearDownTimerWithIdentifier:", CFSTR("com.apple.routined.SMTriggerDestination.statusUpdateTimerIdentifier"));

    }
    -[SMTriggerDestination _tearDownTimerWithIdentifier:](self, "_tearDownTimerWithIdentifier:", v4);
  }
LABEL_10:

}

- (void)_tearDownTimerWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[SMTriggerDestination _tearDownTimerWithIdentifier:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v11, 0x16u);
  }

  -[SMTriggerDestination timerIdentifierToTimers](self, "timerIdentifierToTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMTriggerDestination timerIdentifierToTimers](self, "timerIdentifierToTimers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[SMTriggerDestination timerIdentifierToTimers](self, "timerIdentifierToTimers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v4);

  }
}

- (void)_removeTimers
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SMTriggerDestination _removeTimers]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SMTriggerDestination timerIdentifierToTimers](self, "timerIdentifierToTimers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        -[SMTriggerDestination timerIdentifierToTimers](self, "timerIdentifierToTimers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "invalidate");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[SMTriggerDestination timerIdentifierToTimers](self, "timerIdentifierToTimers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  -[SMTriggerDestination setTimerIdentifierToTimers:](self, "setTimerIdentifierToTimers:", 0);
}

- (void)_addObservers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SMTriggerDestination _addObservers]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[SMTriggerDestination locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:", self, sel_onLocationNotification_, v5);

  -[SMTriggerDestination dataProtectionManager](self, "dataProtectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:", self, sel_onDataProtectionNotification_, v7);

}

- (void)_removeObservers
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SMTriggerDestination _removeObservers]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SMTriggerDestination locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SMTriggerDestination dataProtectionManager](self, "dataProtectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

+ (void)mapsExpectedTravelTimeforTransportType:(unint64_t)a3 source:(id)a4 destination:(id)a5 departureDate:(id)a6 queue:(id)a7 handler:(id)a8
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  RTDefaultsManager *v42;
  NSObject *queue;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  _QWORD block[4];
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  queue = a7;
  v15 = a8;
  v41 = a6;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "coordinateToString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinateToString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "convertSMDirectionTransportTypeToString:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v58 = "+[SMTriggerDestination mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler:]";
    v59 = 2112;
    v60 = v17;
    v61 = 2112;
    v62 = v18;
    v63 = 2112;
    v64 = v19;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%s, source, %@, destination, %@, transportType, %@.", buf, 0x2Au);

  }
  v20 = a3;

  v42 = objc_alloc_init(RTDefaultsManager);
  -[RTDefaultsManager objectForKey:](v42, "objectForKey:", CFSTR("RTDefaultsSMTriggerDestinationForceCrowFliesKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  v23 = MEMORY[0x1E0C809B0];
  if (v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "overriding Maps ETA return -1.0", buf, 2u);
    }

    v55 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disabled due to defaults"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v28 = (void *)objc_msgSend(v27, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 5, v26);
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke;
    block[3] = &unk_1E9297678;
    v53 = v28;
    v54 = v15;
    v29 = v28;
    dispatch_async(queue, block);

  }
  v30 = (void *)objc_opt_new();
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1900]), "initWithLocation:addressDictionary:region:areasOfInterest:", v13, 0, 0, 0);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1900]), "initWithLocation:addressDictionary:region:areasOfInterest:", v14, 0, 0, 0);
  v33 = v23;
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1828]), "initWithPlacemark:", v31);
  objc_msgSend(v30, "setSource:", v34);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1828]), "initWithPlacemark:", v32);
  objc_msgSend(v30, "setDestination:", v35);

  objc_msgSend(v30, "setTransportType:", +[SMTriggerDestination convertSMDirectionTransportTypeToMKDirectionTransportType:](SMTriggerDestination, "convertSMDirectionTransportTypeToMKDirectionTransportType:", v20));
  objc_msgSend(v30, "setDepartureDate:", v41);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1790]), "initWithRequest:", v30);
  v45[0] = v33;
  v45[1] = 3221225472;
  v45[2] = __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_2;
  v45[3] = &unk_1E92A3BF0;
  v46 = queue;
  v47 = v13;
  v50 = a1;
  v51 = v20;
  v48 = v14;
  v49 = v15;
  v37 = v15;
  v38 = v14;
  v39 = v13;
  v40 = queue;
  objc_msgSend(v36, "calculateETAWithCompletionHandler:", v45);

}

uint64_t __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), -1.0);
}

void __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_3;
  block[3] = &unk_1E9298438;
  v14 = v6;
  v7 = *(NSObject **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 72);
  v16 = v8;
  v17 = v5;
  v12 = *(_OWORD *)(a1 + 56);
  v9 = (id)v12;
  v18 = v12;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, block);

}

uint64_t __110__SMTriggerDestination_mapsExpectedTravelTimeforTransportType_source_destination_departureDate_queue_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __n128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "coordinateToString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "coordinateToString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "convertSMDirectionTransportTypeToString:", *(_QWORD *)(a1 + 80));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "code");
      v16 = 136316162;
      v17 = "+[SMTriggerDestination mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler"
            ":]_block_invoke_3";
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      v24 = 1024;
      LODWORD(v25) = v8;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, error in ETA request, source, %@, destination, %@, transportType, %@, error, %d", (uint8_t *)&v16, 0x30u);

    }
    v9.n128_u64[0] = -1.0;
  }
  else
  {
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 56), "expectedTravelTime");
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 40), "coordinateToString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "coordinateToString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "convertSMDirectionTransportTypeToString:", *(_QWORD *)(a1 + 80));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136316162;
      v17 = "+[SMTriggerDestination mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler:]_block_invoke";
      v18 = 2048;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, expectedTravelTime, %f, source, %@, destination, %@, transport type, %@", (uint8_t *)&v16, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 56), "expectedTravelTime");
  }
  return (*(uint64_t (**)(__n128))(*(_QWORD *)(a1 + 64) + 16))(v9);
}

- (id)_locationsInDateInterval:(id)a3 horizontalAccuracy:(double)a4 error:(id *)a5
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
  NSObject *v33;
  void *v35;
  _QWORD v36[4];
  NSObject *v37;
  uint8_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t v46[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE buf[12];
  __int16 v53;
  id v54;
  __int16 v55;
  double v56;
  __int16 v57;
  uint64_t v58;
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    *(_QWORD *)v46 = 0;
    v47 = v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__138;
    v50 = __Block_byref_object_dispose__138;
    v51 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__138;
    v44 = __Block_byref_object_dispose__138;
    v45 = 0;
    v9 = dispatch_semaphore_create(0);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184F0]), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v8, 1800, 0, a4);
    -[SMTriggerDestination locationManager](self, "locationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __74__SMTriggerDestination__locationsInDateInterval_horizontalAccuracy_error___block_invoke;
    v36[3] = &unk_1E9296EE0;
    v38 = v46;
    v39 = &v40;
    v11 = v9;
    v37 = v11;
    objc_msgSend(v10, "fetchStoredLocationsWithOptions:handler:", v35, v36);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14))
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501_0);
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
    v59[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v59, 1);
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
LABEL_7:
      v27 = 0;
      v28 = 1;
    }

    v29 = v27;
    if ((v28 & 1) == 0)
      objc_storeStrong((id *)v47 + 5, v27);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = objc_msgSend((id)v41[5], "count");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[SMTriggerDestination _locationsInDateInterval:horizontalAccuracy:error:]";
      v53 = 2112;
      v54 = v8;
      v55 = 2048;
      v56 = a4;
      v57 = 2048;
      v58 = v31;
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%s, dateInterval, %@, horizontalAccuracy, %f, locations, %lu", buf, 0x2Au);
    }

    if (a5)
      *a5 = objc_retainAutorelease(*((id *)v47 + 5));
    v32 = (id)v41[5];

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(v46, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", v46, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("dateInterval"));
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

void __74__SMTriggerDestination__locationsInDateInterval_horizontalAccuracy_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_locationAtDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
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
  char v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  _BYTE *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[12];
  __int16 v47;
  uint64_t v48;
  _BYTE buf[24];
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[4];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "stringFromDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMTriggerDestination _locationAtDate:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, date, %@", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v50 = __Block_byref_object_copy__138;
    v51 = __Block_byref_object_dispose__138;
    v52 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__138;
    v44 = __Block_byref_object_dispose__138;
    v45 = 0;
    v9 = dispatch_semaphore_create(0);
    -[SMTriggerDestination locationManager](self, "locationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __46__SMTriggerDestination__locationAtDate_error___block_invoke;
    v36[3] = &unk_1E929AB38;
    v38 = buf;
    v39 = &v40;
    v11 = v9;
    v37 = v11;
    objc_msgSend(v10, "fetchEstimatedLocationAtDate:options:handler:", v6, 0, v36);

    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v12, v14))
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v13);
    v17 = v16;
    v18 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501_0);
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
      *(_WORD *)v46 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v46, 2u);
    }

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v53[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v46 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v53, 1);
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
LABEL_9:
      v27 = 0;
      v28 = 1;
    }

    v29 = v27;
    if ((v28 & 1) == 0)
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v27);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "stringFromDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v46 = 138412546;
        *(_QWORD *)&v46[4] = v34;
        v47 = 2112;
        v48 = v35;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Unable to fetch location at date, %@, error, %@", v46, 0x16u);

      }
    }
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v31 = (id)v41[5];

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("date"));
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
  }

  return v31;
}

void __46__SMTriggerDestination__locationAtDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_cacheLocations:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  SMLocationEvent *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7);
        if (objc_msgSend((id)objc_opt_class(), "validLocation:", v8))
        {
          -[SMTriggerDestination originLocation](self, "originLocation");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
            -[SMTriggerDestination setOriginLocation:](self, "setOriginLocation:", v8);
          -[SMTriggerDestination _evaluateStatusUsingCurrentLocation:](self, "_evaluateStatusUsingCurrentLocation:", v8);
          v10 = (void *)objc_opt_class();
          -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "destination");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "clLocation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SMTriggerDestination distanceCalculator](self, "distanceCalculator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "distanceFromLocation:toLocation:withCalculator:", v8, v13, v14);
          v16 = v15;

          v17 = -[SMLocationEvent initWithLocation:distance:]([SMLocationEvent alloc], "initWithLocation:distance:", v8, v16);
          -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v17);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }
  -[SMTriggerDestination sessionMetricManager](self, "sessionMetricManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "distance");
  objc_msgSend(v19, "cacheMostRecentLocationDistance:");

}

- (void)_reviseCachedLocations
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
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
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
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_144);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[SMTriggerDestination setCachedLocationEvents:](self, "setCachedLocationEvents:", v5);

  -[SMTriggerDestination _cachedLocationsDateInterval](self, "_cachedLocationsDateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v47 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timestamp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "initWithStartDate:endDate:", v10, v14);

  }
  else
  {
    v48 = 0;
  }

  while (1)
  {
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "count"))
      break;
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timestamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v20);
    v22 = v21;

    if (v22 >= 0.0)
      goto LABEL_9;
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObjectAtIndex:", 0);

  }
LABEL_9:
  while (1)
  {
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "count"))
      break;
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "location");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "timestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceDate:", v29);
    v31 = v30;

    if (v31 <= 0.0)
      goto LABEL_13;
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeObjectAtIndex:", objc_msgSend(v33, "count") - 1);

  }
LABEL_13:
  -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
  {
    v44 = objc_alloc(MEMORY[0x1E0CB3588]);
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "location");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "timestamp");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "location");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "timestamp");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v44, "initWithStartDate:endDate:", v37, v41);

  }
  else
  {
    v42 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v50 = "-[SMTriggerDestination _reviseCachedLocations]";
    v51 = 2112;
    v52 = v48;
    v53 = 2112;
    v54 = v6;
    v55 = 2112;
    v56 = v42;
    _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "%s, cachedLocations dateInterval pre-filter, %@, dateInterval of interest, %@, cachedLocations dateInterval post-filter, %@", buf, 0x2Au);
  }

}

uint64_t __46__SMTriggerDestination__reviseCachedLocations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (void)_evaluateStatusUsingCurrentLocation:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  -[SMTriggerDestination triggerState](self, "triggerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentStatus");

  if (v5 == 1)
  {
    v6 = (void *)objc_opt_class();
    -[SMTriggerDestination originLocation](self, "originLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination distanceCalculator](self, "distanceCalculator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "distanceFromLocation:toLocation:withCalculator:", v7, v18, v8);
    v10 = v9;

    if (v10 != 1.79769313e308)
    {
      -[SMTriggerDestination idleMaxDistanceThreshold](self, "idleMaxDistanceThreshold");
      v12 = v11;
      -[SMTriggerDestination originLocation](self, "originLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "horizontalAccuracy");
      v15 = v14;

      objc_msgSend(v18, "horizontalAccuracy");
      if (v15 >= v16)
        v16 = v15;
      if (v10 > v12 + v16)
      {
        -[SMTriggerDestination triggerState](self, "triggerState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setCurrentStatus:", 2);

        -[SMTriggerDestination _persistState](self, "_persistState");
      }
    }
  }

}

+ (BOOL)validLocation:(id)a3
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;
  double v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "horizontalAccuracy"), v5 >= 0.0))
  {
    objc_msgSend(v4, "horizontalAccuracy");
    v6 = v7 <= 200.0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isNoProgressStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t i;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  NSObject *v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  void *v92;
  double v93;
  uint64_t v94;
  void *v95;
  void *v96;
  NSObject *obj;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  const char *v113;
  __int16 v114;
  double v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  double v119;
  __int16 v120;
  uint64_t v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  +[SMDateUtility date](SMDateUtility, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination triggerState](self, "triggerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentStatus");

  if (v5 == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_5:
      v11 = 0;
      goto LABEL_6;
    }
    -[SMTriggerDestination originLocation](self, "originLocation");
    v7 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v113 = "-[SMTriggerDestination _isNoProgressStatus]";
    v114 = 2112;
    v115 = v7;
    v116 = 2112;
    v117 = (uint64_t)v10;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, NO, has not transitioned from idle status yet, origin location, %@, last location, %@", buf, 0x20u);

LABEL_4:
    goto LABEL_5;
  }
  -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timestamp");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v18);
    v20 = v19;
    -[SMTriggerDestination noProgressTimeoutThreshold](self, "noProgressTimeoutThreshold");
    v22 = v21;

    if (v20 <= v22)
    {
      -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "location");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timestamp");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", v46);
      v48 = v47;

      -[SMTriggerDestination noProgressTimeoutThreshold](self, "noProgressTimeoutThreshold");
      if (v48 < v49)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "firstObject");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "location");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "timestamp");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringFromDate");
          v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          objc_msgSend(v3, "stringFromDate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v113 = "-[SMTriggerDestination _isNoProgressStatus]";
          v114 = 2112;
          v115 = v54;
          v116 = 2112;
          v117 = (uint64_t)v55;
          v118 = 2048;
          v119 = v48;
          _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, NO, short length cached locations from, %@, now, %@, timeInterval, %f", buf, 0x2Au);

        }
        goto LABEL_5;
      }
      -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "lastObject");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "location");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "timestamp");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination noProgressTimeoutThreshold](self, "noProgressTimeoutThreshold");
      objc_msgSend(v64, "dateByAddingTimeInterval:", -v65);
      v6 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K >= %@"), CFSTR("location"), CFSTR("timestamp"), v6);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "filteredArrayUsingPredicate:", v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v103 = v68;
      objc_msgSend(v68, "reverseObjectEnumerator");
      v69 = objc_claimAutoreleasedReturnValue();
      v99 = -[NSObject countByEnumeratingWithState:objects:count:](v69, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
      if (v99)
      {
        v101 = *(_QWORD *)v109;
        v95 = v66;
        v96 = v3;
        obj = v69;
        do
        {
          for (i = 0; i != v99; ++i)
          {
            if (*(_QWORD *)v109 != v101)
              objc_enumerationMutation(obj);
            v71 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
            v104 = 0u;
            v105 = 0u;
            v106 = 0u;
            v107 = 0u;
            v72 = v103;
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
            if (v73)
            {
              v74 = v73;
              v75 = *(_QWORD *)v105;
LABEL_26:
              v76 = 0;
              while (1)
              {
                if (*(_QWORD *)v105 != v75)
                  objc_enumerationMutation(v72);
                v77 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v76);
                if (v71 == v77)
                  break;
                objc_msgSend(v71, "location");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "location");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "distanceFromLocation:", v79);
                v81 = v80;
                objc_msgSend(v78, "horizontalAccuracy");
                v83 = v82;
                objc_msgSend(v79, "horizontalAccuracy");
                v85 = v84;
                -[SMTriggerDestination significantMoveThreshold](self, "significantMoveThreshold");
                if (v83 >= v85)
                  v87 = v83;
                else
                  v87 = v85;
                if (v81 > v86 + v87)
                {
                  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v91 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v78, "toString");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v79, "toString");
                    v93 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    -[SMTriggerDestination significantMoveThreshold](self, "significantMoveThreshold");
                    *(_DWORD *)buf = 136316162;
                    v113 = "-[SMTriggerDestination _isNoProgressStatus]";
                    v114 = 2048;
                    v115 = v81;
                    v116 = 2112;
                    v117 = (uint64_t)v92;
                    v118 = 2112;
                    v119 = v93;
                    v120 = 2048;
                    v121 = v94;
                    _os_log_impl(&dword_1D1A22000, v91, OS_LOG_TYPE_INFO, "%s, NO, distance, %.2f, location_i, %@, location_j, %@, no progress distance threshold, %.2f", buf, 0x34u);

                  }
                  v11 = 0;
                  v66 = v95;
                  v3 = v96;
                  v88 = obj;
                  goto LABEL_43;
                }

                if (v74 == ++v76)
                {
                  v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
                  if (v74)
                    goto LABEL_26;
                  break;
                }
              }
            }

          }
          v69 = obj;
          v66 = v95;
          v3 = v96;
          v99 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v108, v123, 16);
        }
        while (v99);
      }

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v88 = objc_claimAutoreleasedReturnValue();
      v11 = 1;
      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
      {
        -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        *(double *)&v90 = COERCE_DOUBLE(objc_msgSend(v89, "count"));
        *(_DWORD *)buf = 136315650;
        v113 = "-[SMTriggerDestination _isNoProgressStatus]";
        v114 = 2048;
        v115 = *(double *)&v90;
        v116 = 2048;
        v117 = 0x4069000000000000;
        _os_log_impl(&dword_1D1A22000, v88, OS_LOG_TYPE_INFO, "%s, YES, no significant change detected for cachedLocations count, %lu, no progress distance threshold, %.2f", buf, 0x20u);

      }
LABEL_43:

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v6 = objc_claimAutoreleasedReturnValue();
      v11 = 1;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "lastObject");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "location");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "timestamp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringFromDate");
        v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(v3, "stringFromDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "location");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timestamp");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "timeIntervalSinceDate:", v29);
        *(_DWORD *)buf = 136315906;
        v113 = "-[SMTriggerDestination _isNoProgressStatus]";
        v114 = 2112;
        v115 = v24;
        v116 = 2112;
        v117 = (uint64_t)v25;
        v118 = 2048;
        v119 = v30;
        v11 = 1;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, YES, no locations available from, %@, now, %@, timeInterval, %f", buf, 0x2Au);

      }
    }
  }
  else
  {
    -[SMTriggerDestination lastUserResponseSafeDate](self, "lastUserResponseSafeDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v31);
    v33 = v32;
    -[SMTriggerDestination idleTimeoutThreshold](self, "idleTimeoutThreshold");
    v35 = v34;
    -[SMTriggerDestination noProgressTimeoutThreshold](self, "noProgressTimeoutThreshold");
    v37 = v35 + v36;

    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v6 = objc_claimAutoreleasedReturnValue();
    v38 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v33 < v37)
    {
      if (!v38)
        goto LABEL_5;
      -[SMTriggerDestination lastUserResponseSafeDate](self, "lastUserResponseSafeDate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "stringFromDate");
      v7 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(v3, "stringFromDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination lastUserResponseSafeDate](self, "lastUserResponseSafeDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", v41);
      *(_DWORD *)buf = 136315906;
      v113 = "-[SMTriggerDestination _isNoProgressStatus]";
      v114 = 2112;
      v115 = v7;
      v116 = 2112;
      v117 = (uint64_t)v40;
      v118 = 2048;
      v119 = v42;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, NO, empty cached locations, lastUserResponseSafeDate, %@, now, %@, timeInterval, %f", buf, 0x2Au);

      goto LABEL_4;
    }
    if (v38)
    {
      -[SMTriggerDestination lastUserResponseSafeDate](self, "lastUserResponseSafeDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "stringFromDate");
      v57 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(v3, "stringFromDate");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination lastUserResponseSafeDate](self, "lastUserResponseSafeDate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", v59);
      *(_DWORD *)buf = 136315906;
      v113 = "-[SMTriggerDestination _isNoProgressStatus]";
      v114 = 2112;
      v115 = v57;
      v116 = 2112;
      v117 = (uint64_t)v58;
      v118 = 2048;
      v119 = v60;
      v11 = 1;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, YES, empty cached locations, lastUserResponseSafeDate, %@, now, %@, timeInterval, %f", buf, 0x2Au);

    }
    else
    {
      v11 = 1;
    }
  }
LABEL_6:

  return v11;
}

- (BOOL)_shouldChangeModeOfTransportStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  v30 = v6;
  v36 = 0;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v29);
  -[SMTriggerDestination _locationsInDateInterval:horizontalAccuracy:error:](self, "_locationsInDateInterval:horizontalAccuracy:error:", 200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v36;
  v27 = v7;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v7, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v11 = 1.79769313e308;
    v12 = 2.22507386e-308;
    v13 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v16 = (void *)objc_opt_class();
        -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "destination");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "clLocation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMTriggerDestination distanceCalculator](self, "distanceCalculator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "distanceFromLocation:toLocation:withCalculator:", v15, v19, v20);
        v22 = v21;

        if (v13 < v22)
          v13 = v22;
        if (v11 >= v22)
          v11 = v22;
        objc_msgSend(v15, "horizontalAccuracy");
        if (v12 < v23)
          v12 = v23;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1.79769313e308;
    v12 = 2.22507386e-308;
    v13 = 2.22507386e-308;
  }

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v38 = "-[SMTriggerDestination _shouldChangeModeOfTransportStartDate:endDate:]";
    v39 = 1024;
    v40 = v13 - v11 > v12 + 200.0;
    v41 = 2048;
    v42 = v13;
    v43 = 2048;
    v44 = v11;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%s, %d, maxDistance, %f, minDistance, %f", buf, 0x26u);
  }

  return v13 - v11 > v12 + 750.0;
}

+ (void)currentLocationWithLocationManager:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "locationRequestOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke;
  v14[3] = &unk_1E929E708;
  v15 = v7;
  v16 = v10;
  v17 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v7;
  objc_msgSend(v9, "fetchCurrentLocationWithOptions:handler:", v12, v14);

}

void __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke_2;
  v10[3] = &unk_1E9297EB8;
  v7 = *(NSObject **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 48);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

uint64_t __73__SMTriggerDestination_currentLocationWithLocationManager_queue_handler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "toString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 136315906;
    v8 = "+[SMTriggerDestination currentLocationWithLocationManager:queue:handler:]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%s, options, %@, currentLocation, %@, error, %@", (uint8_t *)&v7, 0x2Au);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (void)calculateDistanceToDestination:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 queue:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = (void *)objc_opt_class();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __104__SMTriggerDestination_calculateDistanceToDestination_locationManager_distanceCalculator_queue_handler___block_invoke;
  v21[3] = &unk_1E92A3C58;
  v24 = v14;
  v25 = a1;
  v22 = v12;
  v23 = v13;
  v18 = v13;
  v19 = v12;
  v20 = v14;
  objc_msgSend(v17, "currentLocationWithLocationManager:queue:handler:", v16, v15, v21);

}

void __104__SMTriggerDestination_calculateDistanceToDestination_locationManager_distanceCalculator_queue_handler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5 || a3)
  {
    v10 = a1[6];
    v11 = a1[4];
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D8BB70];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("current location is unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 17, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, double))(v10 + 16))(v10, v11, v15, 1.79769313e308);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "distanceFromLocation:toLocation:withCalculator:", v5, a1[4], a1[5]);
    v7 = v6;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      if (v7 == 1.79769313e308)
      {
        v9 = CFSTR("YES");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v7);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      *(_DWORD *)buf = 136315394;
      v17 = "+[SMTriggerDestination calculateDistanceToDestination:locationManager:distanceCalculator:queue:handler:]_block_invoke";
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, distance, %@", buf, 0x16u);
      if (v7 != 1.79769313e308)

    }
    (*(void (**)(double))(a1[6] + 16))(v7);
  }

}

- (void)_updateInitiatorStatus
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v9 = 136315138;
    v10 = "-[SMTriggerDestination _updateInitiatorStatus]";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sessionType");

  if (v5 == 2)
  {
    -[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:](self, "_updateInitiatorStatusDestinationBoundWithCompletion:", &__block_literal_global_160);
  }
  else
  {
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sessionType");

    if (v7 == 3)
    {
      -[SMTriggerDestination _updateInitiatorStatusRoundTrip](self, "_updateInitiatorStatusRoundTrip");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "-[SMTriggerDestination _updateInitiatorStatus]";
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%s, Invalid session type", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

void __46__SMTriggerDestination__updateInitiatorStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[SMTriggerDestination _updateInitiatorStatus]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, finished updating initiator status for destination, error, %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)_updateInitiatorStatusRoundTrip
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sessionType");

  if (v4 != 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[SMTriggerDestination _updateInitiatorStatusRoundTrip]";
      v22 = 1024;
      LODWORD(v23) = 1271;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.sessionConfiguration.sessionType == SMSessionTypeRoundTrip (in %s:%d)", (uint8_t *)&v20, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0D8BAA8];
    -[SMTriggerDestination triggerState](self, "triggerState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "statusToString:", objc_msgSend(v8, "currentStatus"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315394;
    v21 = "-[SMTriggerDestination _updateInitiatorStatusRoundTrip]";
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, initiator current status, %@", (uint8_t *)&v20, 0x16u);

  }
  -[SMTriggerDestination triggerState](self, "triggerState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentStatus");

  if (v11 != 3)
  {
    if (v11 == 2)
    {
      +[SMDateUtility date](SMDateUtility, "date");
      v12 = objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "roundTripReminderDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceDate:](v12, "timeIntervalSinceDate:", v14);
      v16 = v15;

      if (v16 > 0.0)
        -[SMTriggerDestination _declareAnomalyForTriggerCategory:](self, "_declareAnomalyForTriggerCategory:", 9);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)MEMORY[0x1E0D8BAA8];
        -[SMTriggerDestination triggerState](self, "triggerState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "statusToString:", objc_msgSend(v18, "currentStatus"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 136315394;
        v21 = "-[SMTriggerDestination _updateInitiatorStatusRoundTrip]";
        v22 = 2112;
        v23 = v19;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%s, Invalid status, %@", (uint8_t *)&v20, 0x16u);

      }
    }

  }
}

- (void)_updateInitiatorStatusDestinationBoundWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void (**v67)(id, _QWORD);
  _QWORD block[5];
  id v69;
  id v70;
  void (**v71)(id, _QWORD);
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  _BYTE *v75;
  double v76;
  unint64_t v77;
  _QWORD v78[5];
  NSObject *v79;
  _QWORD *v80;
  _QWORD *v81;
  _BYTE *v82;
  _QWORD *v83;
  id v84;
  _QWORD v85[4];
  _QWORD v86[4];
  _QWORD v87[5];
  id v88;
  uint8_t v89[4];
  const char *v90;
  __int16 v91;
  void *v92;
  _BYTE buf[24];
  uint64_t (*v94)(uint64_t, uint64_t);
  __int128 v95;
  uint64_t v96;
  _QWORD v97[4];

  v97[1] = *MEMORY[0x1E0C80C00];
  v67 = (void (**)(id, _QWORD))a3;
  -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sessionType");

  if (v5 != 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1305;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: self.sessionConfiguration.sessionType == SMSessionTypeDestinationBound (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination triggerState](self, "triggerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentStatusDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v9);
  v11 = v10;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)MEMORY[0x1E0D8BAA8];
    -[SMTriggerDestination triggerState](self, "triggerState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusToString:", objc_msgSend(v14, "currentStatus"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "description");
    v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v94 = v17;
    LOWORD(v95) = 2048;
    *(double *)((char *)&v95 + 2) = v11;
    _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%s, current status, %@, session configuration, %@, durationSinceLastStatusChange, %.2f", buf, 0x2Au);

  }
  -[SMTriggerDestination triggerState](self, "triggerState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "currentStatus") == 1)
  {
    -[SMTriggerDestination idleTimeoutThreshold](self, "idleTimeoutThreshold");
    v20 = v11 > v19;

    if (v20)
    {
      -[SMTriggerDestination triggerState](self, "triggerState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setCurrentStatus:", 2);

      -[SMTriggerDestination _persistState](self, "_persistState");
    }
  }
  else
  {

  }
  -[SMTriggerDestination _reviseCachedLocations](self, "_reviseCachedLocations");
  -[SMTriggerDestination triggerState](self, "triggerState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "currentStatus") == 1;

  if (v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%s, delaying trigger monitoring until transition to progress state", buf, 0xCu);
    }

    v67[2](v67, 0);
  }
  else
  {
    v25 = -[SMTriggerDestination _isNoProgressStatus](self, "_isNoProgressStatus");
    -[SMTriggerDestination triggerState](self, "triggerState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "currentStatus") == 3)
      v25 = 0;

    if (v25)
      -[SMTriggerDestination _declareAnomalyForTriggerCategory:](self, "_declareAnomalyForTriggerCategory:", 3);
    -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count") == 0;

    if (v28)
    {
      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v96 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s cannot be completed due to no cached locations"), "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, &v96, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 6, v38);

      ((void (**)(id, void *))v67)[2](v67, v39);
    }
    else
    {
      +[SMDateUtility date](SMDateUtility, "date");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "dateByAddingTimeInterval:", -300.0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "location");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      -[SMTriggerDestination cachedLocationEvents](self, "cachedLocationEvents");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastObject");
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v32, "distance");
      v34 = v33;

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v94 = __Block_byref_object_copy__138;
      *(_QWORD *)&v95 = __Block_byref_object_dispose__138;
      *((_QWORD *)&v95 + 1) = 0;
      v87[0] = 0;
      v87[1] = v87;
      v87[2] = 0x3032000000;
      v87[3] = __Block_byref_object_copy__138;
      v87[4] = __Block_byref_object_dispose__138;
      v88 = 0;
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x2020000000;
      v86[3] = 0xBFF0000000000000;
      v85[0] = 0;
      v85[1] = v85;
      v85[2] = 0x2020000000;
      v85[3] = 0xBFF0000000000000;
      -[SMTriggerDestination triggerState](self, "triggerState");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v32) = objc_msgSend(v35, "predominantModeOfTransport") == 4;

      if ((v32 & 1) != 0)
      {
        v61 = 0;
        v63 = 4;
      }
      else
      {
        v84 = 0;
        v40 = -[SMTriggerDestination _predominantMotionActicityTypeFromStartDate:toEndDate:outError:](self, "_predominantMotionActicityTypeFromStartDate:toEndDate:outError:", v64, v66, &v84);
        v61 = v84;
        v63 = -[SMTriggerDestination _motionActivityTypeToTransportType:distance:](self, "_motionActivityTypeToTransportType:distance:", v40, v34);
      }
      -[SMTriggerDestination triggerState](self, "triggerState");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "predominantModeOfTransport") == 0xFFFFFFF;

      if (v42)
      {
        -[SMTriggerDestination triggerState](self, "triggerState");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setPredominantModeOfTransport:", v63);

        -[SMTriggerDestination _persistState](self, "_persistState");
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = (void *)objc_opt_class();
          -[SMTriggerDestination triggerState](self, "triggerState");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "convertSMDirectionTransportTypeToString:", objc_msgSend(v46, "predominantModeOfTransport"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v89 = 136315394;
          v90 = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]";
          v91 = 2112;
          v92 = v47;
          _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%s, predominantModeOfTransport, %@", v89, 0x16u);

        }
      }
      v48 = dispatch_group_create();
      dispatch_group_enter(v48);
      v62 = (void *)objc_opt_class();
      -[SMTriggerDestination triggerState](self, "triggerState");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "predominantModeOfTransport");
      -[SMTriggerDestination defaultsManager](self, "defaultsManager");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "destination");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "clLocation");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination distanceCalculator](self, "distanceCalculator");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMTriggerDestination queue](self, "queue");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke;
      v78[3] = &unk_1E92A3CA0;
      v80 = v86;
      v78[4] = self;
      v81 = v85;
      v82 = buf;
      v83 = v87;
      v57 = v48;
      v79 = v57;
      objc_msgSend(v62, "expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:distanceCalculator:queue:completionHandler:", v50, v65, v51, v54, v66, v55, v56, v78);

      -[SMTriggerDestination queue](self, "queue");
      v58 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_166;
      block[3] = &unk_1E92A3D18;
      v72 = v87;
      block[4] = self;
      v76 = v34;
      v73 = v86;
      v77 = v63;
      v69 = v65;
      v70 = v66;
      v71 = v67;
      v74 = v85;
      v75 = buf;
      v59 = v66;
      v60 = v65;
      dispatch_group_notify(v57, v58, block);

      _Block_object_dispose(v85, 8);
      _Block_object_dispose(v86, 8);
      _Block_object_dispose(v87, 8);

      _Block_object_dispose(buf, 8);
    }
  }

}

void __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a4;
  objc_msgSend(*(id *)(a1 + 32), "platform");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "internalInstall") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("RTDefaultsSMTriggerDestinationMuteMapsExpectedEtaKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v21 = 136315138;
        v22 = "-[SMTriggerDestination _updateInitiatorStatusDestinationBoundWithCompletion:]_block_invoke";
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, muting maps expected travel time with user defaults", (uint8_t *)&v21, 0xCu);
      }

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0xBFF0000000000000;
    }
  }
  else
  {

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a5;
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;
  v17 = v9;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v10;
  v20 = v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_166(uint64_t a1)
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_declareAnomalyForTriggerCategory:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v48 = objc_msgSend(*(id *)(a1 + 32), "_shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:", *(double *)(a1 + 96), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onCrowFliesETAUpdate:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

  objc_msgSend(*(id *)(a1 + 32), "sessionMetricManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "onMapsETAUpdate:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));

  if (!*((_BYTE *)v46 + 24))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "triggerState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "upperBoundEta");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v4, "_isExceedingUpperBoundEta:mapsExpectedTravelTime:crowFliesExpectedTravelTime:", v6, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));

    if ((_DWORD)v4)
      objc_msgSend(*(id *)(a1 + 32), "_declareAnomalyForTriggerCategory:", 4);
  }
  v7 = dispatch_group_create();
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  dispatch_group_enter(v7);
  objc_msgSend(*(id *)(a1 + 32), "triggerState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "upperBoundEta");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {

    goto LABEL_10;
  }
  v10 = *(_QWORD *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "triggerState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "predominantModeOfTransport");

  if (v10 == v12)
  {
LABEL_10:
    dispatch_group_leave(v7);
    goto LABEL_11;
  }
  *((_BYTE *)v42 + 24) = 1;
  v26 = (void *)objc_opt_class();
  v25 = *(_QWORD *)(a1 + 104);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "destination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "distanceCalculator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_2;
  v36[3] = &unk_1E92A3CC8;
  v38 = *(_OWORD *)(a1 + 72);
  v21 = *(_QWORD *)(a1 + 64);
  v39 = *(_QWORD *)(a1 + 88);
  v40 = v21;
  v37 = v7;
  objc_msgSend(v26, "expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:distanceCalculator:queue:completionHandler:", v25, v13, v14, v17, v18, v19, v20, v36);

LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_3;
  block[3] = &unk_1E92A3CF0;
  v23 = *(_QWORD *)(a1 + 64);
  v24 = *(_QWORD *)(a1 + 32);
  v30 = &v41;
  v31 = v23;
  block[4] = v24;
  v34 = *(_QWORD *)(a1 + 104);
  v32 = &v45;
  v28 = *(id *)(a1 + 48);
  v33 = *(_OWORD *)(a1 + 72);
  v35 = *(_QWORD *)(a1 + 96);
  v29 = *(id *)(a1 + 56);
  dispatch_group_notify(v7, v22, block);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
}

void __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, double a4, double a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;

  v9 = a2;
  v10 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a5;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;
  v16 = v9;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;
  v15 = v10;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __77__SMTriggerDestination__updateInitiatorStatusDestinationBoundWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "_declareAnomalyForTriggerCategory:", 0);
    v2 = *(_QWORD *)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 32), "triggerState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredominantModeOfTransport:", v2);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "etaScaleFactor");
    objc_msgSend(v4, "upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpectedTravelTime:etaScaleFactor:", v5, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "triggerState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUpperBoundEta:", v10);

    v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "triggerState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMapsExpectedTravelTime:", v12);

    v14 = *(double *)(a1 + 104);
    objc_msgSend(*(id *)(a1 + 32), "triggerState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRemainingDistance:", v14);

    objc_msgSend(*(id *)(a1 + 32), "_initializeETATimer");
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateCoarseEtaWithMapsExpectedTravelTime:crowFliesExpectedTravelTime:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_persistState");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_persistState
{
  void *v3;
  int v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  id v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
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
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE buf[12];
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  -[SMTriggerDestination triggerState](self, "triggerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "dirty");

  if (v4)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__138;
    v38 = __Block_byref_object_dispose__138;
    v39 = 0;
    v5 = dispatch_semaphore_create(0);
    -[SMTriggerDestination sessionStore](self, "sessionStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination triggerState](self, "triggerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __37__SMTriggerDestination__persistState__block_invoke;
    v31[3] = &unk_1E9297038;
    v33 = &v34;
    v9 = v5;
    v32 = v9;
    objc_msgSend(v6, "storeTriggerDestinationStates:handler:", v8, v31);

    v10 = (id *)(v35 + 5);
    v11 = (id)v35[5];
    v12 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v12, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeIntervalSinceDate:", v13);
      v16 = v15;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501_0);
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
      v46[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v46, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v11 = objc_retainAutorelease(v25);

      }
    }

    objc_storeStrong(v10, v11);
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination triggerState](self, "triggerState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v35[5];
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SMTriggerDestination _persistState]";
      v41 = 2112;
      v42 = v27;
      v43 = 2112;
      v44 = v28;
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%s, persisted state, %@, error, %@", buf, 0x20u);

    }
    -[SMTriggerDestination triggerState](self, "triggerState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDirty:", 0);

    _Block_object_dispose(&v34, 8);
  }
}

void __37__SMTriggerDestination__persistState__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_shouldUpdateUpperBoundEtaWithRemainingDistance:(double)a3 mapsExpectedTravelTime:(double)a4
{
  SMSessionTriggerDestinationETAUpdateState *v5;
  const char *v6;
  NSObject *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  _BOOL8 v36;
  double v37;
  unsigned int v38;
  NSObject *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  void *v43;
  int v44;
  const char *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (a3 == 1.79769313e308)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      v6 = "Invalid parameter not satisfying: remainingDistance != DBL_MAX";
LABEL_7:
      _os_log_error_impl(&dword_1D1A22000, &v5->super, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v44, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (a3 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      v6 = "Invalid parameter not satisfying: remainingDistance >= 0.0";
      goto LABEL_7;
    }
LABEL_15:
    LOBYTE(v26) = 0;
    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    -[SMTriggerDestination triggerState](self, "triggerState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remainingDistance");
    v12 = v11;
    -[SMTriggerDestination triggerState](self, "triggerState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mapsExpectedTravelTime");
    v44 = 136316162;
    v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
    v46 = 2048;
    v47 = v12;
    v48 = 2048;
    v49 = a3;
    v50 = 2048;
    v51 = v14;
    v52 = 2048;
    v53 = a4;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, previous remainingDistance, %.1f, current remainingDistance, %.1f, previous mapsTravelTime, %.1f, current mapsTravelTime, %.1f", (uint8_t *)&v44, 0x34u);

  }
  -[SMTriggerDestination triggerState](self, "triggerState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "upperBoundEta");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "destination");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "eta");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "destination");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "eta");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "additionalTravelTime");
      v25 = v24;

      if (v25 > 0.0)
      {
        _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_INFO))
        {
          v44 = 136315138;
          v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
          _os_log_impl(&dword_1D1A22000, &v5->super, OS_LOG_TYPE_INFO, "%s, NO, user has specified the ETA.", (uint8_t *)&v44, 0xCu);
        }
        goto LABEL_15;
      }
    }
    else
    {

    }
    -[SMTriggerDestination triggerState](self, "triggerState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "remainingDistance");
    v30 = v29 - a3;

    -[SMTriggerDestination triggerState](self, "triggerState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "mapsExpectedTravelTime");
    v33 = v32 - a4;

    if (a4 <= 0.0)
    {
      v36 = 0;
    }
    else
    {
      -[SMTriggerDestination triggerState](self, "triggerState");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "mapsExpectedTravelTime");
      v36 = v33 > 300.0 && v35 > 0.0;

    }
    -[SMTriggerDestination minDistanceUpdateThreshold](self, "minDistanceUpdateThreshold");
    v38 = v30 > 200.0 || v36;
    if (v37 < a3)
      v26 = v38;
    else
      v26 = 1;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = CFSTR("NO");
      if ((_DWORD)v26)
        v41 = CFSTR("YES");
      else
        v41 = CFSTR("NO");
      v44 = 136316162;
      v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
      v46 = 2112;
      v47 = v41;
      if (v30 <= 200.0)
        v42 = CFSTR("NO");
      else
        v42 = CFSTR("YES");
      v48 = 2112;
      v49 = *(double *)&v42;
      if (v36)
        v40 = CFSTR("YES");
      v50 = 2112;
      v51 = v40;
      v52 = 2048;
      v53 = a3;
      _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%s, shouldUpdateETA, %@, distance shorter, %@, ETA shorter, %@, remainingDistance, %.2f.", (uint8_t *)&v44, 0x34u);
    }

    v5 = -[SMSessionTriggerDestinationETAUpdateState initWithDistanceRemaining:distanceDifference:nominalTravelTimeRemaining:nominalTravelTimeDifference:nominalTravelTimeShorter:remainingDistanceShorter:shouldUpdateETAUpperBound:]([SMSessionTriggerDestinationETAUpdateState alloc], "initWithDistanceRemaining:distanceDifference:nominalTravelTimeRemaining:nominalTravelTimeDifference:nominalTravelTimeShorter:remainingDistanceShorter:shouldUpdateETAUpperBound:", v36, v30 > 200.0, v26, a3, v30, a4, v33);
    -[SMTriggerDestination sessionMetricManager](self, "sessionMetricManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "onShouldUpdateETAUpperBoundWithETAUpdateState:", v5);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v5 = (SMSessionTriggerDestinationETAUpdateState *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v26) = 1;
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_INFO))
    {
      v44 = 136315138;
      v45 = "-[SMTriggerDestination _shouldUpdateUpperBoundEtaWithRemainingDistance:mapsExpectedTravelTime:]";
      _os_log_impl(&dword_1D1A22000, &v5->super, OS_LOG_TYPE_INFO, "%s, YES, threshold has not set yet.", (uint8_t *)&v44, 0xCu);
    }
  }
LABEL_16:

  return v26;
}

- (BOOL)_isExceedingUpperBoundEta:(id)a3 mapsExpectedTravelTime:(double)a4 crowFliesExpectedTravelTime:(double)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  const char *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "crowFliesUpperBoundEta");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[SMDateUtility date](SMDateUtility, "date");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapsUpperBoundEta");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 > 0.0 && v11)
    {
      -[NSObject dateByAddingTimeInterval:](v10, "dateByAddingTimeInterval:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mapsUpperBoundEta");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14;
      v16 = v14 > 0.0;

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "mapsUpperBoundEta");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringFromDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringFromDate");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = CFSTR("NO");
        v32 = 136316162;
        v33 = "-[SMTriggerDestination _isExceedingUpperBoundEta:mapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
        v36 = 2048;
        v34 = 2112;
        v35 = v19;
        if (v15 > 0.0)
          v22 = CFSTR("YES");
        v37 = a4;
        v38 = 2112;
        v39 = v20;
        v40 = 2112;
        v41 = v22;
        v23 = "%s, maps upper bound ETA, %@, mapsExpectedTravelTime, %f, newETA, %@, isExceedingUpperBoundEta, %@";
LABEL_15:
        _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v32, 0x34u);

      }
    }
    else
    {
      -[NSObject dateByAddingTimeInterval:](v10, "dateByAddingTimeInterval:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "crowFliesUpperBoundEta");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v24);
      v26 = v25;
      v16 = v25 > 0.0;

      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "crowFliesUpperBoundEta");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringFromDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringFromDate");
        v27 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v27;
        v28 = CFSTR("NO");
        v32 = 136316162;
        v33 = "-[SMTriggerDestination _isExceedingUpperBoundEta:mapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
        v36 = 2048;
        v34 = 2112;
        v35 = v19;
        if (v26 > 0.0)
          v28 = CFSTR("YES");
        v37 = a5;
        v38 = 2112;
        v39 = v27;
        v40 = 2112;
        v41 = v28;
        v23 = "%s, crow flies upper bound ETA, %@, crowFliesExpectedTravelTime, %f, newETA, %@, isExceedingUpperBoundEta, %@";
        goto LABEL_15;
      }
    }

    -[SMTriggerDestination sessionMetricManager](self, "sessionMetricManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapsUpperBoundEta");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v30);
    objc_msgSend(v29, "updateClosestTimeIntervalToExceedingETAWithTimeInterval:");

    goto LABEL_17;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v32 = 136315138;
    v33 = "-[SMTriggerDestination _isExceedingUpperBoundEta:mapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "%s, No initial upper bound ETA to compare with.", (uint8_t *)&v32, 0xCu);
  }
  v16 = 1;
LABEL_17:

  return v16;
}

+ (id)upperBoundEtaForDepartureDate:(id)a3 defaultsManager:(id)a4 mapsExpectedTravelTime:(double)a5 crowFliesExpectedTravelTime:(double)a6 etaScaleFactor:(double)a7
{
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(v12, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationMinExpectedTravelDurationThresholdKey"), &unk_1E932D520);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (v15 != 900.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v29 = 136316162;
      v30 = "+[SMTriggerDestination upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpecte"
            "dTravelTime:etaScaleFactor:]";
      v31 = 2080;
      v32 = "overriding min expected travel duration threshold";
      v33 = 2048;
      v34 = 900.0;
      v35 = 2048;
      v36 = v15;
      v37 = 2112;
      v38 = CFSTR("RTDefaultsSMTriggerDestinationMinExpectedTravelDurationThresholdKey");
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v29, 0x34u);
    }

  }
  objc_msgSend(v12, "objectForKey:value:", CFSTR("RTDefaultsSMTriggerDestinationMaxExceedTravelDurationThresholdKey"), &unk_1E932D540);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  if (v19 != 7200.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v29 = 136316162;
      v30 = "+[SMTriggerDestination upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpecte"
            "dTravelTime:etaScaleFactor:]";
      v31 = 2080;
      v32 = "overriding max exceed travel duration threshold";
      v33 = 2048;
      v34 = 7200.0;
      v35 = 2048;
      v36 = v19;
      v37 = 2112;
      v38 = CFSTR("RTDefaultsSMTriggerDestinationMaxExceedTravelDurationThresholdKey");
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v29, 0x34u);
    }

  }
  if (a5 <= 0.0)
  {
    v22 = 0;
  }
  else
  {
    v21 = a5 * a7;
    if (a5 * a7 < v15)
      v21 = v15;
    if (v21 >= v19 + a5)
      v21 = v19 + a5;
    objc_msgSend(v11, "dateByAddingTimeInterval:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = a6 * a7;
  if (a6 * a7 < v15)
    v23 = v15;
  if (v23 >= v19 + a6)
    v23 = v19 + a6;
  objc_msgSend(v11, "dateByAddingTimeInterval:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8BAB0]), "initWithMapsUpperBoundEta:crowFliesUpperBoundEta:", v22, v24);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "stringFromDate");
    v27 = (char *)objc_claimAutoreleasedReturnValue();
    v29 = 136316418;
    v30 = "+[SMTriggerDestination upperBoundEtaForDepartureDate:defaultsManager:mapsExpectedTravelTime:crowFliesExpectedT"
          "ravelTime:etaScaleFactor:]";
    v31 = 2112;
    v32 = v27;
    v33 = 2048;
    v34 = a5;
    v35 = 2048;
    v36 = a6;
    v37 = 2048;
    v38 = *(const __CFString **)&a7;
    v39 = 2112;
    v40 = v25;
    _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%s, departureDate, %@, mapsExpectedTravlTime, %.2f, crowFliesExpectedTravelTime, %.2f, etaScaleFactor, %.2f, upperBoundETA, %@", (uint8_t *)&v29, 0x3Eu);

  }
  return v25;
}

+ (double)crowFliesExpectedTravelTimeForTransportType:(unint64_t)a3 defaultsManager:(id)a4 distance:(double)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[SMTriggerDestination updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:](SMTriggerDestination, "updateSMTriggerDestinationTransportTypeToAvgSpeedWithDefaultsManager:", a4);
  v7 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    if (v15 != 0.0)
    {
      v16 = (void *)SMTriggerDestinationTransportTypeToAvgSpeed;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = a5 / v19;

      return v20;
    }
  }
  else
  {

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v23 = 136315394;
    v24 = "+[SMTriggerDestination crowFliesExpectedTravelTimeForTransportType:defaultsManager:distance:]";
    v25 = 2112;
    v26 = SMTriggerDestinationTransportTypeToAvgSpeed;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "%s, invalid SMTriggerDestinationTransportTypeToAvgSpeed, %@", (uint8_t *)&v23, 0x16u);
  }

  return -1.0;
}

- (id)_cachedLocationsDateInterval
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  +[SMDateUtility date](SMDateUtility, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination triggerState](self, "triggerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUnlockDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination triggerState](self, "triggerState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastLockDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v7);
  if (v8 > 0.0)
  {

    goto LABEL_8;
  }
  -[SMTriggerDestination triggerState](self, "triggerState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentStatus");

  if (v10 == 1)
  {
LABEL_8:
    -[SMTriggerDestination destinationStatusUpdateTimeInterval](self, "destinationStatusUpdateTimeInterval");
    objc_msgSend(v3, "dateByAddingTimeInterval:", v26 * -0.5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[SMTriggerDestination noProgressTimeoutThreshold](self, "noProgressTimeoutThreshold");
  v12 = v11;
  -[SMTriggerDestination destinationStatusUpdateTimeInterval](self, "destinationStatusUpdateTimeInterval");
  objc_msgSend(v3, "dateByAddingTimeInterval:", -(v12 + v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SMTriggerDestination triggerState](self, "triggerState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentStatusDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SMTriggerDestination triggerState](self, "triggerState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentStatusDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "laterDate:", v14);
    v19 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v19;
  }
  -[SMTriggerDestination triggerState](self, "triggerState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastUnlockDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SMTriggerDestination triggerState](self, "triggerState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastUnlockDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dateByAddingTimeInterval:", -6.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "laterDate:", v14);
    v25 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v25;
  }
LABEL_9:
  -[SMTriggerDestination lastUserResponseSafeDate](self, "lastUserResponseSafeDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dateByAddingTimeInterval:", -6.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "laterDate:", v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v29, v3);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    -[SMTriggerDestination triggerState](self, "triggerState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "lastLockDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringFromDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination triggerState](self, "triggerState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastUnlockDate");
    v41 = v3;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringFromDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination lastUserResponseSafeDate](self, "lastUserResponseSafeDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringFromDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v43 = "-[SMTriggerDestination _cachedLocationsDateInterval]";
    v44 = 2112;
    v45 = v33;
    v46 = 2112;
    v47 = v36;
    v48 = 2112;
    v49 = v38;
    v50 = 2112;
    v51 = v30;
    _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "%s, lastLockDate, %@, lastUnlockDate, %@, lastUserResponseDate, %@, dateInterval of interest, %@", buf, 0x34u);

    v3 = v41;
  }

  return v30;
}

- (void)_declareAnomalyForTriggerCategory:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x1E0D8BAA8];
    -[SMTriggerDestination triggerState](self, "triggerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statusToString:", objc_msgSend(v7, "currentStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8BA40], "triggerCategoryToString:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[SMTriggerDestination _declareAnomalyForTriggerCategory:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, current status, %@, triggerCategory, %@", (uint8_t *)&v13, 0x20u);

  }
  -[SMTriggerDestination triggerState](self, "triggerState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentStatus");

  if (v11 != 3)
  {
    -[SMTriggerDestination triggerState](self, "triggerState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentStatus:", 3);

    -[SMTriggerDestination _persistState](self, "_persistState");
    -[SMTriggerDestination setTriggerCategory:](self, "setTriggerCategory:", a3);
    -[SMTriggerDestination postStateChange](self, "postStateChange");
  }
}

- (void)_initializeETATimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[SMTriggerDestination triggerState](self, "triggerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upperBoundEta");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SMTriggerDestination _tearDownTimerWithIdentifier:](self, "_tearDownTimerWithIdentifier:", CFSTR("com.apple.routined.SMTriggerDestination.upperBoundETATimerIdentifier"));
    +[SMDateUtility date](SMDateUtility, "date");
    v30 = objc_claimAutoreleasedReturnValue();
    -[SMTriggerDestination triggerState](self, "triggerState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "upperBoundEta");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mapsUpperBoundEta");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[SMTriggerDestination triggerState](self, "triggerState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "upperBoundEta");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mapsUpperBoundEta");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToDate:", v12);

      if ((v13 & 1) == 0)
      {
        -[SMTriggerDestination triggerState](self, "triggerState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "upperBoundEta");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mapsUpperBoundEta");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    else
    {

    }
    -[SMTriggerDestination triggerState](self, "triggerState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "upperBoundEta");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "crowFliesUpperBoundEta");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {

      goto LABEL_16;
    }
    v21 = (void *)v20;
    -[SMTriggerDestination triggerState](self, "triggerState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "upperBoundEta");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "crowFliesUpperBoundEta");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqualToDate:", v25);

    if ((v26 & 1) != 0)
    {
LABEL_16:
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[SMTriggerDestination _initializeETATimer]";
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%s, Invalid upper bound ETA", buf, 0xCu);
      }
      v17 = v30;
      goto LABEL_19;
    }
    -[SMTriggerDestination triggerState](self, "triggerState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "upperBoundEta");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "crowFliesUpperBoundEta");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v27 = v16;

    if (v27)
    {
      v17 = v30;
      -[NSObject timeIntervalSinceDate:](v27, "timeIntervalSinceDate:", v30);
      -[SMTriggerDestination _initializeTimerWithIdentifier:fireAfterDelay:](self, "_initializeTimerWithIdentifier:fireAfterDelay:", CFSTR("com.apple.routined.SMTriggerDestination.upperBoundETATimerIdentifier"));
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        -[NSObject stringFromDate](v27, "stringFromDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v32 = "-[SMTriggerDestination _initializeETATimer]";
        v33 = 2112;
        v34 = v29;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%s, fireDate, %@", buf, 0x16u);

      }
LABEL_19:

      goto LABEL_20;
    }
    goto LABEL_16;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[SMTriggerDestination _initializeETATimer]";
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%s, No upper bound ETA is set yet", buf, 0xCu);
  }
LABEL_20:

}

- (unint64_t)_predominantMotionActicityTypeFromStartDate:(id)a3 toEndDate:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
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
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  unint64_t v37;
  NSObject *v38;
  void *v40;
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  uint8_t *v44;
  uint8_t v45[8];
  uint8_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE buf[12];
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  _QWORD v62[4];

  v62[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v45 = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate", v45, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("startDate"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:
      v37 = 0;
      *a5 = v31;
      goto LABEL_26;
    }
LABEL_25:
    v37 = 0;
    goto LABEL_26;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v45 = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v45, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
      v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v11 = dispatch_semaphore_create(0);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  *(_QWORD *)v45 = 0;
  v46 = v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__138;
  v49 = __Block_byref_object_dispose__138;
  v50 = 0;
  -[SMTriggerDestination motionActivityManager](self, "motionActivityManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __87__SMTriggerDestination__predominantMotionActicityTypeFromStartDate_toEndDate_outError___block_invoke;
  v41[3] = &unk_1E92971F0;
  v43 = &v51;
  v44 = v45;
  v13 = v11;
  v42 = v13;
  objc_msgSend(v12, "fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:", v8, v10, v41);

  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16))
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "timeIntervalSinceDate:", v15);
  v18 = v17;
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_501_0);
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
  v62[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v62, 1);
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
LABEL_12:
    v28 = 0;
    v29 = 1;
  }

  v32 = v28;
  if ((v29 & 1) == 0)
    objc_storeStrong((id *)v46 + 5, v28);
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "stringFromDate");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromDate");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", v52[3]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[SMTriggerDestination _predominantMotionActicityTypeFromStartDate:toEndDate:outError:]";
    v56 = 2112;
    v57 = v34;
    v58 = 2112;
    v59 = v35;
    v60 = 2112;
    v61 = v36;
    _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%s, start Date, %@, endDate, %@, motionActivityType, %@", buf, 0x2Au);

  }
  if (a5)
    *a5 = objc_retainAutorelease(*((id *)v46 + 5));
  v37 = v52[3];

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v51, 8);

LABEL_26:
  return v37;
}

void __87__SMTriggerDestination__predominantMotionActicityTypeFromStartDate_toEndDate_outError___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (unint64_t)_motionActivityTypeToTransportType:(unint64_t)a3 distance:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2)
    goto LABEL_5;
  if (a4 <= 2000.0)
    goto LABEL_4;
  -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eta");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "transportType");

  if (v9 == 2)
  {
LABEL_4:
    v10 = 2;
  }
  else
  {
LABEL_5:
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "destination");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "eta");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "transportType");

  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0D18400], "motionActivityTypeToString:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "convertSMDirectionTransportTypeToString:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315650;
    v19 = "-[SMTriggerDestination _motionActivityTypeToTransportType:distance:]";
    v20 = 2112;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, motionActivityType, %@, transportType, %@", (uint8_t *)&v18, 0x20u);

  }
  return v10;
}

+ (void)checkEligibilityOfDestination:(id)a3 locationManager:(id)a4 distanceCalculator:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v11 = a3;
  v12 = a7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__SMTriggerDestination_checkEligibilityOfDestination_locationManager_distanceCalculator_queue_completionHandler___block_invoke;
  v15[3] = &unk_1E92A3D40;
  v16 = v11;
  v17 = v12;
  v13 = v11;
  v14 = v12;
  +[SMTriggerDestination calculateDistanceToDestination:locationManager:distanceCalculator:queue:handler:](SMTriggerDestination, "calculateDistanceToDestination:locationManager:distanceCalculator:queue:handler:", v13, a4, a5, a6, v15);

}

void __113__SMTriggerDestination_checkEligibilityOfDestination_locationManager_distanceCalculator_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void (*v10)(void);
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Unable to calculate distance, error, %@", buf, 0xCu);
    }

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  v11 = *MEMORY[0x1E0D8BCC0];
  if (*MEMORY[0x1E0D8BCC0] < a4)
  {
    v14 = a1 + 32;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(v14 + 8);
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D8BB70];
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("destination is too far");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    v19 = v16;
    v20 = 18;
LABEL_10:
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v13 + 16))(v13, 0, v12, v24);

    goto LABEL_11;
  }
  v21 = a1 + 32;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(v21 + 8);
  if (a4 < 500.0)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D8BB70];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("destination is too close");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;
    v19 = v23;
    v20 = 19;
    goto LABEL_10;
  }
  v10 = *(void (**)(void))(v13 + 16);
LABEL_5:
  v10();
LABEL_11:

}

+ (void)estimateEtaToDestination:(id)a3 transportType:(unint64_t)a4 locationManager:(id)a5 defaultsManager:(id)a6 distanceCalculator:(id)a7 queue:(id)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  id v37;

  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a5;
  +[SMDateUtility date](SMDateUtility, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_class();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke;
  v29[3] = &unk_1E92A3D90;
  v30 = v15;
  v31 = v16;
  v32 = v21;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = a4;
  v37 = a1;
  v23 = v18;
  v24 = v17;
  v25 = v21;
  v26 = v16;
  v27 = v15;
  v28 = v19;
  objc_msgSend(v22, "currentLocationWithLocationManager:queue:handler:", v20, v23, v29);

}

void __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  _QWORD v30[4];
  uint64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 72);
    v17 = *(_QWORD *)(a1 + 80);
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("current location is unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D8BB70], 17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *, double, double))(v18 + 16))(v18, v16, v17, v21, -1.0, -1.0);

  }
  else
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke_2;
    v22[3] = &unk_1E92A3D68;
    v25 = v30;
    v26 = v29;
    v12 = *(_QWORD *)(a1 + 80);
    v27 = *(_QWORD *)(a1 + 88);
    v13 = *(_QWORD *)(a1 + 64);
    v24 = *(id *)(a1 + 72);
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 80);
    v23 = v14;
    v28 = v15;
    +[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:distanceCalculator:queue:completionHandler:](SMTriggerDestination, "expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:distanceCalculator:queue:completionHandler:", v12, v5, v8, v9, v10, v11, v13, v22);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v30, 8);
  }

}

void __128__SMTriggerDestination_estimateEtaToDestination_transportType_locationManager_defaultsManager_distanceCalculator_queue_handler___block_invoke_2(_QWORD *a1, void *a2, void *a3, double a4, double a5)
{
  id v9;
  id v10;
  BOOL v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  __n128 v15;
  __n128 v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  if (v9)
    v11 = 1;
  else
    v11 = a4 < 0.0;
  if (v11)
    v12 = a5;
  else
    v12 = a4;
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v12;
  v13 = *MEMORY[0x1E0D8BB58];
  if ((int)v13 <= 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v17[0] = 67109634;
      v17[1] = v13;
      v18 = 2080;
      v19 = "+[SMTriggerDestination estimateEtaToDestination:transportType:locationManager:defaultsManager:distanceCalcul"
            "ator:queue:handler:]_block_invoke_2";
      v20 = 1024;
      v21 = 1922;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "SMCoarseDateBucketsMinutes should be greater than 0, %d (in %s:%d)", (uint8_t *)v17, 0x18u);
    }

  }
  objc_msgSend((id)objc_opt_class(), "roundingUpTimeInterval:bucketDurationMinute:", v13, *(double *)(*(_QWORD *)(a1[6] + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v16.n128_u64[0];
  v16.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v16.n128_f64[0] < 0.0
    || v10
    || (v15.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24), v15.n128_f64[0] < 0.0))
  {
    v16.n128_u64[0] = -1.0;
    v15.n128_u64[0] = -1.0;
    (*(void (**)(__n128, __n128))(a1[5] + 16))(v16, v15);
  }
  else
  {
    (*(void (**)(__n128, __n128))(a1[5] + 16))(v16, v15);
  }

}

+ (void)expectedTravelTimeforTransportType:(unint64_t)a3 source:(id)a4 defaultsManager:(id)a5 destination:(id)a6 departureDate:(id)a7 distanceCalculator:(id)a8 queue:(id)a9 completionHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  objc_msgSend((id)objc_opt_class(), "distanceFromLocation:toLocation:withCalculator:", v15, v17, v21);
  v23 = v22;

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    +[SMTriggerDestination convertSMDirectionTransportTypeToString:](SMTriggerDestination, "convertSMDirectionTransportTypeToString:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringFromDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v35 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:dis"
          "tanceCalculator:queue:completionHandler:]";
    v36 = 2112;
    v37 = v25;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v26;
    v44 = 2048;
    v45 = v23;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%s, transportType, %@, source, %@, destination, %@, departureDate, %@, distance, %.3f", buf, 0x3Eu);

  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __151__SMTriggerDestination_expectedTravelTimeforTransportType_source_defaultsManager_destination_departureDate_distanceCalculator_queue_completionHandler___block_invoke;
  v29[3] = &unk_1E92A3DB8;
  v32 = v23;
  v33 = a3;
  v30 = v16;
  v31 = v19;
  v27 = v16;
  v28 = v19;
  +[SMTriggerDestination mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler:](SMTriggerDestination, "mapsExpectedTravelTimeforTransportType:source:destination:departureDate:queue:handler:", a3, v15, v17, v18, v20, v29);

}

void __151__SMTriggerDestination_expectedTravelTimeforTransportType_source_defaultsManager_destination_departureDate_distanceCalculator_queue_completionHandler___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:dis"
          "tanceCalculator:queue:completionHandler:]_block_invoke";
    v26 = 2048;
    v27 = a3;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, Maps expectedTravelTime, %.3f, error, %@", buf, 0x20u);
  }

  if (*(double *)(a1 + 48) == 1.79769313e308)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:d"
            "istanceCalculator:queue:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%s, invalid distance = DBL_MAX", buf, 0xCu);
    }

    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D8BB70];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("invalid distance");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = v9;
    v13 = 6;
  }
  else
  {
    +[SMTriggerDestination crowFliesExpectedTravelTimeForTransportType:defaultsManager:distance:](SMTriggerDestination, "crowFliesExpectedTravelTimeForTransportType:defaultsManager:distance:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v15 = v14;
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[SMTriggerDestination expectedTravelTimeforTransportType:source:defaultsManager:destination:departureDate:d"
            "istanceCalculator:queue:completionHandler:]_block_invoke";
      v26 = 2048;
      v27 = v15;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%s, CrowFlies expectedTravelTime, %.3f", buf, 0x16u);
    }

    if (v15 >= 0.0)
    {
      (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(a3, v15);
      goto LABEL_12;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D8BB70];
    v20 = *MEMORY[0x1E0CB2D50];
    v21 = CFSTR("unable to calculate ETA");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    v12 = v18;
    v13 = 7;
  }
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(a3, -1.0);
LABEL_12:

}

+ (id)statusToString:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("InvalidStatus");
  else
    return off_1E92A3DF8[a3];
}

+ (id)convertSMDirectionTransportTypeToString:(unint64_t)a3
{
  id result;

  result = CFSTR("SMDirectionsTransportTypeWalking");
  switch(a3)
  {
    case 1uLL:
      result = CFSTR("SMDirectionsTransportTypeAutomobile");
      break;
    case 2uLL:
      return result;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      result = CFSTR("SMDirectionsTransportTypeTransit");
      break;
    case 8uLL:
      result = CFSTR("SMDirectionsTransportTypeBicycle");
      break;
    default:
      if (a3 == 0xFFFFFFF)
        result = CFSTR("SMDirectionsTransportTypeAny");
      else
LABEL_5:
        result = CFSTR("UKNOWN");
      break;
  }
  return result;
}

+ (unint64_t)convertSMDirectionTransportTypeToMKDirectionTransportType:(unint64_t)a3
{
  unint64_t result;

  result = a3;
  if ((a3 > 8 || ((1 << a3) & 0x116) == 0) && a3 != 0xFFFFFFF)
    return 0;
  return result;
}

+ (double)roundingUpTimeInterval:(double)a3 bucketDurationMinute:(int)a4
{
  return ceil(a3 / ((double)a4 * 60.0)) * (double)a4 * 60.0;
}

+ (double)distanceFromLocation:(id)a3 toLocation:(id)a4 withCalculator:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0D183B0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithCLLocation:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v9);
  v18 = 0;
  objc_msgSend(v8, "distanceFromLocation:toLocation:error:", v11, v12, &v18);
  v14 = v13;

  v15 = v18;
  if (v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "error calculating distance: %@", buf, 0xCu);
    }

  }
  return v14;
}

- (void)_updateCoarseEtaWithMapsExpectedTravelTime:(double)a3 crowFliesExpectedTravelTime:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  SMTriggerEstimatedEndDateUpdateNotification *v17;
  void *v18;
  SMTriggerEstimatedEndDateUpdateNotification *v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[SMDateUtility date](SMDateUtility, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0C99D68];
  if (a3 > 0.0)
    a4 = a3;
  objc_msgSend(v7, "dateByAddingTimeInterval:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "roundingUpDate:bucketDurationMinute:", v10, *MEMORY[0x1E0D8BB58]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateByAddingTimeInterval:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SMTriggerDestination _shouldUpdateCoarseEta:](self, "_shouldUpdateCoarseEta:", v11))
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[SMTriggerDestination coarseEta](self, "coarseEta");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v22 = "-[SMTriggerDestination _updateCoarseEtaWithMapsExpectedTravelTime:crowFliesExpectedTravelTime:]";
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, update coarseETA from, %@, to, %@", buf, 0x20u);

    }
    -[SMTriggerDestination setCoarseEta:](self, "setCoarseEta:", v11);
    v17 = [SMTriggerEstimatedEndDateUpdateNotification alloc];
    +[SMDateUtility date](SMDateUtility, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SMTriggerEstimatedEndDateUpdateNotification initWithTriggerCategory:SOSState:estimatedEndDate:coarseEstimatedEndDate:triggerName:date:details:](v17, "initWithTriggerCategory:SOSState:estimatedEndDate:coarseEstimatedEndDate:triggerName:date:details:", 16, 1, v12, v11, CFSTR("SMTriggerDestination"), v18, MEMORY[0x1E0C9AA70]);

    -[SMTriggerDestination sessionMonitorDelegate](self, "sessionMonitorDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "onTriggerNotification:", v19);

  }
}

- (BOOL)_shouldUpdateCoarseEta:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  -[SMTriggerDestination coarseEta](self, "coarseEta");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  -[SMTriggerDestination coarseEta](self, "coarseEta");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToDate:", v6);

  if ((v7 & 1) == 0)
  {
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eta");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "additionalTravelTime");
    v13 = v12;

    if (v13 > 0.0)
    {
      -[SMTriggerDestination coarseEta](self, "coarseEta");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v14, "compare:", v4) == -1;

      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_4:
  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)getSMTriggerDestinationTransportTypeToAvgSpeed
{
  return (id)SMTriggerDestinationTransportTypeToAvgSpeed;
}

- (id)lastUserResponseSafeDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userResponseSafeDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[SMTriggerDestination sessionConfiguration](self, "sessionConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionStartDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (SMTriggerManagerProtocol)sessionMonitorDelegate
{
  return (SMTriggerManagerProtocol *)objc_loadWeakRetained((id *)&self->sessionMonitorDelegate);
}

- (void)setSessionMonitorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->sessionMonitorDelegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (void)setDataProtectionManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataProtectionManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStore, a3);
}

- (SMTriggerDestinationState)triggerState
{
  return self->_triggerState;
}

- (void)setTriggerState:(id)a3
{
  objc_storeStrong((id *)&self->_triggerState, a3);
}

- (CLLocation)originLocation
{
  return self->_originLocation;
}

- (void)setOriginLocation:(id)a3
{
  objc_storeStrong((id *)&self->_originLocation, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (void)setSessionMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionMetricManager, a3);
}

- (NSMutableDictionary)timerIdentifierToTimers
{
  return self->_timerIdentifierToTimers;
}

- (void)setTimerIdentifierToTimers:(id)a3
{
  objc_storeStrong((id *)&self->_timerIdentifierToTimers, a3);
}

- (unint64_t)triggerCategory
{
  return self->_triggerCategory;
}

- (void)setTriggerCategory:(unint64_t)a3
{
  self->_triggerCategory = a3;
}

- (NSMutableArray)cachedLocationEvents
{
  return self->_cachedLocationEvents;
}

- (void)setCachedLocationEvents:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocationEvents, a3);
}

- (SMSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
}

- (double)idleTimeoutThreshold
{
  return self->_idleTimeoutThreshold;
}

- (void)setIdleTimeoutThreshold:(double)a3
{
  self->_idleTimeoutThreshold = a3;
}

- (double)noProgressTimeoutThreshold
{
  return self->_noProgressTimeoutThreshold;
}

- (void)setNoProgressTimeoutThreshold:(double)a3
{
  self->_noProgressTimeoutThreshold = a3;
}

- (NSDate)coarseEta
{
  return self->_coarseEta;
}

- (void)setCoarseEta:(id)a3
{
  objc_storeStrong((id *)&self->_coarseEta, a3);
}

- (double)etaScaleFactor
{
  return self->_etaScaleFactor;
}

- (void)setEtaScaleFactor:(double)a3
{
  self->_etaScaleFactor = a3;
}

- (double)minDistanceUpdateThreshold
{
  return self->_minDistanceUpdateThreshold;
}

- (void)setMinDistanceUpdateThreshold:(double)a3
{
  self->_minDistanceUpdateThreshold = a3;
}

- (double)destinationStatusUpdateTimeInterval
{
  return self->_destinationStatusUpdateTimeInterval;
}

- (void)setDestinationStatusUpdateTimeInterval:(double)a3
{
  self->_destinationStatusUpdateTimeInterval = a3;
}

- (double)significantMoveThreshold
{
  return self->_significantMoveThreshold;
}

- (void)setSignificantMoveThreshold:(double)a3
{
  self->_significantMoveThreshold = a3;
}

- (double)idleMaxDistanceThreshold
{
  return self->_idleMaxDistanceThreshold;
}

- (void)setIdleMaxDistanceThreshold:(double)a3
{
  self->_idleMaxDistanceThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coarseEta, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_cachedLocationEvents, 0);
  objc_storeStrong((id *)&self->_timerIdentifierToTimers, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_originLocation, 0);
  objc_storeStrong((id *)&self->_triggerState, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end
