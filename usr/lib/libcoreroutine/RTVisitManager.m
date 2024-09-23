@implementation RTVisitManager

+ (id)vendedClasses
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)vendedClasses_vendedClasses_3;
  if (!vendedClasses_vendedClasses_3)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    v4 = (void *)vendedClasses_vendedClasses_3;
    vendedClasses_vendedClasses_3 = v3;

    v2 = (void *)vendedClasses_vendedClasses_3;
  }
  return v2;
}

- (RTVisitManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_deviceLocationPredictor_hintManager_learnedLocationManager_locationAwarenessManager_locationManager_metricManager_motionActivityManager_platform_pointOfInterestMonitor_visitLabeler_visitStore_xpcActivityManager_);
}

- (RTVisitManager)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 hintManager:(id)a5 learnedLocationManager:(id)a6 locationAwarenessManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 motionActivityManager:(id)a10 platform:(id)a11 pointOfInterestMonitor:(id)a12 visitLabeler:(id)a13 visitStore:(id)a14 xpcActivityManager:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  RTVisitManager *v30;
  RTVisitManager *v31;
  RTVisitManager *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  NSObject *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  uint8_t buf[16];

  v53 = a3;
  v40 = a4;
  v20 = a4;
  v47 = a5;
  v41 = a6;
  v46 = a6;
  v42 = a7;
  v45 = a7;
  v43 = a8;
  v44 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v52 = a12;
  v51 = a13;
  v50 = a14;
  v24 = a15;
  v48 = v24;
  if (!v53)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v32 = 0;
    v34 = 0;
    v25 = v20;
    v26 = v46;
    v27 = v47;
    v29 = v44;
    v28 = v45;
    goto LABEL_45;
  }
  v25 = v20;
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    v26 = v46;
    v27 = v47;
    v29 = v44;
    v28 = v45;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: deviceLocationPredictor";
LABEL_42:
    _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_43;
  }
  v26 = v46;
  v27 = v47;
  v29 = v44;
  v28 = v45;
  if (!v47)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: hintManager";
    goto LABEL_42;
  }
  if (!v46)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_42;
  }
  if (!v45)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: locationAwarenessManager";
    goto LABEL_42;
  }
  if (!v44)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_42;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_42;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_42;
  }
  if (!v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: platform";
    goto LABEL_42;
  }
  if (!v52)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: pointOfInterestMonitor";
    goto LABEL_42;
  }
  if (!v51)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    v36 = "Invalid parameter not satisfying: visitLabeler";
    goto LABEL_42;
  }
  if (!v50)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = "Invalid parameter not satisfying: visitStore";
      goto LABEL_42;
    }
LABEL_43:

    v32 = 0;
LABEL_44:
    v34 = v53;
    goto LABEL_45;
  }
  if (v24)
  {
    v54.receiver = self;
    v54.super_class = (Class)RTVisitManager;
    v30 = -[RTNotifier init](&v54, sel_init);
    v31 = v30;
    if (v30)
    {
      objc_storeStrong((id *)&v30->_defaultsManager, a3);
      objc_storeStrong((id *)&v31->_deviceLocationPredictor, v40);
      objc_storeStrong((id *)&v31->_hintManager, a5);
      objc_storeStrong((id *)&v31->_learnedLocationManager, v41);
      objc_storeStrong((id *)&v31->_locationAwarenessManager, v42);
      objc_storeStrong((id *)&v31->_locationManager, v43);
      objc_storeStrong((id *)&v31->_metricManager, a9);
      objc_storeStrong((id *)&v31->_motionActivityManager, a10);
      objc_storeStrong((id *)&v31->_platform, a11);
      objc_storeStrong((id *)&v31->_pointOfInterestMonitor, a12);
      objc_storeStrong((id *)&v31->_visitLabeler, a13);
      objc_storeStrong((id *)&v31->_visitStore, a14);
      objc_storeStrong((id *)&v31->_xpcActivityManager, a15);
      v31->_findingPointOfInterest = 0;
      v31->_pointOfInterestUpdateEnabled = 0;
      -[RTService setup](v31, "setup");
    }
    v32 = v31;
    self = v32;
    goto LABEL_44;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v38 = objc_claimAutoreleasedReturnValue();
  v34 = v53;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager", buf, 2u);
  }

  v32 = 0;
LABEL_45:

  return v32;
}

- (void)_setup
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  const char *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  int v18;
  _QWORD handler[5];
  id v20;
  int out_token;
  id location;

  -[RTVisitManager visitStore](self, "visitStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:", self, sel_onVisitStoreNotification_, v4);

  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("InstantPOIEvalMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    -[RTVisitManager pointOfInterestMonitor](self, "pointOfInterestMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTPointOfInterestMonitorVisitNotification, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:", self, sel_onPointOfInterestVisitNotification_, v8);

  }
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    objc_initWeak(&location, self);
    out_token = 0;
    v9 = (const char *)objc_msgSend(CFSTR("SpoofVisit"), "UTF8String");
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __24__RTVisitManager__setup__block_invoke;
    handler[3] = &unk_1E92A20F0;
    handler[4] = self;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v9, &out_token, v10, handler);

    v12 = (void *)objc_opt_new();
    -[RTVisitManager setSpoofVisitIncidentTokens:](self, "setSpoofVisitIncidentTokens:", v12);

    v18 = 0;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __24__RTVisitManager__setup__block_invoke_66;
    v16[3] = &unk_1E9298AA8;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232094](v16);
    v14 = (const char *)objc_msgSend(CFSTR("SpoofVisitIncidentsUpdate"), "UTF8String");
    -[RTNotifier queue](self, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v14, &v18, v15, v13);

    v13[2](v13, 0xFFFFFFFFLL);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __24__RTVisitManager__setup__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id WeakRetained;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", CFSTR("SpoofVisit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v6 = 138412546;
    v7 = CFSTR("SpoofVisit");
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "default, %@, %@", (uint8_t *)&v6, 0x16u);
  }

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18578]), "initWithDefaultsDictionanry:", v2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "onVisitIncident:error:", v4, 0);

}

void __24__RTVisitManager__setup__block_invoke_66(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", CFSTR("SpoofVisitIncidentsOn"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "BOOLValue");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSpoofMode:", v2);

}

- (void)_onVisitStoreNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6 && objc_msgSend(v7, "availability") == 2)
    -[RTVisitManager _setupVisitMonitorWithHandler:](self, "_setupVisitMonitorWithHandler:", &__block_literal_global_86);

}

void __44__RTVisitManager__onVisitStoreNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "setup visit monitor, error, %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)onVisitStoreNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__RTVisitManager_onVisitStoreNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __43__RTVisitManager_onVisitStoreNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVisitStoreNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onPointOfInterestVisitNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  RTVisitManagerVisitIncidentNotification *v10;
  void *v11;
  RTVisitManagerVisitIncidentNotification *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPointOfInterestMonitorVisitNotification, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  v7 = v13;
  if (v6)
  {
    v8 = v13;
    objc_msgSend(v8, "visit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [RTVisitManagerVisitIncidentNotification alloc];
      objc_msgSend(v8, "visit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[RTVisitManagerVisitIncidentNotification initWithVisitIncident:](v10, "initWithVisitIncident:", v11);

      -[RTNotifier postNotification:](self, "postNotification:", v12);
    }

    v7 = v13;
  }

}

- (void)onPointOfInterestVisitNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__RTVisitManager_onPointOfInterestVisitNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__RTVisitManager_onPointOfInterestVisitNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onPointOfInterestVisitNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_setupVisitMonitorWithHandler:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;

  v20 = a3;
  v4 = dispatch_group_create();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__110;
  v43[4] = __Block_byref_object_dispose__110;
  v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__110;
  v41[4] = __Block_byref_object_dispose__110;
  v42 = 0;
  dispatch_group_enter(v4);
  -[RTVisitManager visitStore](self, "visitStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D18508]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, v7, 0, 0, &unk_1E9328BE0);
  v9 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke;
  v37[3] = &unk_1E9296EE0;
  v39 = v43;
  v40 = v41;
  v10 = v4;
  v38 = v10;
  objc_msgSend(v5, "fetchVisitsWithOptions:handler:", v8, v37);

  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__110;
  v35[4] = __Block_byref_object_dispose__110;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__110;
  v33[4] = __Block_byref_object_dispose__110;
  v34 = 0;
  dispatch_group_enter(v10);
  -[RTVisitManager visitStore](self, "visitStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D18508]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, v13, 0, 0, &unk_1E9328BE0);
  v29[0] = v9;
  v29[1] = 3221225472;
  v29[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_2;
  v29[3] = &unk_1E9296EE0;
  v31 = v35;
  v32 = v33;
  v15 = v10;
  v30 = v15;
  objc_msgSend(v11, "fetchVisitsWithOptions:handler:", v14, v29);

  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    dispatch_group_enter(v15);
    -[RTVisitManager visitMonitor](self, "visitMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_3;
    v27[3] = &unk_1E9297150;
    v28 = v15;
    objc_msgSend(v17, "shutdownWithHandler:", v27);

  }
  -[RTNotifier queue](self, "queue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_4;
  block[3] = &unk_1E92A2138;
  v23 = v43;
  v24 = v35;
  block[4] = self;
  v22 = v20;
  v25 = v41;
  v26 = v33;
  v19 = v20;
  dispatch_group_notify(v15, v18, block);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __48__RTVisitManager__setupVisitMonitorWithHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RTVisitMonitor *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  RTVisitMonitor *v25;
  void *v26;
  void *v27;
  RTVisitMonitorState *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v28 = -[RTVisitMonitorState initWithLastVisit:lastLowConfidenceVisit:]([RTVisitMonitorState alloc], "initWithLastVisit:lastLowConfidenceVisit:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v25 = [RTVisitMonitor alloc];
  objc_msgSend(*(id *)(a1 + 32), "defaultsManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceLocationPredictor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hintManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "learnedLocationManager");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "locationAwarenessManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "metricManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "motionActivityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visitLabeler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v2;
  v11 = -[RTVisitMonitor initWithDefaultsManager:deviceLocationPredictor:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:queue:state:visitLabeler:](v25, "initWithDefaultsManager:deviceLocationPredictor:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:queue:state:visitLabeler:", v27, v26, v24, v2, v3, v4, v5, v6, v7, v8, v28, v9);
  objc_msgSend(*(id *)(a1 + 32), "setVisitMonitor:", v11);

  objc_msgSend(*(id *)(a1 + 32), "visitMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "visitMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v13);

    objc_msgSend(*(id *)(a1 + 32), "_updateStateForVisitIncidents");
    objc_msgSend(*(id *)(a1 + 32), "_updateStateForLeechedVisitIncidents");
    objc_msgSend(*(id *)(a1 + 32), "_updateStateForLowConfidenceVisitIncidents");
    v15 = *(void **)(a1 + 32);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v15, "postNotification:", v16);

    v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v29 = *MEMORY[0x1E0CB2D50];
    v30[0] = CFSTR("failed to setup visit monitor.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 5, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = *(_QWORD *)(a1 + 40);
  _RTSafeArray();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v23);

}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shutdownWithHandler:", 0);

  -[RTVisitManager visitStore](self, "visitStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    v7 = v8;
  }

}

- (void)_updateStateForVisitIncidents
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3);

  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "startMonitoringVisitIncidents");
  else
    objc_msgSend(v5, "stopMonitoringVisitIncidents");

}

- (void)_updateStateForLeechedVisitIncidents
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3);

  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "startMonitoringLeechedVisitIncidents");
  else
    objc_msgSend(v5, "stopMonitoringLeechedVisitIncidents");

}

- (void)_updateStateForLowConfidenceVisitIncidents
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;

  +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v3);

  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "startMonitoringLowConfidenceVisitIncidents");
  else
    objc_msgSend(v5, "stopMonitoringLowConfidenceVisitIncidents");

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[RTVisitManager _updateStateForVisitIncidents](self, "_updateStateForVisitIncidents");
  }
  else
  {
    +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isEqualToString:", v10);

    if (v11)
    {
      -[RTVisitManager _updateStateForLeechedVisitIncidents](self, "_updateStateForLeechedVisitIncidents");
    }
    else
    {
      +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "isEqualToString:", v12);

      if (v13)
      {
        -[RTVisitManager _updateStateForLowConfidenceVisitIncidents](self, "_updateStateForLowConfidenceVisitIncidents");
      }
      else
      {
        +[RTNotification notificationName](RTVisitManagerAvailableNotification, "notificationName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "isEqualToString:", v14);

        if (v15)
        {
          -[RTVisitManager visitMonitor](self, "visitMonitor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = (void *)objc_opt_new();
            -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v17, v6);

          }
        }
        else
        {
          +[RTNotification notificationName](RTVisitManagerPointOfInterestUpdateNotification, "notificationName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v7, "isEqualToString:", v18);

          if (v19)
          {
            -[RTVisitManager setPointOfInterestUpdateEnabled:](self, "setPointOfInterestUpdateEnabled:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v7) != 0);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = 138412290;
              v22 = v7;
              _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v21, 0xCu);
            }

          }
        }
      }
    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTVisitManager _updateStateForVisitIncidents](self, "_updateStateForVisitIncidents");
  }
  else
  {
    +[RTNotification notificationName](RTVisitManagerLeechedVisitIncidentNotification, "notificationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if (v9)
    {
      -[RTVisitManager _updateStateForLeechedVisitIncidents](self, "_updateStateForLeechedVisitIncidents");
    }
    else
    {
      +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "isEqualToString:", v10);

      if (v11)
      {
        -[RTVisitManager _updateStateForLowConfidenceVisitIncidents](self, "_updateStateForLowConfidenceVisitIncidents");
      }
      else
      {
        +[RTNotification notificationName](RTVisitManagerAvailableNotification, "notificationName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "isEqualToString:", v12);

        if ((v13 & 1) == 0)
        {
          +[RTNotification notificationName](RTVisitManagerPointOfInterestUpdateNotification, "notificationName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v5, "isEqualToString:", v14);

          if (v15)
          {
            -[RTVisitManager setPointOfInterestUpdateEnabled:](self, "setPointOfInterestUpdateEnabled:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) != 0);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = 138412290;
              v18 = v5;
              _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v17, 0xCu);
            }

          }
        }
      }
    }
  }

}

- (void)_fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  RTVisitMonitor *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  RTVisitMonitor *v23;
  id v24;
  RTVisitMonitorState *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  RTVisitMonitor *v33;
  RTVisitMonitor *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  RTVisitMonitor *v39;
  void (**v40)(id, _QWORD, void *);
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[RTVisitManager _fetchVisitsFromDate:toDate:handler:]";
      v47 = 1024;
      v48 = 498;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
    }

    if (v10)
      goto LABEL_4;
    goto LABEL_14;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[RTVisitManager _fetchVisitsFromDate:toDate:handler:]";
    v47 = 1024;
    v48 = 497;
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
    goto LABEL_11;
LABEL_3:
  if (v10)
  {
LABEL_4:
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "compare:", v9) == 1)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0D18598];
        v41 = *MEMORY[0x1E0CB2D50];
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "stringFromDate");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringFromDate");
        v15 = (RTVisitMonitor *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("fromDate, %@, postdates toDate, %@"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v10[2](v10, 0, v18);

      }
      else
      {
        v23 = [RTVisitMonitor alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v23);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = dispatch_queue_create((const char *)objc_msgSend(v24, "UTF8String"), 0);

        v34 = v23;
        -[RTVisitManager defaultsManager](self, "defaultsManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager deviceLocationPredictor](self, "deviceLocationPredictor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager hintManager](self, "hintManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager learnedLocationManager](self, "learnedLocationManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager locationAwarenessManager](self, "locationAwarenessManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager locationManager](self, "locationManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager metricManager](self, "metricManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager motionActivityManager](self, "motionActivityManager");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitManager platform](self, "platform");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[RTVisitMonitorState initWithLastVisit:lastLowConfidenceVisit:]([RTVisitMonitorState alloc], "initWithLastVisit:lastLowConfidenceVisit:", 0, 0);
        -[RTVisitManager visitLabeler](self, "visitLabeler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[RTVisitMonitor initWithDefaultsManager:deviceLocationPredictor:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:queue:state:visitLabeler:](v34, "initWithDefaultsManager:deviceLocationPredictor:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:queue:state:visitLabeler:", v37, v36, v35, v32, v31, v30, v29, v28, v27, v14, v25, v26);

        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __54__RTVisitManager__fetchVisitsFromDate_toDate_handler___block_invoke;
        v38[3] = &unk_1E9296F98;
        v39 = v33;
        v40 = v10;
        v15 = v33;
        -[RTVisitMonitor fetchVisitsFromDate:toDate:handler:](v15, "fetchVisitsFromDate:toDate:handler:", v8, v9, v38);

      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D18598];
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("requires valid dates.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 7, v14);
      v15 = (RTVisitMonitor *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v15);
    }

    goto LABEL_19;
  }
LABEL_14:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[RTVisitManager _fetchVisitsFromDate:toDate:handler:]";
    v47 = 1024;
    v48 = 499;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
  }
LABEL_19:

}

uint64_t __54__RTVisitManager__fetchVisitsFromDate_toDate_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "shutdownWithHandler:", 0);
}

- (void)fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__RTVisitManager_fetchVisitsFromDate_toDate_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __53__RTVisitManager_fetchVisitsFromDate_toDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchVisitsFromDate:toDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)fetchStoredVisitsWithOptions:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
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
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  _RTMap *v33;
  _RTMap *v34;
  id v35;
  void *v36;
  NSObject *dsema;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  NSObject *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  _BYTE v61[128];
  uint64_t v62;
  uint8_t buf[16];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v56 = (id *)&v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__110;
  v59 = __Block_byref_object_dispose__110;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__110;
  v53 = __Block_byref_object_dispose__110;
  v54 = 0;
  v2 = dispatch_semaphore_create(0);
  v38 = a1;
  objc_msgSend(*(id *)(a1 + 32), "visitStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(v38 + 40);
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke_2;
  v44[3] = &unk_1E92995B0;
  v45 = v4;
  v47 = &v49;
  v48 = &v55;
  v5 = v2;
  v46 = v5;
  objc_msgSend(v3, "fetchVisitsWithOptions:handler:", v45, v44);

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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_342);
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
  v62 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v62, 1);
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

  v35 = v20;
  if ((v21 & 1) == 0)
    objc_storeStrong(v56 + 5, v20);
  if (v56[5])
    (*(void (**)(_QWORD))(*(_QWORD *)(v38 + 48) + 16))(*(_QWORD *)(v38 + 48));
  if ((objc_msgSend(*(id *)(v38 + 40), "labelVisit", v35) & 1) == 0)
  {
    v33 = [_RTMap alloc];
    v34 = -[_RTMap initWithInput:](v33, "initWithInput:", v50[5]);
    -[_RTMap withBlock:](v34, "withBlock:", &__block_literal_global_96);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(v38 + 48) + 16))();
    goto LABEL_26;
  }
  v22 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = (id)v50[5];
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
  if (!v24)
    goto LABEL_24;
  v25 = *(_QWORD *)v41;
  v26 = *MEMORY[0x1E0D185D0];
  do
  {
    for (i = 0; i != v24; ++i)
    {
      if (*(_QWORD *)v41 != v25)
        objc_enumerationMutation(v23);
      v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      if (objc_msgSend(v28, "source") == 1)
      {
        objc_msgSend(v28, "placeInference");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          objc_msgSend(v28, "confidence");
          if (v30 <= v26)
            goto LABEL_22;
          objc_msgSend(*(id *)(v38 + 32), "visitLabeler");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "bundleIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v29, "labelVisit:clientIdentifier:error:", v28, v32, &v39);

        }
      }
LABEL_22:
      objc_msgSend(v22, "addObject:", v28);
    }
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v61, 16);
  }
  while (v24);
LABEL_24:

  (*(void (**)(void))(*(_QWORD *)(v38 + 48) + 16))();
LABEL_26:

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

}

void __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend(v5, "count");
    objc_msgSend(v5, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "fetched %ld visits from detection date, %@, to, %@, options, %@", buf, 0x2Au);

  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v5;
  v17 = v5;

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v6;
  v20 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id __55__RTVisitManager_fetchStoredVisitsWithOptions_handler___block_invoke_94(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;

  v2 = (objc_class *)MEMORY[0x1E0D18578];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "dataPointCount");
  objc_msgSend(v3, "confidence");
  v12 = v11;
  v13 = objc_msgSend(v3, "source");

  v14 = (void *)objc_msgSend(v4, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:", v5, v6, v7, v8, v9, v10, v12, 0, v13);
  return v14;
}

- (void)setFindingPointOfInterest:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_findingPointOfInterest != a3)
  {
    v3 = a3;
    _rt_log_facility_get_os_log(RTLogFacilityMetric);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("YES");
      if (self->_findingPointOfInterest)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = 138412802;
      v12 = v7;
      v14 = v10;
      v13 = 2112;
      if (!v3)
        v9 = CFSTR("NO");
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, findingPointOfInterest transitioned from, %@, to, %@", (uint8_t *)&v11, 0x20u);

    }
    self->_findingPointOfInterest = v3;
    if (v3)
      -[RTVisitManager _registerXpcActivityFindPointOfInterest](self, "_registerXpcActivityFindPointOfInterest");
    else
      -[RTVisitManager _unregisterXpcActivityFindPointOfInterest](self, "_unregisterXpcActivityFindPointOfInterest");
  }
}

- (void)_registerXpcActivityFindPointOfInterest
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  RTXPCActivityCriteria *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[6];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitManager lastHighConfidenceVisit](self, "lastHighConfidenceVisit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  v8 = 900.0 - v7;

  if (v8 < 1.0)
    v8 = 1.0;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v10;
    v17 = 2048;
    v18 = v8;
    v19 = 2048;
    v20 = 0x404E000000000000;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, delay, %.1f, grace period, %.1f", buf, 0x20u);

  }
  LOBYTE(v13) = 1;
  v11 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", 1, 1, 0, 1024, 102400, 1, 9.22337204e18, 60.0, v8, v13, 0);
  -[RTVisitManager xpcActivityManager](self, "xpcActivityManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke;
  v14[3] = &unk_1E929BB80;
  v14[4] = self;
  v14[5] = a2;
  objc_msgSend(v12, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.visitManager.findPointOfInterest"), v11, v14);

}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2;
  v3[3] = &unk_1E9297BF0;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_async(v2, v3);

}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastHighConfidenceVisit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, finding POI for visit, %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "visitLabeler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastHighConfidenceVisit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_104;
  v7[3] = &unk_1E92A21A0;
  v8 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v5, "findPointOfInterestForVisit:clientIdentifier:handler:", v6, CFSTR("com.apple.CoreRoutine.visitManager"), v7);

}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_104(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2_105;
  v10[3] = &unk_1E9298238;
  v11 = v5;
  v12 = v6;
  v13 = *(_OWORD *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __57__RTVisitManager__registerXpcActivityFindPointOfInterest__block_invoke_2_105(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  RTVisitManagerPointOfInterestUpdateNotification *v28;
  void *v29;
  RTVisitManagerPointOfInterestUpdateNotification *v30;
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "lastHighConfidenceVisit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(a1 + 48), "pointOfInterestUpdateEnabled");
    *(_DWORD *)buf = 138413314;
    v8 = CFSTR("NO");
    v35 = v3;
    v36 = 2112;
    if (v7)
      v8 = CFSTR("YES");
    v37 = v4;
    v38 = 2112;
    v39 = v5;
    v40 = 2112;
    v41 = v6;
    v42 = 2112;
    v43 = v8;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, updated visit, %@, error, %@, before update, %@, pointOfInterestUpdateEnabled, %@", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 48), "_unregisterXpcActivityFindPointOfInterest");
  objc_msgSend(*(id *)(a1 + 48), "defaultsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("VisitManagerPreviousPOIVisitDates"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v13, v10, &v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v33;
  objc_msgSend(*(id *)(a1 + 48), "defaultsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("VisitManagerQueryingBluePOIMaxDailyVisitCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 48), "defaultsManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("VisitManagerQueryingBluePOIMaxDailyVisitCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

  }
  else
  {
    v20 = 2;
  }
  if (objc_msgSend(v14, "count") > v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v31;
      _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "%@, exceed BluePOI query budget!", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v22);

  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v32;
  if (!v24)
  {
    objc_msgSend(*(id *)(a1 + 48), "defaultsManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v23, CFSTR("VisitManagerPreviousPOIVisitDates"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "pointOfInterestUpdateEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "placeInference");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mapItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = [RTVisitManagerPointOfInterestUpdateNotification alloc];
      objc_msgSend(*(id *)(a1 + 32), "placeInference");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[RTVisitManagerPointOfInterestUpdateNotification initWithPlaceInference:](v28, "initWithPlaceInference:", v29);

      objc_msgSend(*(id *)(a1 + 48), "postNotification:", v30);
    }
  }

}

- (void)_unregisterXpcActivityFindPointOfInterest
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
  v36 = __Block_byref_object_copy__110;
  v37 = __Block_byref_object_dispose__110;
  v38 = 0;
  v4 = dispatch_semaphore_create(0);
  -[RTVisitManager xpcActivityManager](self, "xpcActivityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __59__RTVisitManager__unregisterXpcActivityFindPointOfInterest__block_invoke;
  v30 = &unk_1E9297038;
  v32 = &v33;
  v6 = v4;
  v31 = v6;
  objc_msgSend(v5, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.visitManager.findPointOfInterest"), &v27);

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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_342);
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

void __59__RTVisitManager__unregisterXpcActivityFindPointOfInterest__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)shouldFindPointOfInterestForVisit:(id)a3
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
  SEL v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (_os_feature_enabled_impl()
    && (objc_msgSend(v5, "confidence"), v7 == *MEMORY[0x1E0D185C8])
    && objc_msgSend(v5, "type") == 1
    && (objc_msgSend(v5, "placeInference"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "mapItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    -[RTVisitManager defaultsManager](self, "defaultsManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("VisitManagerPreviousPOIVisitDates"));
    v17 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v36 = (void *)v17;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v20, v17, &v42);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v42;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __52__RTVisitManager_shouldFindPointOfInterestForVisit___block_invoke;
    v38[3] = &unk_1E92A21C8;
    v35 = v23;
    v39 = v35;
    v41 = a2;
    v24 = v6;
    v40 = v24;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v38);
    -[RTVisitManager defaultsManager](self, "defaultsManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", CFSTR("VisitManagerQueryingBluePOIMaxDailyVisitCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[RTVisitManager defaultsManager](self, "defaultsManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKey:", CFSTR("VisitManagerQueryingBluePOIMaxDailyVisitCount"));
      v34 = v22;
      v28 = v21;
      v29 = v20;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntegerValue");

      v20 = v29;
      v21 = v28;
      v22 = v34;

    }
    else
    {
      v31 = 2;
    }
    v10 = objc_msgSend(v24, "count") < v31;
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, &v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      -[RTVisitManager defaultsManager](self, "defaultsManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKey:", v32, CFSTR("VisitManagerPreviousPOIVisitDates"));

    }
  }
  else
  {
    v10 = 0;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v14 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 138413058;
    v44 = v12;
    v45 = 2112;
    v46 = v13;
    v47 = 2048;
    v48 = v14;
    v49 = 2112;
    v50 = v5;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, result, %@, filtered date count, %lu, visit, %@", buf, 0x2Au);

  }
  return v10;
}

void __52__RTVisitManager_shouldFindPointOfInterestForVisit___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(v5, "isAfterDate:", *(_QWORD *)(a1 + 32)))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v7;
      v10 = 2048;
      v11 = a3;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, idx, %lu, date, %@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

- (void)_onVisitIncident:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  RTVisitManagerVisitIncidentNotification *v12;
  void *v13;
  BOOL v14;
  RTVisitManagerLeechedVisitIncidentNotification *v15;
  void *v16;
  id v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  SEL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v19;
      v28 = 2112;
      v29 = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }
  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "monitoringVisitIncidents") & 1) != 0)
  {

  }
  else
  {
    v11 = -[RTVisitManager spoofMode](self, "spoofMode");

    if (!v11)
      goto LABEL_9;
  }
  v12 = -[RTVisitManagerVisitIncidentNotification initWithVisitIncident:]([RTVisitManagerVisitIncidentNotification alloc], "initWithVisitIncident:", v7);
  -[RTNotifier postNotification:](self, "postNotification:", v12);

LABEL_9:
  -[RTVisitManager visitMonitor](self, "visitMonitor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "monitoringLeechedVisitIncidents") & 1) != 0)
  {

  }
  else
  {
    v14 = -[RTVisitManager spoofMode](self, "spoofMode");

    if (!v14)
      goto LABEL_13;
  }
  v15 = -[RTVisitManagerLeechedVisitIncidentNotification initWithVisitIncident:]([RTVisitManagerLeechedVisitIncidentNotification alloc], "initWithVisitIncident:", v7);
  -[RTNotifier postNotification:](self, "postNotification:", v15);

LABEL_13:
  -[RTVisitManager visitStore](self, "visitStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __41__RTVisitManager__onVisitIncident_error___block_invoke;
  v23 = &unk_1E9297628;
  v25 = a2;
  v17 = v7;
  v24 = v17;
  objc_msgSend(v16, "storeVisit:handler:", v17, &v20);

  if (-[RTVisitManager shouldFindPointOfInterestForVisit:](self, "shouldFindPointOfInterestForVisit:", v17, v20, v21, v22, v23))
  {
    -[RTVisitManager setLastHighConfidenceVisit:](self, "setLastHighConfidenceVisit:", v17);
    -[RTVisitManager setFindingPointOfInterest:](self, "setFindingPointOfInterest:", 1);
  }
  if (objc_msgSend(v17, "type") == 3)
  {
    objc_msgSend(v17, "confidence");
    if (v18 == *MEMORY[0x1E0D185C8])
      -[RTVisitManager setFindingPointOfInterest:](self, "setFindingPointOfInterest:", 0);
  }

}

void __41__RTVisitManager__onVisitIncident_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (void)onVisitIncident:(id)a3 error:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__RTVisitManager_onVisitIncident_error___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __40__RTVisitManager_onVisitIncident_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "spoofMode");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_onVisitIncident:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)_onLowConfidenceVisitIncident:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  RTVisitManagerLowConfidenceVisitIncidentNotification *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  SEL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }
  v10 = -[RTVisitManagerLowConfidenceVisitIncidentNotification initWithVisitIncident:]([RTVisitManagerLowConfidenceVisitIncidentNotification alloc], "initWithVisitIncident:", v7);
  -[RTNotifier postNotification:](self, "postNotification:", v10);
  -[RTVisitManager visitStore](self, "visitStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__RTVisitManager__onLowConfidenceVisitIncident_error___block_invoke;
  v14[3] = &unk_1E9297628;
  v15 = v7;
  v16 = a2;
  v12 = v7;
  objc_msgSend(v11, "storeVisit:handler:", v12, v14);

}

void __54__RTVisitManager__onLowConfidenceVisitIncident_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

- (void)onLowConfidenceVisitIncident:(id)a3 error:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTVisitManager_onLowConfidenceVisitIncident_error___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __53__RTVisitManager_onLowConfidenceVisitIncident_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "spoofMode");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_onLowConfidenceVisitIncident:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)_performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if ((unint64_t)a3 > 1)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }
  else
  {
    -[RTVisitManager visitStore](self, "visitStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__RTVisitManager__performPurgeOfType_referenceDate_completion___block_invoke;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    objc_msgSend(v11, "purgeVisitsPredating:handler:", v8, v12);

  }
}

uint64_t __63__RTVisitManager__performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__RTVisitManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __62__RTVisitManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPurgeOfType:referenceDate:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setSpoofMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const __CFString *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if (self->_spoofMode == a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("OFF");
      if (v3)
        v5 = CFSTR("ON");
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Spoof mode remains %@.", buf, 0xCu);
    }
  }
  else
  {
    self->_spoofMode = a3;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Start spoof mode.", buf, 2u);
      }

      -[RTVisitManager spoofVisitIncidentTokens](self, "spoofVisitIncidentTokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitManager registerForSpoofVisitIncidentOfCategory:](self, "registerForSpoofVisitIncidentOfCategory:", CFSTR("SpoofVisitIncident"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      -[RTVisitManager spoofVisitIncidentTokens](self, "spoofVisitIncidentTokens");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTVisitManager registerForSpoofVisitIncidentOfCategory:](self, "registerForSpoofVisitIncidentOfCategory:", CFSTR("SpoofLeechedVisitIncident"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

      -[RTVisitManager spoofVisitIncidentTokens](self, "spoofVisitIncidentTokens");
      v4 = objc_claimAutoreleasedReturnValue();
      -[RTVisitManager registerForSpoofVisitIncidentOfCategory:](self, "registerForSpoofVisitIncidentOfCategory:", CFSTR("SpoofLowConfidenceVisitIncident"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v4, "addObject:", v13);

    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Stop spoof.", buf, 2u);
      }

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[RTVisitManager spoofVisitIncidentTokens](self, "spoofVisitIncidentTokens", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v20;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v20 != v17)
              objc_enumerationMutation(v14);
            -[RTVisitManager unregisterForSpoofVisitIncidentWithToken:](self, "unregisterForSpoofVisitIncidentWithToken:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "intValue"));
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v16);
      }

      -[RTVisitManager spoofVisitIncidentTokens](self, "spoofVisitIncidentTokens");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeAllObjects](v4, "removeAllObjects");
    }
  }

}

- (id)registerForSpoofVisitIncidentOfCategory:(id)a3
{
  id v4;
  id v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  int out_token;
  _QWORD v12[5];
  id v13;
  id v14;
  id location;

  v4 = a3;
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__RTVisitManager_registerForSpoofVisitIncidentOfCategory___block_invoke;
    v12[3] = &unk_1E92A21F0;
    objc_copyWeak(&v14, &location);
    v12[4] = self;
    v5 = v4;
    v13 = v5;
    v6 = (void *)MEMORY[0x1D8232094](v12);
    out_token = 0;
    v7 = (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    notify_register_dispatch(v7, &out_token, v8, v6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __58__RTVisitManager_registerForSpoofVisitIncidentOfCategory___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18578]), "initWithDefaultsDictionanry:", v3);
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 40);
        v8 = 138412546;
        v9 = v6;
        v10 = 2112;
        v11 = v4;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Read %@ from defaults, visitIncident, %@", (uint8_t *)&v8, 0x16u);
      }

      if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("SpoofVisitIncident")) & 1) != 0
        || objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("SpoofLeechedVisitIncident")))
      {
        objc_msgSend(WeakRetained, "_onVisitIncident:error:", v4, 0);
      }
      else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("SpoofLowConfidenceVisitIncident")))
      {
        objc_msgSend(WeakRetained, "_onLowConfidenceVisitIncident:error:", v4, 0);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Cannot find %@ in defaults", (uint8_t *)&v8, 0xCu);
      }
    }

  }
}

- (void)unregisterForSpoofVisitIncidentWithToken:(int)a3
{
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
    notify_cancel(a3);
}

- (void)_simulateVisit:(id)a3 handler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  RTVisitManagerVisitIncidentNotification *v13;
  RTVisitManagerLeechedVisitIncidentNotification *v14;
  RTVisitManagerLowConfidenceVisitIncidentNotification *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  id v23;
  dispatch_semaphore_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_time_t v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  NSObject *v51;
  __int128 *p_buf;
  _QWORD v53[4];
  id v54;
  SEL v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE v66[128];
  _QWORD v67[3];
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  uint8_t v71[16];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, uint64_t))a4;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "simulate visit, %@", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
  {
    -[RTVisitManager visitLabeler](self, "visitLabeler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v10, "labelVisit:clientIdentifier:error:", v7, v12, &v60);
    v49 = v60;

    v13 = -[RTVisitManagerVisitIncidentNotification initWithVisitIncident:]([RTVisitManagerVisitIncidentNotification alloc], "initWithVisitIncident:", v7);
    v67[0] = v13;
    v14 = -[RTVisitManagerLeechedVisitIncidentNotification initWithVisitIncident:]([RTVisitManagerLeechedVisitIncidentNotification alloc], "initWithVisitIncident:", v7);
    v67[1] = v14;
    v15 = -[RTVisitManagerLowConfidenceVisitIncidentNotification initWithVisitIncident:]([RTVisitManagerLowConfidenceVisitIncidentNotification alloc], "initWithVisitIncident:", v7);
    v67[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v57 != v19)
            objc_enumerationMutation(v17);
          -[RTNotifier postNotification:](self, "postNotification:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i));
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v18);
    }

    if (self->_spoofMode)
    {
      -[RTVisitManager visitStore](self, "visitStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __41__RTVisitManager__simulateVisit_handler___block_invoke;
      v53[3] = &unk_1E9297628;
      v55 = a2;
      v23 = v7;
      v54 = v23;
      objc_msgSend(v21, "storeVisit:handler:", v23, v53);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v62 = 0x3032000000;
      v63 = __Block_byref_object_copy__110;
      v64 = __Block_byref_object_dispose__110;
      v65 = 0;
      v24 = dispatch_semaphore_create(0);
      -[RTVisitManager visitStore](self, "visitStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_alloc(MEMORY[0x1E0D18508]);
      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "confidence");
      objc_msgSend(v27, "numberWithDouble:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v26, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, v28, 0, 0, &unk_1E9328BE0);
      v50[0] = v22;
      v50[1] = 3221225472;
      v50[2] = __41__RTVisitManager__simulateVisit_handler___block_invoke_131;
      v50[3] = &unk_1E9297010;
      p_buf = &buf;
      v30 = v24;
      v51 = v30;
      objc_msgSend(v25, "fetchVisitsWithOptions:handler:", v29, v50);

      v31 = v30;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v31, v32))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "timeIntervalSinceDate:", v48);
        v34 = v33;
        v46 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_342);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "filteredArrayUsingPredicate:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "submitToCoreAnalytics:type:duration:", v38, 1, v34);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v71 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v71, 2u);
        }

        v40 = (void *)MEMORY[0x1E0CB35C8];
        v70 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)v71 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[RTVisitManager visitMonitor](self, "visitMonitor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "compareVisit:previousVisit:", v23, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));

      _Block_object_dispose(&buf, 8);
    }
    if (!v8)
      goto LABEL_22;
    v44 = 0;
LABEL_21:
    v8[2](v8, v44);
LABEL_22:

    goto LABEL_23;
  }
  if (v8)
  {
    v45 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *MEMORY[0x1E0CB2D50];
    v69 = CFSTR("requires a valid visit.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v49);
    v44 = objc_claimAutoreleasedReturnValue();
    v17 = (id)v44;
    goto LABEL_21;
  }
LABEL_23:

}

void __41__RTVisitManager__simulateVisit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v7, 0x20u);

    }
  }

}

intptr_t __41__RTVisitManager__simulateVisit_handler___block_invoke_131(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)simulateVisit:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__RTVisitManager_simulateVisit_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __40__RTVisitManager_simulateVisit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_simulateVisit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_injectRealtimeVisit:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SEL v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "inject visit, %@", buf, 0xCu);
  }

  if (v7)
  {
    -[RTVisitManager visitStore](self, "visitStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __47__RTVisitManager__injectRealtimeVisit_handler___block_invoke;
    v15[3] = &unk_1E9298100;
    v18 = a2;
    v16 = v7;
    v17 = v8;
    objc_msgSend(v10, "storeVisit:handler:", v16, v15);

    v11 = v16;
LABEL_7:

    goto LABEL_8;
  }
  if (v8)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D18598];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("requires a valid visit.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 7, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v14);

    goto LABEL_7;
  }
LABEL_8:

}

void __47__RTVisitManager__injectRealtimeVisit_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412802;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, visit, %@, error, %@", (uint8_t *)&v8, 0x20u);

    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (void)injectRealtimeVisit:(id)a3 handler:(id)a4
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
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTVisitManager_injectRealtimeVisit_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __46__RTVisitManager_injectRealtimeVisit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_injectRealtimeVisit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  RTVisitManager *v14;
  id v15;
  unint64_t v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__RTVisitManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E92994E0;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v16 = a4;
    dispatch_async(v10, v12);

    v11 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __67__RTVisitManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "enumeratedType");
    objc_msgSend((id)objc_opt_class(), "vendedClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "member:", v3);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "visitStore");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchEnumerableObjectsWithOptions:offset:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

      return;
    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = CFSTR("the type specified by options is not vended by this manager");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v15;
    v10 = &v14;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("options cannot be nil");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (const __CFString **)v17;
    v10 = &v16;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocationPredictor, a3);
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
  objc_storeStrong((id *)&self->_hintManager, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationAwarenessManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTPointOfInterestMonitor)pointOfInterestMonitor
{
  return self->_pointOfInterestMonitor;
}

- (void)setPointOfInterestMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pointOfInterestMonitor, a3);
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (void)setVisitStore:(id)a3
{
  objc_storeStrong((id *)&self->_visitStore, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (BOOL)spoofMode
{
  return self->_spoofMode;
}

- (NSMutableArray)spoofVisitIncidentTokens
{
  return self->_spoofVisitIncidentTokens;
}

- (void)setSpoofVisitIncidentTokens:(id)a3
{
  objc_storeStrong((id *)&self->_spoofVisitIncidentTokens, a3);
}

- (RTVisitMonitor)visitMonitor
{
  return self->_visitMonitor;
}

- (void)setVisitMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_visitMonitor, a3);
}

- (RTVisitLabeler)visitLabeler
{
  return self->_visitLabeler;
}

- (RTVisit)lastHighConfidenceVisit
{
  return self->_lastHighConfidenceVisit;
}

- (void)setLastHighConfidenceVisit:(id)a3
{
  objc_storeStrong((id *)&self->_lastHighConfidenceVisit, a3);
}

- (BOOL)findingPointOfInterest
{
  return self->_findingPointOfInterest;
}

- (BOOL)pointOfInterestUpdateEnabled
{
  return self->_pointOfInterestUpdateEnabled;
}

- (void)setPointOfInterestUpdateEnabled:(BOOL)a3
{
  self->_pointOfInterestUpdateEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastHighConfidenceVisit, 0);
  objc_storeStrong((id *)&self->_visitLabeler, 0);
  objc_storeStrong((id *)&self->_visitMonitor, 0);
  objc_storeStrong((id *)&self->_spoofVisitIncidentTokens, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_pointOfInterestMonitor, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
