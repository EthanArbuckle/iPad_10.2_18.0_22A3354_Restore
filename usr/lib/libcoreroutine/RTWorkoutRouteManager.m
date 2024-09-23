@implementation RTWorkoutRouteManager

+ (id)curveOrientationTypeToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("curveOrientationUnknown");
  if (a3 == 1)
    v3 = CFSTR("curveOrientationClockwise");
  if (a3 == 2)
    return CFSTR("curveOrientationCounterClockwise");
  else
    return (id)v3;
}

- (RTWorkoutRouteManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_healthKitManager_locationManager_mapServiceManager_platform_workoutDistanceStore_workoutMetricsManager_);
}

- (RTWorkoutRouteManager)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 healthKitManager:(id)a5 locationManager:(id)a6 mapServiceManager:(id)a7 platform:(id)a8 workoutDistanceStore:(id)a9 workoutMetricsManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  RTWorkoutRouteManager *v19;
  uint64_t v20;
  NSMutableDictionary *workoutActivityTypeToclustersSet;
  RTWorkoutRouteManager *v22;
  RTWorkoutRouteManager *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v28;
  id v29;
  RTWorkoutRouteManager *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v32 = a9;
  v18 = a10;
  if (!v16)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: defaultsManager";
LABEL_26:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_27;
  }
  if (!v17)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_26;
  }
  if (!v36)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: healthKitManager";
    goto LABEL_26;
  }
  if (!v35)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_26;
  }
  if (!v34)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_26;
  }
  if (!v33)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: platform";
    goto LABEL_26;
  }
  if (!v32)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: workoutDistanceStore";
      goto LABEL_26;
    }
LABEL_27:

    v23 = 0;
    v22 = self;
    goto LABEL_28;
  }
  v29 = v18;
  if (v18)
  {
    v37.receiver = self;
    v37.super_class = (Class)RTWorkoutRouteManager;
    v19 = -[RTNotifier init](&v37, sel_init);
    if (v19)
    {
      v31 = v19;
      objc_storeStrong((id *)&v19->_defaultsManager, a3);
      objc_storeStrong((id *)&v31->_distanceCalculator, a4);
      objc_storeStrong((id *)&v31->_healthKitManager, a5);
      objc_storeStrong((id *)&v31->_locationManager, a6);
      objc_storeStrong((id *)&v31->_mapServiceManager, a7);
      objc_storeStrong((id *)&v31->_platform, a8);
      objc_storeStrong((id *)&v31->_workoutDistanceStore, a9);
      objc_storeStrong((id *)&v31->_workoutMetricsManager, a10);
      v31->_distanceMetric = 2;
      v20 = objc_opt_new();
      workoutActivityTypeToclustersSet = v31->_workoutActivityTypeToclustersSet;
      v31->_workoutActivityTypeToclustersSet = (NSMutableDictionary *)v20;

      v31->_isSchedulerTriggered = 1;
      -[RTService setup](v31, "setup");
      v19 = v31;
    }
    v22 = v19;
    v23 = v22;
    v24 = v29;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutMetricsManager", buf, 2u);
    }

    v23 = 0;
    v24 = 0;
    v22 = self;
  }
LABEL_28:

  return v23;
}

- (void)processWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 handler:(id)a11
{
  BOOL v18;
  id v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  BOOL v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  unint64_t v31;
  _QWORD block[5];
  id v35;
  id v36;
  double v37;
  unint64_t v38;
  SEL v39;
  BOOL v40;
  BOOL v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v18 = a10;
  v52 = *MEMORY[0x1E0C80C00];
  v19 = a11;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v31 = a9;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = a5;
    v25 = a7;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v47 = v23;
    v48 = 2112;
    v49 = v26;
    v50 = 2048;
    v51 = v27;
    _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "--------->%@, %@, start processing workouts, footprint, %.4f MB<---------", buf, 0x20u);

    a7 = v25;
    a5 = v24;
    v18 = a10;

    a9 = v31;
  }

  -[RTNotifier queue](self, "queue");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke;
  block[3] = &unk_1E92A34E8;
  v40 = a3;
  v41 = a4;
  v42 = a5;
  v43 = a6;
  v44 = a7;
  v37 = a8;
  v45 = v18;
  v35 = v20;
  v36 = v19;
  v38 = a9;
  v39 = a2;
  block[4] = self;
  v29 = v20;
  v30 = v19;
  dispatch_async(v28, block);

}

void __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v14 = *(void **)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 80);
  v3 = *(unsigned __int8 *)(a1 + 81);
  v4 = *(unsigned __int8 *)(a1 + 82);
  v5 = *(unsigned __int8 *)(a1 + 83);
  v6 = *(unsigned __int8 *)(a1 + 84);
  v7 = *(double *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v15[0] = MEMORY[0x1E0C809B0];
  v9 = *(_BYTE *)(a1 + 85);
  v15[2] = __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke_2;
  v15[3] = &unk_1E92A34C0;
  v15[1] = 3221225472;
  objc_copyWeak(v18, &location);
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v17 = v10;
  v15[4] = v11;
  v18[1] = *(id *)(a1 + 72);
  v16 = v12;
  LOBYTE(v13) = v9;
  objc_msgSend(v14, "_processWorkoutsClearClusters:clearExistingDistanceMatrix:buildDistanceMatrix:syncClustersToHealhtKit:syncClustersToWatch:filteringDistanceThreshold:topNWorkouts:isSchedulerTriggered:handler:", v2, v3, v4, v5, v6, v8, v7, v13, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __215__RTWorkoutRouteManager_processWorkoutsClearClusters_clearExistingDistanceMatrix_buildDistanceMatrix_syncClustersToHealhtKit_syncClustersToWatch_filteringDistanceThreshold_topNWorkouts_isSchedulerTriggered_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(void);
  objc_class *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_11;
  }
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412802;
      v20 = v17;
      v21 = 2112;
      v22 = v18;
      v23 = 2112;
      v24 = v3;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@, %@, %@", (uint8_t *)&v19, 0x20u);

    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v19 = 138413314;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v3;
    v25 = 2048;
    v26 = v11;
    v27 = 2048;
    v28 = v13;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "--------->%@, %@, finished processing workouts, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v19, 0x34u);

  }
  v14 = *(_QWORD *)(a1 + 48);
  if (v14)
  {
    v15 = *(void (**)(void))(v14 + 16);
LABEL_11:
    v15();
  }

}

- (void)processNewlyAddedWorkout:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  SEL v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    v28 = 2048;
    v29 = v14;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "--------->%@, %@, start processing newly added workout, footprint, %.4f MB<---------", buf, 0x20u);

  }
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke;
  block[3] = &unk_1E9298750;
  block[4] = self;
  v20 = v7;
  v22 = v8;
  v23 = a2;
  v21 = v9;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  dispatch_async(v15, block);

}

void __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke_2;
  v6[3] = &unk_1E92A34C0;
  objc_copyWeak(v9, &location);
  v4 = *(id *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v6[4] = v5;
  v9[1] = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_processNewlyAddedWorkout:handler:", v3, v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __58__RTWorkoutRouteManager_processNewlyAddedWorkout_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v15 = 138413314;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = v10;
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "--------->%@, %@, finished processing newly added workout, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v15, 0x34u);

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    v14 = *(void (**)(void))(v13 + 16);
LABEL_7:
    v14();
  }

}

- (void)updateRelevanceScoresWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = v11;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "--------->%@, %@, start update relevance scores, footprint, %.4f MB<---------", buf, 0x20u);

  }
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke;
  v15[3] = &unk_1E92994E0;
  v17 = v5;
  v18 = a2;
  v15[4] = self;
  v16 = v6;
  v13 = v6;
  v14 = v5;
  dispatch_async(v12, v15);

}

void __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke_2;
  v6[3] = &unk_1E92A34C0;
  objc_copyWeak(v9, &location);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v6[4] = v4;
  v9[1] = *(id *)(a1 + 56);
  v7 = v5;
  objc_msgSend(v2, "_updateRelevanceScoresWithHandler:", v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __58__RTWorkoutRouteManager_updateRelevanceScoresWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    v14 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v15 = 138413314;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = v10;
    v23 = 2048;
    v24 = v12;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "--------->%@, %@, finished update relevance scores, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v15, 0x34u);

  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    v14 = *(void (**)(void))(v13 + 16);
LABEL_7:
    v14();
  }

}

- (void)deleteWorkout:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  SEL v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412546;
    v23 = v11;
    v24 = 2048;
    v25 = v12;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "--------->%@, start deleting workout, footprint, %.4f MB<---------", buf, 0x16u);

  }
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke;
  block[3] = &unk_1E9298750;
  block[4] = self;
  v18 = v7;
  v20 = v8;
  v21 = a2;
  v19 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  dispatch_async(v13, block);

}

void __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke_2;
  v6[3] = &unk_1E92A3510;
  objc_copyWeak(v9, &location);
  v4 = *(id *)(a1 + 56);
  v5 = *(void **)(a1 + 64);
  v8 = v4;
  v9[1] = v5;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_deleteWorkout:handler:", v3, v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __47__RTWorkoutRouteManager_deleteWorkout_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v13 = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    v17 = 2048;
    v18 = v8;
    v19 = 2048;
    v20 = v10;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "--------->%@, finished deleting workout, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v13, 0x2Au);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v12 = *(void (**)(void))(v11 + 16);
LABEL_7:
    v12();
  }

}

- (void)pruneDistanceMatrixWithHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "--------->%@, start pruning distance matrix, footprint, %.4f MB<---------", buf, 0x16u);

  }
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke;
  v13[3] = &unk_1E92994E0;
  v15 = v5;
  v16 = a2;
  v13[4] = self;
  v14 = v6;
  v11 = v6;
  v12 = v5;
  dispatch_async(v10, v13);

}

void __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8[2];
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke_2;
  v5[3] = &unk_1E92A3510;
  objc_copyWeak(v8, &location);
  v3 = *(id *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v7 = v3;
  v8[1] = v4;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_pruneDistanceMatrixWithHandler:", v5);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __56__RTWorkoutRouteManager_pruneDistanceMatrixWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v13 = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    v17 = 2048;
    v18 = v8;
    v19 = 2048;
    v20 = v10;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "--------->%@, finished pruning distance matrix, error, %@, footprint, %.4f MB, latency, %.4f sec<---------", (uint8_t *)&v13, 0x2Au);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v12 = *(void (**)(void))(v11 + 16);
LABEL_7:
    v12();
  }

}

- (void)displayWorkoutDistanceRecordsWithHandler:(id)a3
{
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
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  dispatch_semaphore_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  dispatch_time_t v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void (**v67)(id, id);
  void *context;
  id v69;
  NSObject *dsema;
  id obj;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  NSObject *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[4];
  NSObject *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE buf[12];
  __int16 v96;
  void *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  id v101;
  __int16 v102;
  const __CFString *v103;
  __int16 v104;
  void *v105;
  _BYTE v106[128];
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _QWORD v113[4];

  v113[1] = *MEMORY[0x1E0C80C00];
  v67 = (void (**)(id, id))a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v3 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke;
  v88[3] = &unk_1E929A708;
  v90 = &v91;
  v5 = v3;
  v89 = v5;
  objc_msgSend(v4, "fetchTotalWorkoutDistancesCountWithHandler:", v88);

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
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v107 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v107, 1);
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
    v22 = v21;
    v67[2](v67, v21);
  }
  else
  {
    v23 = 0;
    v24 = 0;
    v64 = *MEMORY[0x1E0D18598];
    v65 = *MEMORY[0x1E0CB2D50];
    do
    {
      context = (void *)MEMORY[0x1D8231EA8]();
      v25 = dispatch_semaphore_create(0);

      v107 = 0;
      v108 = &v107;
      v109 = 0x3032000000;
      v110 = __Block_byref_object_copy__133;
      v111 = __Block_byref_object_dispose__133;
      v112 = 0;
      v82 = 0;
      v83 = &v82;
      v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__133;
      v86 = __Block_byref_object_dispose__133;
      v87 = 0;
      -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke_93;
      v78[3] = &unk_1E9296EE0;
      v80 = &v107;
      v81 = &v82;
      v27 = v25;
      v79 = v27;
      objc_msgSend(v26, "fetchWorkoutDistancesWithOffset:limit:maxDistanceThreshold:includeVisitedRecords:handler:", v23, 5000, 0, v78, 1.79769313e308);

      dsema = v27;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = dispatch_time(0, 3600000000000);
      v30 = v24;
      if (dispatch_semaphore_wait(dsema, v29))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "timeIntervalSinceDate:", v28);
        v33 = v32;
        v34 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "filteredArrayUsingPredicate:", v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "submitToCoreAnalytics:type:duration:", v38, 1, v33);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v40 = (void *)MEMORY[0x1E0CB35C8];
        v113[0] = v65;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v113, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", v64, 15, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v24;
        if (v42)
        {
          v30 = objc_retainAutorelease(v42);

        }
      }

      v69 = v30;
      v43 = v69;
      if (v69 || (v43 = (id)v83[5]) != 0)
      {
        v67[2](v67, v43);
        v44 = 0;
      }
      else
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        obj = (id)v108[5];
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v106, 16);
        if (v45)
        {
          v72 = *(_QWORD *)v75;
          do
          {
            v46 = 0;
            v73 = v45;
            do
            {
              if (*(_QWORD *)v75 != v72)
                objc_enumerationMutation(obj);
              v47 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v46);
              v48 = (void *)MEMORY[0x1D8231EA8]();
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                v50 = v23;
                objc_msgSend(v47, "firstWorkout");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "secondWorkout");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "distance");
                v54 = v53;
                +[RTHealthKitManager stringFromRTHealthKitWorkoutActivityType:](RTHealthKitManager, "stringFromRTHealthKitWorkoutActivityType:", objc_msgSend(v47, "workoutActivityType"));
                v55 = (id)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v47, "areBothWorkoutsDecimated"))
                  v56 = CFSTR("YES");
                else
                  v56 = CFSTR("NO");
                +[RTDistanceCalculator distanceMetricToString:](RTDistanceCalculator, "distanceMetricToString:", objc_msgSend(v47, "distanceMetric", v63));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413570;
                *(_QWORD *)&buf[4] = v51;
                v96 = 2112;
                v97 = v52;
                v98 = 2048;
                v99 = v54;
                v100 = 2112;
                v101 = v55;
                v102 = 2112;
                v103 = v56;
                v104 = 2112;
                v105 = v57;
                _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "%@, %@, %.8f, %@, %@, %@", buf, 0x3Eu);

                v23 = v50;
              }

              objc_autoreleasePoolPop(v48);
              ++v46;
            }
            while (v73 != v46);
            v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v106, 16);
          }
          while (v45);
        }

        v58 = (void *)v108[5];
        v108[5] = 0;

        v23 += 5000;
        v44 = 1;
      }

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(&v107, 8);

      objc_autoreleasePoolPop(context);
      if (!v44)
      {
        v22 = v69;
        goto LABEL_39;
      }
      if (!v23)
        break;
      v24 = v69;
    }
    while (v23 < v92[3]);
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      v60 = v92[3];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "timeIntervalSinceDate:", v63);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v60;
      v96 = 2048;
      v97 = v62;
      _os_log_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_INFO, "totalWorkoutDistancesCount, %lu, latency, %.4f", buf, 0x16u);

    }
    v67[2](v67, 0);
    v22 = v69;
  }
LABEL_39:

  _Block_object_dispose(&v91, 8);
}

intptr_t __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __66__RTWorkoutRouteManager_displayWorkoutDistanceRecordsWithHandler___block_invoke_93(uint64_t a1, void *a2, void *a3)
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

- (void)_processWorkoutsClearClusters:(BOOL)a3 clearExistingDistanceMatrix:(BOOL)a4 buildDistanceMatrix:(BOOL)a5 syncClustersToHealhtKit:(BOOL)a6 syncClustersToWatch:(BOOL)a7 filteringDistanceThreshold:(double)a8 topNWorkouts:(unint64_t)a9 isSchedulerTriggered:(BOOL)a10 handler:(id)a11
{
  _BOOL8 v13;
  _BOOL8 v14;
  void (**v16)(id, id);
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
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
  _BOOL4 v52;
  id v53;
  NSObject *v54;
  unint64_t v55;
  objc_class *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  id v64;
  void *v65;
  _BOOL4 v66;
  id v67;
  NSObject *v68;
  objc_class *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  void *v89;
  _BOOL8 v90;
  double v91;
  double v92;
  NSObject *v93;
  objc_class *v94;
  void *v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  double v99;
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
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  double v116;
  double v117;
  void *v118;
  uint64_t v119;
  id v120;
  void *v121;
  NSObject *v122;
  objc_class *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t j;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  id v142;
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
  uint64_t v157;
  NSObject *v158;
  objc_class *v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  _BOOL4 v165;
  id v166;
  NSObject *v167;
  objc_class *v168;
  void *v169;
  void *v170;
  const __CFString *v171;
  void *v172;
  double v173;
  double v174;
  double v175;
  void *v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  double v180;
  double v181;
  _BOOL8 v182;
  id v183;
  double v184;
  double v185;
  NSObject *v186;
  objc_class *v187;
  void *v188;
  void *v189;
  const __CFString *v190;
  void *v191;
  double v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t k;
  void *v213;
  void *v214;
  NSObject *v215;
  void *v216;
  void *v217;
  void *v218;
  RTWorkoutRouteManager *v219;
  uint64_t v220;
  void *v221;
  void *v222;
  void *v223;
  int v224;
  id v225;
  NSObject *v226;
  objc_class *v227;
  void *v228;
  void *v229;
  uint64_t v230;
  const __CFString *v231;
  void *v232;
  double v233;
  double v234;
  const __CFString *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  NSObject *v243;
  objc_class *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  uint64_t v248;
  void *context;
  void (**v250)(id, id);
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  _BOOL4 v256;
  _BOOL4 v257;
  void *v258;
  unint64_t v259;
  id v260;
  const __CFString *v261;
  _BOOL4 v262;
  uint64_t v263;
  void *v264;
  RTWorkoutRouteManager *v265;
  void *v266;
  id v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  id v272;
  id v273;
  id v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  id v279;
  id v280;
  id v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  id v286;
  id v287;
  id v288;
  id v289;
  id v290;
  void *v291;
  _BYTE v292[128];
  _BYTE v293[128];
  uint8_t v294[128];
  uint8_t buf[4];
  void *v296;
  __int16 v297;
  uint64_t v298;
  __int16 v299;
  uint64_t v300;
  __int16 v301;
  double v302;
  __int16 v303;
  double v304;
  __int16 v305;
  double v306;
  __int16 v307;
  const __CFString *v308;
  __int16 v309;
  double v310;
  __int16 v311;
  unint64_t v312;
  __int16 v313;
  const __CFString *v314;
  uint64_t v315;

  v256 = a7;
  v257 = a6;
  v262 = a5;
  v13 = a4;
  v14 = a3;
  v315 = *MEMORY[0x1E0C80C00];
  v16 = (void (**)(id, id))a11;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v296 = v19;
    v297 = 2112;
    v298 = (uint64_t)v20;
    v299 = 2048;
    v300 = v21;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "--------->%@, %@, before autoreleasepool, footprint, %.4f MB<---------", buf, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v22 = objc_claimAutoreleasedReturnValue();
  v250 = v16;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    v27 = CFSTR("NO");
    *(_DWORD *)buf = 138414594;
    v296 = v24;
    v297 = 2112;
    if (v14)
      v28 = CFSTR("YES");
    else
      v28 = CFSTR("NO");
    v298 = v25;
    if (v13)
      *(double *)&v29 = COERCE_DOUBLE(CFSTR("YES"));
    else
      *(double *)&v29 = COERCE_DOUBLE(CFSTR("NO"));
    v299 = 2112;
    if (v262)
      *(double *)&v30 = COERCE_DOUBLE(CFSTR("YES"));
    else
      *(double *)&v30 = COERCE_DOUBLE(CFSTR("NO"));
    v300 = (uint64_t)v28;
    if (v257)
      *(double *)&v31 = COERCE_DOUBLE(CFSTR("YES"));
    else
      *(double *)&v31 = COERCE_DOUBLE(CFSTR("NO"));
    v301 = 2112;
    if (v256)
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    v302 = *(double *)&v29;
    if (a10)
      v27 = CFSTR("YES");
    v303 = 2112;
    v304 = *(double *)&v30;
    v305 = 2112;
    v306 = *(double *)&v31;
    v307 = 2112;
    v308 = v32;
    v309 = 2048;
    v310 = a8;
    v311 = 2048;
    v312 = a9;
    v313 = 2112;
    v314 = v27;
    _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, clearClusters, %@, clearExistingDistanceMatrix, %@, buildDistanceMatrix, %@, syncClustersToHealhtKit, %@, syncClustersToWatch, %@, filteringDistanceThreshold, %.3f, topNWorkouts, %lu, isSchedulerTriggered, %@", buf, 0x66u);

    v16 = v250;
  }
  v259 = a9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1D8231EA8](-[RTWorkoutRouteManager setIsSchedulerTriggered:](self, "setIsSchedulerTriggered:", a10));
  v34 = (void *)objc_opt_new();
  -[RTWorkoutRouteManager setProcessWorkoutMetrics:](self, "setProcessWorkoutMetrics:", v34);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, CFSTR("parameter_filter_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("parameter_clearClusters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, CFSTR("parameter_distance_threshold"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v256);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, CFSTR("parameter_syncClustersToWatch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v262);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, CFSTR("parameter_buildDistanceMatrix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v257);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setObject:forKeyedSubscript:", v45, CFSTR("parameter_syncClustersToHealhtKit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("parameter_clearExistingDistanceMatrix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setObject:forKeyedSubscript:", v49, CFSTR("is_scheduler_triggered"));

  v265 = self;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v290 = 0;
    v52 = -[RTWorkoutRouteManager _deleteAllClustersFromHealthKitError:](self, "_deleteAllClustersFromHealthKitError:", &v290);
    v53 = v290;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = 0x1E0C99000uLL;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
        v59 = CFSTR("YES");
      else
        v59 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "timeIntervalSinceDate:", v51);
      v62 = v61;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413314;
      v296 = v57;
      v297 = 2112;
      v298 = (uint64_t)v58;
      v299 = 2112;
      v300 = (uint64_t)v59;
      self = v265;
      v301 = 2048;
      v302 = v62;
      v303 = 2048;
      v304 = v63;
      _os_log_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_INFO, "%@, %@, clear clusters in HealthKit, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

      v55 = 0x1E0C99000;
      v16 = v250;
    }

    if (v16 && v53)
    {
      v64 = v53;
LABEL_47:
      v16[2](v16, v64);
      objc_autoreleasePoolPop(context);
      v77 = 0;
      goto LABEL_48;
    }
    v289 = v53;
    -[RTWorkoutRouteManager _updateWorkoutDistanceRecordsWithObjectIDs:isVisited:error:](self, "_updateWorkoutDistanceRecordsWithObjectIDs:isVisited:error:", 0, 0, &v289);
    v64 = v289;

    if (v16 && v64)
      goto LABEL_47;
  }
  else
  {
    v64 = 0;
    v51 = v33;
    v55 = 0x1E0C99000uLL;
  }
  if (v13)
  {
    objc_msgSend(*(id *)(v55 + 3432), "date");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v288 = v64;
    v66 = -[RTWorkoutRouteManager _clearDistanceMatrixWithError:](self, "_clearDistanceMatrixWithError:", &v288);
    v67 = v288;

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      v69 = (objc_class *)objc_opt_class();
      NSStringFromClass(v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v66)
        v72 = CFSTR("YES");
      else
        v72 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "timeIntervalSinceDate:", v65);
      v75 = v74;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413314;
      v296 = v70;
      v297 = 2112;
      v298 = (uint64_t)v71;
      v299 = 2112;
      v300 = (uint64_t)v72;
      self = v265;
      v301 = 2048;
      v302 = v75;
      v303 = 2048;
      v304 = v76;
      _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "%@, %@, clear distance matrix, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

      v55 = 0x1E0C99000;
    }

    if (v16)
    {
      v64 = v67;
      v51 = v65;
      if (v67)
        goto LABEL_47;
    }
  }
  else
  {
    v65 = v51;
    v67 = v64;
  }
  v287 = v67;
  -[RTWorkoutRouteManager _initProcessWorkoutMetrics:](self, "_initProcessWorkoutMetrics:", &v287);
  v64 = v287;

  if (v16 && v64)
  {
    v51 = v65;
    goto LABEL_47;
  }
  v78 = (void *)objc_opt_new();
  if (v262)
  {
    objc_msgSend(*(id *)(v55 + 3432), "date");
    v263 = objc_claimAutoreleasedReturnValue();

    +[RTRuntime footprint](RTRuntime, "footprint");
    v80 = v79;
    v286 = v64;
    -[RTWorkoutRouteManager _getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold:topN:error:](self, "_getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold:topN:error:", v259, &v286, a8);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v286;

    if (v16 && v82)
      v16[2](v16, v82);
    v284 = 0u;
    v285 = 0u;
    v282 = 0u;
    v283 = 0u;
    v252 = v81;
    objc_msgSend(v81, "allValues");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v282, v294, 16);
    if (v84)
    {
      v85 = v84;
      v86 = *(_QWORD *)v283;
      do
      {
        for (i = 0; i != v85; ++i)
        {
          if (*(_QWORD *)v283 != v86)
            objc_enumerationMutation(v83);
          v88 = *(_QWORD *)(*((_QWORD *)&v282 + 1) + 8 * i);
          v89 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v78, "addObjectsFromArray:", v88);
          objc_autoreleasePoolPop(v89);
        }
        v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v282, v294, 16);
      }
      while (v85);
    }

    v281 = v82;
    v90 = -[RTWorkoutRouteManager _processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:error:](self, "_processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:error:", v252, &v281);
    v64 = v281;

    +[RTRuntime footprint](RTRuntime, "footprint");
    v92 = v91;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      v94 = (objc_class *)objc_opt_class();
      NSStringFromClass(v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (v90)
        v97 = CFSTR("YES");
      else
        v97 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "timeIntervalSinceDate:", v263);
      *(_DWORD *)buf = 138413314;
      v296 = v95;
      v297 = 2112;
      v298 = (uint64_t)v96;
      v299 = 2112;
      v300 = (uint64_t)v97;
      self = v265;
      v301 = 2048;
      v302 = v99;
      v303 = 2048;
      v304 = v92;
      _os_log_impl(&dword_1D1A22000, v93, OS_LOG_TYPE_INFO, "%@, %@, process workouts using activity type to workout UUIDs map, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v90);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, CFSTR("distance_matrix_is_success"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v92 - v80);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setObject:forKeyedSubscript:", v102, CFSTR("distance_matrix_footprint_delta"));

    v104 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = (void *)v263;
    objc_msgSend(v105, "timeIntervalSinceDate:", v263);
    objc_msgSend(v104, "numberWithDouble:");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "setObject:forKeyedSubscript:", v106, CFSTR("distance_matrix_time_elapsed"));

    v16 = v250;
    if (v64)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v64, "code"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "setObject:forKeyedSubscript:", v108, CFSTR("distance_matrix_errorcode"));

      objc_msgSend(v64, "domain");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "description");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "setObject:forKeyedSubscript:", v111, CFSTR("distance_matrix_errordomain"));

      if (v250)
        v250[2](v250, v64);

      objc_autoreleasePoolPop(context);
      v77 = v252;
      v51 = (void *)v263;
      goto LABEL_48;
    }
    v260 = 0;
    v55 = 0x1E0C99000uLL;
    v113 = v252;
  }
  else
  {
    v260 = v64;
    v113 = 0;
  }
  v114 = 0;
  v248 = *MEMORY[0x1E0D18598];
  while (1)
  {
    v115 = MEMORY[0x1D8231EA8]();
    v253 = (void *)v115;
    if (!v257)
    {
      v121 = (void *)v115;
      goto LABEL_106;
    }
    objc_msgSend(*(id *)(v55 + 3432), "date");
    v251 = (void *)objc_claimAutoreleasedReturnValue();

    +[RTRuntime footprint](RTRuntime, "footprint");
    v117 = v116;
    -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](self, "workoutActivityTypeToclustersSet");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v118, "count");

    if (v119)
    {
      v120 = v260;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
      {
        v123 = (objc_class *)objc_opt_class();
        NSStringFromClass(v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v296 = v124;
        v297 = 2112;
        v298 = (uint64_t)v125;
        _os_log_impl(&dword_1D1A22000, v122, OS_LOG_TYPE_INFO, "%@, %@, No clusters in memory. Reading clusters from HealthKit", buf, 0x16u);

      }
      v280 = v260;
      -[RTWorkoutRouteManager _readClustersFromHealthKitWithError:](self, "_readClustersFromHealthKitWithError:", &v280);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v280;

      -[RTWorkoutRouteManager setWorkoutActivityTypeToclustersSet:](self, "setWorkoutActivityTypeToclustersSet:", v126);
    }
    v260 = v120;
    if (!v120)
    {
      v279 = 0;
      -[RTWorkoutRouteManager _clusterizeWorkoutsWithError:](self, "_clusterizeWorkoutsWithError:", &v279);
      v127 = objc_claimAutoreleasedReturnValue();
      v260 = v279;

      v114 = (void *)v127;
    }
    objc_msgSend(v114, "objectIDs");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "count");

    if (!v129)
      break;
    v130 = (void *)objc_opt_new();
    v275 = 0u;
    v276 = 0u;
    v277 = 0u;
    v278 = 0u;
    objc_msgSend(v114, "clusters");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v275, v293, 16);
    if (v132)
    {
      v133 = v132;
      v134 = *(_QWORD *)v276;
      do
      {
        for (j = 0; j != v133; ++j)
        {
          if (*(_QWORD *)v276 != v134)
            objc_enumerationMutation(v131);
          v136 = *(_QWORD *)(*((_QWORD *)&v275 + 1) + 8 * j);
          v137 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v130, "addObjectsFromArray:", v136);
          objc_autoreleasePoolPop(v137);
        }
        v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v275, v293, 16);
      }
      while (v133);
    }

    self = v265;
    if (objc_msgSend(v78, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v130, "count")* 100.0/ (double)(unint64_t)objc_msgSend(v78, "count"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](v265, "processWorkoutMetrics");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "setObject:forKeyedSubscript:", v138, CFSTR("clustering_percentage_workouts_clustered"));

    }
    +[RTRuntime footprint](RTRuntime, "footprint");
    v141 = v140;
    v142 = v260;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v260 == 0);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](v265, "processWorkoutMetrics");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "setObject:forKeyedSubscript:", v143, CFSTR("clustering_is_success"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v141 - v117);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](v265, "processWorkoutMetrics");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "setObject:forKeyedSubscript:", v145, CFSTR("clustering_footprint_delta"));

    v147 = (void *)MEMORY[0x1E0CB37E8];
    v55 = 0x1E0C99000uLL;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v251;
    objc_msgSend(v148, "timeIntervalSinceDate:", v251);
    objc_msgSend(v147, "numberWithDouble:");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](v265, "processWorkoutMetrics");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setObject:forKeyedSubscript:", v149, CFSTR("clustering_time_elapsed"));

    v16 = v250;
    if (v260)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v260, "code"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](v265, "processWorkoutMetrics");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "setObject:forKeyedSubscript:", v151, CFSTR("clustering_errorcode"));

      objc_msgSend(v260, "domain");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "description");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](v265, "processWorkoutMetrics");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "setObject:forKeyedSubscript:", v154, CFSTR("clustering_errordomain"));

      objc_msgSend(v260, "domain");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v156, "isEqualToString:", v248))
      {

        goto LABEL_146;
      }
      v157 = objc_msgSend(v260, "code");

      if (v157 != 15)
        goto LABEL_146;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v158 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
    {
      v159 = (objc_class *)objc_opt_class();
      NSStringFromClass(v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "timeIntervalSinceDate:", v251);
      *(_DWORD *)buf = 138413058;
      v296 = v160;
      v297 = 2112;
      v298 = (uint64_t)v161;
      v299 = 2048;
      v300 = v163;
      v301 = 2048;
      v302 = v141;
      _os_log_impl(&dword_1D1A22000, v158, OS_LOG_TYPE_INFO, "%@, %@, clustering workouts status, done, latency, %.4f, footprint, %.4f MB", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v114, "clusters");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = v260;
    v165 = -[RTWorkoutRouteManager _syncClustersToHealthKit:error:](v265, "_syncClustersToHealthKit:error:", v164, &v274);
    v166 = v274;

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v167 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
    {
      v168 = (objc_class *)objc_opt_class();
      NSStringFromClass(v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      if (v165)
        v171 = CFSTR("YES");
      else
        v171 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "timeIntervalSinceDate:", v65);
      v174 = v173;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413314;
      v296 = v169;
      v297 = 2112;
      v298 = (uint64_t)v170;
      v299 = 2112;
      v300 = (uint64_t)v171;
      self = v265;
      v301 = 2048;
      v302 = v174;
      v303 = 2048;
      v304 = v175;
      _os_log_impl(&dword_1D1A22000, v167, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to HealthKit, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

      v55 = 0x1E0C99000uLL;
    }

    if (v166)
    {
      v142 = v166;
      goto LABEL_146;
    }
    objc_msgSend(v114, "objectIDs");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = objc_msgSend(v176, "count");

    if (v177)
    {
      objc_msgSend(v114, "objectIDs");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v273 = 0;
      -[RTWorkoutRouteManager _updateWorkoutDistanceRecordsWithObjectIDs:isVisited:error:](self, "_updateWorkoutDistanceRecordsWithObjectIDs:isVisited:error:", v178, 1, &v273);
      v260 = v273;

      v78 = 0;
    }
    else
    {
      v78 = 0;
      v260 = 0;
    }
    v121 = v253;
LABEL_106:

    if (!v256)
    {
      v251 = v65;
      goto LABEL_115;
    }
    objc_msgSend(*(id *)(v55 + 3432), "date");
    v179 = objc_claimAutoreleasedReturnValue();

    v65 = (void *)v179;
    +[RTRuntime footprint](RTRuntime, "footprint");
    v181 = v180;
    v272 = v260;
    v182 = -[RTWorkoutRouteManager _syncClustersToWatchWithLimit:error:](self, "_syncClustersToWatchWithLimit:error:", 100, &v272);
    v183 = v272;

    +[RTRuntime footprint](RTRuntime, "footprint");
    v185 = v184;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v186 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
    {
      v187 = (objc_class *)objc_opt_class();
      NSStringFromClass(v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      if (v182)
        *(double *)&v190 = COERCE_DOUBLE(CFSTR("YES"));
      else
        *(double *)&v190 = COERCE_DOUBLE(CFSTR("NO"));
      objc_msgSend(*(id *)(v55 + 3432), "date");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "timeIntervalSinceDate:", v65);
      *(_DWORD *)buf = 138413570;
      v296 = v188;
      v297 = 2112;
      v298 = (uint64_t)v189;
      v299 = 2048;
      v300 = 100;
      v301 = 2112;
      v302 = *(double *)&v190;
      self = v265;
      v303 = 2048;
      v304 = v192;
      v305 = 2048;
      v306 = v185;
      _os_log_impl(&dword_1D1A22000, v186, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x3Eu);

      v55 = 0x1E0C99000uLL;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 100);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "setObject:forKeyedSubscript:", v193, CFSTR("sync_to_watch_count_clusters"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v182);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "setObject:forKeyedSubscript:", v195, CFSTR("sync_to_watch_is_success"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v185 - v181);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "setObject:forKeyedSubscript:", v197, CFSTR("sync_to_watch_footprint_delta"));

    v199 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(v55 + 3432), "date");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v200, "timeIntervalSinceDate:", v65);
    objc_msgSend(v199, "numberWithDouble:");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v202, "setObject:forKeyedSubscript:", v201, CFSTR("sync_to_watch_time_elapsed"));

    if (v183)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v183, "code"));
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "setObject:forKeyedSubscript:", v238, CFSTR("sync_to_watch_errorcode"));

      objc_msgSend(v183, "domain");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "description");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v242, "setObject:forKeyedSubscript:", v241, CFSTR("sync_to_watch_errordomain"));

      v113 = 0;
      v142 = v183;
LABEL_146:
      v236 = context;
      if (v16)
        v16[2](v16, v142);
      objc_autoreleasePoolPop(v253);

      v237 = 0;
      v254 = v113;
      v225 = v142;
      goto LABEL_149;
    }
    v260 = 0;
    v251 = v65;
    v121 = v253;
LABEL_115:
    objc_autoreleasePoolPop(v121);
    objc_msgSend(v114, "objectIDs");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = objc_msgSend(v203, "count");

    v78 = 0;
    v113 = 0;
    v205 = 0;
    v206 = 0;
    if (!v204)
      goto LABEL_118;
  }
  objc_autoreleasePoolPop(v253);
  v205 = v113;
  v206 = v78;
LABEL_118:
  v258 = v206;
  v254 = v205;

  v270 = 0u;
  v271 = 0u;
  v268 = 0u;
  v269 = 0u;
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v207, "allKeys");
  v208 = (void *)objc_claimAutoreleasedReturnValue();

  v209 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v268, v292, 16);
  if (v209)
  {
    v210 = v209;
    v211 = *(_QWORD *)v269;
    do
    {
      for (k = 0; k != v210; ++k)
      {
        if (*(_QWORD *)v269 != v211)
          objc_enumerationMutation(v208);
        v213 = *(void **)(*((_QWORD *)&v268 + 1) + 8 * k);
        v214 = (void *)MEMORY[0x1D8231EA8]();
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v215 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v215, OS_LOG_TYPE_INFO))
        {
          -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "objectForKeyedSubscript:", v213);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v296 = v213;
          v297 = 2112;
          v298 = (uint64_t)v217;
          _os_log_impl(&dword_1D1A22000, v215, OS_LOG_TYPE_INFO, "key, %@, value, %@", buf, 0x16u);

          self = v265;
        }

        objc_autoreleasePoolPop(v214);
      }
      v210 = objc_msgSend(v208, "countByEnumeratingWithState:objects:count:", &v268, v292, 16);
    }
    while (v210);
  }

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = self;
  v220 = objc_msgSend(v218, "count");

  if (v220)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTWorkoutRouteManager workoutMetricsManager](v219, "workoutMetricsManager");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](v219, "processWorkoutMetrics");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    v291 = v222;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v291, 1);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = v260;
    v224 = objc_msgSend(v221, "submitMetricsForEvent:data:error:", 3, v223, &v267);
    v225 = v267;

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v226 = objc_claimAutoreleasedReturnValue();
    v16 = v250;
    if (os_log_type_enabled(v226, OS_LOG_TYPE_INFO))
    {
      v227 = (objc_class *)objc_opt_class();
      NSStringFromClass(v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTWorkoutMetricsManager stringFromWorkoutMetricsEvent:](RTWorkoutMetricsManager, "stringFromWorkoutMetricsEvent:", 3);
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager processWorkoutMetrics](v219, "processWorkoutMetrics");
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      *(double *)&v230 = COERCE_DOUBLE(objc_msgSend(v266, "count"));
      *(double *)&v231 = COERCE_DOUBLE(CFSTR("NO"));
      if (v224)
        *(double *)&v231 = COERCE_DOUBLE(CFSTR("YES"));
      v261 = v231;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "timeIntervalSinceDate:", v65);
      v234 = v233;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413826;
      v296 = v228;
      v297 = 2112;
      v298 = (uint64_t)v264;
      v299 = 2112;
      v300 = (uint64_t)v229;
      v301 = 2048;
      v302 = *(double *)&v230;
      v303 = 2112;
      v304 = *(double *)&v261;
      v305 = 2048;
      v306 = v234;
      v307 = 2048;
      v308 = v235;
      _os_log_impl(&dword_1D1A22000, v226, OS_LOG_TYPE_INFO, "%@, %@, submitted metrics for event, %@, metrics count, %lu, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x48u);

    }
    -[RTWorkoutRouteManager setProcessWorkoutMetrics:](v219, "setProcessWorkoutMetrics:", 0);
    if (v225)
    {
      v236 = context;
      if (v250)
        v250[2](v250, v225);
      v237 = v258;
LABEL_149:

      objc_autoreleasePoolPop(v236);
      v64 = v225;
      goto LABEL_150;
    }
    v260 = 0;
  }
  else
  {
    v16 = v250;
    v65 = v251;
  }

  objc_autoreleasePoolPop(context);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v243 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
  {
    v244 = (objc_class *)objc_opt_class();
    NSStringFromClass(v244);
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    v296 = v245;
    v297 = 2112;
    v298 = (uint64_t)v246;
    v299 = 2048;
    v300 = v247;
    _os_log_impl(&dword_1D1A22000, v243, OS_LOG_TYPE_INFO, "--------->%@, %@, after autoreleasepool, footprint, %.4f MB<---------", buf, 0x20u);

  }
  v64 = v260;
  if (v16)
    v16[2](v16, v260);
LABEL_150:
  v77 = v254;
  v51 = v65;
LABEL_48:

}

- (BOOL)_processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:(id)a3 error:(id *)a4
{
  uint64_t v4;
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
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  objc_class *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  objc_class *v48;
  id v49;
  void *v50;
  void *v51;
  int64_t v52;
  id *v53;
  _BOOL4 v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  id v58;
  id v59;
  const __CFString *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  NSObject *v77;
  void *v78;
  dispatch_semaphore_t v80;
  void *v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  dispatch_time_t v85;
  id v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  NSObject *v102;
  objc_class *v103;
  id v104;
  void *v105;
  objc_class *v106;
  id v107;
  void *v108;
  void *v109;
  objc_class *v110;
  id v111;
  void *v112;
  void *v113;
  objc_class *v114;
  id v115;
  void *v116;
  objc_class *v117;
  id v118;
  void *v119;
  void *v120;
  id v121;
  id obj;
  uint64_t v123;
  uint64_t v124;
  char v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *context;
  void *contexta;
  _QWORD v136[4];
  NSObject *v137;
  _BYTE *v138;
  uint64_t *v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[4];
  NSObject *v150;
  _BYTE *v151;
  uint64_t *v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  _BYTE buf[24];
  id v160;
  __int16 v161;
  uint64_t v162;
  __int16 v163;
  uint64_t v164;
  __int16 v165;
  uint64_t v166;
  _BYTE v167[128];
  _BYTE v168[128];
  uint64_t v169;
  uint8_t v170[8];
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v128 = a3;
  if (!v128)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: activityTypeToWorkoutUUIDsMap", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("activityTypeToWorkoutUUIDsMap"));
      v126 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v126 = 0;
    }
    goto LABEL_68;
  }
  v153 = 0;
  v154 = &v153;
  v155 = 0x3032000000;
  v156 = __Block_byref_object_copy__133;
  v157 = __Block_byref_object_dispose__133;
  v158 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1D8231EA8]();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v160 = 0;
  v5 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = MEMORY[0x1E0C809B0];
  v149[1] = 3221225472;
  v149[2] = __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke;
  v149[3] = &unk_1E92971F0;
  v151 = buf;
  v152 = &v153;
  v7 = v5;
  v150 = v7;
  objc_msgSend(v6, "fetchTotalWorkoutDistancesCountWithHandler:", v149);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
    *(_WORD *)v170 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v170, 2u);
  }

  v20 = (void *)MEMORY[0x1E0CB35C8];
  v169 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v170 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, &v169, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

  }
  else
  {
LABEL_7:
    v23 = 0;
  }

  v121 = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("distance_matrix_initial_size"));

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(context);
  if (a4 && v121)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v103 = (objc_class *)objc_opt_class();
      NSStringFromClass(v103);
      v104 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v104;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v105;
      *(_WORD *)&buf[22] = 2112;
      v160 = v121;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = objc_retainAutorelease(v121);
LABEL_13:
    v28 = v27;
    goto LABEL_66;
  }
  v30 = (void *)v4;
  if (a4 && v154[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v106 = (objc_class *)objc_opt_class();
      NSStringFromClass(v106);
      v107 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)v154[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v107;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v108;
      *(_WORD *)&buf[22] = 2112;
      v160 = v109;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = objc_retainAutorelease((id)v154[5]);
    goto LABEL_65;
  }
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  objc_msgSend(v128, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
  if (!v32)
  {
    v126 = 1;
    goto LABEL_60;
  }
  v124 = *(_QWORD *)v146;
  v126 = 1;
  while (2)
  {
    v130 = 0;
    v123 = v32;
    do
    {
      if (*(_QWORD *)v146 != v124)
        objc_enumerationMutation(obj);
      v131 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * v130);
      v127 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v129 = objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "objectForKeyedSubscript:", v131);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2112;
        v160 = v131;
        v161 = 2048;
        v162 = v38;
        v163 = 2048;
        v164 = v39;
        _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%@, %@, activity type, %@, workout UUIDs count, %lu, footprint, %.4f MB", buf, 0x34u);

      }
      v143 = 0u;
      v144 = 0u;
      v141 = 0u;
      v142 = 0u;
      v40 = v128;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
      if (v41)
      {
        v42 = 0;
        v43 = *(_QWORD *)v142;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v142 != v43)
              objc_enumerationMutation(v40);
            v45 = *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * i);
            v46 = (void *)MEMORY[0x1D8231EA8]();
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              v48 = (objc_class *)objc_opt_class();
              NSStringFromClass(v48);
              v49 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              ++v42;
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v49;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v50;
              *(_WORD *)&buf[22] = 2048;
              v160 = v42;
              v161 = 2112;
              v162 = v45;
              _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, %lu, workout UUID: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v46);
            ++v42;
          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
        }
        while (v41);
      }

      objc_msgSend(v40, "objectForKeyedSubscript:", v131);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[RTWorkoutRouteManager distanceMetric](self, "distanceMetric");
      v53 = (id *)(v154 + 5);
      v140 = (id)v154[5];
      v54 = -[RTWorkoutRouteManager _computeAndSaveDistanceMatrixForWorkoutUUIDs:distanceMetric:error:](self, "_computeAndSaveDistanceMatrixForWorkoutUUIDs:distanceMetric:error:", v51, v52, &v140);
      objc_storeStrong(v53, v140);

      v55 = v154[5];
      if (!v55)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v59 = (id)objc_claimAutoreleasedReturnValue();
          if (v54)
            v60 = CFSTR("YES");
          else
            v60 = CFSTR("NO");
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "timeIntervalSinceDate:", v129);
          v63 = v62;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v58;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v59;
          *(_WORD *)&buf[22] = 2112;
          v160 = v131;
          v161 = 2112;
          v162 = (uint64_t)v60;
          v163 = 2048;
          v164 = v63;
          v165 = 2048;
          v166 = v64;
          _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%@, %@, updating distance matrix for activity type, %@, status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x3Eu);

        }
        +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", 37);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v131, "isEqualToString:", v65);

        if (v66)
        {
          v67 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v40, "objectForKeyedSubscript:", v131);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, CFSTR("number_of_workouts_running"));
        }
        else
        {
          +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", 13);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = objc_msgSend(v131, "isEqualToString:", v71);

          if (v72)
          {
            v73 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v40, "objectForKeyedSubscript:", v131);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, CFSTR("number_of_workouts_cycling"));
          }
          else
          {
            +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", 71);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend(v131, "isEqualToString:", v74);

            if (!v75)
            {
LABEL_52:
              objc_msgSend(v40, "removeObjectForKey:", v131);
              v126 &= v54;
              goto LABEL_53;
            }
            v76 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v40, "objectForKeyedSubscript:", v131);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "numberWithUnsignedInteger:", objc_msgSend(v68, "count"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setObject:forKeyedSubscript:", v69, CFSTR("number_of_workouts_wheel_chair_run_pace"));
          }
        }

        goto LABEL_52;
      }
LABEL_53:
      objc_autoreleasePoolPop(v127);
      if (v55)
      {
        v30 = (void *)v129;
        goto LABEL_60;
      }
      v30 = (void *)v129;
      ++v130;
    }
    while (v130 != v123);
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v168, 16);
    v30 = (void *)v129;
    if (v32)
      continue;
    break;
  }
LABEL_60:
  v4 = (uint64_t)v30;

  if (a4 && v154[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
    {
      v110 = (objc_class *)objc_opt_class();
      NSStringFromClass(v110);
      v111 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = (void *)v154[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v111;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v112;
      *(_WORD *)&buf[22] = 2112;
      v160 = v113;
      _os_log_error_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = objc_retainAutorelease((id)v154[5]);
LABEL_65:
    v28 = v121;
LABEL_66:
    v126 = 0;
    *a4 = v27;
    v78 = (void *)v4;
    goto LABEL_67;
  }
  contexta = (void *)MEMORY[0x1D8231EA8]();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v160 = 0;
  v80 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = MEMORY[0x1E0C809B0];
  v136[1] = 3221225472;
  v136[2] = __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke_110;
  v136[3] = &unk_1E92971F0;
  v138 = buf;
  v139 = &v153;
  v82 = v80;
  v137 = v82;
  objc_msgSend(v81, "fetchTotalWorkoutDistancesCountWithHandler:", v136);

  v83 = v82;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = dispatch_time(0, 3600000000000);
  v86 = v121;
  if (dispatch_semaphore_wait(v83, v85))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "timeIntervalSinceDate:", v84);
    v89 = v88;
    v90 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "filteredArrayUsingPredicate:", v91);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "firstObject");
    v94 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v90, "submitToCoreAnalytics:type:duration:", v94, 1, v89);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v170 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v95, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v170, 2u);
    }

    v96 = (void *)MEMORY[0x1E0CB35C8];
    v169 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v170 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, &v169, 1);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = v121;
    if (v98)
    {
      v86 = objc_retainAutorelease(v98);

    }
  }

  v28 = v86;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setObject:forKeyedSubscript:", v99, CFSTR("distance_matrix_final_size"));

  _Block_object_dispose(buf, 8);
  objc_autoreleasePoolPop(contexta);
  if (a4 && v28)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      v114 = (objc_class *)objc_opt_class();
      NSStringFromClass(v114);
      v115 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v115;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v116;
      *(_WORD *)&buf[22] = 2112;
      v160 = v28;
      _os_log_error_impl(&dword_1D1A22000, v101, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = objc_retainAutorelease(v28);
    goto LABEL_13;
  }
  v78 = (void *)v4;
  if (a4 && v154[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      v117 = (objc_class *)objc_opt_class();
      NSStringFromClass(v117);
      v118 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = (void *)v154[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v118;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v119;
      *(_WORD *)&buf[22] = 2112;
      v160 = v120;
      _os_log_error_impl(&dword_1D1A22000, v102, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = objc_retainAutorelease((id)v154[5]);
    goto LABEL_66;
  }
LABEL_67:

  _Block_object_dispose(&v153, 8);
LABEL_68:

  return v126 & 1;
}

void __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __82__RTWorkoutRouteManager__processWorkoutsUsingActivityTypeToWorkoutUUIDsMap_error___block_invoke_110(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_processNewlyAddedWorkout:(id)a3 handler:(id)a4
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  id *v14;
  NSObject *v15;
  NSObject *v16;
  objc_class *v17;
  id v18;
  id v19;
  uint64_t v20;
  dispatch_semaphore_t v21;
  void *v22;
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
  id v38;
  id v39;
  void *v40;
  NSObject *v41;
  objc_class *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  int64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  id *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  NSObject *v62;
  objc_class *v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  _BOOL4 v71;
  objc_class *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id *v77;
  objc_class *v78;
  id v79;
  id v80;
  NSObject *v81;
  objc_class *v82;
  id v83;
  id v84;
  dispatch_semaphore_t v85;
  void *v86;
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
  uint64_t v103;
  void *v104;
  id *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  NSObject *v116;
  objc_class *v117;
  id v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id *v124;
  int v125;
  NSObject *v126;
  objc_class *v127;
  id v128;
  id v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  id *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  NSObject *v140;
  objc_class *v141;
  id v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  int v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  int v153;
  uint64_t v154;
  void *v155;
  id *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  NSObject *v169;
  objc_class *v170;
  id v171;
  id v172;
  uint64_t v173;
  id *v174;
  NSObject *v175;
  objc_class *v176;
  id v177;
  id v178;
  uint64_t v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  NSObject *v190;
  objc_class *v191;
  id v192;
  id v193;
  uint64_t v194;
  id *v195;
  void *v196;
  void *v197;
  void *v198;
  id *v199;
  void *v200;
  void *v201;
  void *v202;
  id *v203;
  NSObject *v204;
  objc_class *v205;
  id v206;
  id v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  int64_t v214;
  id *v215;
  _BOOL4 v216;
  int v217;
  int v218;
  NSObject *v219;
  objc_class *v220;
  id v221;
  id v222;
  void *v223;
  const __CFString *v224;
  void *v225;
  void *v226;
  void *v227;
  id *v228;
  _BOOL4 v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  int64_t v234;
  id *v235;
  _BOOL8 v236;
  NSObject *v237;
  objc_class *v238;
  id v239;
  uint64_t v240;
  void *v241;
  const __CFString *v242;
  NSObject *v243;
  objc_class *v244;
  id v245;
  id v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  double v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  id *v259;
  int v260;
  NSObject *v261;
  NSObject *v262;
  objc_class *v263;
  id v264;
  id v265;
  const __CFString *v266;
  void *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  dispatch_semaphore_t v271;
  NSObject *v272;
  void *v273;
  dispatch_time_t v274;
  void *v275;
  double v276;
  double v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  NSObject *v283;
  void *v284;
  void *v285;
  void *v286;
  id v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  int64_t v292;
  id *v293;
  _BOOL8 v294;
  NSObject *v295;
  objc_class *v296;
  id v297;
  uint64_t v298;
  void *v299;
  const __CFString *v300;
  id v301;
  uint64_t v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  id *v307;
  _BOOL4 v308;
  uint64_t v309;
  void *v310;
  double v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  id *v318;
  int v319;
  NSObject *v320;
  NSObject *v321;
  objc_class *v322;
  id v323;
  id v324;
  void *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  id *v330;
  _BOOL4 v331;
  NSObject *v332;
  objc_class *v333;
  id v334;
  id v335;
  const __CFString *v336;
  void *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  objc_class *v341;
  id v342;
  id v343;
  uint64_t v344;
  const __CFString *v345;
  NSObject *v346;
  objc_class *v347;
  id v348;
  id v349;
  const __CFString *v350;
  void *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  dispatch_semaphore_t v355;
  NSObject *v356;
  void *v357;
  dispatch_time_t v358;
  void *v359;
  double v360;
  double v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  NSObject *v367;
  void *v368;
  void *v369;
  void *v370;
  id v371;
  id v372;
  uint64_t v373;
  objc_class *v374;
  id v375;
  id v376;
  uint64_t v377;
  const __CFString *v378;
  NSObject *v379;
  objc_class *v380;
  id v381;
  id v382;
  void *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  id *v387;
  _BOOL4 v388;
  NSObject *v389;
  objc_class *v390;
  id v391;
  id v392;
  const __CFString *v393;
  void *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  id v402;
  uint64_t v403;
  uint64_t v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  NSObject *dsema;
  const char *aSelector;
  void *context;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void (**v423)(void);
  id v424;
  id v425;
  _QWORD v426[4];
  NSObject *v427;
  uint64_t *v428;
  id v429;
  id v430;
  __int128 v431;
  __int128 v432;
  __int128 v433;
  __int128 v434;
  id v435;
  id v436;
  id v437;
  id v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  _QWORD v443[4];
  NSObject *v444;
  uint64_t *v445;
  uint64_t *v446;
  id v447;
  id v448;
  _QWORD v449[4];
  NSObject *v450;
  uint64_t *v451;
  id v452;
  id v453;
  id v454;
  id v455;
  id v456;
  id v457;
  id v458;
  id v459;
  id v460;
  id v461;
  _QWORD v462[4];
  NSObject *v463;
  uint64_t *v464;
  uint64_t *v465;
  uint64_t v466;
  uint64_t *v467;
  uint64_t v468;
  uint64_t (*v469)(uint64_t, uint64_t);
  void (*v470)(uint64_t);
  id v471;
  id obj;
  uint64_t v473;
  uint64_t *v474;
  uint64_t v475;
  uint64_t (*v476)(uint64_t, uint64_t);
  void (*v477)(uint64_t);
  id v478;
  void *v479;
  void *v480;
  _BYTE v481[128];
  void *v482;
  id v483;
  uint64_t v484;
  void *v485;
  void *v486;
  _BYTE v487[128];
  uint64_t v488;
  uint64_t *v489;
  uint64_t v490;
  uint64_t (*v491)(uint64_t, uint64_t);
  void (*v492)(uint64_t);
  id v493;
  void *v494;
  void *v495;
  void *v496;
  void *v497;
  uint64_t v498;
  void *v499;
  uint64_t v500;
  void *v501;
  void *v502;
  uint64_t v503;
  void *v504;
  void *v505;
  _BYTE buf[12];
  __int16 v507;
  uint64_t v508;
  __int16 v509;
  uint64_t v510;
  __int16 v511;
  uint64_t v512;
  __int16 v513;
  uint64_t v514;
  __int16 v515;
  uint64_t v516;
  uint64_t v517;
  void *v518;
  id v519;
  id v520;
  _QWORD v521[4];

  v521[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v423 = (void (**)(void))a4;
  if (v6)
  {
    aSelector = a2;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v9;
      v507 = 2112;
      v508 = (uint64_t)v10;
      v509 = 2112;
      v510 = (uint64_t)v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, newly added workout uuid, %@", buf, 0x20u);

    }
    v473 = 0;
    v474 = &v473;
    v475 = 0x3032000000;
    v476 = __Block_byref_object_copy__133;
    v477 = __Block_byref_object_dispose__133;
    v478 = 0;
    context = (void *)MEMORY[0x1D8231EA8]();
    v419 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v418 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v420 = (void *)objc_claimAutoreleasedReturnValue();
    v520 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v520, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id *)(v474 + 5);
    obj = (id)v474[5];
    -[RTWorkoutRouteManager _getRemoteWorkoutClustersForWorkoutUUIDs:error:](self, "_getRemoteWorkoutClustersForWorkoutUUIDs:error:", v13, &obj);
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v14, obj);

    if (v474[5])
    {
      if (v423)
        v423[2]();
      goto LABEL_35;
    }
    if (objc_msgSend(v421, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v421, "count");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v18;
        v507 = 2112;
        v508 = (uint64_t)v19;
        v509 = 2112;
        v510 = (uint64_t)v6;
        v511 = 2048;
        v512 = v20;
        _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, %@, existing cluster exists for newly added workout uuid, %@, count, %lu, further processing, skipped", buf, 0x2Au);

      }
      if (v423)
        v423[2]();

      goto LABEL_36;
    }
    v466 = 0;
    v467 = &v466;
    v468 = 0x3032000000;
    v469 = __Block_byref_object_copy__133;
    v470 = __Block_byref_object_dispose__133;
    v471 = 0;
    v21 = dispatch_semaphore_create(0);
    -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v462[0] = MEMORY[0x1E0C809B0];
    v462[1] = 3221225472;
    v462[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke;
    v462[3] = &unk_1E9296EE0;
    v464 = &v466;
    v465 = &v473;
    v23 = v21;
    v463 = v23;
    objc_msgSend(v22, "fetchWorkoutDistancesWithWorkout:handler:", v6, v462);

    dsema = v23;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v25))
      goto LABEL_21;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v24);
    v28 = v27;
    v29 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
    v488 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v488, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = objc_retainAutorelease(v37);

    }
    else
    {
LABEL_21:
      v38 = 0;
    }

    v39 = v38;
    if (v39)
    {
      v40 = v39;
      if (v423)
        v423[2]();
      goto LABEL_34;
    }
    if (v474[5])
    {
      if (!v423)
      {
LABEL_33:
        v40 = 0;
LABEL_34:

        _Block_object_dispose(&v466, 8);
LABEL_35:

LABEL_36:
        objc_autoreleasePoolPop(context);
        _Block_object_dispose(&v473, 8);

        goto LABEL_37;
      }
LABEL_32:
      v423[2]();
      goto LABEL_33;
    }
    if (objc_msgSend((id)v467[5], "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend((id)v467[5], "count");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v43;
        v507 = 2112;
        v508 = (uint64_t)v44;
        v509 = 2112;
        v510 = (uint64_t)v6;
        v511 = 2048;
        v512 = v45;
        _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "%@, %@, distance matrix records exists for newly added workout uuid, %@, count, %lu, further processing, skipped", buf, 0x2Au);

      }
      v46 = (void *)v467[5];
      v467[5] = 0;

      if (!v423)
        goto LABEL_33;
      goto LABEL_32;
    }
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v519 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v519, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (id *)(v474 + 5);
    v461 = (id)v474[5];
    objc_msgSend(v47, "getWorkoutsWithUUIDs:error:", v48, &v461);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v49, v461);

    if (v474[5])
    {
      if (v423)
        goto LABEL_47;
      goto LABEL_48;
    }
    if (objc_msgSend(v50, "count") != 1)
    {
      v56 = (void *)MEMORY[0x1E0CB35C8];
      v517 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("newlyAddedWorkoutUUID cannot be found in healthKit, %lu"), objc_msgSend(v50, "count"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v518 = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v518, &v517, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v58);
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = (void *)v474[5];
      v474[5] = v59;

      if (v423)
LABEL_47:
        v423[2]();
LABEL_48:
      v40 = 0;
LABEL_49:

      goto LABEL_34;
    }
    objc_msgSend(v50, "firstObject");
    v414 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = -[RTWorkoutRouteManager distanceMetric](self, "distanceMetric");
    v52 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v414);
    v53 = objc_msgSend(v414, "workoutActivityType");
    v54 = (id *)(v474 + 5);
    v460 = (id)v474[5];
    -[RTWorkoutRouteManager _getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:](self, "_getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:", v51, v52, v53, &v460);
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v54, v460);
    if (v474[5])
    {
      if (v423)
        v423[2]();
      v55 = 0;
      v40 = 0;
      goto LABEL_163;
    }
    objc_msgSend(v414, "metadata");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "valueForKey:", *MEMORY[0x1E0CB7300]);
    v405 = (void *)objc_claimAutoreleasedReturnValue();

    if (v405)
      v409 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v405);
    else
      v409 = 0;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v63 = (objc_class *)objc_opt_class();
      NSStringFromClass(v63);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v65 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "timeIntervalSinceDate:", v420);
      v68 = v67;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v64;
      v507 = 2112;
      v508 = (uint64_t)v65;
      v509 = 2112;
      v510 = (uint64_t)v6;
      v511 = 2112;
      v512 = (uint64_t)v409;
      v513 = 2048;
      v514 = v68;
      v515 = 2048;
      v516 = v69;
      _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "%@, %@, workout uuid, %@, reference workout uuid, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = os_log_type_enabled(v70, OS_LOG_TYPE_INFO);
    if (v409)
    {
      if (v71)
      {
        v72 = (objc_class *)objc_opt_class();
        NSStringFromClass(v72);
        v73 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v73;
        v507 = 2112;
        v508 = (uint64_t)v74;
        v509 = 2112;
        v510 = (uint64_t)v6;
        v511 = 2112;
        v512 = (uint64_t)v409;
        _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_INFO, "%@, %@, case 1/2, matching workout uuid, %@, with its reference workout uuid, %@,", buf, 0x2Au);

      }
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v505 = v409;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v505, 1);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (id *)(v474 + 5);
      v459 = (id)v474[5];
      objc_msgSend(v75, "getWorkoutsWithUUIDs:error:", v76, &v459);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v77, v459);

      if (v474[5])
      {
        if (v423)
          v423[2]();
        v40 = 0;
        goto LABEL_162;
      }
      objc_msgSend(v55, "firstObject");
      v411 = (void *)objc_claimAutoreleasedReturnValue();

      v103 = objc_msgSend(v411, "workoutActivityType");
      if (v103 != objc_msgSend(v414, "workoutActivityType"))
      {
        v108 = (void *)MEMORY[0x1E0CB35C8];
        v503 = *MEMORY[0x1E0CB2D50];
        v109 = (void *)MEMORY[0x1E0CB3940];
        +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v411, "workoutActivityType"));
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v414, "workoutActivityType"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "stringWithFormat:", CFSTR("mismatched workout activity types, refrence workout UUID, %@, reference workout activity type, %@, refrence workout UUID, %@, newly added workout activity type, %@, "), v409, v110, v6, v111);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v504 = v112;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v504, &v503, 1);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v113);
        v114 = objc_claimAutoreleasedReturnValue();
        v115 = (void *)v474[5];
        v474[5] = v114;

        if (v423)
          ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v474[5]);
        v40 = 0;
        goto LABEL_131;
      }
      v502 = v409;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v502, 1);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = (id *)(v474 + 5);
      v458 = (id)v474[5];
      -[RTWorkoutRouteManager _getRemoteWorkoutClustersForWorkoutUUIDs:error:](self, "_getRemoteWorkoutClustersForWorkoutUUIDs:error:", v104, &v458);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v105, v458);

      if (v474[5])
      {
        if (v423)
          v423[2]();
LABEL_129:
        v40 = 0;
LABEL_130:

LABEL_131:
        v55 = 0;
LABEL_162:

LABEL_163:
        v50 = v55;
        goto LABEL_49;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v140 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
      {
        v141 = (objc_class *)objc_opt_class();
        NSStringFromClass(v141);
        v142 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v143 = (id)objc_claimAutoreleasedReturnValue();
        v144 = objc_msgSend(v106, "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v142;
        v507 = 2112;
        v508 = (uint64_t)v143;
        v509 = 2048;
        v510 = v144;
        _os_log_impl(&dword_1D1A22000, v140, OS_LOG_TYPE_INFO, "%@, %@, reference clusters count, %lu", buf, 0x20u);

      }
      if (objc_msgSend(v106, "count") != 1)
      {
        v158 = (void *)MEMORY[0x1E0CB35C8];
        v500 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reference cluster count is invalid, %lu, should be 1"), objc_msgSend(v106, "count"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v501 = v159;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v501, &v500, 1);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v160);
        v161 = objc_claimAutoreleasedReturnValue();
        v162 = (void *)v474[5];
        v474[5] = v161;

        if (v423)
          ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v474[5]);
        goto LABEL_129;
      }
      v145 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v419, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("does_reference_route_exist"));
      objc_msgSend(v106, "firstObject");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "bestWorkoutUUID");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = objc_msgSend(v147, "isEqual:", v409);

      v149 = MEMORY[0x1E0C9AAA0];
      if (v148)
        v150 = v145;
      else
        v150 = MEMORY[0x1E0C9AAA0];
      objc_msgSend(v419, "setObject:forKeyedSubscript:", v150, CFSTR("is_reference_route_best_route"));
      objc_msgSend(v106, "firstObject");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "lastWorkoutUUID");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = objc_msgSend(v152, "isEqual:", v409);

      if (v153)
        v154 = v145;
      else
        v154 = v149;
      objc_msgSend(v419, "setObject:forKeyedSubscript:", v154, CFSTR("is_reference_route_last_route"));
      objc_msgSend(v106, "firstObject");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = (id *)(v474 + 5);
      v457 = (id)v474[5];
      -[RTWorkoutRouteManager _getWorkoutUUIDsForCluster:error:](self, "_getWorkoutUUIDsForCluster:error:", v155, &v457);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v156, v457);

      if (v474[5])
      {
        if (v423)
          v423[2]();
LABEL_147:
        v40 = 0;
LABEL_148:

        goto LABEL_130;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v175 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v175, OS_LOG_TYPE_INFO))
      {
        v176 = (objc_class *)objc_opt_class();
        NSStringFromClass(v176);
        v177 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v178 = (id)objc_claimAutoreleasedReturnValue();
        v179 = objc_msgSend(v157, "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v177;
        v507 = 2112;
        v508 = (uint64_t)v178;
        v509 = 2048;
        v510 = v179;
        _os_log_impl(&dword_1D1A22000, v175, OS_LOG_TYPE_INFO, "%@, %@, reference cluster workout UUIDs count, %lu", buf, 0x20u);

      }
      if ((unint64_t)objc_msgSend(v157, "count") <= 1)
      {
        v180 = (void *)MEMORY[0x1E0CB35C8];
        v498 = *MEMORY[0x1E0CB2D50];
        v181 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v106, "firstObject");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "clusterUUID");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "stringWithFormat:", CFSTR("reference clusters with cluster uuid, %@, has %lu reference workout uuid, less than threshold, %lu"), v183, objc_msgSend(v157, "count"), 2);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        v499 = v184;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v499, &v498, 1);
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v185);
        v186 = objc_claimAutoreleasedReturnValue();
        v187 = (void *)v474[5];
        v474[5] = v186;

        if (v423)
          ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v474[5]);
        goto LABEL_147;
      }

      v188 = (void *)objc_opt_new();
      objc_msgSend(v188, "addObjectsFromArray:", v157);
      objc_msgSend(v414, "UUID");
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v188, "addObject:", v189);

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v190 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
      {
        v191 = (objc_class *)objc_opt_class();
        NSStringFromClass(v191);
        v192 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v193 = (id)objc_claimAutoreleasedReturnValue();
        v194 = objc_msgSend(v188, "count");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v192;
        v507 = 2112;
        v508 = (uint64_t)v193;
        v509 = 2048;
        v510 = v194;
        _os_log_impl(&dword_1D1A22000, v190, OS_LOG_TYPE_INFO, "%@, %@, workout UUIDs for processing count, %lu", buf, 0x20u);

      }
      v195 = (id *)(v474 + 5);
      v456 = (id)v474[5];
      -[RTWorkoutRouteManager _sortWorkoutUUIDsByDistance:error:](self, "_sortWorkoutUUIDsByDistance:error:", v188, &v456);
      v407 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v195, v456);
      if (v474[5])
      {
        if (v423)
          v423[2]();
        goto LABEL_228;
      }

      +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v414, "workoutActivityType"));
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v496 = v200;
      v497 = v407;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v497, &v496, 1);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v202 = (void *)objc_msgSend(v201, "mutableCopy");
      v203 = (id *)(v474 + 5);
      v455 = (id)v474[5];
      -[RTWorkoutRouteManager _processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:error:](self, "_processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:error:", v202, &v455);
      objc_storeStrong(v203, v455);

      if (v474[5])
      {
        if (v423)
          v423[2]();
LABEL_227:
        v188 = 0;
LABEL_228:
        v40 = 0;
LABEL_229:

        v106 = 0;
        goto LABEL_148;
      }
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v409);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      v231 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v414, "UUID");
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "setWithObject:", v232);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      v234 = +[RTHealthKitManager RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:](RTHealthKitManager, "RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:", objc_msgSend(v414, "workoutActivityType"));
      objc_msgSend(v410, "doubleValue");
      v235 = (id *)(v474 + 5);
      v454 = (id)v474[5];
      v236 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](self, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v230, v233, v234, &v454);
      objc_storeStrong(v235, v454);

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v237 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v237, OS_LOG_TYPE_INFO))
      {
        v238 = (objc_class *)objc_opt_class();
        NSStringFromClass(v238);
        v239 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v240 = objc_claimAutoreleasedReturnValue();
        v241 = (void *)v240;
        v242 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v239;
        v507 = 2112;
        if (v236)
          v242 = CFSTR("YES");
        v508 = v240;
        v509 = 2112;
        v510 = (uint64_t)v242;
        _os_log_impl(&dword_1D1A22000, v237, OS_LOG_TYPE_INFO, "%@, %@, isNewlyAddedWorkoutSimilarToReferenceWorkout, %@", buf, 0x20u);

      }
      if (v474[5])
      {
        if (v423)
          v423[2]();
        goto LABEL_227;
      }
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v157);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      v289 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v414, "UUID");
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v289, "setWithObject:", v290);
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      v292 = +[RTHealthKitManager RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:](RTHealthKitManager, "RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:", objc_msgSend(v414, "workoutActivityType"));
      objc_msgSend(v410, "doubleValue");
      v293 = (id *)(v474 + 5);
      v453 = (id)v474[5];
      v294 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](self, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v288, v291, v292, &v453);
      objc_storeStrong(v293, v453);

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v295 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v295, OS_LOG_TYPE_INFO))
      {
        v296 = (objc_class *)objc_opt_class();
        NSStringFromClass(v296);
        v297 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v298 = objc_claimAutoreleasedReturnValue();
        v299 = (void *)v298;
        v300 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v297;
        v507 = 2112;
        if (v294)
          v300 = CFSTR("YES");
        v508 = v298;
        v509 = 2112;
        v510 = (uint64_t)v300;
        _os_log_impl(&dword_1D1A22000, v295, OS_LOG_TYPE_INFO, "%@, %@, isNewlyAddedWorkoutSimilarToReferenceWorkoutAndItsCluster, %@", buf, 0x20u);

      }
      if (v474[5])
      {
        if (v423)
          v423[2]();
        goto LABEL_227;
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v236);
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v419, "setObject:forKeyedSubscript:", v303, CFSTR("is_new_workout_similar_to_reference_route"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v294);
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v419, "setObject:forKeyedSubscript:", v304, CFSTR("is_new_workout_clustered_reference_route"));

      if (v294)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v305 = (void *)objc_claimAutoreleasedReturnValue();

        v495 = v407;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v495, 1);
        v306 = (void *)objc_claimAutoreleasedReturnValue();
        v307 = (id *)(v474 + 5);
        v452 = (id)v474[5];
        v308 = -[RTWorkoutRouteManager _syncClustersToHealthKit:error:](self, "_syncClustersToHealthKit:error:", v306, &v452);
        objc_storeStrong(v307, v452);

        if (v474[5])
        {
          if (v423)
            v423[2]();
          v188 = 0;
          v157 = 0;
          v40 = 0;
          v420 = v305;
          goto LABEL_229;
        }
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v346 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v346, OS_LOG_TYPE_INFO))
        {
          v347 = (objc_class *)objc_opt_class();
          NSStringFromClass(v347);
          v348 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v349 = (id)objc_claimAutoreleasedReturnValue();
          if (v308)
            v350 = CFSTR("YES");
          else
            v350 = CFSTR("NO");
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v351 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "timeIntervalSinceDate:", v305);
          v353 = v352;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v348;
          v507 = 2112;
          v508 = (uint64_t)v349;
          v509 = 2112;
          v510 = (uint64_t)v350;
          v511 = 2048;
          v512 = v353;
          v513 = 2048;
          v514 = v354;
          _os_log_impl(&dword_1D1A22000, v346, OS_LOG_TYPE_INFO, "%@, %@, syncing clusters to HealthKit status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v420 = (void *)objc_claimAutoreleasedReturnValue();

        v355 = dispatch_semaphore_create(0);
        v449[0] = MEMORY[0x1E0C809B0];
        v449[1] = 3221225472;
        v449[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_125;
        v449[3] = &unk_1E9297038;
        v451 = &v473;
        v356 = v355;
        v450 = v356;
        -[RTWorkoutRouteManager _updateRelevanceScoresWithHandler:](self, "_updateRelevanceScoresWithHandler:", v449);
        dsema = v356;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v357 = (void *)objc_claimAutoreleasedReturnValue();
        v358 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(dsema, v358))
          goto LABEL_269;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v359, "timeIntervalSinceDate:", v357);
        v361 = v360;
        v362 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
        v363 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v364 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v364, "filteredArrayUsingPredicate:", v363);
        v365 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v365, "firstObject");
        v366 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v362, "submitToCoreAnalytics:type:duration:", v366, 1, v361);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v367 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v367, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v367, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v368 = (void *)MEMORY[0x1E0CB35C8];
        v488 = *MEMORY[0x1E0CB2D50];
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v488, 1);
        v369 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v368, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v369);
        v370 = (void *)objc_claimAutoreleasedReturnValue();

        if (v370)
        {
          v371 = objc_retainAutorelease(v370);

        }
        else
        {
LABEL_269:
          v371 = 0;
        }

        v372 = v371;
        v40 = v372;
        if (v372)
        {
          v373 = (uint64_t)v372;
LABEL_273:
          if (v423)
            ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v373);

          v188 = 0;
          v157 = 0;
          goto LABEL_229;
        }
        v373 = v474[5];
        if (v373)
          goto LABEL_273;
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v379 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v379, OS_LOG_TYPE_INFO))
        {
          v380 = (objc_class *)objc_opt_class();
          NSStringFromClass(v380);
          v381 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v382 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v383 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v383, "timeIntervalSinceDate:", v420);
          v385 = v384;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v381;
          v507 = 2112;
          v508 = (uint64_t)v382;
          v509 = 2048;
          v510 = v385;
          v511 = 2048;
          v512 = v386;
          _os_log_impl(&dword_1D1A22000, v379, OS_LOG_TYPE_INFO, "%@, %@, updateing relevance scores, status, done, latency, %.4f sec, footprint, %.4f MB", buf, 0x2Au);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v309 = objc_claimAutoreleasedReturnValue();

        v387 = (id *)(v474 + 5);
        v448 = (id)v474[5];
        v388 = -[RTWorkoutRouteManager _syncClustersToWatchWithLimit:error:](self, "_syncClustersToWatchWithLimit:error:", 100, &v448);
        objc_storeStrong(v387, v448);
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v389 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v389, OS_LOG_TYPE_INFO))
        {
          v390 = (objc_class *)objc_opt_class();
          NSStringFromClass(v390);
          v391 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v392 = (id)objc_claimAutoreleasedReturnValue();
          if (v388)
            v393 = CFSTR("YES");
          else
            v393 = CFSTR("NO");
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v394 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v394, "timeIntervalSinceDate:", v309);
          v396 = v395;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v391;
          v507 = 2112;
          v508 = (uint64_t)v392;
          v509 = 2048;
          v510 = 100;
          v511 = 2112;
          v512 = (uint64_t)v393;
          v513 = 2048;
          v514 = v396;
          v515 = 2048;
          v516 = v397;
          _os_log_impl(&dword_1D1A22000, v389, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

        }
      }
      else
      {
        v309 = (uint64_t)v420;
      }
      v310 = (void *)MEMORY[0x1E0CB37E8];
      +[RTRuntime footprint](RTRuntime, "footprint");
      objc_msgSend(v310, "numberWithDouble:", v311 - v12);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v419, "setObject:forKeyedSubscript:", v312, CFSTR("footprint_delta"));

      v313 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v314, "timeIntervalSinceDate:", v418);
      objc_msgSend(v313, "numberWithDouble:");
      v315 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v419, "setObject:forKeyedSubscript:", v315, CFSTR("time_elapsed_reference_route_cluster_check"));

      -[RTWorkoutRouteManager workoutMetricsManager](self, "workoutMetricsManager");
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      v494 = v419;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v494, 1);
      v317 = (void *)objc_claimAutoreleasedReturnValue();
      v318 = (id *)(v474 + 5);
      v447 = (id)v474[5];
      v319 = objc_msgSend(v316, "submitMetricsForEvent:data:error:", 2, v317, &v447);
      objc_storeStrong(v318, v447);

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v320 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR))
      {
        v374 = (objc_class *)objc_opt_class();
        NSStringFromClass(v374);
        v375 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v376 = (id)objc_claimAutoreleasedReturnValue();
        v377 = objc_msgSend(v419, "count");
        v378 = CFSTR("NO");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v375;
        v507 = 2112;
        if (v319)
          v378 = CFSTR("YES");
        v508 = (uint64_t)v376;
        v509 = 2112;
        v510 = (uint64_t)v378;
        v511 = 2048;
        v512 = v377;
        _os_log_error_impl(&dword_1D1A22000, v320, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);

      }
      if (v423)
        ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v474[5]);
      v188 = 0;
      v157 = 0;
      v40 = 0;
      v419 = 0;
      v420 = (void *)v309;
      goto LABEL_229;
    }
    if (v71)
    {
      v78 = (objc_class *)objc_opt_class();
      NSStringFromClass(v78);
      v79 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v80 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v79;
      v507 = 2112;
      v508 = (uint64_t)v80;
      v509 = 2112;
      v510 = (uint64_t)v6;
      _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_INFO, "%@, %@, case  2/2, reference workout UUID does not exist. Finding the next best cluster for workout uuid, %@", buf, 0x20u);

    }
    v488 = 0;
    v489 = &v488;
    v490 = 0x3032000000;
    v491 = __Block_byref_object_copy__133;
    v492 = __Block_byref_object_dispose__133;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v493 = (id)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
    {
      v82 = (objc_class *)objc_opt_class();
      NSStringFromClass(v82);
      v83 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v84 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v83;
      v507 = 2112;
      v508 = (uint64_t)v84;
      _os_log_impl(&dword_1D1A22000, v81, OS_LOG_TYPE_INFO, "%@, %@, fetching all clusters", buf, 0x16u);

    }
    v85 = dispatch_semaphore_create(0);

    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v443[0] = MEMORY[0x1E0C809B0];
    v443[1] = 3221225472;
    v443[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_126;
    v443[3] = &unk_1E9296EE0;
    v445 = &v488;
    v446 = &v473;
    v87 = v85;
    v444 = v87;
    objc_msgSend(v86, "fetchWorkoutClustersWithHandler:", v443);

    dsema = v87;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v89))
      goto LABEL_75;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "timeIntervalSinceDate:", v88);
    v92 = v91;
    v93 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v98, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v99 = (void *)MEMORY[0x1E0CB35C8];
    v521[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v521, 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      v102 = objc_retainAutorelease(v101);

    }
    else
    {
LABEL_75:
      v102 = 0;
    }

    v107 = v102;
    if (v107)
    {
      v40 = v107;
      if (v423)
        ((void (*)(void (**)(void), id))v423[2])(v423, v107);
      v55 = 0;
      goto LABEL_161;
    }
    if (v474[5])
    {
      if (v423)
        v423[2]();
      v55 = 0;
      v40 = 0;
      goto LABEL_161;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      v117 = (objc_class *)objc_opt_class();
      NSStringFromClass(v117);
      v118 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v119 = (id)objc_claimAutoreleasedReturnValue();
      v120 = objc_msgSend((id)v489[5], "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v118;
      v507 = 2112;
      v508 = (uint64_t)v119;
      v509 = 2048;
      v510 = v120;
      _os_log_impl(&dword_1D1A22000, v116, OS_LOG_TYPE_INFO, "%@, %@, all clusters count, %lu", buf, 0x20u);

    }
    v399 = (void *)objc_opt_new();
    v398 = (void *)objc_opt_new();
    v441 = 0u;
    v442 = 0u;
    v439 = 0u;
    v440 = 0u;
    v402 = (id)v489[5];
    v403 = objc_msgSend(v402, "countByEnumeratingWithState:objects:count:", &v439, v487, 16);
    if (v403)
    {
      v55 = 0;
      v121 = *(_QWORD *)v440;
LABEL_91:
      v122 = 0;
      while (1)
      {
        if (*(_QWORD *)v440 != v121)
          objc_enumerationMutation(v402);
        v123 = *(void **)(*((_QWORD *)&v439 + 1) + 8 * v122);
        v406 = (void *)MEMORY[0x1D8231EA8]();
        v124 = (id *)(v474 + 5);
        v438 = (id)v474[5];
        -[RTWorkoutRouteManager _getWorkoutUUIDsForCluster:error:](self, "_getWorkoutUUIDsForCluster:error:", v123, &v438);
        v412 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v124, v438);
        if (v474[5])
        {
          if (v423)
            v423[2]();
          v125 = 1;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
          {
            v127 = (objc_class *)objc_opt_class();
            NSStringFromClass(v127);
            v128 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v129 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "clusterUUID");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = objc_msgSend(v412, "count");
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v128;
            v507 = 2112;
            v508 = (uint64_t)v129;
            v509 = 2112;
            v510 = (uint64_t)v130;
            v511 = 2048;
            v512 = v131;
            _os_log_impl(&dword_1D1A22000, v126, OS_LOG_TYPE_INFO, "%@, %@, cluster with cluster uuid, %@, count of workouts in the cluster, %lu", buf, 0x2Au);

          }
          if (objc_msgSend(v412, "count"))
          {
            -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v412, "firstObject");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            v486 = v133;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v486, 1);
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = (id *)(v474 + 5);
            v437 = (id)v474[5];
            objc_msgSend(v132, "getWorkoutsWithUUIDs:error:", v134, &v437);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(v135, v437);

            if (v474[5])
            {
              if (v423)
                v423[2]();
              v125 = 1;
            }
            else
            {
              objc_msgSend(v136, "firstObject");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = objc_msgSend(v137, "workoutActivityType");
              LODWORD(v138) = v138 == objc_msgSend(v414, "workoutActivityType");

              if ((_DWORD)v138)
              {
                objc_msgSend(v399, "addObjectsFromArray:", v412);
                objc_msgSend(v123, "clusterUUID");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v398, "setObject:forKeyedSubscript:", v412, v139);

              }
              v125 = 0;
            }
            v55 = v136;
          }
          else
          {
            v125 = 7;
          }
        }

        objc_autoreleasePoolPop(v406);
        if (v125 != 7)
        {
          if (v125)
            goto LABEL_158;
        }
        if (v403 == ++v122)
        {
          v403 = objc_msgSend(v402, "countByEnumeratingWithState:objects:count:", &v439, v487, 16);
          if (v403)
            goto LABEL_91;
          goto LABEL_133;
        }
      }
    }
    v55 = 0;
LABEL_133:

    if ((unint64_t)objc_msgSend(v399, "count") <= 1)
    {
      v163 = (void *)MEMORY[0x1E0CB35C8];
      v484 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("workout uuids from cluster, %lu, is less than threshold, %lu"), objc_msgSend(v399, "count"), 2);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v485 = v164;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v485, &v484, 1);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v165);
      v166 = objc_claimAutoreleasedReturnValue();
      v167 = (void *)v474[5];
      v474[5] = v166;

      if (v423)
        ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v474[5]);
      v40 = 0;
      goto LABEL_160;
    }
    objc_msgSend(v414, "UUID");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v399, "addObject:", v168);

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v169 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
    {
      v170 = (objc_class *)objc_opt_class();
      NSStringFromClass(v170);
      v171 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v172 = (id)objc_claimAutoreleasedReturnValue();
      v173 = objc_msgSend(v399, "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v171;
      v507 = 2112;
      v508 = (uint64_t)v172;
      v509 = 2048;
      v510 = v173;
      _os_log_impl(&dword_1D1A22000, v169, OS_LOG_TYPE_INFO, "%@, %@, processing workout UUIDs from clusters plus newlyAddedWorkout count, %lu", buf, 0x20u);

    }
    v174 = (id *)(v474 + 5);
    v436 = (id)v474[5];
    -[RTWorkoutRouteManager _sortWorkoutUUIDsByDistance:error:](self, "_sortWorkoutUUIDsByDistance:error:", v399, &v436);
    v402 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v174, v436);
    if (v474[5])
    {
      if (v423)
        v423[2]();
LABEL_158:
      v40 = 0;
LABEL_159:

LABEL_160:
LABEL_161:

      _Block_object_dispose(&v488, 8);
      goto LABEL_162;
    }

    +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v414, "workoutActivityType"));
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v482 = v196;
    v483 = v402;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v483, &v482, 1);
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    v198 = (void *)objc_msgSend(v197, "mutableCopy");
    v199 = (id *)(v474 + 5);
    v435 = (id)v474[5];
    -[RTWorkoutRouteManager _processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:error:](self, "_processWorkoutsUsingActivityTypeToWorkoutUUIDsMap:error:", v198, &v435);
    objc_storeStrong(v199, v435);

    if (v474[5])
    {
      if (v423)
        v423[2]();
      v399 = 0;
      goto LABEL_158;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v204 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
    {
      v205 = (objc_class *)objc_opt_class();
      NSStringFromClass(v205);
      v206 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v207 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v206;
      v507 = 2112;
      v508 = (uint64_t)v207;
      _os_log_impl(&dword_1D1A22000, v204, OS_LOG_TYPE_INFO, "%@, %@, checking similarity", buf, 0x16u);

    }
    v400 = (void *)objc_opt_new();
    v433 = 0u;
    v434 = 0u;
    v431 = 0u;
    v432 = 0u;
    objc_msgSend(v398, "allValues");
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    v408 = (void *)objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v431, v481, 16);
    if (v408)
    {
      v404 = *(_QWORD *)v432;
LABEL_171:
      v208 = 0;
      while (1)
      {
        if (*(_QWORD *)v432 != v404)
          objc_enumerationMutation(v401);
        v209 = *(_QWORD *)(*((_QWORD *)&v431 + 1) + 8 * v208);
        v413 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v209);
        v210 = (void *)objc_claimAutoreleasedReturnValue();
        v211 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v414, "UUID");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v211, "setWithObject:", v212);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        v214 = +[RTHealthKitManager RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:](RTHealthKitManager, "RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:", objc_msgSend(v414, "workoutActivityType"));
        objc_msgSend(v410, "doubleValue");
        v215 = (id *)(v474 + 5);
        v430 = (id)v474[5];
        v216 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](self, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v210, v213, v214, &v430);
        objc_storeStrong(v215, v430);

        if (v474[5])
        {
          if (v423)
            v423[2]();
          v217 = 0;
          v218 = 1;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v219 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
          {
            v220 = (objc_class *)objc_opt_class();
            NSStringFromClass(v220);
            v221 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v222 = (id)objc_claimAutoreleasedReturnValue();
            v223 = v222;
            *(_DWORD *)buf = 138412802;
            v224 = CFSTR("NO");
            if (v216)
              v224 = CFSTR("YES");
            *(_QWORD *)&buf[4] = v221;
            v507 = 2112;
            v508 = (uint64_t)v222;
            v509 = 2112;
            v510 = (uint64_t)v224;
            _os_log_impl(&dword_1D1A22000, v219, OS_LOG_TYPE_INFO, "%@, %@, isNewlyAddedWorkoutSimilarToCluster,  %@", buf, 0x20u);

          }
          if (v216)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v209);
            v225 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v225, "addObject:", v6);
            v217 = 0;
            v218 = 8;
            v400 = v225;
          }
          else
          {
            v218 = 0;
            v217 = 1;
          }
        }
        objc_autoreleasePoolPop(v413);
        if (!v217)
          break;
        if (v408 == (void *)++v208)
        {
          v408 = (void *)objc_msgSend(v401, "countByEnumeratingWithState:objects:count:", &v431, v481, 16);
          if (v408)
            goto LABEL_171;
          goto LABEL_188;
        }
      }

      if ((v218 | 8) == 8)
        goto LABEL_190;
      v40 = 0;
      goto LABEL_237;
    }
LABEL_188:

LABEL_190:
    if (objc_msgSend(v400, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v226 = (void *)objc_claimAutoreleasedReturnValue();

      v480 = v400;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v480, 1);
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      v228 = (id *)(v474 + 5);
      v429 = (id)v474[5];
      v229 = -[RTWorkoutRouteManager _syncClustersToHealthKit:error:](self, "_syncClustersToHealthKit:error:", v227, &v429);
      objc_storeStrong(v228, v429);

      if (v474[5])
      {
        if (v423)
          v423[2]();
        v40 = 0;
        v420 = v226;
LABEL_237:

        v399 = 0;
        goto LABEL_159;
      }

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v262 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v262, OS_LOG_TYPE_INFO))
      {
        v263 = (objc_class *)objc_opt_class();
        NSStringFromClass(v263);
        v264 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v265 = (id)objc_claimAutoreleasedReturnValue();
        if (v229)
          v266 = CFSTR("YES");
        else
          v266 = CFSTR("NO");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "timeIntervalSinceDate:", v226);
        v269 = v268;
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v264;
        v507 = 2112;
        v508 = (uint64_t)v265;
        v509 = 2112;
        v510 = (uint64_t)v266;
        v511 = 2048;
        v512 = v269;
        v513 = 2048;
        v514 = v270;
        _os_log_impl(&dword_1D1A22000, v262, OS_LOG_TYPE_INFO, "%@, %@, syncing clusters to HealthKit status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v420 = (void *)objc_claimAutoreleasedReturnValue();

      v271 = dispatch_semaphore_create(0);
      v426[0] = MEMORY[0x1E0C809B0];
      v426[1] = 3221225472;
      v426[2] = __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_129;
      v426[3] = &unk_1E9297038;
      v428 = &v473;
      v272 = v271;
      v427 = v272;
      -[RTWorkoutRouteManager _updateRelevanceScoresWithHandler:](self, "_updateRelevanceScoresWithHandler:", v426);
      dsema = v272;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v274))
        goto LABEL_230;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v275, "timeIntervalSinceDate:", v273);
      v277 = v276;
      v278 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
      v279 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "filteredArrayUsingPredicate:", v279);
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "firstObject");
      v282 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v278, "submitToCoreAnalytics:type:duration:", v282, 1, v277);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v283 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v283, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v283, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v284 = (void *)MEMORY[0x1E0CB35C8];
      v521[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v521, 1);
      v285 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v285);
      v286 = (void *)objc_claimAutoreleasedReturnValue();

      if (v286)
      {
        v287 = objc_retainAutorelease(v286);

      }
      else
      {
LABEL_230:
        v287 = 0;
      }

      v301 = v287;
      v40 = v301;
      if (v301)
      {
        v302 = (uint64_t)v301;
LABEL_234:
        if (v423)
          ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v302);

        v400 = 0;
        goto LABEL_237;
      }
      v302 = v474[5];
      if (v302)
        goto LABEL_234;
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v321 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v321, OS_LOG_TYPE_INFO))
      {
        v322 = (objc_class *)objc_opt_class();
        NSStringFromClass(v322);
        v323 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v324 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v325 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v325, "timeIntervalSinceDate:", v420);
        v327 = v326;
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v323;
        v507 = 2112;
        v508 = (uint64_t)v324;
        v509 = 2048;
        v510 = v327;
        v511 = 2048;
        v512 = v328;
        _os_log_impl(&dword_1D1A22000, v321, OS_LOG_TYPE_INFO, "%@, %@, updating relevance scores, status, done, latency, %.4f sec, footprint, %.4f MB", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v329 = objc_claimAutoreleasedReturnValue();

      v330 = (id *)(v474 + 5);
      v425 = (id)v474[5];
      v331 = -[RTWorkoutRouteManager _syncClustersToWatchWithLimit:error:](self, "_syncClustersToWatchWithLimit:error:", 100, &v425);
      objc_storeStrong(v330, v425);
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v332 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v332, OS_LOG_TYPE_INFO))
      {
        v333 = (objc_class *)objc_opt_class();
        NSStringFromClass(v333);
        v334 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v335 = (id)objc_claimAutoreleasedReturnValue();
        if (v331)
          v336 = CFSTR("YES");
        else
          v336 = CFSTR("NO");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v337 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v337, "timeIntervalSinceDate:", v329);
        v339 = v338;
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v334;
        v507 = 2112;
        v508 = (uint64_t)v335;
        v509 = 2048;
        v510 = 100;
        v511 = 2112;
        v512 = (uint64_t)v336;
        v513 = 2048;
        v514 = v339;
        v515 = 2048;
        v516 = v340;
        _os_log_impl(&dword_1D1A22000, v332, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

      }
      objc_msgSend(v419, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("is_new_workout_clustered_other"));

      v400 = 0;
      v420 = (void *)v329;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v243 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v243, OS_LOG_TYPE_INFO))
      {
        v244 = (objc_class *)objc_opt_class();
        NSStringFromClass(v244);
        v245 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v246 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v247, "timeIntervalSinceDate:", v420);
        v249 = v248;
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v245;
        v507 = 2112;
        v508 = (uint64_t)v246;
        v509 = 2112;
        v510 = (uint64_t)v6;
        v511 = 2048;
        v512 = v249;
        v513 = 2048;
        v514 = v250;
        _os_log_impl(&dword_1D1A22000, v243, OS_LOG_TYPE_INFO, "%@, %@, couldn't find best cluster for the new workout, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

      }
      objc_msgSend(v419, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("is_new_workout_clustered_other"));
    }
    v251 = (void *)MEMORY[0x1E0CB37E8];
    +[RTRuntime footprint](RTRuntime, "footprint");
    objc_msgSend(v251, "numberWithDouble:", v252 - v12);
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v419, "setObject:forKeyedSubscript:", v253, CFSTR("footprint_delta"));

    v254 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "timeIntervalSinceDate:", v418);
    objc_msgSend(v254, "numberWithDouble:");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v419, "setObject:forKeyedSubscript:", v256, CFSTR("time_elapsed_mini_worldbuild_check"));

    -[RTWorkoutRouteManager workoutMetricsManager](self, "workoutMetricsManager");
    v257 = (void *)objc_claimAutoreleasedReturnValue();
    v479 = v419;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v479, 1);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    v259 = (id *)(v474 + 5);
    v424 = (id)v474[5];
    v260 = objc_msgSend(v257, "submitMetricsForEvent:data:error:", 2, v258, &v424);
    objc_storeStrong(v259, v424);

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v261 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR))
    {
      v341 = (objc_class *)objc_opt_class();
      NSStringFromClass(v341);
      v342 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v343 = (id)objc_claimAutoreleasedReturnValue();
      v344 = objc_msgSend(v419, "count");
      v345 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v342;
      v507 = 2112;
      if (v260)
        v345 = CFSTR("YES");
      v508 = (uint64_t)v343;
      v509 = 2112;
      v510 = (uint64_t)v345;
      v511 = 2048;
      v512 = v344;
      _os_log_error_impl(&dword_1D1A22000, v261, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);

    }
    if (v423)
      ((void (*)(void (**)(void), uint64_t))v423[2])(v423, v474[5]);
    v40 = 0;
    v419 = 0;
    goto LABEL_237;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: newlyAddedWorkoutUUID", buf, 2u);
  }

LABEL_37:
}

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_125(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_126(uint64_t a1, void *a2, void *a3)
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

void __59__RTWorkoutRouteManager__processNewlyAddedWorkout_handler___block_invoke_129(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)_updateRelevanceScoresWithHandler:(id)a3
{
  double v3;
  double v4;
  NSObject *v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
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
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void (**v34)(void);
  uint64_t v35;
  objc_class *v36;
  id v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  objc_class *v41;
  id v42;
  id v43;
  id *v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  objc_class *v48;
  id v49;
  void *v50;
  objc_class *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id *v59;
  NSObject *v60;
  objc_class *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id *v68;
  uint64_t v69;
  NSObject *v70;
  NSObject *v71;
  uint64_t v72;
  objc_class *v73;
  id v74;
  id v75;
  void *v76;
  NSObject *v77;
  objc_class *v78;
  id v79;
  id v80;
  NSObject *v81;
  objc_class *v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  dispatch_semaphore_t v91;
  void *v92;
  void *v93;
  NSObject *v94;
  void *v95;
  dispatch_time_t v96;
  id v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id *v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  id *v119;
  double v120;
  double v121;
  NSObject *v122;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  double v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  double v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  id *v151;
  NSObject *v152;
  objc_class *v153;
  id v154;
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  objc_class *v161;
  id v162;
  void *v163;
  uint64_t v164;
  objc_class *v165;
  id v166;
  void *v167;
  uint64_t v168;
  objc_class *v169;
  id v170;
  void *v171;
  uint64_t v172;
  objc_class *v173;
  id v174;
  id v175;
  uint64_t v176;
  objc_class *v177;
  id v178;
  void *v179;
  uint64_t v180;
  NSObject *v181;
  objc_class *v182;
  id v183;
  id v184;
  void *v185;
  uint64_t v186;
  uint64_t v187;
  double v188;
  void *v189;
  void *v190;
  id *v191;
  _BOOL4 v192;
  NSObject *v193;
  void *v194;
  NSObject *v195;
  objc_class *v196;
  id v197;
  id v198;
  const __CFString *v199;
  void *v200;
  double v201;
  double v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  void *v206;
  NSObject *v207;
  void *v208;
  double v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  id *v216;
  int v217;
  NSObject *v218;
  objc_class *v219;
  id v220;
  void *v221;
  uint64_t v222;
  objc_class *v223;
  id v224;
  void *v225;
  uint64_t v226;
  objc_class *v227;
  id v228;
  void *v229;
  uint64_t v230;
  objc_class *v231;
  id v232;
  id v233;
  uint64_t v234;
  const __CFString *v235;
  objc_class *v236;
  id v237;
  id v238;
  uint64_t v239;
  char v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  void *v244;
  id v245;
  uint64_t v246;
  uint64_t v247;
  void *context;
  void *v249;
  void *v251;
  uint64_t v252;
  uint64_t v253;
  void (**v254)(void);
  void *v255;
  void *v256;
  void *v258;
  NSObject *dsema;
  id v260;
  id v261;
  id v262;
  id v263;
  id v264;
  _QWORD v265[4];
  NSObject *v266;
  uint64_t *v267;
  uint64_t *v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  id v273;
  id v274;
  id obj;
  _QWORD v276[4];
  NSObject *v277;
  uint64_t *v278;
  uint64_t *v279;
  uint64_t v280;
  uint64_t *v281;
  uint64_t v282;
  uint64_t (*v283)(uint64_t, uint64_t);
  void (*v284)(uint64_t);
  id v285;
  uint64_t v286;
  uint64_t *v287;
  uint64_t v288;
  uint64_t (*v289)(uint64_t, uint64_t);
  void (*v290)(uint64_t);
  id v291;
  void *v292;
  _BYTE buf[12];
  __int16 v294;
  id v295;
  __int16 v296;
  uint64_t v297;
  __int16 v298;
  uint64_t v299;
  __int16 v300;
  double v301;
  __int16 v302;
  uint64_t v303;
  void *v304;
  uint64_t v305;
  uint64_t *v306;
  uint64_t v307;
  uint64_t (*v308)(uint64_t, uint64_t);
  void (*v309)(uint64_t);
  id v310;
  _BYTE v311[128];
  _QWORD v312[4];

  v312[1] = *MEMORY[0x1E0C80C00];
  v254 = (void (**)(void))a3;
  context = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTRuntime footprint](RTRuntime, "footprint");
  v4 = v3;
  v256 = (void *)objc_opt_new();
  v286 = 0;
  v287 = &v286;
  v288 = 0x3032000000;
  v289 = __Block_byref_object_copy__133;
  v290 = __Block_byref_object_dispose__133;
  v291 = (id)objc_opt_new();
  v280 = 0;
  v281 = &v280;
  v282 = 0x3032000000;
  v283 = __Block_byref_object_copy__133;
  v284 = __Block_byref_object_dispose__133;
  v285 = 0;
  v258 = (void *)objc_opt_new();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v7;
    v294 = 2112;
    v295 = v8;
    v296 = 2048;
    v297 = v9;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, fetching workout clusters, footprint, %.4f MB", buf, 0x20u);

  }
  v10 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v276[0] = MEMORY[0x1E0C809B0];
  v276[1] = 3221225472;
  v276[2] = __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke;
  v276[3] = &unk_1E92A3538;
  v278 = &v280;
  v12 = v10;
  v277 = v12;
  v279 = &v286;
  objc_msgSend(v11, "fetchWorkoutClustersWithHandler:", v276);

  dsema = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v14))
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v305 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v305, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

  }
  else
  {
LABEL_8:
    v27 = 0;
  }

  v28 = v27;
  if (v28)
  {
    v29 = v28;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v49;
      v294 = 2112;
      v295 = v50;
      v296 = 2112;
      v297 = (uint64_t)v29;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

    }
    if (v254)
      v254[2]();
    goto LABEL_48;
  }
  v31 = v281[5];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v61 = (objc_class *)objc_opt_class();
      NSStringFromClass(v61);
      v62 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v281[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v62;
      v294 = 2112;
      v295 = v63;
      v296 = 2112;
      v297 = v64;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

    }
    v34 = v254;
    if (!v254)
      goto LABEL_32;
    v35 = v281[5];
LABEL_31:
    ((void (*)(void (**)(void), uint64_t))v34[2])(v34, v35);
LABEL_32:
    v29 = 0;
    goto LABEL_48;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend((id)v287[5], "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v37;
    v294 = 2112;
    v295 = v38;
    v296 = 2048;
    v297 = v39;
    _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%@, %@, clusters count, %lu", buf, 0x20u);

  }
  if (!objc_msgSend((id)v287[5], "count"))
  {
    v35 = 0;
    v34 = v254;
    goto LABEL_31;
  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v43 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v42;
    v294 = 2112;
    v295 = v43;
    _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%@, %@, getting current location", buf, 0x16u);

  }
  v44 = (id *)(v281 + 5);
  obj = (id)v281[5];
  -[RTWorkoutRouteManager _getRelevanceLocationWithError:](self, "_getRelevanceLocationWithError:", &obj);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v44, obj);
  v45 = v281[5];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v45)
  {
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v177 = (objc_class *)objc_opt_class();
      NSStringFromClass(v177);
      v178 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v281[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v178;
      v294 = 2112;
      v295 = v179;
      v296 = 2112;
      v297 = v180;
      _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

    }
    if (v254)
      v254[2]();
    v29 = 0;
    goto LABEL_47;
  }
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v51 = (objc_class *)objc_opt_class();
    NSStringFromClass(v51);
    v52 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v52;
    v294 = 2112;
    v295 = v53;
    v296 = 2112;
    v297 = (uint64_t)v244;
    _os_log_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_INFO, "%@, %@, current location, %@", buf, 0x20u);

  }
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "_getWorkoutDefaultStartDateForRaceRoute");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "_getRTWorkoutDefaultTypesForRaceRoute");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (id *)(v281 + 5);
  v274 = (id)v281[5];
  objc_msgSend(v54, "getLatestWorkoutWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v56, 0, 1, 0, v58, &v274, 1.79769313e308);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v59, v274);

  if (v281[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v219 = (objc_class *)objc_opt_class();
      NSStringFromClass(v219);
      v220 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v222 = v281[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v220;
      v294 = 2112;
      v295 = v221;
      v296 = 2112;
      v297 = v222;
      _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

    }
    if (v254)
      v254[2]();
LABEL_45:
    v29 = 0;
    v72 = (uint64_t)v251;
    goto LABEL_46;
  }
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "_getWorkoutDefaultStartDateForRaceRoute");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (id *)(v281 + 5);
  v273 = (id)v281[5];
  v242 = objc_msgSend(v65, "getWorkoutsCountWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:error:", v67, 0, 1, 0, &v273, 1.79769313e308);
  objc_storeStrong(v68, v273);

  v69 = v281[5];
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v70 = objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v69)
  {
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v223 = (objc_class *)objc_opt_class();
      NSStringFromClass(v223);
      v224 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      v226 = v281[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v224;
      v294 = 2112;
      v295 = v225;
      v296 = 2112;
      v297 = v226;
      _os_log_error_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

    }
    if (v254)
      v254[2]();
    goto LABEL_45;
  }
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    v73 = (objc_class *)objc_opt_class();
    NSStringFromClass(v73);
    v74 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v75 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v243, "UUID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v74;
    v294 = 2112;
    v295 = v75;
    v296 = 2112;
    v297 = (uint64_t)v76;
    _os_log_impl(&dword_1D1A22000, v71, OS_LOG_TYPE_INFO, "%@, %@, latest workout across all workouts, %@", buf, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    v78 = (objc_class *)objc_opt_class();
    NSStringFromClass(v78);
    v79 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v80 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v79;
    v294 = 2112;
    v295 = v80;
    v296 = 2048;
    v297 = v242;
    _os_log_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_INFO, "%@, %@, count of all workouts, %lu", buf, 0x20u);

  }
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
  {
    v82 = (objc_class *)objc_opt_class();
    NSStringFromClass(v82);
    v83 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v84 = (id)objc_claimAutoreleasedReturnValue();
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v83;
    v294 = 2112;
    v295 = v84;
    v296 = 2048;
    v297 = v85;
    _os_log_impl(&dword_1D1A22000, v81, OS_LOG_TYPE_INFO, "%@, %@, updating relevance score, footprint, %.4f MB", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v287[5], "count"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v256, "setObject:forKeyedSubscript:", v86, CFSTR("count_clusters_existing"));

  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  objc_msgSend(v256, "setObject:forKeyedSubscript:", &unk_1E93290A8);
  v271 = 0u;
  v272 = 0u;
  v269 = 0u;
  v270 = 0u;
  v245 = (id)v287[5];
  v87 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v269, v311, 16);
  if (!v87)
  {
    v240 = 0;
    v241 = 0;
    v29 = 0;
    goto LABEL_112;
  }
  v240 = 0;
  v241 = 0;
  v29 = 0;
  v252 = *(_QWORD *)v270;
  v246 = *MEMORY[0x1E0D18598];
  v247 = *MEMORY[0x1E0CB2D50];
  do
  {
    v88 = 0;
    v89 = v29;
    v253 = v87;
    do
    {
      if (*(_QWORD *)v270 != v252)
        objc_enumerationMutation(v245);
      v90 = *(void **)(*((_QWORD *)&v269 + 1) + 8 * v88);
      v255 = (void *)MEMORY[0x1D8231EA8]();
      v305 = 0;
      v306 = &v305;
      v307 = 0x3032000000;
      v308 = __Block_byref_object_copy__133;
      v309 = __Block_byref_object_dispose__133;
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v310 = (id)objc_claimAutoreleasedReturnValue();
      v91 = dispatch_semaphore_create(0);

      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "clusterUUID");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v265[0] = MEMORY[0x1E0C809B0];
      v265[1] = 3221225472;
      v265[2] = __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke_131;
      v265[3] = &unk_1E9296EE0;
      v267 = &v280;
      v268 = &v305;
      v94 = v91;
      v266 = v94;
      objc_msgSend(v92, "fetchWorkoutUUIDsForClusterUUID:handler:", v93, v265);

      dsema = v94;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = dispatch_time(0, 3600000000000);
      v97 = v89;
      if (dispatch_semaphore_wait(dsema, v96))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "timeIntervalSinceDate:", v95);
        v100 = v99;
        v101 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "filteredArrayUsingPredicate:", v102);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "firstObject");
        v105 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v101, "submitToCoreAnalytics:type:duration:", v105, 1, v100);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v107 = (void *)MEMORY[0x1E0CB35C8];
        v312[0] = v247;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v312, 1);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "errorWithDomain:code:userInfo:", v246, 15, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        v97 = v89;
        if (v109)
        {
          v97 = objc_retainAutorelease(v109);

        }
      }

      v29 = v97;
      if (!v258 || !v281[5])
      {
        -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "lastWorkoutUUID");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v304 = v113;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v304, 1);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = (id *)(v281 + 5);
        v264 = (id)v281[5];
        objc_msgSend(v112, "getWorkoutsWithUUIDs:error:", v114, &v264);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v115, v264);

        if (v258 && v281[5])
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v116 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
          {
            v165 = (objc_class *)objc_opt_class();
            NSStringFromClass(v165);
            v166 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            v168 = v281[5];
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v166;
            v294 = 2112;
            v295 = v167;
            v296 = 2112;
            v297 = v168;
            _os_log_error_impl(&dword_1D1A22000, v116, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

          }
          objc_msgSend(v258, "addObject:", v281[5]);
          v117 = (void *)v281[5];
          v281[5] = 0;
        }
        else
        {
          objc_msgSend(v111, "firstObject");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v306[5];
          v119 = (id *)(v281 + 5);
          v263 = (id)v281[5];
          -[RTWorkoutRouteManager _relevanceScoreForWorkoutUUIDs:representativeWorkout:latestWorkoutAcrossAllWorkouts:countOfAllWorkouts:currentLocation:error:](self, "_relevanceScoreForWorkoutUUIDs:representativeWorkout:latestWorkoutAcrossAllWorkouts:countOfAllWorkouts:currentLocation:error:", v118, v117, v243, v242, v244, &v263);
          v121 = v120;
          objc_storeStrong(v119, v263);
          if (v258 && v281[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              v169 = (objc_class *)objc_opt_class();
              NSStringFromClass(v169);
              v170 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              v172 = v281[5];
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v170;
              v294 = 2112;
              v295 = v171;
              v296 = 2112;
              v297 = v172;
              _os_log_error_impl(&dword_1D1A22000, v122, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(v90, "relevanceValue");
            v123 = (void *)MEMORY[0x1E0CB37E8];
            if (v124 == 0.0)
            {
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_existing_zero_relevance"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "numberWithUnsignedInteger:", objc_msgSend(v125, "unsignedIntegerValue") + 1);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v126, CFSTR("count_clusters_existing_zero_relevance"));
            }
            else
            {
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_existing_greaterthanzero_relevance"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "numberWithUnsignedInteger:", objc_msgSend(v125, "unsignedIntegerValue") + 1);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v126, CFSTR("count_clusters_existing_greaterthanzero_relevance"));
            }

            objc_msgSend(v90, "relevanceValue");
            if (v127 == v121)
            {
              v128 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_relevance_score_not_updated"));
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v128, "numberWithUnsignedInteger:", objc_msgSend(v129, "unsignedIntegerValue") + 1);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v130, CFSTR("count_clusters_relevance_score_not_updated"));
            }
            else
            {
              objc_msgSend(v90, "relevanceValue");
              v131 = (void *)MEMORY[0x1E0CB37E8];
              if (v132 >= v121)
              {
                objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_relevance_decreased"));
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "numberWithUnsignedInteger:", objc_msgSend(v133, "unsignedIntegerValue") + 1);
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v256, "setObject:forKeyedSubscript:", v134, CFSTR("count_clusters_relevance_decreased"));
              }
              else
              {
                objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_relevance_increased"));
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "numberWithUnsignedInteger:", objc_msgSend(v133, "unsignedIntegerValue") + 1);
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v256, "setObject:forKeyedSubscript:", v134, CFSTR("count_clusters_relevance_increased"));
              }

              v135 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_relevance_score_updated"));
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "numberWithUnsignedInteger:", objc_msgSend(v129, "unsignedIntegerValue") + 1);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v130, CFSTR("count_clusters_relevance_score_updated"));
            }

            v136 = (void *)MEMORY[0x1E0CB37E8];
            if (v121 == 0.0)
            {
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_new_zero_relevance"));
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "numberWithUnsignedInteger:", objc_msgSend(v137, "unsignedIntegerValue") + 1);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v138, CFSTR("count_clusters_new_zero_relevance"));
            }
            else
            {
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_new_greaterthanzero_relevance"));
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v136, "numberWithUnsignedInteger:", objc_msgSend(v137, "unsignedIntegerValue") + 1);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v138, CFSTR("count_clusters_new_greaterthanzero_relevance"));
            }

            objc_msgSend(v90, "relevanceValue");
            if (v139 == 0.0 && v121 > 0.0)
            {
              v140 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_zero_to_relevance"));
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "numberWithUnsignedInteger:", objc_msgSend(v141, "unsignedIntegerValue") + 1);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v142, CFSTR("count_clusters_zero_to_relevance"));

            }
            objc_msgSend(v90, "relevanceValue");
            if (v121 == 0.0 && v143 > 0.0)
            {
              v144 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("count_clusters_relevance_to_zero"));
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "numberWithUnsignedInteger:", objc_msgSend(v145, "unsignedIntegerValue") + 1);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v256, "setObject:forKeyedSubscript:", v146, CFSTR("count_clusters_relevance_to_zero"));

            }
            objc_msgSend(v90, "relevanceValue");
            if (v121 != v147)
            {
              -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "clusterUUID");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v121);
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              v151 = (id *)(v281 + 5);
              v262 = (id)v281[5];
              objc_msgSend(v148, "updateWorkoutClusterWithUUID:newBestWorkoutUUID:newLastWorkoutUUID:newRelevance:newWorkoutAssociations:workoutAssociationsToRemove:error:", v149, 0, 0, v150, 0, 0, &v262);
              objc_storeStrong(v151, v262);

              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v152 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
              {
                v153 = (objc_class *)objc_opt_class();
                NSStringFromClass(v153);
                v154 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v155 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "clusterUUID");
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "relevanceValue");
                v158 = v157;
                +[RTRuntime footprint](RTRuntime, "footprint");
                *(_DWORD *)buf = 138413570;
                *(_QWORD *)&buf[4] = v154;
                v294 = 2112;
                v295 = v155;
                v296 = 2112;
                v297 = (uint64_t)v156;
                v298 = 2048;
                v299 = v158;
                v300 = 2048;
                v301 = v121;
                v302 = 2048;
                v303 = v159;
                _os_log_impl(&dword_1D1A22000, v152, OS_LOG_TYPE_INFO, "%@, %@, relevance score updated for cluster with clusterUUID, %@, old relevance score, %.3f, new relevance score, %.3f, footprint, %.4f MB", buf, 0x3Eu);

              }
              ++v241;
              v240 = 1;
            }
            if (!v258 || !v281[5])
              goto LABEL_107;
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
            {
              v173 = (objc_class *)objc_opt_class();
              NSStringFromClass(v173);
              v174 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v175 = (id)objc_claimAutoreleasedReturnValue();
              v176 = v281[5];
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v174;
              v294 = 2112;
              v295 = v175;
              v296 = 2112;
              v297 = v176;
              _os_log_error_impl(&dword_1D1A22000, v122, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

            }
          }

          objc_msgSend(v258, "addObject:", v281[5]);
          v160 = (void *)v281[5];
          v281[5] = 0;

        }
LABEL_107:

        goto LABEL_108;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        v161 = (objc_class *)objc_opt_class();
        NSStringFromClass(v161);
        v162 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = v281[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v162;
        v294 = 2112;
        v295 = v163;
        v296 = 2112;
        v297 = v164;
        _os_log_error_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

      }
      objc_msgSend(v258, "addObject:", v281[5]);
      v111 = (void *)v281[5];
      v281[5] = 0;
LABEL_108:

      _Block_object_dispose(&v305, 8);
      objc_autoreleasePoolPop(v255);
      ++v88;
      v89 = v29;
    }
    while (v253 != v88);
    v87 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v269, v311, 16);
  }
  while (v87);
LABEL_112:

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v181 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
  {
    v182 = (objc_class *)objc_opt_class();
    NSStringFromClass(v182);
    v183 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v184 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "timeIntervalSinceDate:", v251);
    v187 = v186;
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v183;
    v294 = 2112;
    v295 = v184;
    v296 = 2048;
    v297 = v241;
    v298 = 2048;
    v299 = v187;
    v300 = 2048;
    v301 = v188;
    _os_log_impl(&dword_1D1A22000, v181, OS_LOG_TYPE_INFO, "%@, %@, updated relevance score for %lu clusters, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

  }
  v189 = (void *)v287[5];
  v287[5] = 0;

  if ((v240 & 1) != 0)
  {
    v190 = (void *)MEMORY[0x1D8231EA8]();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v72 = objc_claimAutoreleasedReturnValue();

    v191 = (id *)(v281 + 5);
    v261 = (id)v281[5];
    v192 = -[RTWorkoutRouteManager _syncClustersToWatchWithLimit:error:](self, "_syncClustersToWatchWithLimit:error:", 100, &v261);
    objc_storeStrong(v191, v261);
    if (v258 && v281[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v193 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v193, OS_LOG_TYPE_ERROR))
      {
        v236 = (objc_class *)objc_opt_class();
        NSStringFromClass(v236);
        v237 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v238 = (id)objc_claimAutoreleasedReturnValue();
        v239 = v281[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v237;
        v294 = 2112;
        v295 = v238;
        v296 = 2112;
        v297 = v239;
        _os_log_error_impl(&dword_1D1A22000, v193, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

      }
      objc_msgSend(v258, "addObject:", v281[5]);
      v194 = (void *)v281[5];
      v281[5] = 0;

    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v195 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v195, OS_LOG_TYPE_INFO))
    {
      v196 = (objc_class *)objc_opt_class();
      NSStringFromClass(v196);
      v197 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v198 = (id)objc_claimAutoreleasedReturnValue();
      if (v192)
        v199 = CFSTR("YES");
      else
        v199 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "timeIntervalSinceDate:", v72);
      v202 = v201;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)&buf[4] = v197;
      v294 = 2112;
      v295 = v198;
      v296 = 2048;
      v297 = 100;
      v298 = 2112;
      v299 = (uint64_t)v199;
      v300 = 2048;
      v301 = v202;
      v302 = 2048;
      v303 = v203;
      _os_log_impl(&dword_1D1A22000, v195, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

    }
    objc_autoreleasePoolPop(v190);
  }
  else
  {
    v72 = (uint64_t)v251;
  }
  if (objc_msgSend(v258, "count"))
  {
    _RTSafeArray();
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v205 = objc_claimAutoreleasedReturnValue();
    v206 = (void *)v281[5];
    v281[5] = v205;

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v207 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
    {
      v227 = (objc_class *)objc_opt_class();
      NSStringFromClass(v227);
      v228 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      v230 = v281[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v228;
      v294 = 2112;
      v295 = v229;
      v296 = 2112;
      v297 = v230;
      _os_log_error_impl(&dword_1D1A22000, v207, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

    }
    if (v254)
      ((void (*)(void (**)(void)))v254[2])(v254);
  }
  else
  {
    v208 = (void *)MEMORY[0x1E0CB37E8];
    +[RTRuntime footprint](RTRuntime, "footprint");
    objc_msgSend(v208, "numberWithDouble:", v209 - v4);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "setObject:forKeyedSubscript:", v210, CFSTR("footprint_delta"));

    v211 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "timeIntervalSinceDate:", v249);
    objc_msgSend(v211, "numberWithDouble:");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "setObject:forKeyedSubscript:", v213, CFSTR("time_elapsed"));

    -[RTWorkoutRouteManager workoutMetricsManager](self, "workoutMetricsManager");
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = v256;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v292, 1);
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = (id *)(v281 + 5);
    v260 = (id)v281[5];
    v217 = objc_msgSend(v214, "submitMetricsForEvent:data:error:", 4, v215, &v260);
    objc_storeStrong(v216, v260);

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v218 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
    {
      v231 = (objc_class *)objc_opt_class();
      NSStringFromClass(v231);
      v232 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v233 = (id)objc_claimAutoreleasedReturnValue();
      v234 = objc_msgSend(v256, "count");
      v235 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v232;
      v294 = 2112;
      if (v217)
        v235 = CFSTR("YES");
      v295 = v233;
      v296 = 2112;
      v297 = (uint64_t)v235;
      v298 = 2048;
      v299 = v234;
      _os_log_error_impl(&dword_1D1A22000, v218, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);

    }
    if (v254)
      v254[2]();
    v256 = 0;
  }
LABEL_46:

  v251 = (void *)v72;
LABEL_47:

LABEL_48:
  _Block_object_dispose(&v280, 8);

  _Block_object_dispose(&v286, 8);
  objc_autoreleasePoolPop(context);

}

void __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__RTWorkoutRouteManager__updateRelevanceScoresWithHandler___block_invoke_131(uint64_t a1, void *a2, void *a3)
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

- (void)_deleteWorkout:(id)a3 handler:(id)a4
{
  void *v5;
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
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  objc_class *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id *v37;
  NSObject *v38;
  objc_class *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  dispatch_semaphore_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  dispatch_time_t v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id *v65;
  id v66;
  int v67;
  NSObject *v68;
  NSObject *v69;
  objc_class *v70;
  id v71;
  id v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  NSObject *v76;
  _BOOL4 v77;
  objc_class *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id *v84;
  char v85;
  objc_class *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  objc_class *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  id *v103;
  _BOOL4 v104;
  NSObject *v105;
  objc_class *v106;
  id v107;
  id v108;
  const __CFString *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  uint64_t v121;
  id *v122;
  _BOOL4 v123;
  NSObject *v124;
  objc_class *v125;
  id v126;
  id v127;
  const __CFString *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  void *context;
  void *v142;
  void (**v143)(void);
  id v145;
  id v146;
  id v147;
  _QWORD v148[4];
  NSObject *v149;
  id v150;
  _QWORD v151[4];
  NSObject *v152;
  uint64_t *v153;
  uint64_t *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  id obj;
  _QWORD v160[4];
  NSObject *v161;
  uint64_t *v162;
  uint64_t v163;
  id *v164;
  uint64_t v165;
  uint64_t (*v166)(uint64_t, uint64_t);
  void (*v167)(uint64_t);
  id v168;
  _BYTE buf[12];
  __int16 v170;
  id v171;
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  uint64_t v175;
  __int16 v176;
  uint64_t v177;
  __int16 v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  uint64_t (*v186)(uint64_t, uint64_t);
  void (*v187)(uint64_t);
  id v188;
  _BYTE v189[128];
  id v190;
  uint64_t v191;
  const __CFString *v192;
  _QWORD v193[4];

  v193[1] = *MEMORY[0x1E0C80C00];
  v145 = a3;
  v143 = (void (**)(void))a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v145)
  {
    v163 = 0;
    v164 = (id *)&v163;
    v165 = 0x3032000000;
    v166 = __Block_byref_object_copy__133;
    v167 = __Block_byref_object_dispose__133;
    v168 = 0;
    -[RTWorkoutRouteManager _clearInMemoryClusters](self, "_clearInMemoryClusters");
    v6 = dispatch_semaphore_create(0);
    -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v160[0] = MEMORY[0x1E0C809B0];
    v160[1] = 3221225472;
    v160[2] = __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke;
    v160[3] = &unk_1E9297038;
    v162 = &v163;
    v8 = v6;
    v161 = v8;
    objc_msgSend(v7, "deleteWorkoutDistanceWithWorkoutUUID:handler:", v145, v160);

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
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
      v183 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v183, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v23 = objc_retainAutorelease(v23);

      }
    }
    else
    {
      v23 = 0;
    }

    v27 = v23;
    if (v27)
      objc_storeStrong(v164 + 5, v23);
    if (v164[5])
    {
      v143[2]();
LABEL_70:

      _Block_object_dispose(&v163, 8);
      goto LABEL_71;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceDate:", v5);
      v34 = v33;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v30;
      v170 = 2112;
      v171 = v31;
      v172 = 2112;
      v173 = (uint64_t)v145;
      v174 = 2048;
      v175 = v34;
      v176 = 2048;
      v177 = v35;
      _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, deleted rows in distance matrix that has the workout UUID %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    v190 = v145;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v190, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v164 + 5;
    obj = v164[5];
    -[RTWorkoutRouteManager _getRemoteWorkoutClustersForWorkoutUUIDs:error:](self, "_getRemoteWorkoutClustersForWorkoutUUIDs:error:", v36, &obj);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v37, obj);

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v137, "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v40;
      v170 = 2112;
      v171 = v41;
      v172 = 2048;
      v173 = v42;
      _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, %@, deletion clusters count, %lu", buf, 0x20u);

    }
    if (v164[5] || !objc_msgSend(v137, "count"))
    {
      if (v143)
        v143[2]();
    }
    else
    {
      v157 = 0u;
      v158 = 0u;
      v156 = 0u;
      v155 = 0u;
      v134 = v137;
      v43 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v155, v189, 16);
      if (v43)
      {
        v139 = *(_QWORD *)v156;
        v135 = *MEMORY[0x1E0D18598];
        v136 = *MEMORY[0x1E0CB2D50];
        do
        {
          v44 = 0;
          v45 = v27;
          v138 = v43;
          do
          {
            if (*(_QWORD *)v156 != v139)
              objc_enumerationMutation(v134);
            v142 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v44);
            context = (void *)MEMORY[0x1D8231EA8]();
            v183 = 0;
            v184 = &v183;
            v185 = 0x3032000000;
            v186 = __Block_byref_object_copy__133;
            v187 = __Block_byref_object_dispose__133;
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v188 = (id)objc_claimAutoreleasedReturnValue();
            v46 = dispatch_semaphore_create(0);

            -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "clusterUUID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v151[0] = MEMORY[0x1E0C809B0];
            v151[1] = 3221225472;
            v151[2] = __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_132;
            v151[3] = &unk_1E9296EE0;
            v153 = &v163;
            v154 = &v183;
            v49 = v46;
            v152 = v49;
            objc_msgSend(v47, "fetchWorkoutUUIDsForClusterUUID:handler:", v48, v151);

            v9 = v49;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = dispatch_time(0, 3600000000000);
            v52 = v45;
            if (dispatch_semaphore_wait(v9, v51))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "timeIntervalSinceDate:", v50);
              v55 = v54;
              v56 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "filteredArrayUsingPredicate:", v57);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "firstObject");
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v56, "submitToCoreAnalytics:type:duration:", v60, 1, v55);
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
              }

              v62 = (void *)MEMORY[0x1E0CB35C8];
              v193[0] = v136;
              *(_QWORD *)buf = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v193, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "errorWithDomain:code:userInfo:", v135, 15, v63);
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              v52 = v45;
              if (v64)
              {
                v52 = objc_retainAutorelease(v64);

              }
            }

            v27 = v52;
            v65 = v164;
            if (v27)
            {
              v66 = v27;
              v67 = 0;
              v68 = v65[5];
              v65[5] = v66;
LABEL_33:

              goto LABEL_36;
            }
            if (!v164[5])
            {
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                v70 = (objc_class *)objc_opt_class();
                NSStringFromClass(v70);
                v71 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v72 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v142, "clusterUUID");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = objc_msgSend((id)v184[5], "count");
                *(_DWORD *)buf = 138413058;
                *(_QWORD *)&buf[4] = v71;
                v170 = 2112;
                v171 = v72;
                v172 = 2112;
                v173 = (uint64_t)v73;
                v174 = 2048;
                v175 = v74;
                _os_log_impl(&dword_1D1A22000, v69, OS_LOG_TYPE_INFO, "%@, %@, cluster, %@, number of workouts, %lu", buf, 0x2Au);

              }
              v75 = objc_msgSend((id)v184[5], "count");
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v76 = objc_claimAutoreleasedReturnValue();
              v77 = os_log_type_enabled(v76, OS_LOG_TYPE_INFO);
              if (v75 > 2)
              {
                if (v77)
                {
                  v94 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v94);
                  v95 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v96 = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v142, "clusterUUID");
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v95;
                  v170 = 2112;
                  v171 = v96;
                  v172 = 2112;
                  v173 = (uint64_t)v97;
                  _os_log_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_INFO, "%@, %@, case 2/2, updating the cluster with cluster UUID, %@", buf, 0x20u);

                }
                v98 = (void *)v184[5];
                v99 = (void *)MEMORY[0x1E0CB3880];
                v148[0] = MEMORY[0x1E0C809B0];
                v148[1] = 3221225472;
                v148[2] = __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_136;
                v148[3] = &unk_1E929B988;
                v149 = v145;
                objc_msgSend(v99, "predicateWithBlock:", v148);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v98, "filteredArrayUsingPredicate:", v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();

                v180 = v101;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
                v102 = objc_claimAutoreleasedReturnValue();
                v103 = v164 + 5;
                v147 = v164[5];
                v104 = -[RTWorkoutRouteManager _syncClustersToHealthKit:error:](self, "_syncClustersToHealthKit:error:", v102, &v147);
                objc_storeStrong(v103, v147);

                LOBYTE(v102) = v164[5] == 0;
                if ((v102 & 1) != 0)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  v105 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                  {
                    v106 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v106);
                    v107 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v108 = (id)objc_claimAutoreleasedReturnValue();
                    if (v104)
                      v109 = CFSTR("YES");
                    else
                      v109 = CFSTR("NO");
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v110 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v110, "timeIntervalSinceDate:", v133);
                    v112 = v111;
                    +[RTRuntime footprint](RTRuntime, "footprint");
                    *(_DWORD *)buf = 138413314;
                    *(_QWORD *)&buf[4] = v107;
                    v170 = 2112;
                    v171 = v108;
                    v172 = 2112;
                    v173 = (uint64_t)v109;
                    v174 = 2048;
                    v175 = v112;
                    v176 = 2048;
                    v177 = v113;
                    _os_log_impl(&dword_1D1A22000, v105, OS_LOG_TYPE_INFO, "%@, %@, updated clusters to healthkit status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

                  }
                  v67 = 1;
                }
                else
                {
                  v67 = 0;
                }
                v68 = v149;
                goto LABEL_33;
              }
              if (v77)
              {
                v78 = (objc_class *)objc_opt_class();
                NSStringFromClass(v78);
                v79 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v80 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v142, "clusterUUID");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v79;
                v170 = 2112;
                v171 = v80;
                v172 = 2112;
                v173 = (uint64_t)v81;
                _os_log_impl(&dword_1D1A22000, v76, OS_LOG_TYPE_INFO, "%@, %@, case 1/2, deleting the entire cluster with cluster UUID, %@", buf, 0x20u);

              }
              -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "clusterUUID");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v164 + 5;
              v150 = v164[5];
              v85 = objc_msgSend(v82, "deleteWorkoutCluster:error:", v83, &v150);
              objc_storeStrong(v84, v150);

              if (!v164[5])
              {
                if ((v85 & 1) != 0)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  v68 = objc_claimAutoreleasedReturnValue();
                  v67 = 1;
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                  {
                    v86 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v86);
                    v87 = (id)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(a2);
                    v88 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v142, "clusterUUID");
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v90, "timeIntervalSinceDate:", v133);
                    v92 = v91;
                    +[RTRuntime footprint](RTRuntime, "footprint");
                    *(_DWORD *)buf = 138413314;
                    *(_QWORD *)&buf[4] = v87;
                    v170 = 2112;
                    v171 = v88;
                    v172 = 2112;
                    v173 = (uint64_t)v89;
                    v174 = 2048;
                    v175 = v92;
                    v176 = 2048;
                    v177 = v93;
                    _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "%@, %@, deleted the entire cluster with cluster UUID, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

                    v67 = 1;
                  }
                }
                else
                {
                  v114 = (void *)MEMORY[0x1E0CB35C8];
                  v181 = v136;
                  v115 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v142, "clusterUUID");
                  v68 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v115, "stringWithFormat:", CFSTR("workout cluster with clusterUUID, %@, not deleted"), v68);
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  v182 = v116;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v114, "errorWithDomain:code:userInfo:", v135, 0, v117);
                  v118 = objc_claimAutoreleasedReturnValue();
                  v119 = v164[5];
                  v164[5] = (id)v118;

                  v67 = 0;
                }
                goto LABEL_33;
              }
            }
            v67 = 0;
LABEL_36:

            _Block_object_dispose(&v183, 8);
            objc_autoreleasePoolPop(context);
            if (!v67)
              goto LABEL_61;
            ++v44;
            v45 = v27;
          }
          while (v138 != v44);
          v43 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v155, v189, 16);
        }
        while (v43);
      }
LABEL_61:

      if (v164[5])
      {
        v143[2]();
      }
      else
      {
        v120 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v121 = objc_claimAutoreleasedReturnValue();

        v122 = v164 + 5;
        v146 = v164[5];
        v123 = -[RTWorkoutRouteManager _syncClustersToWatchWithLimit:error:](self, "_syncClustersToWatchWithLimit:error:", 100, &v146);
        objc_storeStrong(v122, v146);
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v124 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
        {
          v125 = (objc_class *)objc_opt_class();
          NSStringFromClass(v125);
          v126 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v127 = (id)objc_claimAutoreleasedReturnValue();
          if (v123)
            v128 = CFSTR("YES");
          else
            v128 = CFSTR("NO");
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "timeIntervalSinceDate:", v121);
          v131 = v130;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v126;
          v170 = 2112;
          v171 = v127;
          v172 = 2048;
          v173 = 100;
          v174 = 2112;
          v175 = (uint64_t)v128;
          v176 = 2048;
          v177 = v131;
          v178 = 2048;
          v179 = v132;
          _os_log_impl(&dword_1D1A22000, v124, OS_LOG_TYPE_INFO, "%@, %@, sync clusters to watch with default limit, %lu, status, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

        }
        objc_autoreleasePoolPop(v120);
        ((void (*)(void (**)(void), id))v143[2])(v143, v164[5]);
        v133 = (void *)v121;
      }
    }

    v5 = v133;
    goto LABEL_70;
  }
  v24 = (void *)MEMORY[0x1E0CB35C8];
  v191 = *MEMORY[0x1E0CB2D50];
  v192 = CFSTR("requires valid UUID.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v192, &v191, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (*)(void (**)(void), void *))v143[2])(v143, v26);

LABEL_71:
}

void __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_132(uint64_t a1, void *a2, void *a3)
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

uint64_t __48__RTWorkoutRouteManager__deleteWorkout_handler___block_invoke_136(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (BOOL)_computeAndSaveDistanceMatrixForWorkoutUUIDs:(id)a3 distanceMetric:(int64_t)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  uint64_t *v22;
  void *v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  int v27;
  objc_class *v28;
  id v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  dispatch_semaphore_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  dispatch_time_t v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  _BOOL4 v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  objc_class *v71;
  id v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  unint64_t j;
  uint64_t *v78;
  void *v79;
  uint64_t *v80;
  void *v81;
  uint64_t *v82;
  void *v83;
  void *v84;
  double v85;
  int v86;
  void *v87;
  NSObject *v88;
  objc_class *v89;
  id v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  NSObject *v96;
  objc_class *v97;
  id v98;
  NSObject *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  id *v107;
  void *v108;
  int v109;
  objc_class *v110;
  id v111;
  NSObject *v112;
  void *v113;
  void *v114;
  id *v115;
  void *v116;
  id *v117;
  NSObject *v118;
  void *v119;
  id *v120;
  NSObject *v121;
  void *v122;
  id *v123;
  uint64_t v124;
  NSObject *v125;
  void *v126;
  id *v127;
  NSObject *v128;
  NSObject *v129;
  objc_class *v130;
  void *v131;
  NSObject *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  id *v139;
  _BOOL4 v140;
  NSObject *v141;
  void *v142;
  void *v143;
  void *v144;
  id *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  _BOOL4 v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  _BOOL4 v155;
  void *v156;
  void *v157;
  void *v158;
  _BOOL4 v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  void *v167;
  id *v168;
  _BOOL4 v169;
  NSObject *v170;
  objc_class *v171;
  id v172;
  NSObject *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void **v183;
  void *v184;
  void *v185;
  void *v186;
  _BOOL4 v187;
  _BOOL4 v188;
  uint64_t v189;
  objc_class *v190;
  id v191;
  NSObject *v192;
  unint64_t v193;
  objc_class *v194;
  id v195;
  NSObject *v196;
  unint64_t v197;
  objc_class *v198;
  id v199;
  NSObject *v200;
  unint64_t v201;
  objc_class *v202;
  id v203;
  NSObject *v204;
  unint64_t v205;
  objc_class *v206;
  id v207;
  NSObject *v208;
  unint64_t v209;
  void *v210;
  void *v211;
  _BOOL4 v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  void *v218;
  id *v219;
  uint64_t *v220;
  void *v221;
  void *v222;
  void *v223;
  _BOOL4 v224;
  _BOOL4 v225;
  uint64_t v226;
  objc_class *v227;
  id v228;
  NSObject *v229;
  unint64_t v230;
  void *v231;
  void *v232;
  _BOOL4 v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  void *v239;
  id *v240;
  uint64_t *v241;
  void *v242;
  void *v243;
  id v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  id *v250;
  _BOOL4 v251;
  void *v252;
  void *v253;
  void *v254;
  id *v255;
  uint64_t *v256;
  void *v257;
  char v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  id *v264;
  _BOOL4 v265;
  NSObject *v266;
  void *v267;
  void *v268;
  void *v269;
  id *v270;
  uint64_t *v271;
  void *v272;
  char v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  id *v278;
  _BOOL4 v279;
  void *v280;
  void *v281;
  void *v282;
  id *v283;
  uint64_t *v284;
  void *v285;
  char v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  id *v292;
  _BOOL4 v293;
  NSObject *v294;
  void *v295;
  void *v296;
  void *v297;
  id *v298;
  uint64_t *v299;
  void *v300;
  char v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  id *v306;
  _BOOL4 v307;
  void *v308;
  void *v309;
  void *v310;
  id *v311;
  uint64_t *v312;
  void *v313;
  objc_class *v314;
  id v315;
  NSObject *v316;
  double v317;
  RTWorkoutDistance *v318;
  void *v319;
  void *v320;
  uint64_t v321;
  void *v322;
  id v323;
  NSObject *v324;
  void *v325;
  void *v326;
  id *v327;
  _BOOL4 v328;
  NSObject *v329;
  objc_class *v330;
  void *v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  void *v339;
  void *v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  void *v348;
  void *v349;
  uint64_t v350;
  NSObject *v351;
  objc_class *v352;
  id v353;
  NSObject *v354;
  uint64_t v355;
  id *v356;
  NSObject *v357;
  objc_class *v358;
  id v359;
  NSObject *v360;
  unint64_t v361;
  void *v362;
  char v363;
  void *v364;
  void *v365;
  id *v366;
  double v367;
  NSObject *v368;
  void *v369;
  void *v370;
  id *v371;
  _BOOL4 v372;
  _BOOL4 v373;
  uint64_t v374;
  _BOOL4 v375;
  uint64_t v376;
  void *v377;
  void *v378;
  void *v379;
  id *v380;
  void *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  id *v386;
  double v387;
  void *v388;
  void *v389;
  char v390;
  void *v391;
  objc_class *v392;
  id v393;
  NSObject *v394;
  unint64_t v395;
  objc_class *v396;
  id v397;
  NSObject *v398;
  unint64_t v399;
  objc_class *v400;
  id v401;
  NSObject *v402;
  unint64_t v403;
  objc_class *v404;
  id v405;
  NSObject *v406;
  unint64_t v407;
  objc_class *v408;
  id v409;
  NSObject *v410;
  unint64_t v411;
  objc_class *v412;
  id v413;
  NSObject *v414;
  unint64_t v415;
  objc_class *v416;
  id v417;
  NSObject *v418;
  unint64_t v419;
  void *v420;
  double v421;
  void *v422;
  void *v423;
  void **v424;
  void *v425;
  objc_class *v426;
  id v427;
  NSObject *v428;
  unint64_t v429;
  objc_class *v430;
  id v431;
  NSObject *v432;
  unint64_t v433;
  objc_class *v434;
  id v435;
  NSObject *v436;
  id v437;
  void *v438;
  uint64_t *v439;
  void *v440;
  objc_class *v441;
  id v442;
  NSObject *v443;
  unint64_t v444;
  objc_class *v445;
  id v446;
  NSObject *v447;
  unint64_t v448;
  objc_class *v449;
  id v450;
  NSObject *v451;
  unint64_t v452;
  objc_class *v453;
  id v454;
  NSObject *v455;
  unint64_t v456;
  objc_class *v457;
  id v458;
  NSObject *v459;
  unint64_t v460;
  objc_class *v461;
  id v462;
  NSObject *v463;
  unint64_t v464;
  objc_class *v465;
  id v466;
  NSObject *v467;
  unint64_t v468;
  objc_class *v469;
  id v470;
  NSObject *v471;
  unint64_t v472;
  objc_class *v473;
  id v474;
  NSObject *v475;
  unint64_t v476;
  objc_class *v477;
  id v478;
  NSObject *v479;
  unint64_t v480;
  objc_class *v481;
  id v482;
  NSObject *v483;
  unint64_t v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  NSObject *v490;
  objc_class *v491;
  id v492;
  NSObject *v493;
  objc_class *v494;
  id v495;
  NSObject *v496;
  objc_class *v497;
  id v498;
  NSObject *v499;
  unint64_t v500;
  NSObject *v501;
  objc_class *v502;
  void *v503;
  void *v504;
  void *v505;
  uint64_t v506;
  void *v507;
  void *v508;
  uint64_t v509;
  void *v510;
  id v511;
  uint64_t v512;
  void *v513;
  void *v514;
  void *v515;
  void *v516;
  void *v517;
  uint64_t *v518;
  void *v519;
  uint64_t *v520;
  void *v521;
  uint64_t *v522;
  void *v523;
  uint64_t *v524;
  void *v525;
  uint64_t *v526;
  void *v527;
  uint64_t *v528;
  void *v529;
  void *v530;
  id v531;
  _BOOL4 v532;
  NSObject *v533;
  void *v534;
  objc_class *v536;
  id v537;
  NSObject *v538;
  uint64_t v539;
  NSObject *v540;
  double v541;
  void *v542;
  int64_t v543;
  void *v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  NSObject *v552;
  NSObject *v553;
  os_log_t v554;
  void *v555;
  void *v556;
  uint64_t v557;
  void *v558;
  void *v559;
  uint64_t v560;
  void *v561;
  void *v562;
  uint64_t v563;
  void *v564;
  void *v565;
  uint64_t v566;
  id v567;
  void *v568;
  id v569;
  uint64_t v570;
  os_log_t v571;
  _BOOL4 v572;
  os_log_t v573;
  NSObject *v574;
  void *v575;
  id v576;
  void *v577;
  void *v578;
  NSObject *v579;
  void *v580;
  void *v581;
  void *v582;
  void *v583;
  id v584;
  void *v585;
  void *v586;
  void *v587;
  void *v588;
  void *v589;
  void *v590;
  unint64_t v591;
  void *v592;
  void *v593;
  void *v594;
  NSObject *dsema;
  dispatch_semaphore_t dsemaa;
  void *v598;
  id v599;
  NSObject *log;
  os_log_t loga;
  void *v602;
  void *v603;
  void *context;
  void *contexta;
  os_log_t v606;
  os_log_t v607;
  unint64_t v609;
  id v610;
  void *v611;
  unint64_t v612;
  NSObject *v613;
  id v614;
  id v615;
  void *v616;
  void *v617;
  void *v618;
  id v619;
  id v620;
  id v621;
  id v622;
  _QWORD v623[7];
  _QWORD v624[7];
  id v625;
  id v626;
  id v627;
  id v628;
  id v629;
  id v630;
  id v631;
  id v632;
  id v633;
  id v634;
  id v635;
  id v636;
  void *v637;
  id v638;
  _QWORD v639[7];
  _QWORD v640[7];
  id v641;
  _QWORD v642[7];
  _QWORD v643[7];
  void *v644;
  id v645;
  _QWORD v646[7];
  _QWORD v647[7];
  id v648;
  id v649;
  id v650;
  id v651;
  id v652;
  id v653;
  id v654;
  id obj;
  __int128 v656;
  __int128 v657;
  __int128 v658;
  __int128 v659;
  _QWORD v660[4];
  NSObject *v661;
  uint64_t *v662;
  uint64_t *v663;
  uint64_t v664;
  uint64_t *v665;
  uint64_t v666;
  uint64_t (*v667)(uint64_t, uint64_t);
  void (*v668)(uint64_t);
  id v669;
  uint64_t v670;
  uint64_t *v671;
  uint64_t v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t *v675;
  uint64_t v676;
  uint64_t v677;
  uint64_t v678;
  uint64_t *v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  uint64_t *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  uint64_t *v687;
  uint64_t v688;
  uint64_t v689;
  uint64_t v690;
  uint64_t *v691;
  uint64_t v692;
  uint64_t v693;
  uint64_t v694;
  uint64_t *v695;
  uint64_t v696;
  uint64_t v697;
  uint64_t v698;
  uint64_t *v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t v702;
  uint64_t *v703;
  uint64_t v704;
  uint64_t v705;
  uint64_t v706;
  uint64_t *v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  uint64_t *v711;
  uint64_t v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t *v715;
  uint64_t v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t *v719;
  uint64_t v720;
  uint64_t (*v721)(uint64_t, uint64_t);
  void (*v722)(uint64_t);
  id v723;
  uint64_t v724;
  const __CFString *v725;
  _BYTE buf[12];
  __int16 v727;
  os_log_t v728;
  __int16 v729;
  unint64_t v730;
  __int16 v731;
  uint64_t v732;
  __int16 v733;
  uint64_t v734;
  __int16 v735;
  uint64_t v736;
  __int16 v737;
  os_log_t v738;
  __int16 v739;
  uint64_t v740;
  __int16 v741;
  uint64_t v742;
  __int16 v743;
  uint64_t v744;
  __int16 v745;
  uint64_t v746;
  __int16 v747;
  uint64_t v748;
  __int16 v749;
  uint64_t v750;
  __int16 v751;
  id v752;
  __int16 v753;
  uint64_t v754;
  _BYTE v755[128];
  _QWORD v756[4];

  v756[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v611 = v6;
  if (v6)
  {
    v7 = v6;
    v543 = a4;
    v8 = objc_opt_new();
    v9 = objc_opt_new();
    v718 = 0;
    v719 = &v718;
    v720 = 0x3032000000;
    v721 = __Block_byref_object_copy__133;
    v722 = __Block_byref_object_dispose__133;
    v723 = 0;
    v599 = (id)v8;
    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      v10 = (void *)v9;
      v11 = 1;
      goto LABEL_365;
    }
    v544 = (void *)v9;
    v542 = (void *)MEMORY[0x1D8231EA8]();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v598 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = v611;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v598);
    v17 = v16;
    v586 = (void *)objc_opt_new();
    v582 = (void *)objc_opt_new();
    v593 = (void *)objc_opt_new();
    v609 = 0;
    v714 = 0;
    v715 = &v714;
    v716 = 0x2020000000;
    v717 = 0;
    v710 = 0;
    v711 = &v710;
    v712 = 0x2020000000;
    v713 = 0;
    v708 = 0x2020000000;
    v704 = 0x2020000000;
    v700 = 0x2020000000;
    v696 = 0x2020000000;
    v692 = 0x2020000000;
    v688 = 0x2020000000;
    v684 = 0x2020000000;
    v680 = 0x2020000000;
    v676 = 0x2020000000;
    v18 = 10000.0;
    v672 = 0x2020000000;
    v706 = 0;
    v707 = &v706;
    v709 = 0;
    v702 = 0;
    v703 = &v702;
    v705 = 0;
    v698 = 0;
    v699 = &v698;
    v701 = 0;
    v694 = 0;
    v695 = &v694;
    v697 = 0;
    v690 = 0;
    v691 = &v690;
    v693 = 0;
    v686 = 0;
    v687 = &v686;
    v689 = 0;
    v682 = 0;
    v683 = &v682;
    v685 = 0;
    v678 = 0;
    v679 = &v678;
    v681 = 0;
    v674 = 0;
    v675 = &v674;
    v677 = 0;
    v670 = 0;
    v671 = &v670;
    v673 = 0;
    v548 = *MEMORY[0x1E0D18598];
    v550 = *MEMORY[0x1E0CB2D50];
    v19 = 1;
LABEL_10:
    v591 = v19;
    if (v609 < objc_msgSend(v14, "count"))
    {
      v589 = (void *)MEMORY[0x1D8231EA8]();
      v20 = v715;
      v21 = (void *)v715[3];
      if (v21)
      {
        free(v21);
        v20 = v715;
      }
      v20[3] = 0;
      v22 = v707;
      v23 = (void *)v707[3];
      if (v23)
      {
        free(v23);
        v22 = v707;
      }
      v22[3] = 0;
      v24 = v699;
      v25 = (void *)v699[3];
      if (v25)
      {
        free(v25);
        v24 = v699;
      }
      v24[3] = 0;
      v711[3] = 0;
      v695[3] = 0;
      objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v593, "containsObject:", v26);

      if (v27)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v29;
          v727 = 2112;
          v728 = v30;
          v729 = 2048;
          v730 = v609;
          v731 = 2112;
          v732 = (uint64_t)v31;
          _os_log_impl(&dword_1D1A22000, log, OS_LOG_TYPE_INFO, "%@, %@, skip comparisons for i, %lu, workout UUID, %@; i is marked as contained in a small bounding box",
            buf,
            0x2Au);

        }
        v32 = 8;
        goto LABEL_337;
      }
      objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v586, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 == 0;

      if (v35)
      {
        v36 = (void *)objc_opt_new();
        objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v586, "setObject:forKeyedSubscript:", v36, v37);

      }
      v664 = 0;
      v665 = &v664;
      v666 = 0x3032000000;
      v667 = __Block_byref_object_copy__133;
      v668 = __Block_byref_object_dispose__133;
      v669 = 0;
      v38 = dispatch_semaphore_create(0);
      -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v660[0] = MEMORY[0x1E0C809B0];
      v660[1] = 3221225472;
      v660[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke;
      v660[3] = &unk_1E9296EE0;
      v662 = &v664;
      v663 = &v718;
      v41 = v38;
      v661 = v41;
      objc_msgSend(v39, "fetchWorkoutDistancesWithWorkout:handler:", v40, v660);

      dsema = v41;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(dsema, v43))
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "timeIntervalSinceDate:", v42);
      v46 = v45;
      v47 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "filteredArrayUsingPredicate:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "firstObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "submitToCoreAnalytics:type:duration:", v51, 1, v46);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v53 = (void *)MEMORY[0x1E0CB35C8];
      v756[0] = v550;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v756, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "errorWithDomain:code:userInfo:", v548, 15, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        v56 = objc_retainAutorelease(v55);

      }
      else
      {
LABEL_28:
        v56 = 0;
      }

      v584 = v56;
      if (v584)
        v57 = v599 != 0;
      else
        v57 = 0;
      if (v57)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v494 = (objc_class *)objc_opt_class();
          NSStringFromClass(v494);
          v495 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v496 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v495;
          v727 = 2112;
          v728 = v496;
          v729 = 2112;
          v730 = (unint64_t)v584;
          _os_log_error_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

        }
        v59 = v584;
        objc_msgSend(v599, "addObject:", v584);
        log = 0;
        v32 = 8;
        v584 = 0;
        goto LABEL_334;
      }
      if (v599 && v719[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          v497 = (objc_class *)objc_opt_class();
          NSStringFromClass(v497);
          v498 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v499 = objc_claimAutoreleasedReturnValue();
          v500 = v719[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v498;
          v727 = 2112;
          v728 = v499;
          v729 = 2112;
          v730 = v500;
          _os_log_error_impl(&dword_1D1A22000, v60, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

        }
        objc_msgSend(v599, "addObject:", v719[5]);
        log = 0;
        v59 = (void *)v719[5];
        v719[5] = 0;
        v32 = 8;
        goto LABEL_334;
      }
      v61 = (void *)objc_opt_new();
      v659 = 0u;
      v658 = 0u;
      v657 = 0u;
      v656 = 0u;
      v62 = (id)v665[5];
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v656, v755, 16);
      if (v63)
      {
        v64 = *(_QWORD *)v657;
        do
        {
          for (i = 0; i != v63; ++i)
          {
            if (*(_QWORD *)v657 != v64)
              objc_enumerationMutation(v62);
            v66 = *(void **)(*((_QWORD *)&v656 + 1) + 8 * i);
            v67 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend(v66, "firstWorkout");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "addObject:", v68);

            objc_msgSend(v66, "secondWorkout");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "addObject:", v69);

            objc_autoreleasePoolPop(v67);
          }
          v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v656, v755, 16);
        }
        while (v63);
      }

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = (objc_class *)objc_opt_class();
        NSStringFromClass(v71);
        v72 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v73 = (id)objc_claimAutoreleasedReturnValue();
        v74 = objc_msgSend(v61, "count");
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v72;
        v727 = 2112;
        v728 = v73;
        v729 = 2048;
        v730 = v609;
        v731 = 2048;
        v732 = v74;
        v733 = 2048;
        v734 = v75;
        _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_INFO, "%@, %@, i, %lu, computedDistanceMatrixUUIDs count, %lu, footprint, %.4f MB", buf, 0x34u);

      }
      v76 = (void *)v665[5];
      v665[5] = 0;

      log = 0;
      for (j = v591; ; j = v612 + 1)
      {
        v612 = j;
        if (j >= objc_msgSend(v611, "count"))
        {
LABEL_327:
          objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
          v485 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "objectForKeyedSubscript:", v485);
          v486 = (void *)objc_claimAutoreleasedReturnValue();

          if (v486)
          {
            objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
            v487 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v586, "removeObjectForKey:", v487);

          }
          if (v17 > (double)(unint64_t)kRTMaxTimeIntervalPerFunction
            && -[RTWorkoutRouteManager isSchedulerTriggered](self, "isSchedulerTriggered"))
          {
            v488 = (void *)MEMORY[0x1E0CB35C8];
            v724 = v550;
            v725 = CFSTR("max time for function exceeded");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v725, &v724, 1);
            v489 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v488, "errorWithDomain:code:userInfo:", v548, 15, v489);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v599, "addObject:", v59);
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v490 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v490, OS_LOG_TYPE_INFO))
            {
              v491 = (objc_class *)objc_opt_class();
              NSStringFromClass(v491);
              v492 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v493 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v492;
              v727 = 2112;
              v728 = v493;
              v729 = 2048;
              v730 = (unint64_t)v17;
              v731 = 2048;
              v732 = kRTMaxTimeIntervalPerFunction;
              _os_log_impl(&dword_1D1A22000, v490, OS_LOG_TYPE_INFO, "%@, %@, max time for function exceeded, current time taken by function, %lu, time threshold, %lu", buf, 0x2Au);

            }
            v32 = 6;
LABEL_334:

          }
          else
          {
            v32 = 0;
          }

          _Block_object_dispose(&v664, 8);
LABEL_337:

          objc_autoreleasePoolPop(v589);
          v14 = v611;
          if ((v32 | 8) != 8)
            goto LABEL_339;
          ++v609;
          v19 = v591 + 1;
          goto LABEL_10;
        }
        context = (void *)MEMORY[0x1D8231EA8]();
        v78 = v691;
        v79 = (void *)v691[3];
        if (v79)
        {
          free(v79);
          v78 = v691;
        }
        v78[3] = 0;
        v80 = v683;
        v81 = (void *)v683[3];
        if (v81)
        {
          free(v81);
          v80 = v683;
        }
        v80[3] = 0;
        v82 = v675;
        v83 = (void *)v675[3];
        if (v83)
        {
          free(v83);
          v82 = v675;
        }
        v82[3] = 0;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "timeIntervalSinceDate:", v598);
        v17 = v85;

        if (v17 <= (double)(unint64_t)kRTMaxTimeIntervalPerFunction
          || !-[RTWorkoutRouteManager isSchedulerTriggered](self, "isSchedulerTriggered"))
        {
          break;
        }
        v86 = 17;
LABEL_95:
        objc_autoreleasePoolPop(context);
        if (v86 != 19 && v86)
          goto LABEL_327;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v602 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
      {
        v89 = (objc_class *)objc_opt_class();
        NSStringFromClass(v89);
        v90 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v91 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v90;
        v727 = 2112;
        v728 = v91;
        v729 = 2048;
        v730 = v609;
        v731 = 2048;
        v732 = v612;
        v733 = 2112;
        v734 = (uint64_t)v92;
        v735 = 2112;
        v736 = (uint64_t)v93;
        _os_log_impl(&dword_1D1A22000, v88, OS_LOG_TYPE_INFO, "%@, %@, comparing i, %lu, j, %lu, workout UUID, %@, other workout UUID, %@,", buf, 0x3Eu);

      }
      objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend(v61, "containsObject:", v94);

      if (v95)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v96 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
        {
          v97 = (objc_class *)objc_opt_class();
          NSStringFromClass(v97);
          v98 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v99 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "timeIntervalSinceDate:", v602);
          v102 = v101;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v98;
          v727 = 2112;
          v728 = v99;
          v729 = 2048;
          v730 = v609;
          v731 = 2048;
          v732 = v612;
          v733 = 2048;
          v734 = v102;
          v735 = 2048;
          v736 = v103;
          _os_log_impl(&dword_1D1A22000, v96, OS_LOG_TYPE_INFO, "%@, %@, workout exists, comparison skipped between i, %lu, j, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

        }
        objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "removeObject:", v104);

        v105 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v606 = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject timeIntervalSinceDate:](v606, "timeIntervalSinceDate:", v87);
        objc_msgSend(v105, "numberWithDouble:");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (id *)(v719 + 5);
        obj = (id)v719[5];
        -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v106, 1, &obj);
        objc_storeStrong(v107, obj);

        goto LABEL_93;
      }
      objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v593, "containsObject:", v108);

      if (v109)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v606 = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v606, OS_LOG_TYPE_INFO))
        {
          v110 = (objc_class *)objc_opt_class();
          NSStringFromClass(v110);
          v111 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v112 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v111;
          v727 = 2112;
          v728 = v112;
          v729 = 2048;
          v730 = v609;
          v731 = 2112;
          v732 = (uint64_t)v113;
          _os_log_impl(&dword_1D1A22000, v606, OS_LOG_TYPE_INFO, "%@, %@, skip comparison for j, %lu, workout UUID, %@; j is marked as contained in small bounding box",
            buf,
            0x2Au);

        }
        goto LABEL_93;
      }
      if (log)
      {
LABEL_71:
        objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = (id *)(v719 + 5);
        v652 = (id)v719[5];
        -[RTWorkoutRouteManager _getWorkoutFromWorkouts:UUID:error:](self, "_getWorkoutFromWorkouts:UUID:error:", v582, v114, &v652);
        v606 = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v115, v652);

        v116 = (void *)v719[5];
        if (v116)
        {
          v719[5] = 0;

          v117 = (id *)(v719 + 5);
          v651 = (id)v719[5];
          -[RTWorkoutRouteManager _refreshWorkoutsCache:workoutUUIDs:startingIndex:error:](self, "_refreshWorkoutsCache:workoutUUIDs:startingIndex:error:", v582, v611, v612, &v651);
          objc_storeStrong(v117, v651);
          if (v599 && v719[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v118 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              v190 = (objc_class *)objc_opt_class();
              NSStringFromClass(v190);
              v191 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v192 = (id)objc_claimAutoreleasedReturnValue();
              v193 = v719[5];
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v191;
              v727 = 2112;
              v728 = v192;
              v729 = 2112;
              v730 = v193;
              _os_log_error_impl(&dword_1D1A22000, v118, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

            }
            objc_msgSend(v599, "addObject:", v719[5]);
            v119 = (void *)v719[5];
            v719[5] = 0;
            v86 = 19;
            goto LABEL_131;
          }
          objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = (id *)(v719 + 5);
          v650 = (id)v719[5];
          -[RTWorkoutRouteManager _getWorkoutFromWorkouts:UUID:error:](self, "_getWorkoutFromWorkouts:UUID:error:", v582, v122, &v650);
          v124 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v123, v650);

          if (v599 && v719[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              v202 = (objc_class *)objc_opt_class();
              NSStringFromClass(v202);
              v203 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v204 = (id)objc_claimAutoreleasedReturnValue();
              v205 = v719[5];
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v203;
              v727 = 2112;
              v728 = v204;
              v729 = 2112;
              v730 = v205;
              _os_log_error_impl(&dword_1D1A22000, v125, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

            }
            objc_msgSend(v599, "addObject:", v719[5]);
            v119 = (void *)v719[5];
            v719[5] = 0;
            v86 = 19;
            v606 = (os_log_t)v124;
            goto LABEL_131;
          }
          v606 = (os_log_t)v124;
        }
        -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", log);
        -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v606);
        v687[3] = 0;
        v671[3] = 0;
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
        {
          v552 = v129;
          v130 = (objc_class *)objc_opt_class();
          NSStringFromClass(v130);
          v571 = (os_log_t)(id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v579 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject UUID](log, "UUID");
          v555 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", -[NSObject workoutActivityType](log, "workoutActivityType"));
          v567 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject startDate](log, "startDate");
          v564 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v564, "stringFromDate");
          v576 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject sourceRevision](log, "sourceRevision");
          v561 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v561, "source");
          v558 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v558, "name");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject UUID](v606, "UUID");
          v132 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", -[NSObject workoutActivityType](v606, "workoutActivityType"));
          v133 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject startDate](v606, "startDate");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "stringFromDate");
          v135 = (id)objc_claimAutoreleasedReturnValue();
          -[NSObject sourceRevision](v606, "sourceRevision");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "source");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "name");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414594;
          *(_QWORD *)&buf[4] = v571;
          v727 = 2112;
          v728 = v579;
          v729 = 2112;
          v730 = (unint64_t)v555;
          v731 = 2112;
          v732 = (uint64_t)v567;
          v733 = 2112;
          v734 = (uint64_t)v576;
          v735 = 2112;
          v736 = (uint64_t)v131;
          v737 = 2112;
          v738 = v132;
          v739 = 2112;
          v740 = (uint64_t)v133;
          v741 = 2112;
          v742 = (uint64_t)v135;
          v743 = 2112;
          v744 = (uint64_t)v138;
          _os_log_impl(&dword_1D1A22000, v552, OS_LOG_TYPE_INFO, "%@, %@, workout UUID, %@, activityType, %@, startDate, %@, source, %@, other workout UUID, %@, other activityType, %@, other startDate, %@, other source, %@,", buf, 0x66u);

          v129 = v552;
        }

        if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", log))
          v572 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v606);
        else
          v572 = 0;
        v580 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v577 = (void *)objc_claimAutoreleasedReturnValue();

        v139 = (id *)(v719 + 5);
        v649 = (id)v719[5];
        v140 = -[RTWorkoutRouteManager _isPreFilteredForWorkout:otherWorkout:preFilteringResults:error:](self, "_isPreFilteredForWorkout:otherWorkout:preFilteringResults:error:", log, v606, v580, &v649);
        objc_storeStrong(v139, v649);
        if (v599 && v719[5])
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v141 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          {
            v194 = (objc_class *)objc_opt_class();
            NSStringFromClass(v194);
            v195 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v196 = (id)objc_claimAutoreleasedReturnValue();
            v197 = v719[5];
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v195;
            v727 = 2112;
            v728 = v196;
            v729 = 2112;
            v730 = v197;
            _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

          }
LABEL_114:

          objc_msgSend(v599, "addObject:", v719[5]);
          v146 = v719[5];
          v719[5] = 0;
LABEL_115:
          v86 = 19;
LABEL_130:

          v87 = v577;
          v119 = v580;
LABEL_131:

          goto LABEL_94;
        }
        if (v140)
        {
          v142 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "timeIntervalSinceDate:", v577);
          objc_msgSend(v142, "numberWithDouble:");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v145 = (id *)(v719 + 5);
          v648 = (id)v719[5];
          -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v144, 2, &v648);
          objc_storeStrong(v145, v648);

          if (!v599 || !v719[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v146 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
            {
              v171 = (objc_class *)objc_opt_class();
              NSStringFromClass(v171);
              v172 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v173 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "timeIntervalSinceDate:", v602);
              v176 = v175;
              +[RTRuntime footprint](RTRuntime, "footprint");
              *(_DWORD *)buf = 138413570;
              *(_QWORD *)&buf[4] = v172;
              v727 = 2112;
              v728 = v173;
              v729 = 2048;
              v730 = v609;
              v731 = 2048;
              v732 = v612;
              v733 = 2048;
              v734 = v176;
              v735 = 2048;
              v736 = v177;
              _os_log_impl(&dword_1D1A22000, v146, OS_LOG_TYPE_INFO, "%@, %@, comparison done between i, %lu, j, %lu, breaking the inner loop after prefiltered by metadata, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

            }
            v86 = 17;
            goto LABEL_130;
          }
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v141 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          {
            v227 = (objc_class *)objc_opt_class();
            NSStringFromClass(v227);
            v228 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v229 = (id)objc_claimAutoreleasedReturnValue();
            v230 = v719[5];
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v228;
            v727 = 2112;
            v728 = v229;
            v729 = 2112;
            v730 = v230;
            _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

          }
          goto LABEL_114;
        }
        objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v586, "objectForKeyedSubscript:", v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = v148 == 0;

        if (v149)
        {
          v150 = (void *)objc_opt_new();
          objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "setObject:forKeyedSubscript:", v150, v151);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v568 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v699[3])
        {
          objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "objectForKeyedSubscript:", v152);
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = v154 == 0;

          if (v155)
          {
            v647[0] = MEMORY[0x1E0C809B0];
            v647[1] = 3221225472;
            v647[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_140;
            v647[3] = &unk_1E92A36F8;
            v647[4] = &v698;
            v647[5] = &v694;
            v647[6] = &v718;
            -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", log, 3, 1, v647);
            if (v599)
            {
              if (v719[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v170 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
                {
                  v400 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v400);
                  v401 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v402 = (id)objc_claimAutoreleasedReturnValue();
                  v403 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v401;
                  v727 = 2112;
                  v728 = v402;
                  v729 = 2112;
                  v730 = v403;
                  _os_log_error_impl(&dword_1D1A22000, v170, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                }
LABEL_126:

                objc_msgSend(v599, "addObject:", v719[5]);
                v146 = v719[5];
                v719[5] = 0;
                v86 = 19;
                v577 = v568;
                goto LABEL_130;
              }
            }
          }
        }
        if (!v675[3])
        {
          objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "objectForKeyedSubscript:", v156);
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          v159 = v158 == 0;

          if (v159)
          {
            v646[0] = MEMORY[0x1E0C809B0];
            v646[1] = 3221225472;
            v646[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_142;
            v646[3] = &unk_1E92A36F8;
            v646[4] = &v674;
            v646[5] = &v670;
            v646[6] = &v718;
            -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", v606, 3, 1, v646);
            if (v599)
            {
              if (v719[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v170 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
                {
                  v404 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v404);
                  v405 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v406 = (id)objc_claimAutoreleasedReturnValue();
                  v407 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v405;
                  v727 = 2112;
                  v728 = v406;
                  v729 = 2112;
                  v730 = v407;
                  _os_log_error_impl(&dword_1D1A22000, v170, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                }
                goto LABEL_126;
              }
            }
          }
        }
        v160 = v699[3];
        v161 = v695[3];
        objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v586, "objectForKeyedSubscript:", v162);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = v675[3];
        v165 = v671[3];
        objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v586, "objectForKeyedSubscript:", v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = (id *)(v719 + 5);
        v645 = (id)v719[5];
        v169 = -[RTWorkoutRouteManager _isPreFilteredForWorkout:firstFewLocations:firstFewLocationsCount:cachedDictionary:otherWorkout:firstFewOtherLocations:firstFewOtherLocationsCount:cachedOtherDictionary:preFilteringResults:error:](self, "_isPreFilteredForWorkout:firstFewLocations:firstFewLocationsCount:cachedDictionary:otherWorkout:firstFewOtherLocations:firstFewOtherLocationsCount:cachedOtherDictionary:preFilteringResults:error:", log, v160, v161, v163, v606, v164, v165, v167, v580, &v645);
        objc_storeStrong(v168, v645);

        if (v599 && v719[5])
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v170 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
          {
            v358 = (objc_class *)objc_opt_class();
            NSStringFromClass(v358);
            v359 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v360 = (id)objc_claimAutoreleasedReturnValue();
            v361 = v719[5];
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v359;
            v727 = 2112;
            v728 = v360;
            v729 = 2112;
            v730 = v361;
            _os_log_error_impl(&dword_1D1A22000, v170, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

          }
          goto LABEL_126;
        }
        v178 = v675;
        v179 = (void *)v675[3];
        if (v179)
        {
          free(v179);
          v178 = v675;
        }
        v178[3] = 0;
        if (v169)
        {
          v180 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v181, "timeIntervalSinceDate:", v568);
          objc_msgSend(v180, "numberWithDouble:");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          v183 = (void **)(v719 + 5);
          v644 = (void *)v719[5];
          -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v182, 3, &v644);
          v184 = v644;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v577 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v715[3])
          {
            objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v586, "objectForKeyedSubscript:", v185);
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            v187 = (unint64_t)objc_msgSend(v186, "count") < 2;

            if (v187)
            {
              v188 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", log);
              v643[0] = MEMORY[0x1E0C809B0];
              if (v188)
                v189 = 1;
              else
                v189 = 3;
              v643[1] = 3221225472;
              v643[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_143;
              v643[3] = &unk_1E92A36F8;
              v643[4] = &v714;
              v643[5] = &v710;
              v643[6] = &v718;
              -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", log, v189, 0, v643);
              if (v599 && v719[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v141 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                {
                  v441 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v441);
                  v442 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v443 = (id)objc_claimAutoreleasedReturnValue();
                  v444 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v442;
                  v727 = 2112;
                  v728 = v443;
                  v729 = 2112;
                  v730 = v444;
                  _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                }
                goto LABEL_114;
              }
              v642[0] = MEMORY[0x1E0C809B0];
              v642[1] = 3221225472;
              v642[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_144;
              v642[3] = &unk_1E92A36F8;
              v642[4] = &v706;
              v642[5] = &v702;
              v642[6] = &v718;
              -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", log, 2, 0, v642);
              if (v599 && v719[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v141 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                {
                  v453 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v453);
                  v454 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v455 = (id)objc_claimAutoreleasedReturnValue();
                  v456 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v454;
                  v727 = 2112;
                  v728 = v455;
                  v729 = 2112;
                  v730 = v456;
                  _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                }
                goto LABEL_114;
              }
            }
          }
          objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
          v210 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "objectForKeyedSubscript:", v210);
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          v212 = (unint64_t)objc_msgSend(v211, "count") < 2;

          if (v212)
          {
            v213 = v715[3];
            v214 = v711[3];
            v215 = v707[3];
            v216 = v703[3];
            objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v586, "objectForKeyedSubscript:", v217);
            v218 = (void *)objc_claimAutoreleasedReturnValue();
            v219 = (id *)(v719 + 5);
            v641 = (id)v719[5];
            -[RTWorkoutRouteManager _preComputeCacheForWorkout:locations:locationsCount:decimatedLocations:decimatedLocationsCount:cachedDictionary:error:](self, "_preComputeCacheForWorkout:locations:locationsCount:decimatedLocations:decimatedLocationsCount:cachedDictionary:error:", log, v213, v214, v215, v216, v218, &v641);
            objc_storeStrong(v219, v641);

            if (v599 && v719[5])
            {
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v141 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
              {
                v412 = (objc_class *)objc_opt_class();
                NSStringFromClass(v412);
                v413 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v414 = (id)objc_claimAutoreleasedReturnValue();
                v415 = v719[5];
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v413;
                v727 = 2112;
                v728 = v414;
                v729 = 2112;
                v730 = v415;
                _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

              }
              goto LABEL_114;
            }
            v220 = v707;
            v221 = (void *)v707[3];
            if (v221)
            {
              free(v221);
              v220 = v707;
            }
            v220[3] = 0;
            v703[3] = 0;
          }
          if (!v691[3])
          {
            objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
            v222 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v586, "objectForKeyedSubscript:", v222);
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            v224 = (unint64_t)objc_msgSend(v223, "count") < 2;

            if (v224)
            {
              v225 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v606);
              v640[0] = MEMORY[0x1E0C809B0];
              if (v225)
                v226 = 1;
              else
                v226 = 3;
              v640[1] = 3221225472;
              v640[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_145;
              v640[3] = &unk_1E92A36F8;
              v640[4] = &v690;
              v640[5] = &v686;
              v640[6] = &v718;
              -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", v606, v226, 0, v640);
              if (v599 && v719[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v141 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                {
                  v445 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v445);
                  v446 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v447 = (id)objc_claimAutoreleasedReturnValue();
                  v448 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v446;
                  v727 = 2112;
                  v728 = v447;
                  v729 = 2112;
                  v730 = v448;
                  _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                }
                goto LABEL_114;
              }
              v639[0] = MEMORY[0x1E0C809B0];
              v639[1] = 3221225472;
              v639[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_146;
              v639[3] = &unk_1E92A36F8;
              v639[4] = &v682;
              v639[5] = &v678;
              v639[6] = &v718;
              -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", v606, 2, 0, v639);
              if (v599 && v719[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v141 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                {
                  v457 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v457);
                  v458 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v459 = (id)objc_claimAutoreleasedReturnValue();
                  v460 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v458;
                  v727 = 2112;
                  v728 = v459;
                  v729 = 2112;
                  v730 = v460;
                  _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                }
                goto LABEL_114;
              }
            }
          }
          objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "objectForKeyedSubscript:", v231);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          v233 = (unint64_t)objc_msgSend(v232, "count") < 2;

          if (v233)
          {
            v234 = v691[3];
            v235 = v687[3];
            v236 = v683[3];
            v237 = v679[3];
            objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v586, "objectForKeyedSubscript:", v238);
            v239 = (void *)objc_claimAutoreleasedReturnValue();
            v240 = (id *)(v719 + 5);
            v638 = (id)v719[5];
            -[RTWorkoutRouteManager _preComputeCacheForWorkout:locations:locationsCount:decimatedLocations:decimatedLocationsCount:cachedDictionary:error:](self, "_preComputeCacheForWorkout:locations:locationsCount:decimatedLocations:decimatedLocationsCount:cachedDictionary:error:", v606, v234, v235, v236, v237, v239, &v638);
            objc_storeStrong(v240, v638);

            if (v599 && v719[5])
            {
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v141 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
              {
                v426 = (objc_class *)objc_opt_class();
                NSStringFromClass(v426);
                v427 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v428 = (id)objc_claimAutoreleasedReturnValue();
                v429 = v719[5];
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v427;
                v727 = 2112;
                v728 = v428;
                v729 = 2112;
                v730 = v429;
                _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

              }
              goto LABEL_114;
            }
            v241 = v683;
            v242 = (void *)v683[3];
            if (v242)
            {
              free(v242);
              v241 = v683;
            }
            v241[3] = 0;
            v679[3] = 0;
          }
          v243 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v181, "timeIntervalSinceDate:", v577);
          objc_msgSend(v243, "numberWithDouble:");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          v183 = (void **)(v719 + 5);
          v637 = (void *)v719[5];
          -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v182, 5, &v637);
          v184 = v637;
          v568 = v577;
        }
        v244 = v184;
        v245 = *v183;
        *v183 = v244;

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v577 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v169)
        {
          objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "objectForKeyedSubscript:", v246);
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v586, "objectForKeyedSubscript:", v248);
          v249 = (void *)objc_claimAutoreleasedReturnValue();
          v250 = (id *)(v719 + 5);
          v636 = (id)v719[5];
          v251 = -[RTWorkoutRouteManager _isPreFilteredLocationCountBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:](self, "_isPreFilteredLocationCountBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:", log, v247, v606, v249, v580, &v636);
          objc_storeStrong(v250, v636);

          if (v599 && v719[5])
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v141 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
            {
              v392 = (objc_class *)objc_opt_class();
              NSStringFromClass(v392);
              v393 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v394 = (id)objc_claimAutoreleasedReturnValue();
              v395 = v719[5];
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v393;
              v727 = 2112;
              v728 = v394;
              v729 = 2112;
              v730 = v395;
              _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

            }
            goto LABEL_114;
          }
          if (!v251)
          {
            v258 = 0;
LABEL_206:
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v259 = (void *)objc_claimAutoreleasedReturnValue();

            if ((v258 & 1) == 0)
            {
              objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
              v260 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v586, "objectForKeyedSubscript:", v260);
              v261 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
              v262 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v586, "objectForKeyedSubscript:", v262);
              v263 = (void *)objc_claimAutoreleasedReturnValue();
              v264 = (id *)(v719 + 5);
              v634 = (id)v719[5];
              v265 = -[RTWorkoutRouteManager _isPreFilteredLastLocationBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:](self, "_isPreFilteredLastLocationBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:", log, v261, v606, v263, v580, &v634);
              objc_storeStrong(v264, v634);

              if (v599 && v719[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v266 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v266, OS_LOG_TYPE_ERROR))
                {
                  v396 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v396);
                  v397 = (id)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v398 = (id)objc_claimAutoreleasedReturnValue();
                  v399 = v719[5];
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v397;
                  v727 = 2112;
                  v728 = v398;
                  v729 = 2112;
                  v730 = v399;
                  _os_log_error_impl(&dword_1D1A22000, v266, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                }
                objc_msgSend(v599, "addObject:", v719[5]);
                v146 = v719[5];
                v719[5] = 0;
                v86 = 19;
                v577 = v259;
                goto LABEL_130;
              }
              if (!v265)
              {
                v273 = 0;
LABEL_217:
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v577 = (void *)objc_claimAutoreleasedReturnValue();

                if ((v273 & 1) == 0)
                {
                  objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
                  v274 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v586, "objectForKeyedSubscript:", v274);
                  v275 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
                  v276 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v586, "objectForKeyedSubscript:", v276);
                  v277 = (void *)objc_claimAutoreleasedReturnValue();
                  v278 = (id *)(v719 + 5);
                  v632 = (id)v719[5];
                  v279 = -[RTWorkoutRouteManager _isPreFilteredCentroidBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:](self, "_isPreFilteredCentroidBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:", log, v275, v606, v277, v580, &v632);
                  objc_storeStrong(v278, v632);

                  if (v599 && v719[5])
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                    v141 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                    {
                      v408 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v408);
                      v409 = (id)objc_claimAutoreleasedReturnValue();
                      NSStringFromSelector(a2);
                      v410 = (id)objc_claimAutoreleasedReturnValue();
                      v411 = v719[5];
                      *(_DWORD *)buf = 138412802;
                      *(_QWORD *)&buf[4] = v409;
                      v727 = 2112;
                      v728 = v410;
                      v729 = 2112;
                      v730 = v411;
                      _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                    }
                    goto LABEL_114;
                  }
                  if (!v279)
                  {
                    v286 = 0;
LABEL_228:
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v287 = (void *)objc_claimAutoreleasedReturnValue();

                    if ((v286 & 1) == 0)
                    {
                      objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
                      v288 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v586, "objectForKeyedSubscript:", v288);
                      v289 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
                      v290 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v586, "objectForKeyedSubscript:", v290);
                      v291 = (void *)objc_claimAutoreleasedReturnValue();
                      v292 = (id *)(v719 + 5);
                      v630 = (id)v719[5];
                      v293 = -[RTWorkoutRouteManager _isPreFilteredIOUBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:](self, "_isPreFilteredIOUBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:preFilteringResults:error:", log, v289, v606, v291, v580, &v630);
                      objc_storeStrong(v292, v630);

                      if (v599 && v719[5])
                      {
                        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                        v294 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                        {
                          v416 = (objc_class *)objc_opt_class();
                          NSStringFromClass(v416);
                          v417 = (id)objc_claimAutoreleasedReturnValue();
                          NSStringFromSelector(a2);
                          v418 = (id)objc_claimAutoreleasedReturnValue();
                          v419 = v719[5];
                          *(_DWORD *)buf = 138412802;
                          *(_QWORD *)&buf[4] = v417;
                          v727 = 2112;
                          v728 = v418;
                          v729 = 2112;
                          v730 = v419;
                          _os_log_error_impl(&dword_1D1A22000, v294, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                        }
LABEL_292:

                        objc_msgSend(v599, "addObject:", v719[5]);
                        v146 = v719[5];
                        v719[5] = 0;
                        v86 = 19;
                        v577 = v287;
                        goto LABEL_130;
                      }
                      if (v293)
                      {
                        v295 = (void *)MEMORY[0x1E0CB37E8];
                        objc_msgSend(MEMORY[0x1E0C99D68], "date");
                        v296 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v296, "timeIntervalSinceDate:", v287);
                        objc_msgSend(v295, "numberWithDouble:");
                        v297 = (void *)objc_claimAutoreleasedReturnValue();
                        v298 = (id *)(v719 + 5);
                        v629 = (id)v719[5];
                        -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v297, 8, &v629);
                        objc_storeStrong(v298, v629);

                      }
                      else
                      {
                        objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
                        v325 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v586, "objectForKeyedSubscript:", v325);
                        v326 = (void *)objc_claimAutoreleasedReturnValue();
                        v327 = (id *)(v719 + 5);
                        v628 = (id)v719[5];
                        v328 = -[RTWorkoutRouteManager _isPreFilteredRunningTrackBasedForWorkout:cachedDictionary:error:](self, "_isPreFilteredRunningTrackBasedForWorkout:cachedDictionary:error:", log, v326, &v628);
                        objc_storeStrong(v327, v628);

                        if (v599 && v719[5])
                        {
                          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                          v294 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                          {
                            v449 = (objc_class *)objc_opt_class();
                            NSStringFromClass(v449);
                            v450 = (id)objc_claimAutoreleasedReturnValue();
                            NSStringFromSelector(a2);
                            v451 = (id)objc_claimAutoreleasedReturnValue();
                            v452 = v719[5];
                            *(_DWORD *)buf = 138412802;
                            *(_QWORD *)&buf[4] = v450;
                            v727 = 2112;
                            v728 = v451;
                            v729 = 2112;
                            v730 = v452;
                            _os_log_error_impl(&dword_1D1A22000, v294, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                          }
                          goto LABEL_292;
                        }
                        if (v328)
                        {
                          -[NSObject UUID](log, "UUID");
                          v362 = (void *)objc_claimAutoreleasedReturnValue();
                          v363 = objc_msgSend(v593, "containsObject:", v362);

                          if ((v363 & 1) == 0)
                          {
                            -[NSObject UUID](log, "UUID");
                            v364 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v593, "addObject:", v364);

                          }
                        }
                        else
                        {
                          objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
                          v369 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v586, "objectForKeyedSubscript:", v369);
                          v370 = (void *)objc_claimAutoreleasedReturnValue();
                          v371 = (id *)(v719 + 5);
                          v627 = (id)v719[5];
                          v372 = -[RTWorkoutRouteManager _isPreFilteredRunningTrackBasedForWorkout:cachedDictionary:error:](self, "_isPreFilteredRunningTrackBasedForWorkout:cachedDictionary:error:", v606, v370, &v627);
                          objc_storeStrong(v371, v627);

                          if (v599 && v719[5])
                          {
                            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                            v294 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v294, OS_LOG_TYPE_ERROR))
                            {
                              v469 = (objc_class *)objc_opt_class();
                              NSStringFromClass(v469);
                              v470 = (id)objc_claimAutoreleasedReturnValue();
                              NSStringFromSelector(a2);
                              v471 = (id)objc_claimAutoreleasedReturnValue();
                              v472 = v719[5];
                              *(_DWORD *)buf = 138412802;
                              *(_QWORD *)&buf[4] = v470;
                              v727 = 2112;
                              v728 = v471;
                              v729 = 2112;
                              v730 = v472;
                              _os_log_error_impl(&dword_1D1A22000, v294, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                            }
                            goto LABEL_292;
                          }
                          if (!v372)
                          {
                            v301 = 0;
LABEL_240:
                            objc_msgSend(MEMORY[0x1E0C99D68], "date");
                            v577 = (void *)objc_claimAutoreleasedReturnValue();

                            if ((v301 & 1) != 0)
                            {
LABEL_252:
                              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              v146 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
                              {
                                v314 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v314);
                                v315 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                v316 = (id)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138412546;
                                *(_QWORD *)&buf[4] = v315;
                                v727 = 2112;
                                v728 = v316;
                                _os_log_impl(&dword_1D1A22000, v146, OS_LOG_TYPE_INFO, "%@, %@, final pre-filtered, YES", buf, 0x16u);

                              }
                              v317 = v18;
                              goto LABEL_255;
                            }
                            objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
                            v302 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v586, "objectForKeyedSubscript:", v302);
                            v303 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v611, "objectAtIndexedSubscript:", v612);
                            v304 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v586, "objectForKeyedSubscript:", v304);
                            v305 = (void *)objc_claimAutoreleasedReturnValue();
                            v306 = (id *)(v719 + 5);
                            v626 = (id)v719[5];
                            v307 = -[RTWorkoutRouteManager _isPreFilteredCurveOrientationBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:error:](self, "_isPreFilteredCurveOrientationBasedForWorkout:cachedDictionary:otherWorkout:cachedOtherDictionary:error:", log, v303, v606, v305, &v626);
                            objc_storeStrong(v306, v626);

                            if (v599 && v719[5])
                            {
                              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              v141 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                              {
                                v430 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v430);
                                v431 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                v432 = (id)objc_claimAutoreleasedReturnValue();
                                v433 = v719[5];
                                *(_DWORD *)buf = 138412802;
                                *(_QWORD *)&buf[4] = v431;
                                v727 = 2112;
                                v728 = v432;
                                v729 = 2112;
                                v730 = v433;
                                _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                              }
                              goto LABEL_114;
                            }
                            if (v307)
                            {
                              v308 = (void *)MEMORY[0x1E0CB37E8];
                              objc_msgSend(MEMORY[0x1E0C99D68], "date");
                              v309 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v309, "timeIntervalSinceDate:", v577);
                              objc_msgSend(v308, "numberWithDouble:");
                              v310 = (void *)objc_claimAutoreleasedReturnValue();
                              v311 = (id *)(v719 + 5);
                              v625 = (id)v719[5];
                              -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v310, 13, &v625);
                              objc_storeStrong(v311, v625);

                              v312 = v691;
                              v313 = (void *)v691[3];
                              if (v313)
                              {
                                free(v313);
                                v312 = v691;
                              }
                              v312[3] = 0;
                              v687[3] = 0;
                              goto LABEL_252;
                            }
                            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                            v351 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v351, OS_LOG_TYPE_INFO))
                            {
                              v352 = (objc_class *)objc_opt_class();
                              NSStringFromClass(v352);
                              v353 = (id)objc_claimAutoreleasedReturnValue();
                              NSStringFromSelector(a2);
                              v354 = (id)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412546;
                              *(_QWORD *)&buf[4] = v353;
                              v727 = 2112;
                              v728 = v354;
                              _os_log_impl(&dword_1D1A22000, v351, OS_LOG_TYPE_INFO, "%@, %@, final pre-filtered, NO", buf, 0x16u);

                            }
                            if (!v715[3])
                            {
                              v373 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", log);
                              v624[0] = MEMORY[0x1E0C809B0];
                              v374 = v373 ? 1 : 3;
                              v624[1] = 3221225472;
                              v624[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_147;
                              v624[3] = &unk_1E92A36F8;
                              v624[4] = &v714;
                              v624[5] = &v710;
                              v624[6] = &v718;
                              -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", log, v374, 0, v624);
                              if (v599)
                              {
                                if (v719[5])
                                {
                                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                  v141 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                                  {
                                    v473 = (objc_class *)objc_opt_class();
                                    NSStringFromClass(v473);
                                    v474 = (id)objc_claimAutoreleasedReturnValue();
                                    NSStringFromSelector(a2);
                                    v475 = (id)objc_claimAutoreleasedReturnValue();
                                    v476 = v719[5];
                                    *(_DWORD *)buf = 138412802;
                                    *(_QWORD *)&buf[4] = v474;
                                    v727 = 2112;
                                    v728 = v475;
                                    v729 = 2112;
                                    v730 = v476;
                                    _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                                  }
                                  goto LABEL_114;
                                }
                              }
                            }
                            if (!v691[3])
                            {
                              v375 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v606);
                              v623[0] = MEMORY[0x1E0C809B0];
                              v376 = v375 ? 1 : 3;
                              v623[1] = 3221225472;
                              v623[2] = __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_148;
                              v623[3] = &unk_1E92A36F8;
                              v623[4] = &v690;
                              v623[5] = &v686;
                              v623[6] = &v718;
                              -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", v606, v376, 0, v623);
                              if (v599)
                              {
                                if (v719[5])
                                {
                                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                  v141 = objc_claimAutoreleasedReturnValue();
                                  if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
                                  {
                                    v477 = (objc_class *)objc_opt_class();
                                    NSStringFromClass(v477);
                                    v478 = (id)objc_claimAutoreleasedReturnValue();
                                    NSStringFromSelector(a2);
                                    v479 = (id)objc_claimAutoreleasedReturnValue();
                                    v480 = v719[5];
                                    *(_DWORD *)buf = 138412802;
                                    *(_QWORD *)&buf[4] = v478;
                                    v727 = 2112;
                                    v728 = v479;
                                    v729 = 2112;
                                    v730 = v480;
                                    _os_log_error_impl(&dword_1D1A22000, v141, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                                  }
                                  goto LABEL_114;
                                }
                              }
                            }
                            v355 = -[NSObject workoutActivityType](log, "workoutActivityType");
                            v356 = (id *)(v719 + 5);
                            v622 = (id)v719[5];
                            -[RTWorkoutRouteManager _getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:](self, "_getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:", v543, v572, v355, &v622);
                            v146 = objc_claimAutoreleasedReturnValue();
                            objc_storeStrong(v356, v622);
                            if (v599 && v719[5])
                            {
                              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              v357 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v357, OS_LOG_TYPE_ERROR))
                              {
                                v461 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v461);
                                v462 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                v463 = (id)objc_claimAutoreleasedReturnValue();
                                v464 = v719[5];
                                *(_DWORD *)buf = 138412802;
                                *(_QWORD *)&buf[4] = v462;
                                v727 = 2112;
                                v728 = v463;
                                v729 = 2112;
                                v730 = v464;
                                _os_log_error_impl(&dword_1D1A22000, v357, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                              }
LABEL_314:

                              objc_msgSend(v599, "addObject:", v719[5]);
LABEL_315:
                              v388 = (void *)v719[5];
                              v719[5] = 0;

                              goto LABEL_115;
                            }
                            objc_msgSend(MEMORY[0x1E0C99D68], "date");
                            v365 = (void *)objc_claimAutoreleasedReturnValue();

                            v366 = (id *)(v719 + 5);
                            v621 = (id)v719[5];
                            -[RTWorkoutRouteManager similarityDistanceUsingPreFilteringResults:error:](self, "similarityDistanceUsingPreFilteringResults:error:", v580, &v621);
                            v317 = v367;
                            objc_storeStrong(v366, v621);
                            if (v599 && v719[5])
                            {
                              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                              v368 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v368, OS_LOG_TYPE_ERROR))
                              {
                                v465 = (objc_class *)objc_opt_class();
                                NSStringFromClass(v465);
                                v466 = (id)objc_claimAutoreleasedReturnValue();
                                NSStringFromSelector(a2);
                                v467 = (id)objc_claimAutoreleasedReturnValue();
                                v468 = v719[5];
                                *(_DWORD *)buf = 138412802;
                                *(_QWORD *)&buf[4] = v466;
                                v727 = 2112;
                                v728 = v467;
                                v729 = 2112;
                                v730 = v468;
                                _os_log_error_impl(&dword_1D1A22000, v368, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                              }
                              objc_msgSend(v599, "addObject:", v719[5]);
                              v577 = v365;
                              goto LABEL_315;
                            }
                            v377 = (void *)MEMORY[0x1E0CB37E8];
                            if (v317 == v18)
                            {
                              objc_msgSend(MEMORY[0x1E0C99D68], "date");
                              v378 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v378, "timeIntervalSinceDate:", v365);
                              objc_msgSend(v377, "numberWithDouble:");
                              v379 = (void *)objc_claimAutoreleasedReturnValue();
                              v380 = (id *)(v719 + 5);
                              v620 = (id)v719[5];
                              -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v379, 10, &v620);
                              objc_storeStrong(v380, v620);

                              objc_msgSend(MEMORY[0x1E0C99D68], "date");
                              v577 = (void *)objc_claimAutoreleasedReturnValue();

                              -[RTWorkoutRouteManager distanceCalculator](self, "distanceCalculator");
                              v381 = (void *)objc_claimAutoreleasedReturnValue();
                              v382 = v715[3];
                              v383 = v711[3];
                              v384 = v691[3];
                              v385 = v687[3];
                              -[NSObject doubleValue](v146, "doubleValue");
                              v386 = (id *)(v719 + 5);
                              v619 = (id)v719[5];
                              objc_msgSend(v381, "distanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:distanceMetric:threshold:error:", v382, v383, v384, v385, v543, &v619);
                              v317 = v387;
                              objc_storeStrong(v386, v619);

                              if (v599 && v719[5])
                              {
                                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                v357 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v357, OS_LOG_TYPE_ERROR))
                                {
                                  v481 = (objc_class *)objc_opt_class();
                                  NSStringFromClass(v481);
                                  v482 = (id)objc_claimAutoreleasedReturnValue();
                                  NSStringFromSelector(a2);
                                  v483 = (id)objc_claimAutoreleasedReturnValue();
                                  v484 = v719[5];
                                  *(_DWORD *)buf = 138412802;
                                  *(_QWORD *)&buf[4] = v482;
                                  v727 = 2112;
                                  v728 = v483;
                                  v729 = 2112;
                                  v730 = v484;
                                  _os_log_error_impl(&dword_1D1A22000, v357, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                                }
                                goto LABEL_314;
                              }
                              -[NSObject doubleValue](v146, "doubleValue");
                              v420 = (void *)MEMORY[0x1E0CB37E8];
                              if (v317 <= v421)
                              {
                                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                                v422 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v422, "timeIntervalSinceDate:", v577);
                                objc_msgSend(v420, "numberWithDouble:");
                                v423 = (void *)objc_claimAutoreleasedReturnValue();
                                v424 = (void **)(v719 + 5);
                                v617 = (void *)v719[5];
                                -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v423, 11, &v617);
                                v425 = v617;
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                                v422 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v422, "timeIntervalSinceDate:", v577);
                                objc_msgSend(v420, "numberWithDouble:");
                                v423 = (void *)objc_claimAutoreleasedReturnValue();
                                v424 = (void **)(v719 + 5);
                                v618 = (void *)v719[5];
                                -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v423, 9, &v618);
                                v425 = v618;
                              }
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0C99D68], "date");
                              v422 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v422, "timeIntervalSinceDate:", v365);
                              objc_msgSend(v377, "numberWithDouble:");
                              v423 = (void *)objc_claimAutoreleasedReturnValue();
                              v424 = (void **)(v719 + 5);
                              v616 = (void *)v719[5];
                              -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v423, 12, &v616);
                              v425 = v616;
                              v577 = v365;
                            }
                            v437 = v425;
                            v438 = *v424;
                            *v424 = v437;

                            v439 = v691;
                            v440 = (void *)v691[3];
                            if (v440)
                            {
                              free(v440);
                              v439 = v691;
                            }
                            v439[3] = 0;
                            v687[3] = 0;
LABEL_255:

                            v318 = [RTWorkoutDistance alloc];
                            -[NSObject UUID](log, "UUID");
                            v319 = (void *)objc_claimAutoreleasedReturnValue();
                            -[NSObject UUID](v606, "UUID");
                            v320 = (void *)objc_claimAutoreleasedReturnValue();
                            v321 = objc_msgSend((id)objc_opt_class(), "RTHealthKitWorkoutActivityTypeFromHKWorkoutActivityType:", -[NSObject workoutActivityType](log, "workoutActivityType"));
                            objc_msgSend(MEMORY[0x1E0C99D68], "now");
                            v322 = (void *)objc_claimAutoreleasedReturnValue();
                            LOBYTE(v539) = 0;
                            v146 = -[RTWorkoutDistance initWithObjectID:firstWorkout:secondWorkout:distanceMetric:workoutActivityType:areBothWorkoutsDecimated:distance:isVisited:date:](v318, "initWithObjectID:firstWorkout:secondWorkout:distanceMetric:workoutActivityType:areBothWorkoutsDecimated:distance:isVisited:date:", 0, v319, v320, v543, v321, v572, v317, v539, v322);

                            objc_msgSend(v544, "addObject:", v146);
                            if ((unint64_t)objc_msgSend(v544, "count") >= 0x64)
                            {
                              v615 = 0;
                              -[RTWorkoutRouteManager _storeWorkoutDistances:error:](self, "_storeWorkoutDistances:error:", v544, &v615);
                              v323 = v615;
                              objc_msgSend(v544, "removeAllObjects");
                              if (v599 && v323)
                              {
                                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                                v324 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v324, OS_LOG_TYPE_ERROR))
                                {
                                  v434 = (objc_class *)objc_opt_class();
                                  NSStringFromClass(v434);
                                  v435 = (id)objc_claimAutoreleasedReturnValue();
                                  NSStringFromSelector(a2);
                                  v436 = (id)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138412802;
                                  *(_QWORD *)&buf[4] = v435;
                                  v727 = 2112;
                                  v728 = v436;
                                  v729 = 2112;
                                  v730 = (unint64_t)v323;
                                  _os_log_error_impl(&dword_1D1A22000, v324, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

                                }
                                objc_msgSend(v599, "addObject:", v323);

                                goto LABEL_115;
                              }

                            }
                            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                            v329 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v329, OS_LOG_TYPE_INFO))
                            {
                              v553 = v329;
                              v540 = v146;
                              v541 = v18;
                              v330 = (objc_class *)objc_opt_class();
                              NSStringFromClass(v330);
                              v569 = (id)objc_claimAutoreleasedReturnValue();
                              NSStringFromSelector(a2);
                              v573 = (os_log_t)(id)objc_claimAutoreleasedReturnValue();
                              -[NSObject UUID](log, "UUID");
                              v559 = (void *)objc_claimAutoreleasedReturnValue();
                              -[NSObject UUID](v606, "UUID");
                              v556 = (void *)objc_claimAutoreleasedReturnValue();
                              -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
                              v565 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v565, "_getTotalDistanceForWorkout:", log);
                              v562 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                              v331 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v562, "doubleValueForUnit:", v331);
                              v333 = v332;
                              -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
                              v334 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v334, "_getDurationForWorkout:", log);
                              v336 = v335;
                              v337 = v711[3];
                              -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
                              v338 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v338, "_getTotalDistanceForWorkout:", v606);
                              v339 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                              v340 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v339, "doubleValueForUnit:", v340);
                              v342 = v341;
                              -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
                              v343 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v343, "_getDurationForWorkout:", v606);
                              v345 = v344;
                              v346 = v687[3];
                              objc_msgSend(MEMORY[0x1E0C99D68], "date");
                              v347 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v347, "timeIntervalSinceDate:", v602);
                              v349 = v348;
                              +[RTRuntime footprint](RTRuntime, "footprint");
                              *(_DWORD *)buf = 138415874;
                              *(_QWORD *)&buf[4] = v569;
                              v727 = 2112;
                              v728 = v573;
                              v729 = 2048;
                              v730 = v609;
                              v731 = 2048;
                              v732 = v612;
                              v733 = 2112;
                              v734 = (uint64_t)v559;
                              v735 = 2112;
                              v736 = (uint64_t)v556;
                              v737 = 2112;
                              v738 = v540;
                              v739 = 2048;
                              v740 = v333;
                              v741 = 2048;
                              v742 = v336;
                              v743 = 2048;
                              v744 = v337;
                              v745 = 2048;
                              v746 = v342;
                              v747 = 2048;
                              v748 = v345;
                              v749 = 2048;
                              v750 = v346;
                              v146 = v540;
                              v751 = 2048;
                              v752 = v349;
                              v753 = 2048;
                              v754 = v350;
                              _os_log_impl(&dword_1D1A22000, v553, OS_LOG_TYPE_INFO, "%@, %@, comparison done between i, %lu, j, %lu, workout, %@, other workout, %@, workout distance record, %@, workout distance, %.3f meters, workout duration, %.3f sec, locations count, %lu, other workout distance, %.3f meters, other workout duration, %.3f sec, other locations count, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x98u);

                              v18 = v541;
                              v329 = v553;
                            }

                            objc_msgSend(v580, "removeAllObjects");
                            v86 = 0;
                            goto LABEL_130;
                          }
                          -[NSObject UUID](v606, "UUID");
                          v389 = (void *)objc_claimAutoreleasedReturnValue();
                          v390 = objc_msgSend(v593, "containsObject:", v389);

                          if ((v390 & 1) == 0)
                          {
                            -[NSObject UUID](v606, "UUID");
                            v391 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v593, "addObject:", v391);

                          }
                        }
                      }
                      v299 = v691;
                      v300 = (void *)v691[3];
                      if (v300)
                      {
                        free(v300);
                        v299 = v691;
                      }
                      v299[3] = 0;
                      v687[3] = 0;
                    }
                    v301 = 1;
                    goto LABEL_240;
                  }
                  v280 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(MEMORY[0x1E0C99D68], "date");
                  v281 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v281, "timeIntervalSinceDate:", v577);
                  objc_msgSend(v280, "numberWithDouble:");
                  v282 = (void *)objc_claimAutoreleasedReturnValue();
                  v283 = (id *)(v719 + 5);
                  v631 = (id)v719[5];
                  -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v282, 6, &v631);
                  objc_storeStrong(v283, v631);

                  v284 = v691;
                  v285 = (void *)v691[3];
                  if (v285)
                  {
                    free(v285);
                    v284 = v691;
                  }
                  v284[3] = 0;
                  v687[3] = 0;
                }
                v286 = 1;
                goto LABEL_228;
              }
              v267 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v268 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v268, "timeIntervalSinceDate:", v259);
              objc_msgSend(v267, "numberWithDouble:");
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              v270 = (id *)(v719 + 5);
              v633 = (id)v719[5];
              -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v269, 4, &v633);
              objc_storeStrong(v270, v633);

              v271 = v691;
              v272 = (void *)v691[3];
              if (v272)
              {
                free(v272);
                v271 = v691;
              }
              v271[3] = 0;
              v687[3] = 0;
            }
            v273 = 1;
            goto LABEL_217;
          }
          v252 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v253 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v253, "timeIntervalSinceDate:", v577);
          objc_msgSend(v252, "numberWithDouble:");
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          v255 = (id *)(v719 + 5);
          v635 = (id)v719[5];
          -[RTWorkoutRouteManager _updateMetricsForCurrentTime:distanceMatrixKey:error:](self, "_updateMetricsForCurrentTime:distanceMatrixKey:error:", v254, 7, &v635);
          objc_storeStrong(v255, v635);

          v256 = v691;
          v257 = (void *)v691[3];
          if (v257)
          {
            free(v257);
            v256 = v691;
          }
          v256[3] = 0;
          v687[3] = 0;
        }
        v258 = 1;
        goto LABEL_206;
      }
      v120 = (id *)(v719 + 5);
      v654 = (id)v719[5];
      -[RTWorkoutRouteManager _refreshWorkoutsCache:workoutUUIDs:startingIndex:error:](self, "_refreshWorkoutsCache:workoutUUIDs:startingIndex:error:", v582, v611, v609, &v654);
      objc_storeStrong(v120, v654);
      if (v599 && v719[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v121 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          v198 = (objc_class *)objc_opt_class();
          NSStringFromClass(v198);
          v199 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v200 = objc_claimAutoreleasedReturnValue();
          v201 = v719[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v199;
          v727 = 2112;
          v728 = v200;
          v729 = 2112;
          v730 = v201;
          _os_log_error_impl(&dword_1D1A22000, v121, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

        }
        objc_msgSend(v599, "addObject:", v719[5]);
        log = 0;
      }
      else
      {
        objc_msgSend(v611, "objectAtIndexedSubscript:", v609);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = (id *)(v719 + 5);
        v653 = (id)v719[5];
        -[RTWorkoutRouteManager _getWorkoutFromWorkouts:UUID:error:](self, "_getWorkoutFromWorkouts:UUID:error:", v582, v126, &v653);
        log = objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v127, v653);

        if (!v599 || !v719[5])
          goto LABEL_71;
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          v206 = (objc_class *)objc_opt_class();
          NSStringFromClass(v206);
          v207 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v208 = objc_claimAutoreleasedReturnValue();
          v209 = v719[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v207;
          v727 = 2112;
          v728 = v208;
          v729 = 2112;
          v730 = v209;
          _os_log_error_impl(&dword_1D1A22000, v128, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

        }
        objc_msgSend(v599, "addObject:", v719[5]);
      }
      v606 = (os_log_t)v719[5];
      v719[5] = 0;
LABEL_93:
      v86 = 19;
LABEL_94:

      v15 = v87;
      goto LABEL_95;
    }
LABEL_339:

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v501 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v501, OS_LOG_TYPE_INFO))
    {
      v574 = v501;
      v502 = (objc_class *)objc_opt_class();
      NSStringFromClass(v502);
      v610 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v613 = (id)objc_claimAutoreleasedReturnValue();
      v570 = objc_msgSend(v611, "count");
      v566 = objc_msgSend(v611, "count");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v607 = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v607, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_prefiltered_metadata"));
      contexta = (void *)objc_claimAutoreleasedReturnValue();
      v563 = objc_msgSend(contexta, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v603 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v603, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_prefiltered_firstlocation"));
      loga = (os_log_t)objc_claimAutoreleasedReturnValue();
      v560 = -[NSObject unsignedIntegerValue](loga, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      dsemaa = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](dsemaa, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_prefiltered_locationscount"));
      v594 = (void *)objc_claimAutoreleasedReturnValue();
      v557 = objc_msgSend(v594, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v592 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v592, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_prefiltered_lastlocation"));
      v590 = (void *)objc_claimAutoreleasedReturnValue();
      v554 = (os_log_t)objc_msgSend(v590, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v588 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v588, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_prefiltered_centroid"));
      v587 = (void *)objc_claimAutoreleasedReturnValue();
      v551 = objc_msgSend(v587, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v585 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v585, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_prefiltered_iou"));
      v583 = (void *)objc_claimAutoreleasedReturnValue();
      v549 = objc_msgSend(v583, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v581 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v581, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_lessthan_orequal_quicksimilarity"));
      v578 = (void *)objc_claimAutoreleasedReturnValue();
      v546 = objc_msgSend(v578, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v575 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v575, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_exceeded_quicksimilarity"));
      v503 = (void *)objc_claimAutoreleasedReturnValue();
      v545 = objc_msgSend(v503, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v504 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v504, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_lessthan_orequal_dtw"));
      v505 = (void *)objc_claimAutoreleasedReturnValue();
      v506 = objc_msgSend(v505, "unsignedIntegerValue");
      -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
      v507 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v507, "objectForKeyedSubscript:", CFSTR("distance_matrix_count_exceeded_dtw"));
      v508 = (void *)objc_claimAutoreleasedReturnValue();
      v509 = objc_msgSend(v508, "unsignedIntegerValue");
      _RTSafeArray();
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v511 = (id)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint](RTRuntime, "footprint", 1);
      *(_DWORD *)buf = 138415874;
      *(_QWORD *)&buf[4] = v610;
      v727 = 2112;
      v728 = v613;
      v729 = 2048;
      v730 = (unint64_t)(v566 * (v570 - 1)) >> 1;
      v731 = 2048;
      v732 = v563;
      v733 = 2048;
      v734 = v560;
      v735 = 2048;
      v736 = v557;
      v737 = 2048;
      v738 = v554;
      v739 = 2048;
      v740 = v551;
      v741 = 2048;
      v742 = v549;
      v743 = 2048;
      v744 = v546;
      v745 = 2048;
      v746 = v545;
      v747 = 2048;
      v748 = v506;
      v749 = 2048;
      v750 = v509;
      v751 = 2112;
      v752 = v511;
      v753 = 2048;
      v754 = v512;
      v501 = v574;
      _os_log_impl(&dword_1D1A22000, v574, OS_LOG_TYPE_INFO, "%@, %@, summary statistics, total comparisons done, %lu, prefiltered by metadata, %lu, prefiltered by first location, %lu, prefiltered by locations count, %lu, prefiltered by last location, %lu, prefiltered by centroid, %lu, prefiltered by IOU, %lu, quick similarity, %lu, exceeded quick similarity, %lu, less than or equal to DTW threshold, %lu, exceeded DTW threshold, %lu, error, %@, footprint, %.4f MB", buf, 0x98u);

    }
    v513 = (void *)MEMORY[0x1E0CB37E8];
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v514 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v514, "objectForKeyedSubscript:", CFSTR("distance_matrix_total_number_of_comparisons"));
    v515 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v513, "numberWithUnsignedInteger:", objc_msgSend(v515, "unsignedIntegerValue")+ ((unint64_t)(objc_msgSend(v611, "count") * (objc_msgSend(v611, "count") - 1)) >> 1));
    v516 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v517 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v517, "setObject:forKeyedSubscript:", v516, CFSTR("distance_matrix_total_number_of_comparisons"));

    v518 = v715;
    v519 = (void *)v715[3];
    if (v519)
    {
      free(v519);
      v518 = v715;
    }
    v518[3] = 0;
    v520 = v707;
    v521 = (void *)v707[3];
    if (v521)
    {
      free(v521);
      v520 = v707;
    }
    v520[3] = 0;
    v522 = v699;
    v523 = (void *)v699[3];
    if (v523)
    {
      free(v523);
      v522 = v699;
    }
    v522[3] = 0;
    v524 = v691;
    v525 = (void *)v691[3];
    if (v525)
    {
      free(v525);
      v524 = v691;
    }
    v524[3] = 0;
    v526 = v683;
    v527 = (void *)v683[3];
    if (v527)
    {
      free(v527);
      v526 = v683;
    }
    v526[3] = 0;
    v528 = v675;
    v529 = (void *)v675[3];
    if (v529)
    {
      free(v529);
      v528 = v675;
    }
    v528[3] = 0;
    _Block_object_dispose(&v670, 8);
    _Block_object_dispose(&v674, 8);
    _Block_object_dispose(&v678, 8);
    _Block_object_dispose(&v682, 8);
    _Block_object_dispose(&v686, 8);
    _Block_object_dispose(&v690, 8);
    _Block_object_dispose(&v694, 8);
    _Block_object_dispose(&v698, 8);
    _Block_object_dispose(&v702, 8);
    _Block_object_dispose(&v706, 8);
    _Block_object_dispose(&v710, 8);
    _Block_object_dispose(&v714, 8);

    objc_autoreleasePoolPop(v542);
    v530 = v599;
    v10 = v544;
    if (objc_msgSend(v544, "count"))
    {
      v614 = 0;
      -[RTWorkoutRouteManager _storeWorkoutDistances:error:](self, "_storeWorkoutDistances:error:", v544, &v614);
      v531 = v614;

      if (v531)
        v532 = v599 != 0;
      else
        v532 = 0;
      if (v532)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v533 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v533, OS_LOG_TYPE_ERROR))
        {
          v536 = (objc_class *)objc_opt_class();
          NSStringFromClass(v536);
          v537 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v538 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v537;
          v727 = 2112;
          v728 = v538;
          v729 = 2112;
          v730 = (unint64_t)v531;
          _os_log_error_impl(&dword_1D1A22000, v533, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

        }
        objc_msgSend(v599, "addObject:", v531);

        v531 = 0;
      }

      v10 = 0;
      v530 = v599;
    }
    if (a5)
    {
      v539 = 1;
      _RTSafeArray();
      v534 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      v530 = v599;
    }
    v11 = objc_msgSend(v530, "count", v539) == 0;
LABEL_365:
    _Block_object_dispose(&v718, 8);

    v13 = v599;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13 != 0;
  }

  return v11;
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_140(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_142(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_143(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_144(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_145(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_146(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_147(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __91__RTWorkoutRouteManager__computeAndSaveDistanceMatrixForWorkoutUUIDs_distanceMetric_error___block_invoke_148(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

- (BOOL)_clearDistanceMatrixWithError:(id *)a3
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
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  objc_class *v31;
  id v32;
  void *v33;
  objc_class *v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE buf[12];
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  -[RTWorkoutRouteManager _clearInMemoryClusters](self, "_clearInMemoryClusters");
  v5 = dispatch_semaphore_create(0);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__133;
  v46 = __Block_byref_object_dispose__133;
  v47 = 0;
  -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __55__RTWorkoutRouteManager__clearDistanceMatrixWithError___block_invoke;
  v39[3] = &unk_1E9297038;
  v41 = &v42;
  v7 = v5;
  v40 = v7;
  objc_msgSend(v6, "clearWithHandler:", v39);

  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v8, v10))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v9);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v53[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v53, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_retainAutorelease(v22);

  }
  else
  {
LABEL_6:
    v23 = 0;
  }

  v24 = v23;
  v25 = v24;
  if (a3 && v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v32;
      v49 = 2112;
      v50 = v33;
      v51 = 2112;
      v52 = v25;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = v25;
  }
  else
  {
    if (!a3 || !v43[5])
    {
      v29 = 1;
      goto LABEL_19;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)v43[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v35;
      v49 = 2112;
      v50 = v36;
      v51 = 2112;
      v52 = v37;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v27 = (void *)v43[5];
  }
  v29 = 0;
  *a3 = objc_retainAutorelease(v27);
LABEL_19:

  _Block_object_dispose(&v42, 8);
  return v29;
}

void __55__RTWorkoutRouteManager__clearDistanceMatrixWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_clearInMemoryClusters
{
  void *v3;
  void *v4;

  -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](self, "workoutActivityTypeToclustersSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](self, "workoutActivityTypeToclustersSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");
  }
  else
  {
    v4 = (void *)objc_opt_new();
    -[RTWorkoutRouteManager setWorkoutActivityTypeToclustersSet:](self, "setWorkoutActivityTypeToclustersSet:", v4);
  }

  return 1;
}

- (BOOL)_preComputeCacheForWorkout:(id)a3 locations:(CLLocationCoordinate2D *)a4 locationsCount:(unint64_t)a5 decimatedLocations:(CLLocationCoordinate2D *)a6 decimatedLocationsCount:(unint64_t)a7 cachedDictionary:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  NSObject *v30;
  objc_class *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CLLocationCoordinate2D *v38;
  id *v39;
  BOOL v40;
  NSObject *v41;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  const char *aSelector;
  CLLocationCoordinate2D *v65;
  void *v66;
  RTWorkoutRouteManager *v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  unint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a8;
  v18 = v17;
  if (v16)
  {
    v67 = self;
    if (v17 && 2 * kRTSmoothingNumberOfLocations + 4 <= a5)
    {
      aSelector = a2;
      v19 = MEMORY[0x1D8231EA8]();
      v65 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      *v65 = a4[a5 - 1];
      v20 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      -[RTWorkoutRouteManager distanceCalculator](v67, "distanceCalculator");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      objc_msgSend(v21, "computeCentroid:locationsCount:error:", a6, a7, &v70);
      v23 = v22;
      v25 = v24;
      v26 = v70;
      *v20 = v23;
      v20[1] = v25;
      v66 = v20;

      if (v26)
      {
        v27 = 0;
      }
      else
      {
        -[RTWorkoutRouteManager distanceCalculator](v67, "distanceCalculator");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        v27 = (void *)objc_msgSend(v36, "rectVerticesFromCoordinates:locationsCount:ignoreNFirstAndLastLocations:error:", a4, a5, kRTSmoothingNumberOfLocations, &v69);
        v26 = v69;

        if (!v26)
        {
          v68 = 0;
          v43 = -[RTWorkoutRouteManager _getCurveOrientationTypeForLocations:locationsCount:error:](v67, "_getCurveOrientationTypeForLocations:locationsCount:error:", a4, a5, &v68);
          v44 = v68;
          v37 = (void *)v19;
          v39 = a9;
          if (v44)
          {
            v26 = v44;
            v38 = v65;
          }
          else
          {
            v63 = v43;
            v45 = objc_alloc(MEMORY[0x1E0D18408]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (void *)objc_msgSend(v45, "initWithFirstObject:secondObject:", v46, v47);
            v74 = v48;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v49, CFSTR("kRTCacheKeyLocationsCount"));

            v38 = v65;
            -[RTWorkoutRouteManager _getRTPairUsingCLLocationCoordinate2D:](v67, "_getRTPairUsingCLLocationCoordinate2D:", v65);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v50;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v51, CFSTR("kRTCacheKeyLastLocation"));

            -[RTWorkoutRouteManager _getRTPairUsingCLLocationCoordinate2D:](v67, "_getRTPairUsingCLLocationCoordinate2D:", v66);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v52;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v53, CFSTR("kRTCacheKeyCentroid"));

            -[RTWorkoutRouteManager _getRTPairsFromCoordinates:count:](v67, "_getRTPairsFromCoordinates:count:", v27, 4);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v54, CFSTR("kRTCacheKeyBoundingBoxVertices"));

            v55 = objc_alloc(MEMORY[0x1E0D18408]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v63);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v63);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)objc_msgSend(v55, "initWithFirstObject:secondObject:", v56, v57);
            v71 = v58;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v59, CFSTR("kRTCacheKeyCurveOrientation"));

            v26 = 0;
          }
          goto LABEL_16;
        }
      }
      v37 = (void *)v19;
      v38 = v65;
      v39 = a9;
LABEL_16:
      objc_autoreleasePoolPop(v37);
      free(v38);
      free(v66);
      if (v27)
        free(v27);
      if (v39)
        v40 = v26 == 0;
      else
        v40 = 1;
      v29 = v40;
      if (!v40)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          v60 = (objc_class *)objc_opt_class();
          NSStringFromClass(v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v76 = v61;
          v77 = 2112;
          v78 = v62;
          v79 = 2112;
          v80 = (unint64_t)v26;
          _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        *v39 = objc_retainAutorelease(v26);
      }

      goto LABEL_29;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = a2;
      v34 = (void *)v32;
      NSStringFromSelector(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v76 = v34;
      v77 = 2112;
      v78 = v35;
      v79 = 2048;
      v80 = a5;
      v81 = 2048;
      v82 = 2 * kRTSmoothingNumberOfLocations + 4;
      v83 = 2048;
      v84 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, %@, preComputing cache failed, locations count, %lu, expected count, %lu, cachedDictionary count, %lu, ", buf, 0x34u);

    }
    v29 = 0;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v29 = 1;
  }
LABEL_29:

  return v29;
}

- (BOOL)_isPreFilteredForWorkout:(id)a3 otherWorkout:(id)a4 preFilteringResults:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  double v27;
  void *v28;
  const __CFString *v29;
  NSObject *v30;
  RTWorkoutRouteManager *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  NSObject *v51;
  const __CFString *v52;
  NSObject *v53;
  BOOL v54;
  double v55;
  double v56;
  __CFString *v57;
  __CFString *v58;
  NSObject *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  NSObject *v67;
  objc_class *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  objc_class *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  uint64_t v83;
  id *v84;
  const char *aSelector;
  void *v86;
  RTWorkoutRouteManager *v87;
  id v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  const __CFString *v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  __int16 v99;
  double v100;
  __int16 v101;
  double v102;
  __int16 v103;
  double v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a6)
      goto LABEL_25;
    v52 = CFSTR("workout");
    goto LABEL_24;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
    }

    if (!a6)
      goto LABEL_25;
    v52 = CFSTR("otherWorkout");
LABEL_24:
    _RTErrorInvalidParameterCreate((uint64_t)v52);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    v54 = 1;
    goto LABEL_52;
  }
  v86 = v13;
  v87 = self;
  v84 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "workoutActivityType");
  v17 = objc_msgSend(v12, "workoutActivityType");
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v18 = objc_claimAutoreleasedReturnValue();
  aSelector = a2;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("NO");
    if (v16 != v17)
      v22 = CFSTR("YES");
    v81 = v22;
    v82 = (void *)v21;
    objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v11, "workoutActivityType"));
    v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v12, "workoutActivityType"));
    v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = v12;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v15);
    *(_DWORD *)buf = 138413570;
    v90 = v20;
    v91 = 2112;
    v92 = v82;
    v93 = 2112;
    v94 = v81;
    v95 = 2112;
    v96 = v23;
    v97 = 2112;
    v98 = v24;
    v99 = 2048;
    v100 = v27;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, activityType mismatch, pre-filtered, %@, workout activityType, %@, other workout activityType, %@, latency, %.4f sec,", buf, 0x3Eu);

    v12 = v25;
  }

  if (v16 == v17)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = CFSTR("YES");
    if (+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", objc_msgSend(v11, "workoutActivityType")))
    {
      if (+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", objc_msgSend(v12, "workoutActivityType")))
      {
        v29 = CFSTR("NO");
      }
      else
      {
        v29 = CFSTR("YES");
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v87;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v11, "workoutActivityType"));
      v35 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v12, "workoutActivityType"));
      v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v37 = v12;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "timeIntervalSinceDate:", v28);
      *(_DWORD *)buf = 138413570;
      v90 = v33;
      v91 = 2112;
      v92 = v34;
      v93 = 2112;
      v94 = v29;
      v95 = 2112;
      v96 = v35;
      v97 = 2112;
      v98 = v36;
      v99 = 2048;
      v100 = v39;
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, unsupported activity type, pre-filtered, %@, workout activityType, %@, other workout activityType, %@, latency, %.4f sec,", buf, 0x3Eu);

      v12 = v37;
      v31 = v87;

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v83 = objc_claimAutoreleasedReturnValue();

    -[RTWorkoutRouteManager healthKitManager](v31, "healthKitManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "_getTotalDistanceForWorkout:", v11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValueForUnit:", v42);
    v44 = v43;

    -[RTWorkoutRouteManager healthKitManager](v31, "healthKitManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "_getTotalDistanceForWorkout:", v12);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "doubleValueForUnit:", v47);
    v49 = v48;

    if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](v31, "_shouldDecimateWorkout:", v11))
      v50 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](v31, "_shouldDecimateWorkout:", v12);
    else
      v50 = 0;
    v14 = v86;
    v88 = 0;
    -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v31, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTPreFilterTotalDistanceDifferenceThreshold"), v50, objc_msgSend(v11, "workoutActivityType", v81, v82), &v88);
    v56 = v55;
    v57 = (__CFString *)v88;
    v58 = v57;
    if (v84 && v57)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v78 = (objc_class *)objc_opt_class();
        NSStringFromClass(v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v90 = v79;
        v91 = 2112;
        v92 = v80;
        v93 = 2112;
        v94 = v58;
        _os_log_error_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *v84 = objc_retainAutorelease(v58);
      v54 = 1;
    }
    else
    {
      if (v44 >= v49)
        v60 = v44;
      else
        v60 = v49;
      v61 = v60 * v56;
      if (v61 > v56 * 1000.0)
        v62 = v61;
      else
        v62 = v56 * 1000.0;
      v63 = vabdd_f64(v44, v49);
      v54 = v63 > v62;
      if (v86)
      {
        if (v44 >= v49)
          v64 = v49;
        else
          v64 = v44;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v64 > 15000.0);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKeyedSubscript:", v65, CFSTR("kRTSimilarityIsLongWorkout"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v63);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "setObject:forKeyedSubscript:", v66, CFSTR("kRTSimilarityDifferenceInTotalDistance"));

      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        v68 = (objc_class *)objc_opt_class();
        NSStringFromClass(v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63 <= v62)
          v71 = CFSTR("NO");
        else
          v71 = CFSTR("YES");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v72 = v12;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "timeIntervalSinceDate:", v83);
        v75 = v74;
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138414594;
        v90 = v69;
        v91 = 2112;
        v92 = v70;
        v93 = 2112;
        v94 = v71;
        v95 = 2048;
        v96 = v44;
        v97 = 2048;
        v98 = v49;
        v99 = 2048;
        v100 = v63;
        v101 = 2048;
        v102 = v56;
        v103 = 2048;
        v104 = v62;
        v105 = 2048;
        v106 = v75;
        v107 = 2048;
        v108 = v76;
        _os_log_impl(&dword_1D1A22000, v67, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, difference in totalDistance is greater than threshold, pre-filtered, %@, workout total distance (in meters), %.3f, other workout total distance (in meters), %.3f, total distance difference, %.3f, total distance difference threshold percentage, %.2f %%, total distance difference threshold, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x66u);

        v12 = v72;
      }

    }
    v15 = (void *)v83;

  }
  else
  {
    v54 = 1;
    v14 = v86;
  }

LABEL_52:
  return v54;
}

- (BOOL)_isPreFilteredForWorkout:(id)a3 firstFewLocations:(CLLocationCoordinate2D *)a4 firstFewLocationsCount:(unint64_t)a5 cachedDictionary:(id)a6 otherWorkout:(id)a7 firstFewOtherLocations:(CLLocationCoordinate2D *)a8 firstFewOtherLocationsCount:(unint64_t)a9 cachedOtherDictionary:(id)a10 preFilteringResults:(id)a11 error:(id *)a12
{
  id *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  BOOL v27;
  void *v28;
  void *v29;
  CLLocationCoordinate2D *v30;
  CLLocationCoordinate2D *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  CLLocationDegrees v37;
  CLLocationCoordinate2D *v38;
  void *v39;
  CLLocationDegrees v40;
  RTWorkoutRouteManager *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  CLLocationDegrees v47;
  void *v48;
  CLLocationDegrees v49;
  NSObject *v50;
  objc_class *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  CLLocationCoordinate2D *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  double v65;
  double v66;
  __CFString *v67;
  NSObject *v68;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  NSObject *v83;
  objc_class *v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  objc_class *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  void *context;
  void *v97;
  id v98;
  CLLocationCoordinate2D *v99;
  void *v100;
  id v103;
  id v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  const __CFString *v110;
  __int16 v111;
  unint64_t v112;
  __int16 v113;
  unint64_t v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  uint64_t v120;
  void *v121;
  _QWORD v122[3];

  v17 = a12;
  v122[1] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a6;
  v20 = a7;
  v21 = a10;
  v22 = a11;
  v23 = v22;
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a12)
      goto LABEL_15;
    v25 = CFSTR("workout");
    goto LABEL_14;
  }
  if (v20)
  {
    v100 = v22;
    v98 = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      if (a9)
        goto LABEL_22;
    }
    else
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_29;
      v23 = v28;
      if (a9)
      {

        goto LABEL_22;
      }
    }
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a5)
    if (v29)
    {
LABEL_22:
      v30 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      v31 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      context = (void *)MEMORY[0x1D8231EA8]();
      v99 = v30;
      if (v19)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          *v30 = *a4;
          v55 = v30;
          v41 = self;
          -[RTWorkoutRouteManager _getRTPairUsingCLLocationCoordinate2D:](self, "_getRTPairUsingCLLocationCoordinate2D:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v122[0] = v56;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v57, CFSTR("kRTCacheKeyFirstFewLocations"));

          if (v21)
          {
LABEL_27:
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            if (v42)
            {
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "firstObject");
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v44, "firstObject");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "doubleValue");
              v47 = v46;
              objc_msgSend(v44, "secondObject");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "doubleValue");
              *v31 = CLLocationCoordinate2DMake(v47, v49);

            }
            else
            {
              *v31 = *a8;
              -[RTWorkoutRouteManager _getRTPairUsingCLLocationCoordinate2D:](v41, "_getRTPairUsingCLLocationCoordinate2D:", v31);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = v58;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v59, CFSTR("kRTCacheKeyFirstFewLocations"));

            }
LABEL_35:
            -[RTWorkoutRouteManager distanceCalculator](v41, "distanceCalculator");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = 0;
            objc_msgSend(v60, "distanceFromLocationCoordinate:toLocationCoordinate:error:", v99, v31, &v104);
            v62 = v61;
            v54 = (__CFString *)v104;

            if (!v54)
            {
              if (v100)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "setObject:forKeyedSubscript:", v63, CFSTR("kRTSimilarityDistanceBetweenFirstLocations"));

              }
              if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](v41, "_shouldDecimateWorkout:", v18))
                v64 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](v41, "_shouldDecimateWorkout:", v20);
              else
                v64 = 0;
              v103 = 0;
              -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v41, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTPreFilterFirstLocationsDistanceThreshold"), v64, objc_msgSend(v18, "workoutActivityType"), &v103);
              v66 = v65;
              v67 = (__CFString *)v103;
              if (!v67)
              {
                -[RTWorkoutRouteManager healthKitManager](v41, "healthKitManager");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "_getTotalDistanceForWorkout:", v18);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "doubleValueForUnit:", v72);
                v74 = v73;

                -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "_getTotalDistanceForWorkout:", v20);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "doubleValueForUnit:", v77);
                v79 = v78;

                if (v74 >= v79)
                  v80 = v74;
                else
                  v80 = v79;
                v81 = fmin(v66 * v80, 350.0);
                if (v81 >= 50.0)
                  v82 = v81;
                else
                  v82 = 50.0;
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v83 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                {
                  v84 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v84);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  v87 = CFSTR("NO");
                  if (v62 > v82)
                    v87 = CFSTR("YES");
                  objc_msgSend(MEMORY[0x1E0C99D68], "date", v87, context);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v88, "timeIntervalSinceDate:", v97);
                  v90 = v89;
                  +[RTRuntime footprint](RTRuntime, "footprint");
                  *(_DWORD *)buf = 138414082;
                  v106 = v85;
                  v107 = 2112;
                  v108 = v86;
                  v109 = 2112;
                  v110 = v95;
                  v111 = 2048;
                  v112 = *(_QWORD *)&v62;
                  v113 = 2048;
                  v114 = *(_QWORD *)&v66;
                  v115 = 2048;
                  v116 = *(_QWORD *)&v82;
                  v117 = 2048;
                  v118 = v90;
                  v119 = 2048;
                  v120 = v91;
                  _os_log_impl(&dword_1D1A22000, v83, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenFirstLocations is greater than distance threshold, pre-filtered, %@, distanceBetweenFirstLocations (in meters), %.3f, distance threshold percentage, %.3f, distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);

                }
                v54 = 0;
                v27 = v62 > v82;
                v20 = v98;
                goto LABEL_44;
              }
              v54 = v67;
            }
            v27 = 0;
LABEL_44:
            objc_autoreleasePoolPop(context);
            free(v99);
            free(v31);
            if (v17)
            {
              v23 = v100;
              if (v54)
              {
                _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  v92 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v92);
                  v93 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  v106 = v93;
                  v107 = 2112;
                  v108 = v94;
                  v109 = 2112;
                  v110 = v54;
                  _os_log_error_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

                }
                v54 = objc_retainAutorelease(v54);
                *v17 = v54;
                v27 = 1;
              }
            }
            else
            {
              v23 = v100;
            }
LABEL_50:

            goto LABEL_51;
          }
LABEL_33:
          *v31 = *a8;
          goto LABEL_35;
        }
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyFirstFewLocations"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v36;
        objc_msgSend(v34, "secondObject");
        v38 = v31;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        *v30 = CLLocationCoordinate2DMake(v37, v40);

        v31 = v38;
        v17 = a12;

      }
      else
      {
        *v30 = *a4;
      }
      v41 = self;
      if (v21)
        goto LABEL_27;
      goto LABEL_33;
    }
LABEL_29:
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v50 = objc_claimAutoreleasedReturnValue();
    v23 = v100;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413826;
      v106 = v52;
      v107 = 2112;
      v108 = v53;
      v109 = 2112;
      v110 = CFSTR("YES");
      v111 = 2048;
      v112 = a5;
      v113 = 2048;
      v114 = a9;
      v115 = 2048;
      v116 = objc_msgSend(v19, "count");
      v117 = 2048;
      v118 = objc_msgSend(v21, "count");
      _os_log_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, locations count is zero, pre-filtered, %@, firstFewLocations count, %lu, firstFewOtherLocations count, %lu, cachedDictionary count, %lu, cachedOtherDictionary count, %lu", buf, 0x48u);

    }
    v54 = 0;
    v27 = 1;
    goto LABEL_50;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a12)
  {
    v25 = CFSTR("otherWorkout");
LABEL_14:
    _RTErrorInvalidParameterCreate((uint64_t)v25);
    *a12 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:
  v27 = 1;
LABEL_51:

  return v27;
}

- (BOOL)_isPreFilteredLocationCountBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  double v33;
  double v34;
  __CFString *v35;
  const char *v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  unint64_t v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  double v50;
  double v51;
  NSObject *v52;
  objc_class *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  double v58;
  unint64_t v59;
  double v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  _BOOL8 v82;
  uint64_t v83;
  double v84;
  double v85;
  __CFString *v86;
  unint64_t v87;
  NSObject *v88;
  objc_class *v89;
  void *v90;
  void *v91;
  const __CFString *v92;
  double v93;
  void *v94;
  unint64_t v95;
  double v96;
  unint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __CFString *v102;
  NSObject *v103;
  const __CFString *v104;
  NSObject *v105;
  NSObject *v106;
  objc_class *v107;
  void *v108;
  void *v109;
  NSObject *v111;
  objc_class *v112;
  void *v113;
  const __CFString *v114;
  _BOOL4 v115;
  const __CFString *v116;
  NSObject *v117;
  objc_class *v118;
  void *v119;
  void *v120;
  const __CFString *v121;
  const __CFString *v122;
  char v123;
  void *v124;
  char v125;
  id v126;
  id v127;
  char v128;
  void *v129;
  void *v130;
  void *context;
  id v132;
  const char *aSelector;
  void *v134;
  char v135;
  unint64_t v136;
  uint64_t v137;
  id v139;
  id v140;
  id v141;
  id v142;
  uint8_t buf[4];
  uint64_t v144;
  __int16 v145;
  void *v146;
  __int16 v147;
  const __CFString *v148;
  __int16 v149;
  uint64_t v150;
  __int16 v151;
  uint64_t v152;
  __int16 v153;
  double v154;
  __int16 v155;
  unint64_t v156;
  __int16 v157;
  double v158;
  __int16 v159;
  double v160;
  __int16 v161;
  double v162;
  __int16 v163;
  uint64_t v164;
  __int16 v165;
  uint64_t v166;
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v140 = a4;
  v15 = a5;
  v139 = a6;
  v16 = a7;
  v17 = v16;
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v103, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8)
      goto LABEL_62;
    v104 = CFSTR("workout");
    goto LABEL_61;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v105, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
    }

    if (!a8)
      goto LABEL_62;
    v104 = CFSTR("otherWorkout");
LABEL_61:
    _RTErrorInvalidParameterCreate((uint64_t)v104);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:
    LOBYTE(v23) = 1;
    goto LABEL_69;
  }
  v132 = v16;
  if (!v140)
    goto LABEL_64;
  objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLocationsCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v139 || !v18)
  {

LABEL_64:
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      v107 = (objc_class *)objc_opt_class();
      NSStringFromClass(v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v144 = (uint64_t)v108;
      v145 = 2112;
      v146 = v109;
      v147 = 2112;
      v148 = CFSTR("YES");
      v149 = 2048;
      v150 = objc_msgSend(v140, "count");
      v151 = 2048;
      v152 = objc_msgSend(v139, "count");
      _os_log_impl(&dword_1D1A22000, v106, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyLocationsCount doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);

    }
    v21 = 0;
    v102 = 0;
LABEL_67:
    LOBYTE(v23) = 1;
    goto LABEL_68;
  }
  objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLocationsCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_64;
  aSelector = a2;
  v21 = 0;
  v22 = 1;
  v127 = v15;
  v126 = v14;
  while (1)
  {
    LOBYTE(v23) = v22;
    if ((v22 & 1) == 0)
    {
      v102 = 0;
      goto LABEL_68;
    }
    v128 = v22;
    context = (void *)MEMORY[0x1D8231EA8]();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLocationsCount"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v130 = v25;
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLocationsCount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v129 = v28;
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedIntegerValue");

    if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v14))
      v31 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v15);
    else
      v31 = 0;
    v32 = objc_msgSend(v14, "workoutActivityType");
    v142 = 0;
    -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTPreFilterDifferenceBetweenLocationsThreshold"), v31, v32, &v142);
    v34 = v33;
    v35 = (__CFString *)v142;
    v36 = aSelector;
    if (v35)
    {
      v102 = v35;
      v21 = v134;
      goto LABEL_83;
    }
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v23, "_getDurationForWorkout:", v14);
    if (v37 == 0.0)
    {

      v41 = 0.0;
      LODWORD(v23) = 1;
LABEL_20:
      v43 = 0.0;
LABEL_23:
      v42 = v136;
      goto LABEL_24;
    }
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "_getDurationForWorkout:", v15);
    v40 = v39;

    v41 = 0.0;
    LODWORD(v23) = 1;
    if (v40 == 0.0)
      goto LABEL_20;
    v42 = v136;
    if (v136)
    {
      v43 = 0.0;
      if (!v30)
        goto LABEL_24;
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (uint64_t)v44;
      if (v136 >= v30)
      {
        v41 = (double)v30 / (double)v136;
        objc_msgSend(v44, "_getDurationForWorkout:", v15);
        v46 = v50;
        -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        v49 = v14;
      }
      else
      {
        v41 = (double)v136 / (double)v30;
        objc_msgSend(v44, "_getDurationForWorkout:", v14);
        v46 = v45;
        -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        v49 = v15;
      }
      objc_msgSend(v47, "_getDurationForWorkout:", v49);
      v43 = v46 / v51;

      LODWORD(v23) = v41 - v43 > v34;
      goto LABEL_23;
    }
    v43 = 0.0;
LABEL_24:
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("NO");
      if ((_DWORD)v23)
        v56 = CFSTR("YES");
      v121 = v56;
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "_getDurationForWorkout:", v14);
      v59 = (unint64_t)v58;
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v123 = v23;
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v23, "_getDurationForWorkout:", v15);
      v61 = (unint64_t)v60;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "timeIntervalSinceDate:", v134);
      v64 = v63;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138415106;
      v144 = (uint64_t)v54;
      v145 = 2112;
      v146 = v55;
      v147 = 2112;
      v148 = v121;
      v149 = 2048;
      v150 = v136;
      v151 = 2048;
      v152 = v30;
      v153 = 2048;
      v154 = *(double *)&v59;
      v14 = v126;
      v155 = 2048;
      v156 = v61;
      v36 = aSelector;
      v157 = 2048;
      v158 = v41;
      v159 = 2048;
      v160 = v43;
      v161 = 2048;
      v162 = v34;
      v163 = 2048;
      v164 = v64;
      v165 = 2048;
      v166 = v65;
      _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, difference in number of locations is greater than threshold, pre-filtered, %@, locations count, %lu, other locations count, %lu, workout duration, %lu, other workout duration, %lu, difference in number of locations percentage, %.3f, difference in duration percentage, %.3f, difference in number of locations percentage threshold, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x7Au);

      v15 = v127;
      LOBYTE(v23) = v123;

      v42 = v136;
    }

    if ((v23 & 1) != 0)
      goto LABEL_79;
    if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v14)
      || -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v15))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v111 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
      {
        v112 = (objc_class *)objc_opt_class();
        NSStringFromClass(v112);
        v125 = v23;
        v23 = objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(v36);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v14))
          v114 = CFSTR("YES");
        else
          v114 = CFSTR("NO");
        v115 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v15);
        *(_DWORD *)buf = 138413314;
        if (v115)
          v116 = CFSTR("YES");
        else
          v116 = CFSTR("NO");
        v144 = v23;
        v145 = 2112;
        v146 = v113;
        v147 = 2112;
        v148 = CFSTR("NO");
        v149 = 2112;
        v150 = (uint64_t)v114;
        v151 = 2112;
        v152 = (uint64_t)v116;
        _os_log_impl(&dword_1D1A22000, v111, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, decimated workouts for rate check, pre-filtered, %@, workout decimated, %@, other workout decimated, %@", buf, 0x34u);

        LOBYTE(v23) = v125;
      }

LABEL_79:
      objc_autoreleasePoolPop(context);
      v102 = 0;
      v21 = v134;
      goto LABEL_68;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v137 = objc_claimAutoreleasedReturnValue();

    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "_getDurationForWorkout:", v14);
    v68 = v67;
    v69 = (double)v42;

    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "_getDurationForWorkout:", v14);
    v72 = v71;

    if (!v42)
      goto LABEL_34;
    if (v68 < v69)
      v73 = v72 / v69;
    else
LABEL_34:
      v73 = v69 / v72;
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "_getDurationForWorkout:", v15);
    v76 = v75;
    v77 = (double)v30;

    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "_getDurationForWorkout:", v15);
    v80 = v79;

    if (!v30)
      goto LABEL_38;
    if (v76 < v77)
      v81 = v80 / v77;
    else
LABEL_38:
      v81 = v77 / v80;
    v82 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v14)
       && -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v15);
    v83 = objc_msgSend(v14, "workoutActivityType");
    v141 = 0;
    -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTPreFilterLocationsRateThreshold"), v82, v83, &v141);
    v85 = v84;
    v86 = (__CFString *)v141;
    if (v86)
      break;
    LODWORD(v87) = v81 < v85 || v73 < v85;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      v89 = (objc_class *)objc_opt_class();
      NSStringFromClass(v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = CFSTR("NO");
      if ((_DWORD)v87)
        v92 = CFSTR("YES");
      v122 = v92;
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "_getDurationForWorkout:", v14);
      v135 = v87;
      v87 = (unint64_t)v93;
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_getDurationForWorkout:", v127);
      v95 = v30;
      v97 = (unint64_t)v96;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "timeIntervalSinceDate:", v137);
      v100 = v99;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138415106;
      v144 = (uint64_t)v90;
      v145 = 2112;
      v146 = v91;
      v147 = 2112;
      v148 = v122;
      v149 = 2048;
      v150 = *(_QWORD *)&v73;
      v151 = 2048;
      v152 = *(_QWORD *)&v81;
      v153 = 2048;
      v154 = v85;
      v155 = 2048;
      v156 = v42;
      v157 = 2048;
      v158 = *(double *)&v87;
      LOBYTE(v87) = v135;
      v159 = 2048;
      v160 = *(double *)&v95;
      v14 = v126;
      v161 = 2048;
      v162 = *(double *)&v97;
      v163 = 2048;
      v164 = v100;
      v165 = 2048;
      v166 = v101;
      _os_log_impl(&dword_1D1A22000, v88, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, are workouts not 1 hertz, pre-filtered, %@, workout rate, %.3f, other workout rate, %.3f, 1 hertz threshold, %.3f, locations count, %lu, workout duration, %lu, other locations count, %lu, other workout duration, %lu latency, %.4f sec, footprint, %.4f MB", buf, 0x7Au);

      v15 = v127;
    }

    objc_autoreleasePoolPop(context);
    v22 = 0;
    v102 = 0;
    LOBYTE(v23) = v128;
    v21 = (void *)v137;
    if ((v87 & 1) != 0)
      goto LABEL_68;
  }
  v102 = v86;
  v21 = (void *)v137;
LABEL_83:

  objc_autoreleasePoolPop(context);
  if (a8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v117 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      v118 = (objc_class *)objc_opt_class();
      NSStringFromClass(v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(v36);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v144 = (uint64_t)v119;
      v145 = 2112;
      v146 = v120;
      v147 = 2112;
      v148 = v102;
      _os_log_error_impl(&dword_1D1A22000, v117, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v102 = objc_retainAutorelease(v102);
    *a8 = v102;
    goto LABEL_67;
  }
  LOBYTE(v23) = 0;
LABEL_68:

  v17 = v132;
LABEL_69:

  return v23 & 1;
}

- (BOOL)_isPreFilteredLastLocationBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  CLLocationCoordinate2D *v23;
  CLLocationCoordinate2D *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  CLLocationDegrees v29;
  void *v30;
  CLLocationDegrees v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CLLocationDegrees v36;
  void *v37;
  CLLocationDegrees v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  double longitude;
  void *v47;
  double v48;
  double v49;
  __CFString *v50;
  BOOL v51;
  CLLocationCoordinate2D *v52;
  NSObject *v53;
  const __CFString *v54;
  NSObject *v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  uint64_t v63;
  double v64;
  double v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NSObject *v80;
  objc_class *v81;
  void *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  objc_class *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  const char *aSelector;
  void *context;
  void *v96;
  uint64_t v97;
  RTWorkoutRouteManager *v98;
  CLLocationCoordinate2D *v99;
  CLLocationCoordinate2D *v100;
  id v101;
  id v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  const __CFString *v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  double v114;
  __int16 v115;
  uint64_t v116;
  __int16 v117;
  uint64_t v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8)
      goto LABEL_20;
    v54 = CFSTR("workout");
    goto LABEL_19;
  }
  if (v17)
  {
    if (v16)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLastLocation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v18 && v20)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLastLocation"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v96 = v19;
          aSelector = a2;
          v98 = self;
          v23 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          v24 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          context = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v97 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLastLocation"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "doubleValue");
          v29 = v28;
          objc_msgSend(v26, "secondObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          *v23 = CLLocationCoordinate2DMake(v29, v31);
          v99 = v23;

          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyLastLocation"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "doubleValue");
          v36 = v35;
          objc_msgSend(v33, "secondObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "doubleValue");
          *v24 = CLLocationCoordinate2DMake(v36, v38);
          v100 = v24;

          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = (objc_class *)objc_opt_class();
            NSStringFromClass(v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = *(const __CFString **)&v23->latitude;
            v44 = *(_QWORD *)&v23->longitude;
            v45 = *(_QWORD *)&v24->latitude;
            longitude = v24->longitude;
            *(_DWORD *)buf = 138413571;
            v104 = v41;
            v105 = 2112;
            v106 = v42;
            v107 = 2049;
            v108 = v43;
            v109 = 2049;
            v110 = v44;
            v111 = 2049;
            v112 = v45;
            v113 = 2049;
            v114 = longitude;
            _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%@, %@, lastLocation, <%{private}f, %{private}f>, otherLastLocation, <%{private}f, %{private}f>,", buf, 0x3Eu);

          }
          -[RTWorkoutRouteManager distanceCalculator](v98, "distanceCalculator");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = 0;
          objc_msgSend(v47, "distanceFromLocationCoordinate:toLocationCoordinate:error:", v23, v24, &v102);
          v49 = v48;
          v50 = (__CFString *)v102;

          v19 = v96;
          if (v50)
          {
            v51 = 0;
            v52 = v100;
          }
          else
          {
            if (v96)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "setObject:forKeyedSubscript:", v62, CFSTR("kRTSimilarityDistanceBetweenLastLocations"));

            }
            if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](v98, "_shouldDecimateWorkout:", v15))
              v63 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](v98, "_shouldDecimateWorkout:", v17);
            else
              v63 = 0;
            v52 = v100;
            v101 = 0;
            -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v98, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTPreFilterLastLocationsDistanceThreshold"), v63, objc_msgSend(v15, "workoutActivityType"), &v101);
            v65 = v64;
            v66 = (__CFString *)v101;
            if (v66)
            {
              v50 = v66;
              v51 = 0;
            }
            else
            {
              -[RTWorkoutRouteManager healthKitManager](v98, "healthKitManager");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "_getTotalDistanceForWorkout:", v15);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "doubleValueForUnit:", v69);
              v71 = v70;

              -[RTWorkoutRouteManager healthKitManager](v98, "healthKitManager");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "_getTotalDistanceForWorkout:", v17);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "doubleValueForUnit:", v74);
              v76 = v75;

              if (v71 >= v76)
                v77 = v71;
              else
                v77 = v76;
              v78 = fmin(v65 * v77, 350.0);
              if (v78 >= 50.0)
                v79 = v78;
              else
                v79 = 50.0;
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v80 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
              {
                v81 = (objc_class *)objc_opt_class();
                NSStringFromClass(v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = CFSTR("NO");
                if (v49 > v79)
                  v84 = CFSTR("YES");
                objc_msgSend(MEMORY[0x1E0C99D68], "date", v84);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "timeIntervalSinceDate:", v97);
                v87 = v86;
                +[RTRuntime footprint](RTRuntime, "footprint");
                *(_DWORD *)buf = 138414082;
                v104 = v82;
                v105 = 2112;
                v106 = v83;
                v107 = 2112;
                v108 = v93;
                v109 = 2048;
                v110 = *(_QWORD *)&v49;
                v111 = 2048;
                v112 = *(_QWORD *)&v65;
                v113 = 2048;
                v114 = v79;
                v115 = 2048;
                v116 = v87;
                v117 = 2048;
                v118 = v88;
                _os_log_impl(&dword_1D1A22000, v80, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenLastLocations is greater than distance threshold, pre-filtered, %@, distanceBetweenLastLocations (in meters), %.3f, distance threshold percentage, %.3f, distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);

              }
              v52 = v100;
              if (v49 <= v79)
              {
                v51 = 0;
                v50 = 0;
              }
              else
              {
                v50 = 0;
                v51 = 1;
              }
            }
          }
          objc_autoreleasePoolPop(context);
          free(v99);
          free(v52);
          if (a8 && v50)
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              v90 = (objc_class *)objc_opt_class();
              NSStringFromClass(v90);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v104 = v91;
              v105 = 2112;
              v106 = v92;
              v107 = 2112;
              v108 = v50;
              _os_log_error_impl(&dword_1D1A22000, v89, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

            }
            v50 = objc_retainAutorelease(v50);
            *a8 = v50;
            v51 = 1;
          }
          v60 = (void *)v97;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v104 = v58;
      v105 = 2112;
      v106 = v59;
      v107 = 2112;
      v108 = CFSTR("YES");
      v109 = 2048;
      v110 = objc_msgSend(v16, "count");
      v111 = 2048;
      v112 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyLastLocation doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);

    }
    v60 = 0;
    v50 = 0;
    v51 = 1;
    goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a8)
  {
    v54 = CFSTR("otherWorkout");
LABEL_19:
    _RTErrorInvalidParameterCreate((uint64_t)v54);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:
  v51 = 1;
LABEL_26:

  return v51;
}

- (BOOL)_isPreFilteredCentroidBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  CLLocationCoordinate2D *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CLLocationDegrees v28;
  void *v29;
  CLLocationDegrees v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  CLLocationDegrees v35;
  void *v36;
  CLLocationDegrees v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  id v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  const __CFString *v53;
  NSObject *v54;
  BOOL v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  void *v60;
  __CFString *v61;
  uint64_t *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  NSObject *v78;
  objc_class *v79;
  void *v80;
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  objc_class *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  const char *aSelector;
  void *context;
  uint64_t v96;
  RTWorkoutRouteManager *v97;
  CLLocationCoordinate2D *v98;
  uint64_t *v99;
  id v100;
  id v101;
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  void *v105;
  __int16 v106;
  const __CFString *v107;
  __int16 v108;
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  double v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8)
      goto LABEL_22;
    v53 = CFSTR("workout");
    goto LABEL_21;
  }
  if (v17)
  {
    if (v16)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCentroid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v18 && v20)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCentroid"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          aSelector = a2;
          v97 = self;
          v23 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          v99 = (uint64_t *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          context = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v96 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCentroid"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;
          objc_msgSend(v25, "secondObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "doubleValue");
          *v23 = CLLocationCoordinate2DMake(v28, v30);
          v98 = v23;

          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCentroid"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "firstObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;
          objc_msgSend(v32, "secondObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          *(CLLocationCoordinate2D *)v99 = CLLocationCoordinate2DMake(v35, v37);

          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = *(const __CFString **)&v23->latitude;
            v43 = *(_QWORD *)&v23->longitude;
            v44 = *v99;
            v45 = *((double *)v99 + 1);
            *(_DWORD *)buf = 138413571;
            v103 = v40;
            v104 = 2112;
            v105 = v41;
            v106 = 2049;
            v107 = v42;
            v108 = 2049;
            v109 = v43;
            v110 = 2049;
            v111 = v44;
            v112 = 2049;
            v113 = v45;
            _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, %@, locationCentroid, <%{private}f, %{private}f>, otherLocationCentroid, <%{private}f, %{private}f>,", buf, 0x3Eu);

          }
          -[RTWorkoutRouteManager distanceCalculator](v97, "distanceCalculator");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = 0;
          objc_msgSend(v46, "distanceFromLocationCoordinate:toLocationCoordinate:error:", v23, v99, &v101);
          v48 = v47;
          v49 = v101;

          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v50, CFSTR("kRTSimilarityDistanceBetweenCentroids"));

          }
          if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](v97, "_shouldDecimateWorkout:", v15))
            v51 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](v97, "_shouldDecimateWorkout:", v17);
          else
            v51 = 0;
          v63 = v99;
          v100 = v49;
          -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](v97, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTPreFilterCentroidDistanceThreshold"), v51, objc_msgSend(v15, "workoutActivityType"), &v100);
          v65 = v64;
          v61 = (__CFString *)v100;

          if (v61)
            goto LABEL_43;
          -[RTWorkoutRouteManager healthKitManager](v97, "healthKitManager");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "_getTotalDistanceForWorkout:", v15);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "doubleValueForUnit:", v68);
          v70 = v69;

          -[RTWorkoutRouteManager healthKitManager](v97, "healthKitManager");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "_getTotalDistanceForWorkout:", v17);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "doubleValueForUnit:", v72);
          v74 = v73;

          if (v70 >= v74)
            v75 = v70;
          else
            v75 = v74;
          v76 = fmin(v65 * v75, 1000.0);
          if (v76 >= 100.0)
            v77 = v76;
          else
            v77 = 100.0;
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            v79 = (objc_class *)objc_opt_class();
            NSStringFromClass(v79);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v81 = objc_claimAutoreleasedReturnValue();
            v82 = CFSTR("NO");
            if (v48 > v77)
              v82 = CFSTR("YES");
            objc_msgSend(MEMORY[0x1E0C99D68], "date", v82, v81);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "timeIntervalSinceDate:", v96);
            v84 = v83;
            +[RTRuntime footprint](RTRuntime, "footprint");
            *(_DWORD *)buf = 138414082;
            v103 = v80;
            v104 = 2112;
            v105 = v91;
            v106 = 2112;
            v107 = v90;
            v108 = 2048;
            v109 = *(_QWORD *)&v48;
            v110 = 2048;
            v111 = *(_QWORD *)&v65;
            v112 = 2048;
            v113 = v77;
            v114 = 2048;
            v115 = v84;
            v116 = 2048;
            v117 = v85;
            _os_log_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenCentroids is greater than threshold, pre-filtered, %@, distance between centroids (in meters), %.3f, centroid distance threshold percentage, %.3f, centroid distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);

          }
          v63 = v99;
          if (v48 <= v77)
LABEL_43:
            v55 = 0;
          else
            v55 = 1;
          objc_autoreleasePoolPop(context);
          free(v98);
          free(v63);
          if (a8 && v61)
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              v87 = (objc_class *)objc_opt_class();
              NSStringFromClass(v87);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v103 = v88;
              v104 = 2112;
              v105 = v89;
              v106 = 2112;
              v107 = v61;
              _os_log_error_impl(&dword_1D1A22000, v86, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

            }
            v61 = objc_retainAutorelease(v61);
            *a8 = v61;
            v55 = 1;
          }
          v60 = (void *)v96;
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v103 = v58;
      v104 = 2112;
      v105 = v59;
      v106 = 2112;
      v107 = CFSTR("YES");
      v108 = 2048;
      v109 = objc_msgSend(v16, "count");
      v110 = 2048;
      v111 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyCentroid doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);

    }
    v60 = 0;
    v61 = 0;
    v55 = 1;
    goto LABEL_27;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v54, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a8)
  {
    v53 = CFSTR("otherWorkout");
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v53);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:
  v55 = 1;
LABEL_28:

  return v55;
}

- (BOOL)_isPreFilteredRunningTrackBasedForWorkout:(id)a3 cachedDictionary:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CLLocationCoordinate2D *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __CFString *v24;
  __CFString *v25;
  BOOL v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  objc_class *v35;
  void *v36;
  void *v37;
  void *context;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10
      && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyBoundingBoxVertices")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v12))
    {
      context = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyBoundingBoxVertices"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[RTWorkoutRouteManager _getCoordinatesFromRTPairs:](self, "_getCoordinatesFromRTPairs:", v14);

      v40 = 0;
      -[RTWorkoutRouteManager _getCGRectFromCoordinates:verticesCount:outError:](self, "_getCGRectFromCoordinates:verticesCount:outError:", v15, 4, &v40);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v24 = (__CFString *)v40;
      if (v24)
      {
        v25 = v24;
        v26 = 0;
      }
      else
      {
        v39 = 0;
        v32 = -[RTWorkoutRouteManager _isBoundingBoxAreaLessThanThresholdSubPrefilter:verticesCount:stimulationDate:error:](self, "_isBoundingBoxAreaLessThanThresholdSubPrefilter:verticesCount:stimulationDate:error:", 4, v13, &v39, v17, v19, v21, v23);
        v25 = (__CFString *)v39;
        v26 = 0;
        if (!v25 && v32)
        {
          v26 = -[RTWorkoutRouteManager _isBoundingBoxDimensionsWithinTrackThresholdsSubPrefilter:](self, "_isBoundingBoxDimensionsWithinTrackThresholdsSubPrefilter:", v17, v19, v21, v23);
          v25 = 0;
        }
      }
      objc_autoreleasePoolPop(context);
      if (v15)
        free(v15);
      if (!a5 || !v25)
        goto LABEL_25;
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v36;
        v43 = 2112;
        v44 = v37;
        v45 = 2112;
        v46 = v25;
        _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v25 = objc_retainAutorelease(v25);
      *a5 = v25;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v42 = v29;
        v43 = 2112;
        v44 = v30;
        v45 = 2112;
        v46 = CFSTR("YES");
        v47 = 2048;
        v48 = objc_msgSend(v11, "count");
        _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyBoundingBoxVertices doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu,", buf, 0x2Au);

      }
      v13 = 0;
      v25 = 0;
    }
    v26 = 1;
LABEL_25:

    goto LABEL_26;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = 1;
LABEL_26:

  return v26;
}

- (BOOL)_isBoundingBoxAreaLessThanThresholdSubPrefilter:(CGRect)a3 verticesCount:(unint64_t)a4 stimulationDate:(id)a5 error:(id *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  void *v15;
  double v16;
  double v17;
  __CFString *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_class *v31;
  void *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v49 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  -[RTWorkoutRouteManager distanceCalculator](self, "distanceCalculator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v15, "computeBoundingBoxArea:locationsCount:error:", a4, &v34, x, y, width, height);
  v17 = v16;
  v18 = (__CFString *)v34;

  if (a6 && v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = v32;
      v37 = 2112;
      v38 = v33;
      v39 = 2112;
      v40 = v18;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v20 = 0;
    *a6 = objc_retainAutorelease(v18);
  }
  else
  {
    v20 = v17 < 40000.0;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 >= 40000.0)
        v25 = CFSTR("NO");
      else
        v25 = CFSTR("YES");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", v14);
      v28 = v27;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413826;
      v36 = v23;
      v37 = 2112;
      v38 = v24;
      v39 = 2112;
      v40 = v25;
      v41 = 2048;
      v42 = v17;
      v43 = 2048;
      v44 = 0x40E3880000000000;
      v45 = 2048;
      v46 = v28;
      v47 = 2048;
      v48 = v29;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, area is less than threshold, pre-filtered, %@, area, %.3f, threshold, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);

    }
  }

  return v20;
}

- (BOOL)_isBoundingBoxDimensionsWithinTrackThresholdsSubPrefilter:(CGRect)a3
{
  return a3.size.height < 200.0 && a3.size.width < 200.0;
}

- (BOOL)_isEligibleForCurveOrientation:(CLLocationCoordinate2D *)a3 lastLocation:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  void *v10;
  void *v11;
  double v12;
  double v13;
  __CFString *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  const __CFString *v18;
  NSObject *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: firstLocation", buf, 2u);
    }

    if (a5)
    {
      v18 = CFSTR("firstLocation");
LABEL_16:
      _RTErrorInvalidParameterCreate((uint64_t)v18);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      return v16;
    }
    return 0;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lastLocation", buf, 2u);
    }

    if (a5)
    {
      v18 = CFSTR("lastLocation");
      goto LABEL_16;
    }
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager distanceCalculator](self, "distanceCalculator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v11, "distanceFromLocationCoordinate:toLocationCoordinate:error:", a3, a4, &v33);
  v13 = v12;
  v14 = (__CFString *)v33;

  if (a5 && v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v35 = v31;
      v36 = 2112;
      v37 = v32;
      v38 = 2112;
      v39 = v14;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v16 = 0;
    *a5 = objc_retainAutorelease(v14);
  }
  else
  {
    v16 = v13 < 350.0;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 >= 350.0)
        v24 = CFSTR("NO");
      else
        v24 = CFSTR("YES");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v10);
      v27 = v26;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413826;
      v35 = v22;
      v36 = 2112;
      v37 = v23;
      v38 = 2112;
      v39 = v24;
      v40 = 2048;
      v41 = v13;
      v42 = 2048;
      v43 = 0x4075E00000000000;
      v44 = 2048;
      v45 = v27;
      v46 = 2048;
      v47 = v28;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, distanceBetweenFirstAndLastLocations is greater than distance threshold, %@, distanceBetweenFirstLocationAndLastLocations (in meters), %.3f, distance threshold (in meters), %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);

    }
  }

  return v16;
}

- (BOOL)_isPreFilteredCurveOrientationBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
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
  uint64_t v25;
  BOOL v26;
  BOOL v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  objc_class *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  NSObject *v38;
  const __CFString *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *context;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a7)
      goto LABEL_31;
    v39 = CFSTR("workout");
    goto LABEL_30;
  }
  if (v14)
  {
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCurveOrientation"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15 && v16)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCurveOrientation"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          context = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v53 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCurveOrientation"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v21, "unsignedIntegerValue");

          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyCurveOrientation"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "unsignedIntegerValue");

          if (v51)
            v26 = v25 == 0;
          else
            v26 = 1;
          v50 = v25;
          v27 = v26 || v51 == v25;
          v28 = v53;
          LODWORD(v29) = v27;
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if ((_DWORD)v29)
              v32 = CFSTR("NO");
            else
              v32 = CFSTR("YES");
            objc_msgSend(v12, "UUID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v29;
            +[RTWorkoutRouteManager curveOrientationTypeToString:](RTWorkoutRouteManager, "curveOrientationTypeToString:", v51);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "UUID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTWorkoutRouteManager curveOrientationTypeToString:](RTWorkoutRouteManager, "curveOrientationTypeToString:", v50);
            v29 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "timeIntervalSinceDate:", v53);
            v35 = v34;
            +[RTRuntime footprint](RTRuntime, "footprint");
            *(_DWORD *)buf = 138414338;
            v56 = v49;
            v57 = 2112;
            v58 = v48;
            v59 = 2112;
            v60 = v32;
            v61 = 2112;
            v62 = (uint64_t)v46;
            v63 = 2112;
            v64 = (uint64_t)v33;
            v65 = 2112;
            v66 = v45;
            v67 = 2112;
            v68 = v29;
            v69 = 2048;
            v70 = v35;
            v71 = 2048;
            v72 = v36;
            _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, equal curve orientation, pre-filtered, %@, workout.UUID, %@, curveOrientation %@,  otherWorkout.UUID, %@, otherCurveOrientation, %@, latency, %.4f sec, footprint, %.4f MB", buf, 0x5Cu);

            LOBYTE(v29) = v47;
          }

          objc_autoreleasePoolPop(context);
          v37 = v29 ^ 1;
LABEL_35:

          goto LABEL_36;
        }
      }
      else
      {

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v28 = objc_claimAutoreleasedReturnValue();
    v37 = 1;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v56 = v42;
      v57 = 2112;
      v58 = v43;
      v59 = 2112;
      v60 = CFSTR("YES");
      v61 = 2048;
      v62 = objc_msgSend(v13, "count");
      v63 = 2048;
      v64 = objc_msgSend(v15, "count");
      v37 = 1;
      _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyCurveOrientation doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);

    }
    goto LABEL_35;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a7)
  {
    v39 = CFSTR("otherWorkout");
LABEL_30:
    _RTErrorInvalidParameterCreate((uint64_t)v39);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_31:
  v37 = 1;
LABEL_36:

  return v37;
}

- (BOOL)_isPreFilteredIOUBasedForWorkout:(id)a3 cachedDictionary:(id)a4 otherWorkout:(id)a5 cachedOtherDictionary:(id)a6 preFilteringResults:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CLLocationCoordinate2D *v24;
  void *v25;
  CLLocationCoordinate2D *v26;
  void *v27;
  CLLocationCoordinate2D *v28;
  CLLocationCoordinate2D *v29;
  double v30;
  double v31;
  __CFString *v32;
  void *v33;
  _BOOL8 v34;
  NSObject *v35;
  const __CFString *v36;
  NSObject *v37;
  BOOL v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  void *v43;
  double v45;
  double v46;
  __CFString *v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  const char *aSelector;
  void *context;
  CLLocationCoordinate2D *v65;
  uint64_t v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (!a8)
      goto LABEL_21;
    v36 = CFSTR("workout");
    goto LABEL_20;
  }
  if (v17)
  {
    if (v16)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyBoundingBoxVertices"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v18 && v20)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyBoundingBoxVertices"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          aSelector = a2;
          context = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v66 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyBoundingBoxVertices"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[RTWorkoutRouteManager _getCoordinatesFromRTPairs:](self, "_getCoordinatesFromRTPairs:", v23);

          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kRTCacheKeyBoundingBoxVertices"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[RTWorkoutRouteManager _getCoordinatesFromRTPairs:](self, "_getCoordinatesFromRTPairs:", v25);

          -[RTWorkoutRouteManager distanceCalculator](self, "distanceCalculator");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0;
          v65 = v24;
          v28 = v24;
          v29 = v26;
          objc_msgSend(v27, "computeIntersectionOverUnionUsingBoundingBoxBetweenLocations:locationsCount:otherLocations:otherLocationsCount:error:", v28, 4, v26, 4, &v68);
          v31 = v30;
          v32 = (__CFString *)v68;

          if (!v32)
          {
            if (v19)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v33, CFSTR("kRTSimilarityIOU"));

            }
            if (-[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v15))
              v34 = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v17);
            else
              v34 = 0;
            v67 = 0;
            -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTPreFilterIntersectionOverUnionThreshold"), v34, objc_msgSend(v15, "workoutActivityType"), &v67);
            v46 = v45;
            v47 = (__CFString *)v67;
            if (v47)
            {
              v32 = v47;
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                v49 = (objc_class *)objc_opt_class();
                NSStringFromClass(v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                v51 = objc_claimAutoreleasedReturnValue();
                v52 = CFSTR("NO");
                if (v31 < v46)
                  v52 = CFSTR("YES");
                objc_msgSend(MEMORY[0x1E0C99D68], "date", v52, v51);
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "timeIntervalSinceDate:", v66);
                v54 = v53;
                +[RTRuntime footprint](RTRuntime, "footprint");
                *(_DWORD *)buf = 138413826;
                v70 = v50;
                v71 = 2112;
                v72 = v61;
                v73 = 2112;
                v74 = v60;
                v75 = 2048;
                v76 = *(_QWORD *)&v31;
                v77 = 2048;
                v78 = *(_QWORD *)&v46;
                v79 = 2048;
                v80 = v54;
                v81 = 2048;
                v82 = v55;
                _os_log_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, IOU is less than threshold, pre-filtered, %@, IOU, %.3f, Intersection Over Union Threshold percentage, %.3f, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);

              }
              v32 = 0;
              if (v31 < v46)
              {
                v38 = 1;
LABEL_38:
                objc_autoreleasePoolPop(context);
                if (v65)
                  free(v65);
                if (v29)
                  free(v29);
                if (a8 && v32)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                  {
                    v57 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v57);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(aSelector);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v70 = v58;
                    v71 = 2112;
                    v72 = v59;
                    v73 = 2112;
                    v74 = v32;
                    _os_log_error_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

                  }
                  v32 = objc_retainAutorelease(v32);
                  *a8 = v32;
                  v38 = 1;
                }
                v43 = (void *)v66;
LABEL_26:

                goto LABEL_27;
              }
            }
          }
          v38 = 0;
          goto LABEL_38;
        }
      }
      else
      {

      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v70 = v41;
      v71 = 2112;
      v72 = v42;
      v73 = 2112;
      v74 = CFSTR("YES");
      v75 = 2048;
      v76 = objc_msgSend(v16, "count");
      v77 = 2048;
      v78 = objc_msgSend(v18, "count");
      _os_log_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_INFO, "%@, %@, pre-filtering criteria, kRTCacheKeyBoundingBoxVertices doesn't exist in cache dictionary, pre-filtered, %@, cachedDictionary count, %lu, cachedOtherDictionary count, %lu, ", buf, 0x34u);

    }
    v43 = 0;
    v32 = 0;
    v38 = 1;
    goto LABEL_26;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherWorkout", buf, 2u);
  }

  if (a8)
  {
    v36 = CFSTR("otherWorkout");
LABEL_20:
    _RTErrorInvalidParameterCreate((uint64_t)v36);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:
  v38 = 1;
LABEL_27:

  return v38;
}

- (double)similarityDistanceUsingPreFilteringResults:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  double v12;
  const __CFString *v13;
  const __CFString *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  int v46;
  int v47;
  int v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  RTWorkoutRouteManager *v63;
  const char *aSelector;
  char v65;
  void *v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  double v72;
  __int16 v73;
  const __CFString *v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  const __CFString *v78;
  __int16 v79;
  double v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  double v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  double v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  double v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v66 = v7;
    v63 = self;
    aSelector = a2;
    v9 = 0;
    LOBYTE(v10) = 0;
    v11 = 1;
    v12 = 10000.0;
    v13 = CFSTR("kRTSimilarityDifferenceInTotalDistance");
    v14 = CFSTR("kRTSimilarityDistanceBetweenFirstLocations");
    v15 = 10000.0;
    v16 = 10000.0;
    v17 = 10000.0;
    v18 = 10000.0;
    v19 = 0.0;
    while (1)
    {
      if ((v11 & 1) == 0)
      {
        v48 = 0;
        v49 = 0;
        v21 = v9;
        v19 = 10000.0;
        goto LABEL_42;
      }
      v65 = v10;
      v20 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v66, "objectForKeyedSubscript:", v13);
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        break;
      v23 = (void *)v22;
      v24 = v20;
      objc_msgSend(v66, "objectForKeyedSubscript:", v14);
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
        goto LABEL_40;
      v26 = (void *)v25;
      v27 = v21;
      v28 = v13;
      v29 = v14;
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kRTSimilarityDistanceBetweenLastLocations"));
      v30 = objc_claimAutoreleasedReturnValue();
      if (!v30)
        goto LABEL_39;
      v31 = (void *)v30;
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kRTSimilarityDistanceBetweenCentroids"));
      v32 = objc_claimAutoreleasedReturnValue();
      if (!v32)
      {

LABEL_39:
        v21 = v27;
LABEL_40:

        v20 = v24;
        break;
      }
      v33 = (void *)v32;
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kRTSimilarityIOU"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v29;
      v13 = v28;
      v21 = v27;
      v20 = v24;
      if (!v34)
        break;
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kRTSimilarityIsLongWorkout"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v35, "BOOLValue");

      objc_msgSend(v66, "objectForKeyedSubscript:", v13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v15 = v37;

      objc_msgSend(v66, "objectForKeyedSubscript:", v14);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      v16 = v39;

      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kRTSimilarityDistanceBetweenLastLocations"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValue");
      v17 = v41;

      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kRTSimilarityDistanceBetweenCentroids"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      v18 = v43;

      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("kRTSimilarityIOU"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      v12 = v45;

      v46 = (v15 <= 150.0) & ~v10;
      if (v16 > 150.0)
        v46 = 0;
      if (v17 > 150.0)
        v46 = 0;
      if (v18 > 150.0)
        v46 = 0;
      if (v15 <= 250.0)
        v47 = v10;
      else
        v47 = 0;
      if (v16 > 250.0)
        v47 = 0;
      if (v17 > 250.0)
        v47 = 0;
      if (v18 > 250.0)
        v47 = 0;
      if (v12 >= 0.97)
        v48 = v46;
      else
        v48 = 0;
      if (v12 >= 0.97)
        v49 = v47;
      else
        v49 = 0;
      objc_autoreleasePoolPop(v24);
      if ((v48 & 1) == 0)
      {
        v11 = 0;
        v9 = v21;
        if (!v49)
          continue;
      }
      goto LABEL_42;
    }
    objc_autoreleasePoolPop(v20);
    v48 = 0;
    v49 = 0;
    v19 = 10000.0;
    LOBYTE(v10) = v65;
LABEL_42:
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v10 & 1) != 0)
        v55 = CFSTR("YES");
      else
        v55 = CFSTR("NO");
      if (v48)
        v56 = CFSTR("YES");
      else
        v56 = CFSTR("NO");
      if (v49)
        v57 = CFSTR("YES");
      else
        v57 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v63);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "timeIntervalSinceDate:", v21);
      v60 = v59;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138416642;
      v68 = v53;
      v69 = 2112;
      v70 = v54;
      v71 = 2048;
      v72 = v19;
      v73 = 2112;
      v74 = v55;
      v75 = 2112;
      v76 = v56;
      v77 = 2112;
      v78 = v57;
      v79 = 2048;
      v80 = v15;
      v81 = 2048;
      v82 = 0x4062C00000000000;
      v83 = 2048;
      v84 = v16;
      v85 = 2048;
      v86 = 0x4062C00000000000;
      v87 = 2048;
      v88 = v17;
      v89 = 2048;
      v90 = 0x4062C00000000000;
      v91 = 2048;
      v92 = v18;
      v93 = 2048;
      v94 = 0x4062C00000000000;
      v95 = 2048;
      v96 = v12;
      v97 = 2048;
      v98 = 0x3FEF0A3D70A3D70ALL;
      v99 = 2048;
      v100 = v60;
      v101 = 2048;
      v102 = v61;
      _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "%@, %@, similarity distance, %.3f, isLongWorkout, %@, metShortWorkoutThresholds, %@, metLongWorkoutThresholds, %@, differenceInTotalDistance (in meters), %.4f, differenceInTotalDistance threshold (in meters), %.4f,  distanceBetweenFirstLocations (in meters), %.4f, distanceBetweenFirstLocations threshold (in meters), %.4f, distanceBetweenLastLocations (in meters), %.4f, distanceBetweenLastLocations threshold (in meters), %.4f, distanceBetweenCentroids (in meters), %.4f, distanceBetweenCentroids threshold (in meters), %.4f, iou (in percentage), %.4f, iou threshold (in percentage), %.4f, latency, %.4f sec, footprint, %.4f MB", buf, 0xB6u);

    }
    v8 = v66;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v50, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: preFilteringResults", buf, 2u);
    }

    v19 = 1.0;
    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("preFilteringResults"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v19;
}

- (unint64_t)_getCurveOrientationTypeForLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  NSObject *v13;
  CLLocationCoordinate2D *v16;
  CLLocationCoordinate2D *v17;
  _BOOL4 v18;
  uint64_t v19;
  CLLocationDegrees *p_longitude;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  id v27;
  uint8_t buf[8];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a4 - 1;
    if (a4 > 1)
    {
      v16 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      *v16 = *a3;
      v17 = (CLLocationCoordinate2D *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
      *v17 = a3[a4 - 1];
      v27 = 0;
      v18 = -[RTWorkoutRouteManager _isEligibleForCurveOrientation:lastLocation:error:](self, "_isEligibleForCurveOrientation:lastLocation:error:", v16, v17, &v27);
      v11 = v27;
      if (v18)
      {
        v19 = 0;
        p_longitude = &a3->longitude;
        v21 = 0.0;
        do
        {
          if (v7 == v19)
            v22 = 0;
          else
            v22 = v19 + 1;
          v21 = v21 + *p_longitude * a3[v22].latitude - a3[v22].longitude * *(p_longitude - 1);
          p_longitude += 2;
          ++v19;
        }
        while (a4 != v19);
        if (v16)
          free(v16);
        v23 = v21 * 0.5;
        if (v17)
          free(v17);
        v24 = fabs(v23);
        v25 = 2;
        if (v23 < 0.0)
          v25 = 1;
        if (v24 >= 0.000005)
          v12 = v25;
        else
          v12 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D18598];
      v29 = *MEMORY[0x1E0CB2D50];
      v30[0] = CFSTR("less number of locations than required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 7, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (a5)
      {
        v11 = objc_retainAutorelease(v11);
        v12 = 0;
        *a5 = v11;
LABEL_25:

        return v12;
      }
    }
    v12 = 0;
    goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
  }

  if (!a5)
    return 0;
  _RTErrorInvalidParameterCreate((uint64_t)CFSTR("locations"));
  v12 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (id)_readClustersFromHealthKitWithError:(id *)a3
{
  void *v3;
  char v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
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
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  int v31;
  id v32;
  NSObject *v33;
  objc_class *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  dispatch_semaphore_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
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
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  int v65;
  NSObject *v66;
  objc_class *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  id *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  objc_class *v82;
  id v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
  uint64_t (*v90)(uint64_t, uint64_t);
  void *v91;
  NSObject *v92;
  objc_class *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id *v99;
  _QWORD *v100;
  id v101;
  id obj;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *context;
  id v109;
  void *v111;
  NSObject *dsema;
  dispatch_semaphore_t dsemaa;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  _QWORD v120[4];
  NSObject *v121;
  _BYTE *v122;
  uint64_t *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _QWORD v128[4];
  NSObject *v129;
  _BYTE *v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t (*v135)(uint64_t, uint64_t);
  void (*v136)(uint64_t);
  id v137;
  _BYTE v138[128];
  _BYTE v139[12];
  __int16 v140;
  id v141;
  __int16 v142;
  uint64_t v143;
  __int16 v144;
  uint64_t v145;
  void *v146;
  _BYTE v147[24];
  uint64_t (*v148)(uint64_t, uint64_t);
  void (*v149)(uint64_t);
  id v150;
  uint8_t v151[128];
  _BYTE buf[24];
  uint64_t (*v153)(uint64_t, uint64_t);
  __int128 v154;
  _QWORD v155[4];

  v99 = a3;
  v155[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v109 = 0;
  v4 = 1;
  v104 = *MEMORY[0x1E0D18598];
  v105 = *MEMORY[0x1E0CB2D50];
  v111 = v3;
  do
  {
    if ((v4 & 1) == 0)
      goto LABEL_57;
    v103 = (void *)MEMORY[0x1D8231EA8]();
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, %@, Fetching clusters from healthKit.", buf, 0x16u);

    }
    v9 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v153 = __Block_byref_object_copy__133;
    *(_QWORD *)&v154 = __Block_byref_object_dispose__133;
    *((_QWORD *)&v154 + 1) = 0;
    v132 = 0;
    v133 = &v132;
    v134 = 0x3032000000;
    v135 = __Block_byref_object_copy__133;
    v136 = __Block_byref_object_dispose__133;
    v137 = 0;
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke;
    v128[3] = &unk_1E9296EE0;
    v130 = buf;
    v131 = &v132;
    v11 = v9;
    v129 = v11;
    objc_msgSend(v10, "fetchWorkoutClustersWithHandler:", v128);

    dsema = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v13))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v12);
      v16 = v15;
      v17 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
        *(_WORD *)v147 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v147, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB35C8];
      *(_QWORD *)v139 = v105;
      *(_QWORD *)v147 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v139, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v104, 15, v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v25 = objc_retainAutorelease(v25);

      }
    }
    else
    {
      v25 = 0;
    }

    v26 = v25;
    v27 = v26;
    v28 = (void *)v133[5];
    if (v28)
    {
      v29 = v28;

      v30 = 0;
      v31 = 1;
      v109 = v29;
      goto LABEL_55;
    }
    if (v26)
    {
      v32 = v26;

      v30 = 0;
      v31 = 1;
      v109 = v32;
      goto LABEL_55;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
      *(_DWORD *)v147 = 138412802;
      *(_QWORD *)&v147[4] = v35;
      *(_WORD *)&v147[12] = 2112;
      *(_QWORD *)&v147[14] = v36;
      *(_WORD *)&v147[22] = 2048;
      v148 = (uint64_t (*)(uint64_t, uint64_t))v37;
      _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%@, %@, fetched clusters from healthkit, fetchedClusters count, %lu", v147, 0x20u);

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      obj = *(id *)(*(_QWORD *)&buf[8] + 40);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v151, 16);
      v39 = 0;
      if (!v38)
        goto LABEL_53;
      v106 = *(_QWORD *)v125;
      while (1)
      {
        v40 = 0;
        v107 = v38;
        do
        {
          if (*(_QWORD *)v125 != v106)
            objc_enumerationMutation(obj);
          v41 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v40);
          context = (void *)MEMORY[0x1D8231EA8]();
          v42 = dispatch_semaphore_create(0);

          *(_QWORD *)v147 = 0;
          *(_QWORD *)&v147[8] = v147;
          *(_QWORD *)&v147[16] = 0x3032000000;
          v148 = __Block_byref_object_copy__133;
          v149 = __Block_byref_object_dispose__133;
          v150 = (id)objc_opt_new();
          -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "clusterUUID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke_169;
          v120[3] = &unk_1E9296EE0;
          v122 = v147;
          v123 = &v132;
          v45 = v42;
          v121 = v45;
          objc_msgSend(v43, "fetchWorkoutUUIDsForClusterUUID:handler:", v44, v120);

          dsema = v45;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = dispatch_time(0, 3600000000000);
          v48 = v39;
          if (dispatch_semaphore_wait(dsema, v47))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "timeIntervalSinceDate:", v46);
            v51 = v50;
            v52 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
              *(_WORD *)v139 = 0;
              _os_log_fault_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v139, 2u);
            }

            v58 = (void *)MEMORY[0x1E0CB35C8];
            v155[0] = v105;
            *(_QWORD *)v139 = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v155, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "errorWithDomain:code:userInfo:", v104, 15, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = v39;
            if (v60)
            {
              v48 = objc_retainAutorelease(v60);

            }
          }

          v61 = v48;
          v62 = (void *)v133[5];
          if (v62)
          {
            v39 = v61;
            v63 = v62;
LABEL_32:
            v64 = v109;
            v65 = 5;
            v109 = v63;
            goto LABEL_33;
          }
          if (v61)
          {
            v39 = v61;
            v63 = v61;
            goto LABEL_32;
          }
          v39 = 0;
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            v67 = (objc_class *)objc_opt_class();
            NSStringFromClass(v67);
            v68 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v69 = (id)objc_claimAutoreleasedReturnValue();
            v70 = objc_msgSend(*(id *)(*(_QWORD *)&v147[8] + 40), "count");
            *(_DWORD *)v139 = 138412802;
            *(_QWORD *)&v139[4] = v68;
            v140 = 2112;
            v141 = v69;
            v142 = 2048;
            v143 = v70;
            _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "%@, %@, fetched cluster's uuids, uuids count, %lu", v139, 0x20u);

          }
          if (!objc_msgSend(*(id *)(*(_QWORD *)&v147[8] + 40), "count"))
          {
            v65 = 6;
            goto LABEL_34;
          }
          -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)&v147[8] + 40), "anyObject");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = v72;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (id *)(v133 + 5);
          v119 = (id)v133[5];
          objc_msgSend(v71, "getWorkoutsWithUUIDs:error:", v73, &v119);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(v74, v119);

          v75 = (void *)v133[5];
          if (v75)
          {
            v76 = v109;
            v65 = 5;
            v109 = v75;
          }
          else
          {
            if (!objc_msgSend(v64, "count"))
            {
              v65 = 6;
              goto LABEL_33;
            }
            objc_msgSend(v64, "firstObject");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v77, "workoutActivityType"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v111, "objectForKeyedSubscript:", v76);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v77) = v78 == 0;

            if ((_DWORD)v77)
            {
              v79 = (void *)objc_opt_new();
              objc_msgSend(v111, "setObject:forKeyedSubscript:", v79, v76);

            }
            objc_msgSend(v111, "objectForKeyedSubscript:", v76, v99, v101);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "addObject:", *(_QWORD *)(*(_QWORD *)&v147[8] + 40));

            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
            {
              v82 = (objc_class *)objc_opt_class();
              NSStringFromClass(v82);
              v83 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v84 = (id)objc_claimAutoreleasedReturnValue();
              v85 = objc_msgSend(*(id *)(*(_QWORD *)&v147[8] + 40), "count");
              *(_DWORD *)v139 = 138413058;
              *(_QWORD *)&v139[4] = v83;
              v140 = 2112;
              v141 = v84;
              v142 = 2112;
              v143 = (uint64_t)v76;
              v144 = 2048;
              v145 = v85;
              _os_log_impl(&dword_1D1A22000, v81, OS_LOG_TYPE_INFO, "%@, %@, added new cluster of activity type, %@, uuids count, %lu", v139, 0x2Au);

            }
            v65 = 0;
          }

LABEL_33:
LABEL_34:

          _Block_object_dispose(v147, 8);
          objc_autoreleasePoolPop(context);
          if (v65 != 6 && v65)
            goto LABEL_53;
          ++v40;
        }
        while (v107 != v40);
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v124, v151, 16);
        if (!v38)
        {
LABEL_53:

          v86 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

          v31 = 0;
          v30 = 1;
          goto LABEL_55;
        }
      }
    }
    v101 = v111;
    v30 = 0;
    v31 = 0;
LABEL_55:

    _Block_object_dispose(&v132, 8);
    _Block_object_dispose(buf, 8);

    objc_autoreleasePoolPop(v103);
    v4 = 0;
    v3 = v111;
  }
  while ((v30 & 1) != 0);
  if (v31)
  {
LABEL_57:
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    objc_msgSend(v3, "allKeys", v99);
    dsemaa = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
    v87 = -[NSObject countByEnumeratingWithState:objects:count:](dsemaa, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
    if (v87)
    {
      v88 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v87; ++i)
        {
          if (*(_QWORD *)v116 != v88)
            objc_enumerationMutation(dsemaa);
          v90 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v115 + 1) + 8 * i);
          v91 = (void *)MEMORY[0x1D8231EA8]();
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            v93 = (objc_class *)objc_opt_class();
            NSStringFromClass(v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "objectForKeyedSubscript:", v90);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = objc_msgSend(v96, "count");
            *(_DWORD *)buf = 138413058;
            *(_QWORD *)&buf[4] = v94;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v95;
            *(_WORD *)&buf[22] = 2112;
            v153 = v90;
            LOWORD(v154) = 2048;
            *(_QWORD *)((char *)&v154 + 2) = v97;
            _os_log_impl(&dword_1D1A22000, v92, OS_LOG_TYPE_INFO, "%@, %@, workout activity type, %@, cluster count, %lu", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v91);
        }
        v87 = -[NSObject countByEnumeratingWithState:objects:count:](dsemaa, "countByEnumeratingWithState:objects:count:", &v115, v138, 16);
      }
      while (v87);
    }

    if (v100)
      *v100 = objc_retainAutorelease(v109);
    v3 = v111;
    v101 = v111;
  }

  return v101;
}

void __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __61__RTWorkoutRouteManager__readClustersFromHealthKitWithError___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v12);
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

- (id)_clusterizeWorkoutsWithError:(id *)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  NSObject *v8;
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
  id v28;
  NSObject *v29;
  objc_class *v30;
  id v31;
  void *v32;
  uint64_t v33;
  dispatch_semaphore_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  dispatch_time_t v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  objc_class *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  objc_class *v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  double v76;
  NSObject *v77;
  void *v78;
  _BOOL4 v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL4 v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t j;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  id v95;
  void *v96;
  int v97;
  id v98;
  void *v99;
  uint64_t v100;
  BOOL v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  _BOOL4 v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  NSObject *v113;
  objc_class *v114;
  id v115;
  void *v116;
  unint64_t v117;
  void *v118;
  void *v119;
  objc_class *v120;
  id v121;
  void *v122;
  objc_class *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  _BOOL4 v130;
  void *v131;
  void *v132;
  objc_class *v133;
  id v134;
  void *v135;
  void *v136;
  objc_class *v137;
  id v138;
  void *v139;
  void *v140;
  objc_class *v141;
  id v142;
  void *v143;
  objc_class *v144;
  id v145;
  id v146;
  void *v147;
  objc_class *v148;
  id v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  void *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t i;
  void *v162;
  void *v163;
  void *v164;
  NSObject *v165;
  objc_class *v166;
  id v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  unint64_t v175;
  double v176;
  uint64_t v177;
  void *v178;
  void *v179;
  uint64_t v180;
  objc_class *v181;
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
  objc_class *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  void *v198;
  id v199;
  RTClusterizeResults *v200;
  id v201;
  NSObject *dsema;
  id obj;
  void *v206;
  void *v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  id v211;
  void *context;
  void *v213;
  id v214;
  id v215;
  RTWorkoutRouteManager *v216;
  __int128 v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  id v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  id v234;
  id v235;
  id v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  id v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  _QWORD v246[4];
  NSObject *v247;
  uint64_t *v248;
  uint64_t *v249;
  _QWORD *v250;
  _QWORD v251[5];
  id v252;
  uint64_t v253;
  uint64_t *v254;
  uint64_t v255;
  uint64_t v256;
  _QWORD v257[4];
  NSObject *v258;
  uint64_t *v259;
  uint64_t v260;
  uint64_t *v261;
  uint64_t v262;
  uint64_t v263;
  id v264;
  _BYTE v265[128];
  _BYTE v266[128];
  _BYTE v267[128];
  _BYTE v268[128];
  _BYTE buf[12];
  __int16 v270;
  id v271;
  __int16 v272;
  uint64_t v273;
  __int16 v274;
  uint64_t v275;
  __int16 v276;
  void *v277;
  __int16 v278;
  uint64_t v279;
  __int16 v280;
  uint64_t v281;
  _BYTE v282[128];
  uint64_t v283;
  uint64_t *v284;
  uint64_t v285;
  uint64_t (*v286)(uint64_t, uint64_t);
  void (*v287)(uint64_t);
  id v288;
  _QWORD v289[4];

  v289[1] = *MEMORY[0x1E0C80C00];
  v206 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v210 = (void *)objc_opt_new();
  v200 = -[RTClusterizeResults initWithClusters:objectIDs:]([RTClusterizeResults alloc], "initWithClusters:objectIDs:", v4, v210);
  v264 = 0;
  v216 = self;
  -[RTWorkoutRouteManager _getMaxDistanceThresholdForMetric:error:](self, "_getMaxDistanceThresholdForMetric:error:", -[RTWorkoutRouteManager distanceMetric](self, "distanceMetric"), &v264);
  v6 = v5;
  v7 = v264;
  v201 = v7;
  if (a3 && v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v181 = (objc_class *)objc_opt_class();
      NSStringFromClass(v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v182;
      v270 = 2112;
      v271 = v183;
      v272 = 2112;
      v273 = (uint64_t)v201;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    *a3 = objc_retainAutorelease(v201);
    goto LABEL_143;
  }
  v198 = (void *)MEMORY[0x1D8231EA8]();
  v260 = 0;
  v261 = &v260;
  v262 = 0x2020000000;
  v263 = 0;
  v9 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager workoutDistanceStore](v216, "workoutDistanceStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v257[0] = MEMORY[0x1E0C809B0];
  v257[1] = 3221225472;
  v257[2] = __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke;
  v257[3] = &unk_1E929A708;
  v259 = &v260;
  v11 = v9;
  v258 = v11;
  objc_msgSend(v10, "fetchTotalWorkoutDistancesCountWithHandler:", v257);

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v283 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v283, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

  }
  else
  {
LABEL_11:
    v27 = 0;
  }

  v28 = v27;
  if (v28)
    objc_msgSend(v206, "addObject:", v28);
  v253 = 0;
  v254 = &v253;
  v255 = 0x2020000000;
  v256 = 0;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v261[3];
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v31;
    v270 = 2112;
    v271 = v32;
    v272 = 2048;
    v273 = 5000;
    v274 = 2048;
    v275 = v33;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "%@, %@, limit, %lu, totalWorkoutDistancesCount, %lu,", buf, 0x2Au);

  }
  v34 = dispatch_semaphore_create(0);

  v283 = 0;
  v284 = &v283;
  v285 = 0x3032000000;
  v286 = __Block_byref_object_copy__133;
  v287 = __Block_byref_object_dispose__133;
  v288 = 0;
  v251[0] = 0;
  v251[1] = v251;
  v251[2] = 0x3032000000;
  v251[3] = __Block_byref_object_copy__133;
  v251[4] = __Block_byref_object_dispose__133;
  v252 = 0;
  -[RTWorkoutRouteManager workoutDistanceStore](v216, "workoutDistanceStore");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v246[0] = MEMORY[0x1E0C809B0];
  v246[1] = 3221225472;
  v246[2] = __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke_171;
  v246[3] = &unk_1E9297218;
  v248 = &v283;
  v249 = &v253;
  v250 = v251;
  v36 = v34;
  v247 = v36;
  objc_msgSend(v35, "fetchWorkoutDistancesWithOffset:limit:maxDistanceThreshold:includeVisitedRecords:handler:", 0, 5000, 0, v246, v6);

  dsema = v36;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = dispatch_time(0, 3600000000000);
  v39 = v28;
  if (dispatch_semaphore_wait(dsema, v38))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "timeIntervalSinceDate:", v37);
    v42 = v41;
    v43 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "filteredArrayUsingPredicate:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "submitToCoreAnalytics:type:duration:", v47, 1, v42);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v48, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v49 = (void *)MEMORY[0x1E0CB35C8];
    v289[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v289, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v28;
    if (v51)
    {
      v39 = objc_retainAutorelease(v51);

    }
  }

  v199 = v39;
  if (!v199)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      NSStringFromClass(v53);
      v54 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v56 = v254[3];
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v54;
      v270 = 2112;
      v271 = v55;
      v272 = 2048;
      v273 = v56;
      v274 = 2048;
      v275 = v57;
      _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, "%@, %@, workoutDistances count, %lu, footprint, %.4f MB", buf, 0x2Au);

    }
    v244 = 0u;
    v245 = 0u;
    v242 = 0u;
    v243 = 0u;
    obj = (id)v284[5];
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, v282, 16);
    v59 = 0;
    if (!v58)
    {
LABEL_101:

      v152 = (void *)v284[5];
      v284[5] = 0;

      if (objc_msgSend(v206, "count"))
      {
        -[RTWorkoutRouteManager setWorkoutActivityTypeToclustersSet:](v216, "setWorkoutActivityTypeToclustersSet:", 0);
      }
      else
      {
        v232 = 0u;
        v233 = 0u;
        v230 = 0u;
        v231 = 0u;
        -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "allValues");
        v215 = (id)objc_claimAutoreleasedReturnValue();

        v154 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v230, v267, 16);
        if (v154)
        {
          v218 = *(_QWORD *)v231;
          do
          {
            v155 = 0;
            v220 = v154;
            do
            {
              if (*(_QWORD *)v231 != v218)
                objc_enumerationMutation(v215);
              v156 = *(void **)(*((_QWORD *)&v230 + 1) + 8 * v155);
              v157 = (void *)MEMORY[0x1D8231EA8]();
              v228 = 0u;
              v229 = 0u;
              v226 = 0u;
              v227 = 0u;
              v158 = v156;
              v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v226, v266, 16);
              if (v159)
              {
                v160 = *(_QWORD *)v227;
                do
                {
                  for (i = 0; i != v159; ++i)
                  {
                    if (*(_QWORD *)v227 != v160)
                      objc_enumerationMutation(v158);
                    v162 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * i);
                    v163 = (void *)MEMORY[0x1D8231EA8]();
                    objc_msgSend(v162, "allObjects");
                    v164 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "addObject:", v164);

                    objc_autoreleasePoolPop(v163);
                  }
                  v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v226, v266, 16);
                }
                while (v159);
              }

              objc_autoreleasePoolPop(v157);
              ++v155;
            }
            while (v155 != v220);
            v154 = objc_msgSend(v215, "countByEnumeratingWithState:objects:count:", &v230, v267, 16);
          }
          while (v154);
        }

        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v165 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
        {
          v166 = (objc_class *)objc_opt_class();
          NSStringFromClass(v166);
          v167 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v168 = (id)objc_claimAutoreleasedReturnValue();
          v169 = objc_msgSend(v4, "count");
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v167;
          v270 = 2112;
          v271 = v168;
          v272 = 2048;
          v273 = v169;
          v274 = 2048;
          v275 = v170;
          _os_log_impl(&dword_1D1A22000, v165, OS_LOG_TYPE_INFO, "%@, %@, out clusters count, %lu, footprint, %.4f MB", buf, 0x2Au);

        }
        v224 = 0u;
        v225 = 0u;
        v222 = 0u;
        v223 = 0u;
        v221 = v4;
        v171 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v222, v265, 16);
        if (v171)
        {
          v172 = 0;
          v173 = *(_QWORD *)v223;
          v174 = -1;
          v175 = -1;
          v176 = -1.0;
          do
          {
            v177 = 0;
            v219 = v171 + v172;
            do
            {
              if (*(_QWORD *)v223 != v173)
                objc_enumerationMutation(v221);
              v178 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * v177);
              v179 = (void *)MEMORY[0x1D8231EA8]();
              if (v174 == -1 || objc_msgSend(v178, "count") < v174)
                v174 = objc_msgSend(v178, "count");
              if (v175 == -1 || objc_msgSend(v178, "count") > v175)
                v175 = objc_msgSend(v178, "count");
              if (v176 == -1.0)
                v176 = (double)(unint64_t)objc_msgSend(v178, "count");
              else
                v176 = ((double)(unint64_t)objc_msgSend(v178, "count")
                      + v176 * (double)(unint64_t)(v172 + v177 + 1))
                     / (double)(unint64_t)(v172 + v177 + 2);
              objc_autoreleasePoolPop(v179);
              ++v177;
            }
            while (v171 != v177);
            v171 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v222, v265, 16);
            v180 = v219;
            v172 = v219;
          }
          while (v171);
        }
        else
        {
          v180 = 0;
          v176 = -1.0;
          v174 = -1;
          v175 = -1;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v180);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](v216, "processWorkoutMetrics");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v185, "setObject:forKeyedSubscript:", v184, CFSTR("clustering_count_clusters"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v174);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](v216, "processWorkoutMetrics");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "setObject:forKeyedSubscript:", v186, CFSTR("clustering_min_cluster_size"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v175);
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](v216, "processWorkoutMetrics");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "setObject:forKeyedSubscript:", v188, CFSTR("clustering_max_cluster_size"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v176);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](v216, "processWorkoutMetrics");
        v191 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v191, "setObject:forKeyedSubscript:", v190, CFSTR("clustering_average_cluster_size"));

      }
      goto LABEL_139;
    }
    v208 = 0;
    v209 = *(_QWORD *)v243;
LABEL_27:
    v211 = (id)v58;
    v214 = 0;
    v60 = v59;
    while (1)
    {
      if (*(_QWORD *)v243 != v209)
        objc_enumerationMutation(obj);
      v61 = *(void **)(*((_QWORD *)&v242 + 1) + 8 * (_QWORD)v214);
      context = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v61, "objectID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "addObject:", v62);

      v63 = -[RTWorkoutRouteManager distanceMetric](v216, "distanceMetric");
      v64 = objc_msgSend(v61, "areBothWorkoutsDecimated");
      v65 = objc_msgSend(v61, "workoutActivityType");
      v241 = v60;
      -[RTWorkoutRouteManager _getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:](v216, "_getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:", v63, v64, v65, &v241);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v241;

      if (!v59)
        break;
      objc_msgSend(v206, "addObject:", v59);
LABEL_81:

      objc_autoreleasePoolPop(context);
      v60 = v59;
      v214 = (char *)v214 + 1;
      if (v214 == v211)
      {
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v242, v282, 16);
        if (!v58)
          goto LABEL_101;
        goto LABEL_27;
      }
    }
    ++v208;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      v67 = (objc_class *)objc_opt_class();
      NSStringFromClass(v67);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v69 = (id)objc_claimAutoreleasedReturnValue();
      v70 = v254[3];
      objc_msgSend(v213, "doubleValue");
      v72 = v71;
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138413826;
      *(_QWORD *)&buf[4] = v68;
      v270 = 2112;
      v271 = v69;
      v272 = 2048;
      v273 = v208;
      v274 = 2048;
      v275 = v70;
      v276 = 2112;
      v277 = v61;
      v278 = 2048;
      v279 = v72;
      v280 = 2048;
      v281 = v73;
      _os_log_impl(&dword_1D1A22000, v66, OS_LOG_TYPE_INFO, "%@, %@, record num, %lu, total count, %lu, workout distance record, %@, distanceThreshold, %.4f, footprint, %.4f MB", buf, 0x48u);

    }
    objc_msgSend(v61, "distance");
    v75 = v74;
    objc_msgSend(v213, "doubleValue");
    if (v75 > v76)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v77, OS_LOG_TYPE_INFO, "skipping distance record as it is beyond threshold value", buf, 2u);
      }
      v59 = 0;
      goto LABEL_80;
    }
    +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", +[RTHealthKitManager HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:](RTHealthKitManager, "HKHealthKitWorkoutActivityTypeFromRTWorkoutActivityType:", objc_msgSend(v61, "workoutActivityType")));
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v78 == 0;

    if (v79)
    {
      v80 = (void *)objc_opt_new();
      -[RTWorkoutRouteManager setWorkoutActivityTypeToclustersSet:](v216, "setWorkoutActivityTypeToclustersSet:", v80);

    }
    -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "objectForKeyedSubscript:", v207);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82 == 0;

    if (v83)
    {
      v84 = (void *)objc_opt_new();
      -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setObject:forKeyedSubscript:", v84, v207);

    }
    v239 = 0u;
    v240 = 0u;
    v237 = 0u;
    v238 = 0u;
    -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "objectForKeyedSubscript:", v207);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v237, v268, 16);
    if (v88)
    {
      v217 = 0uLL;
      v89 = *(_QWORD *)v238;
      while (2)
      {
        for (j = 0; j != v88; ++j)
        {
          if (*(_QWORD *)v238 != v89)
            objc_enumerationMutation(v87);
          v91 = *(void **)(*((_QWORD *)&v237 + 1) + 8 * j);
          v92 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v61, "firstWorkout");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v91, "containsObject:", v93);

          if (v94)
          {
            v95 = v91;

            *((_QWORD *)&v217 + 1) = v95;
          }
          objc_msgSend(v61, "secondWorkout");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v91, "containsObject:", v96);

          if (v97)
          {
            v98 = v91;

            *(_QWORD *)&v217 = v98;
          }
          objc_autoreleasePoolPop(v92);
          if (*((_QWORD *)&v217 + 1) && (_QWORD)v217)
          {

            v99 = (void *)*((_QWORD *)&v217 + 1);
            goto LABEL_57;
          }
        }
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v237, v268, 16);
        if (v88)
          continue;
        break;
      }
    }
    else
    {
      v217 = 0uLL;
    }

    v99 = (void *)*((_QWORD *)&v217 + 1);
    if (v217 == 0)
    {
      v107 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v61, "firstWorkout");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "secondWorkout");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "setWithObjects:", v108, v109, 0, v198);
      v110 = objc_claimAutoreleasedReturnValue();

      -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "objectForKeyedSubscript:", v207);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "addObject:", v110);

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        v114 = (objc_class *)objc_opt_class();
        NSStringFromClass(v114);
        v115 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v115;
        v270 = 2112;
        v271 = v116;
        v272 = 2112;
        v273 = (uint64_t)v110;
        _os_log_impl(&dword_1D1A22000, v113, OS_LOG_TYPE_INFO, "%@, %@, case 1/4, new cluster is created, %@", buf, 0x20u);

      }
      *((_QWORD *)&v217 + 1) = 0;
    }
    else
    {
      if (!*((_QWORD *)&v217 + 1) || (_QWORD)v217)
      {
        if (!*((_QWORD *)&v217 + 1) && (_QWORD)v217)
        {
          v126 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v61, "firstWorkout");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "setWithObject:", v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = objc_msgSend(v61, "workoutActivityType");
          objc_msgSend(v213, "doubleValue");
          v235 = 0;
          v130 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](v216, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v128, (_QWORD)v217, v129, &v235);
          v59 = v235;

          if (v59)
          {
            objc_msgSend(v206, "addObject:", v59);
            *((_QWORD *)&v217 + 1) = 0;
            goto LABEL_79;
          }
          if (v130)
          {
            objc_msgSend(v61, "firstWorkout");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v217, "addObject:", v140);

            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              v141 = (objc_class *)objc_opt_class();
              NSStringFromClass(v141);
              v142 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v142;
              v270 = 2112;
              v271 = v143;
              v272 = 2112;
              v273 = v217;
              _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 3/4, added to clusterSetForUUID2, %@", buf, 0x20u);

            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              v148 = (objc_class *)objc_opt_class();
              NSStringFromClass(v148);
              v149 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v150 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "firstWorkout");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v149;
              v270 = 2112;
              v271 = v150;
              v272 = 2112;
              v273 = (uint64_t)v151;
              v274 = 2112;
              v275 = v217;
              _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, %@, workoutUUID, %@, not added to the cluster, %@, reason, not similar to entire cluster", buf, 0x2Au);

            }
          }
          *((_QWORD *)&v217 + 1) = 0;
          goto LABEL_71;
        }
LABEL_57:
        *((_QWORD *)&v217 + 1) = v99;
        if (v99 == (void *)v217)
        {
          v59 = 0;
          *(_QWORD *)&v217 = v99;
          goto LABEL_79;
        }
        v100 = objc_msgSend(v61, "workoutActivityType");
        objc_msgSend(v213, "doubleValue");
        v234 = 0;
        v101 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](v216, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", v99, (_QWORD)v217, v100, &v234);
        v59 = v234;
        if (v59)
        {
          objc_msgSend(v206, "addObject:", v59);
        }
        else if (v101)
        {
          v117 = objc_msgSend(v99, "count");
          if (v117 <= objc_msgSend((id)v217, "count"))
          {
            objc_msgSend((id)v217, "unionSet:", v99);
            -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "objectForKeyedSubscript:", v207);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "removeObject:", v99);

            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              v133 = (objc_class *)objc_opt_class();
              NSStringFromClass(v133);
              v134 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v134;
              v270 = 2112;
              v271 = v135;
              v272 = 2112;
              v273 = v217;
              _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 4.2/4, clusterSetForUUID1 and clusterSetForUUID2 merged, clusterSetForUUID2, %@, clusterSetForUUID1, removed", buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(v99, "unionSet:", (_QWORD)v217);
            -[RTWorkoutRouteManager workoutActivityTypeToclustersSet](v216, "workoutActivityTypeToclustersSet");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "objectForKeyedSubscript:", v207);
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "removeObject:", (_QWORD)v217);

            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              v120 = (objc_class *)objc_opt_class();
              NSStringFromClass(v120);
              v121 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v121;
              v270 = 2112;
              v271 = v122;
              v272 = 2112;
              v273 = (uint64_t)v99;
              _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 4.1/4, clusterSetForUUID1 and clusterSetForUUID2 merged, clusterSetForUUID1, %@, clusterSetForUUID2, removed", buf, 0x20u);

            }
          }
          goto LABEL_71;
        }
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          v123 = (objc_class *)objc_opt_class();
          NSStringFromClass(v123);
          v124 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v124;
          v270 = 2112;
          v271 = v125;
          v272 = 2112;
          v273 = (uint64_t)v99;
          v274 = 2112;
          v275 = v217;
          _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, %@, cluster1, %@, cluster2, %@, not merged", buf, 0x2Au);

        }
        goto LABEL_78;
      }
      v102 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(v61, "secondWorkout");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setWithObject:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v61, "workoutActivityType");
      objc_msgSend(v213, "doubleValue");
      v236 = 0;
      v106 = -[RTWorkoutRouteManager _areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:](v216, "_areWorkoutsSimilarBetweenClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:error:", *((_QWORD *)&v217 + 1), v104, v105, &v236);
      v59 = v236;

      if (v59)
      {
        objc_msgSend(v206, "addObject:", v59);
        *(_QWORD *)&v217 = 0;
LABEL_79:

        v77 = *((_QWORD *)&v217 + 1);
LABEL_80:

        goto LABEL_81;
      }
      if (v106)
      {
        objc_msgSend(v61, "secondWorkout");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)&v217 + 1), "addObject:", v136);

        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          v137 = (objc_class *)objc_opt_class();
          NSStringFromClass(v137);
          v138 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v138;
          v270 = 2112;
          v271 = v139;
          v272 = 2112;
          v273 = *((_QWORD *)&v217 + 1);
          _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, %@, case 2/4, added to clusterSetForUUID1, %@", buf, 0x20u);

        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          v144 = (objc_class *)objc_opt_class();
          NSStringFromClass(v144);
          v145 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v146 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "secondWorkout");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v145;
          v270 = 2112;
          v271 = v146;
          v272 = 2112;
          v273 = (uint64_t)v147;
          v274 = 2112;
          v275 = *((_QWORD *)&v217 + 1);
          _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "%@, %@, workoutUUID, %@, not added to the cluster, %@, reason, not similar to entire cluster", buf, 0x2Au);

        }
      }
    }
    *(_QWORD *)&v217 = 0;
LABEL_71:
    v59 = 0;
LABEL_78:

    goto LABEL_79;
  }
  objc_msgSend(v206, "addObject:");
LABEL_139:

  _Block_object_dispose(v251, 8);
  _Block_object_dispose(&v283, 8);

  _Block_object_dispose(&v253, 8);
  _Block_object_dispose(&v260, 8);
  objc_autoreleasePoolPop(v198);
  v192 = (objc_class *)objc_opt_class();
  NSStringFromClass(v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager _logClusters:className:selectorName:](v216, "_logClusters:className:selectorName:", v4, v193, v194);

  if (a3)
  {
    if (objc_msgSend(v206, "count"))
    {
      _RTSafeArray();
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v196 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v196;

    }
    else
    {
      *a3 = 0;
    }
  }
LABEL_143:

  return v200;
}

intptr_t __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__RTWorkoutRouteManager__clusterizeWorkoutsWithError___block_invoke_171(uint64_t a1, void *a2, void *a3)
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

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v12, "count");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_syncClustersToHealthKit:(id)a3 error:(id *)a4
{
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t v37;
  id *v38;
  _BOOL8 v39;
  double v40;
  double v41;
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
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  objc_class *v65;
  id v66;
  id v67;
  const __CFString *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  id *v74;
  _BOOL8 v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  NSObject *v89;
  objc_class *v90;
  id v91;
  id v92;
  const __CFString *v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  BOOL v97;
  NSObject *v98;
  objc_class *v100;
  id v101;
  void *v102;
  const __CFString *v103;
  const char *aSelector;
  id v106;
  uint64_t v107;
  uint64_t v108;
  void *context;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  id obj;
  _QWORD v116[4];
  NSObject *v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  uint64_t v126;
  id *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  _BYTE buf[12];
  __int16 v133;
  id v134;
  __int16 v135;
  const __CFString *v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  double v140;
  _QWORD v141[4];

  v141[1] = *MEMORY[0x1E0C80C00];
  v106 = a3;
  if (v106)
  {
    aSelector = a2;
    v126 = 0;
    v127 = (id *)&v126;
    v128 = 0x3032000000;
    v129 = __Block_byref_object_copy__133;
    v130 = __Block_byref_object_dispose__133;
    v131 = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = *MEMORY[0x1E0D18598];
    v108 = *MEMORY[0x1E0CB2D50];
    v7 = 1;
    do
    {
      if ((v7 & 1) == 0)
        break;
      context = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[RTRuntime footprint](RTRuntime, "footprint");
      v10 = v9;
      v113 = (void *)objc_opt_new();
      v112 = (void *)objc_opt_new();
      v111 = (void *)objc_opt_new();
      v110 = (void *)objc_opt_new();
      v120 = 0;
      v121 = &v120;
      v122 = 0x3032000000;
      v123 = __Block_byref_object_copy__133;
      v124 = __Block_byref_object_dispose__133;
      v125 = 0;
      v11 = dispatch_semaphore_create(0);
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __56__RTWorkoutRouteManager__syncClustersToHealthKit_error___block_invoke;
      v116[3] = &unk_1E9296EE0;
      v118 = &v120;
      v119 = &v126;
      v13 = v11;
      v117 = v13;
      objc_msgSend(v12, "fetchWorkoutClustersWithHandler:", v116);

      v14 = v13;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v14, v16))
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", v15);
      v19 = v18;
      v20 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v26 = (void *)MEMORY[0x1E0CB35C8];
      v141[0] = v108;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v141, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v107, 15, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = objc_retainAutorelease(v28);

      }
      else
      {
LABEL_9:
        v29 = 0;
      }

      v30 = v29;
      if (v30 || v127[5])
      {
        v31 = 6;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v106, "count"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("sync_from_healthkit_count_local_clusters"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v121[5], "count"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("sync_from_healthkit_count_remote_clusters"));

        v36 = (void *)v121[5];
        v121[5] = 0;

        v37 = -[RTWorkoutRouteManager distanceMetric](self, "distanceMetric");
        v38 = v127;
        obj = v127[5];
        v39 = -[RTWorkoutRouteManager _syncWithRemoteClustersUsingLocalClusters:distanceMetric:outLocalClustersForCreation:outRemoteClustersForUpdationNewWorkouts:outRemoteClustersForUpdationWorkoutsToRemove:outRemoteClustersForDeletion:error:](self, "_syncWithRemoteClustersUsingLocalClusters:distanceMetric:outLocalClustersForCreation:outRemoteClustersForUpdationNewWorkouts:outRemoteClustersForUpdationWorkoutsToRemove:outRemoteClustersForDeletion:error:", v106, v37, v113, v112, v111, v110, &obj);
        objc_storeStrong(v38 + 5, obj);
        +[RTRuntime footprint](RTRuntime, "footprint");
        v41 = v40;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v113, "count"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("sync_from_healthkit_count_final_local_clusters"));

        v44 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v112, "allKeys");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setWithArray:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v111, "allKeys");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObjectsFromArray:", v47);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v46, "count"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, CFSTR("sync_from_healthkit_count_final_remote_clusters"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v39);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("sync_from_healthkit_is_success"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v41 - v10);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v52, CFSTR("sync_from_healthkit_footprint_delta"));

        v54 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "timeIntervalSinceDate:", v8);
        objc_msgSend(v54, "numberWithDouble:");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, CFSTR("sync_from_healthkit_time_elapsed"));

        v58 = v127[5];
        if (v58)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v58, "code"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, CFSTR("sync_from_healthkit_errorcode"));

          objc_msgSend(v127[5], "domain");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "description");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, CFSTR("sync_from_healthkit_errordomain"));
          v31 = 6;
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            v65 = (objc_class *)objc_opt_class();
            NSStringFromClass(v65);
            v66 = (id)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v67 = (id)objc_claimAutoreleasedReturnValue();
            if (v39)
              v68 = CFSTR("YES");
            else
              v68 = CFSTR("NO");
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "timeIntervalSinceDate:", v8);
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)&buf[4] = v66;
            v133 = 2112;
            v134 = v67;
            v135 = 2112;
            v136 = v68;
            v137 = 2048;
            v138 = v70;
            v139 = 2048;
            v140 = v41;
            _os_log_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_INFO, "%@, %@, syncing clusters with remote clusters in HealthKit status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v71 = objc_claimAutoreleasedReturnValue();

          +[RTRuntime footprint](RTRuntime, "footprint");
          v73 = v72;
          v74 = v127;
          v114 = v127[5];
          v75 = -[RTWorkoutRouteManager _saveToHealthKitClustersForCreation:remoteClustersForUpdationNewWorkouts:remoteClustersForUpdationWorkoutsToRemove:remoteClustersForDeletion:error:](self, "_saveToHealthKitClustersForCreation:remoteClustersForUpdationNewWorkouts:remoteClustersForUpdationWorkoutsToRemove:remoteClustersForDeletion:error:", v113, v112, v111, v110, &v114);
          objc_storeStrong(v74 + 5, v114);
          +[RTRuntime footprint](RTRuntime, "footprint");
          v77 = v76;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v75);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setObject:forKeyedSubscript:", v78, CFSTR("sync_to_healthkit_is_success"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v77 - v73);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v80, CFSTR("sync_to_healthkit_footprint_delta"));

          v82 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "timeIntervalSinceDate:", v71);
          objc_msgSend(v82, "numberWithDouble:");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setObject:forKeyedSubscript:", v84, CFSTR("sync_to_healthkit_time_elapsed"));

          v86 = v127[5];
          if (v86)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v86, "code"));
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "setObject:forKeyedSubscript:", v87, CFSTR("sync_to_healthkit_errorcode"));

            objc_msgSend(v127[5], "domain");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "description");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, CFSTR("sync_to_healthkit_errordomain"));
            v106 = 0;
            v31 = 6;
            v8 = (void *)v71;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
            {
              v90 = (objc_class *)objc_opt_class();
              NSStringFromClass(v90);
              v91 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v92 = (id)objc_claimAutoreleasedReturnValue();
              if (v75)
                v93 = CFSTR("YES");
              else
                v93 = CFSTR("NO");
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "timeIntervalSinceDate:", v71);
              *(_DWORD *)buf = 138413314;
              *(_QWORD *)&buf[4] = v91;
              v133 = 2112;
              v134 = v92;
              v135 = 2112;
              v136 = v93;
              v137 = 2048;
              v138 = v95;
              v139 = 2048;
              v140 = v77;
              _os_log_impl(&dword_1D1A22000, v89, OS_LOG_TYPE_INFO, "%@, %@, saving clusters to HealthKit status, %@, latency, %.4f, footprint, %.4f MB", buf, 0x34u);

            }
            v31 = 0;
            v106 = 0;
            v62 = v111;
            v63 = v112;
            v61 = v110;
            v8 = (void *)v71;
            v112 = 0;
            v113 = 0;
            v110 = 0;
            v111 = 0;
          }
        }

      }
      v6 = v8;

      _Block_object_dispose(&v120, 8);
      objc_autoreleasePoolPop(context);
      v7 = 0;
    }
    while (!v31);
    if (a4 && v127[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v100 = (objc_class *)objc_opt_class();
        NSStringFromClass(v100);
        v101 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = (const __CFString *)v127[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v101;
        v133 = 2112;
        v134 = v102;
        v135 = 2112;
        v136 = v103;
        _os_log_error_impl(&dword_1D1A22000, v96, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v97 = 0;
      *a4 = objc_retainAutorelease(v127[5]);
    }
    else
    {
      v97 = 1;
    }

    _Block_object_dispose(&v126, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v98, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: clusters", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("clusters"));
      v97 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v97;
}

void __56__RTWorkoutRouteManager__syncClustersToHealthKit_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_syncWithRemoteClustersUsingLocalClusters:(id)a3 distanceMetric:(int64_t)a4 outLocalClustersForCreation:(id)a5 outRemoteClustersForUpdationNewWorkouts:(id)a6 outRemoteClustersForUpdationWorkoutsToRemove:(id)a7 outRemoteClustersForDeletion:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  id v20;
  id v21;
  uint64_t v22;
  id *v23;
  int v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  _BOOL4 v29;
  objc_class *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  NSObject *v36;
  objc_class *v37;
  id v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  NSObject *v49;
  objc_class *v50;
  id v51;
  id v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  objc_class *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  dispatch_semaphore_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  dispatch_time_t v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  void *v80;
  BOOL v81;
  uint64_t *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  NSObject *v92;
  id v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  char v98;
  NSObject *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t j;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t k;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  NSObject *v118;
  objc_class *v119;
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t m;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t n;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  objc_class *v156;
  id v157;
  void *v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  uint64_t v160;
  uint64_t v161;
  void *v162;
  uint64_t (*v163)(uint64_t, uint64_t);
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id obj;
  void *v168;
  id v169;
  void *v170;
  void *context;
  void *v172;
  uint64_t v173;
  void *v174;
  id v175;
  void *v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
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
  _QWORD v199[4];
  NSObject *v200;
  uint64_t *v201;
  _BYTE *v202;
  id v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  uint64_t (*v211)(uint64_t, uint64_t);
  void (*v212)(uint64_t);
  id v213;
  uint64_t v214;
  void *v215;
  _BYTE v216[128];
  uint8_t v217[128];
  _BYTE buf[24];
  uint64_t (*v219)(uint64_t, uint64_t);
  _BYTE v220[20];
  __int16 v221;
  uint64_t v222;
  __int16 v223;
  uint64_t v224;
  __int16 v225;
  uint64_t v226;
  __int16 v227;
  uint64_t v228;
  __int16 v229;
  uint64_t v230;
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  uint64_t v235;
  uint8_t v236[8];
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v175 = a6;
  v169 = a7;
  v15 = a8;
  v168 = v13;
  v170 = v14;
  v178 = v15;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v92 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v92, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localClusters", buf, 2u);
    }

    if (!a9)
      goto LABEL_83;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("localClusters"));
    v93 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_82;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v94, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outLocalClustersForCreation", buf, 2u);
    }

    if (!a9)
      goto LABEL_83;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("outLocalClustersForCreation"));
    v93 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_82;
  }
  if (!v175)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v95, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRemoteClustersForUpdationNewWorkouts", buf, 2u);
    }

    if (!a9)
      goto LABEL_83;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("outRemoteClustersForUpdationNewWorkouts"));
    v93 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_82;
  }
  if (!v169)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v96 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v96, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRemoteClustersForUpdationWorkoutsToRemove", buf, 2u);
    }

    if (!a9)
      goto LABEL_83;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("outRemoteClustersForUpdationWorkoutsToRemove"));
    v93 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:
    v98 = 0;
    *a9 = v93;
    goto LABEL_125;
  }
  v16 = v15;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v97, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outRemoteClustersForDeletion", buf, 2u);
    }

    if (a9)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("outRemoteClustersForDeletion"));
      v93 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_82;
    }
LABEL_83:
    v98 = 0;
    goto LABEL_125;
  }
  objc_msgSend(v14, "removeAllObjects");
  objc_msgSend(v175, "removeAllObjects");
  objc_msgSend(v169, "removeAllObjects");
  objc_msgSend(v16, "removeAllObjects");
  v208 = 0;
  v209 = &v208;
  v210 = 0x3032000000;
  v211 = __Block_byref_object_copy__133;
  v212 = __Block_byref_object_dispose__133;
  v213 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  obj = v13;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v234, 16);
  if (!v17)
  {
    v163 = 0;
    goto LABEL_85;
  }
  v165 = 0;
  v163 = 0;
  v166 = *(_QWORD *)v205;
  v160 = *MEMORY[0x1E0D18598];
  v161 = *MEMORY[0x1E0CB2D50];
  do
  {
    v173 = 0;
    v164 = v17;
    do
    {
      if (*(_QWORD *)v205 != v166)
        objc_enumerationMutation(obj);
      v174 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * v173);
      context = (void *)MEMORY[0x1D8231EA8]();
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(obj, "count");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        *(_WORD *)&buf[22] = 2048;
        v219 = (uint64_t (*)(uint64_t, uint64_t))++v165;
        *(_WORD *)v220 = 2048;
        *(_QWORD *)&v220[2] = v22;
        *(_WORD *)&v220[10] = 2112;
        *(_QWORD *)&v220[12] = v174;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, %@, %lu / %lu localCluster, %@", buf, 0x34u);

      }
      v23 = (id *)(v209 + 5);
      v203 = (id)v209[5];
      -[RTWorkoutRouteManager _getRemoteWorkoutClustersForWorkoutUUIDs:error:](self, "_getRemoteWorkoutClustersForWorkoutUUIDs:error:", v174, &v203);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v23, v203);
      if (v209[5])
      {
        v24 = 22;
        goto LABEL_38;
      }
      v163 = (uint64_t (*)(uint64_t, uint64_t))((char *)v163 + objc_msgSend(v174, "count"));
      if (!objc_msgSend(v172, "count"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          v38 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v39;
          _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "%@, %@, case 1/4: no corresponding remote cluster, adding to outLocalClusters", buf, 0x16u);

        }
LABEL_35:

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v174);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "addObject:", v35);
LABEL_36:

LABEL_37:
        v24 = 0;
        goto LABEL_38;
      }
      if (objc_msgSend(v172, "count") != 1)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v43;
          _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%@, %@, case 4/4: multiple remote clusters for the given local Cluster (merge remote clusters case), marking remote clusters for deletion and creating new local cluster", buf, 0x16u);

        }
        v197 = 0u;
        v198 = 0u;
        v195 = 0u;
        v196 = 0u;
        v36 = v172;
        v44 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v195, v233, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v196;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v196 != v45)
                objc_enumerationMutation(v36);
              v47 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * i);
              v48 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v178, "addObject:", v47);
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                v50 = (objc_class *)objc_opt_class();
                NSStringFromClass(v50);
                v51 = (id)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v52 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "clusterUUID");
                v53 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v51;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v52;
                *(_WORD *)&buf[22] = 2112;
                v219 = v53;
                _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "%@, %@, cluster uuid marked for deletion, %@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v48);
            }
            v44 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v195, v233, 16);
          }
          while (v44);
        }
        goto LABEL_35;
      }
      objc_msgSend(v172, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
      if (!v27)
      {
        if (v29)
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v31 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "clusterUUID");
          v34 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v32;
          *(_WORD *)&buf[22] = 2112;
          v219 = v34;
          _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, case 3/4: one remote cluster & it has been already visited (split remote cluster case), cluster uuid, %@, adding to outLocalClusters", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v174);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "addObject:", v35);
        goto LABEL_36;
      }
      if (v29)
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v56 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "firstObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "clusterUUID");
        v58 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v55;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v56;
        *(_WORD *)&buf[22] = 2112;
        v219 = v58;
        _os_log_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_INFO, "%@, %@, case 2/4: one remote cluster & it hasn't been visited, cluster uuid, %@, setting uuids to outRemoteClustersForUpdation", buf, 0x20u);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v219 = __Block_byref_object_copy__133;
      *(_QWORD *)v220 = __Block_byref_object_dispose__133;
      *(_QWORD *)&v220[8] = objc_opt_new();
      v59 = dispatch_semaphore_create(0);
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "firstObject");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "clusterUUID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v199[0] = MEMORY[0x1E0C809B0];
      v199[1] = 3221225472;
      v199[2] = __230__RTWorkoutRouteManager__syncWithRemoteClustersUsingLocalClusters_distanceMetric_outLocalClustersForCreation_outRemoteClustersForUpdationNewWorkouts_outRemoteClustersForUpdationWorkoutsToRemove_outRemoteClustersForDeletion_error___block_invoke;
      v199[3] = &unk_1E92A3538;
      v201 = &v208;
      v63 = v59;
      v200 = v63;
      v202 = buf;
      objc_msgSend(v60, "fetchWorkoutUUIDsForClusterUUID:handler:", v62, v199);

      v64 = v63;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v64, v66))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "timeIntervalSinceDate:", v65);
        v69 = v68;
        v70 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "filteredArrayUsingPredicate:", v71);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "firstObject");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v70, "submitToCoreAnalytics:type:duration:", v74, 1, v69);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v75 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v236 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v75, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v236, 2u);
        }

        v76 = (void *)MEMORY[0x1E0CB35C8];
        v235 = v161;
        *(_QWORD *)v236 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v236, &v235, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "errorWithDomain:code:userInfo:", v160, 15, v77);
        v78 = (id)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
          v78 = objc_retainAutorelease(v78);

        }
      }
      else
      {
        v78 = 0;
      }

      v79 = v78;
      v80 = v79;
      v81 = v79 == 0;
      v82 = v209;
      if (v79)
      {
        v83 = v79;
        v84 = (void *)v82[5];
        v82[5] = (uint64_t)v83;
        v24 = 22;
LABEL_51:

        goto LABEL_54;
      }
      if (!v209[5])
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v174);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "isEqualToSet:", v84)
          || (objc_msgSend(v172, "firstObject"),
              v85 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v85, "workoutRouteLabel"),
              v86 = (void *)objc_claimAutoreleasedReturnValue(),
              v87 = objc_msgSend(v86, "isEqualToString:", &stru_1E92AB3A8),
              v86,
              v85,
              v87))
        {
          objc_msgSend(v172, "firstObject");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "setObject:forKeyedSubscript:", v84, v88);

          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "minusSet:", v84);
          v89 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          objc_msgSend(v172, "firstObject");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "setObject:forKeyedSubscript:", v89, v90);

          v91 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

        }
        v24 = 0;
        goto LABEL_51;
      }
      v81 = 0;
      v24 = 22;
LABEL_54:

      _Block_object_dispose(buf, 8);
      if (v81)
        goto LABEL_37;
LABEL_38:

      objc_autoreleasePoolPop(context);
      if (v24)
        goto LABEL_85;
      ++v173;
    }
    while (v173 != v164);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v204, v234, 16);
  }
  while (v17);
LABEL_85:

  if (a9 && v209[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v99 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      v156 = (objc_class *)objc_opt_class();
      NSStringFromClass(v156);
      v157 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = (uint64_t (*)(uint64_t, uint64_t))v209[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v157;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v158;
      *(_WORD *)&buf[22] = 2112;
      v219 = v159;
      _os_log_error_impl(&dword_1D1A22000, v99, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v98 = 0;
    goto LABEL_123;
  }
  v100 = (void *)MEMORY[0x1D8231EA8]();
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  v101 = v170;
  v102 = 0;
  v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v191, v232, 16);
  if (v103)
  {
    v104 = *(_QWORD *)v192;
    do
    {
      for (j = 0; j != v103; ++j)
      {
        if (*(_QWORD *)v192 != v104)
          objc_enumerationMutation(v101);
        v106 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * j);
        v107 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v106);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = objc_msgSend(v108, "count");

        objc_autoreleasePoolPop(v107);
        v102 += v109;
      }
      v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v191, v232, 16);
    }
    while (v103);
  }

  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  objc_msgSend(v175, "allKeys");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v187, v231, 16);
  if (v111)
  {
    v112 = *(_QWORD *)v188;
    do
    {
      for (k = 0; k != v111; ++k)
      {
        if (*(_QWORD *)v188 != v112)
          objc_enumerationMutation(v110);
        v114 = *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * k);
        v115 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v175, "objectForKeyedSubscript:", v114);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v116, "count");

        objc_autoreleasePoolPop(v115);
        v102 += v117;
      }
      v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v187, v231, 16);
    }
    while (v111);
  }

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v118 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
  {
    v119 = (objc_class *)objc_opt_class();
    NSStringFromClass(v119);
    v120 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v121 = (id)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v101, "count");
    v123 = objc_msgSend(v175, "count");
    v124 = objc_msgSend(v169, "count");
    v125 = objc_msgSend(v178, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "timeIntervalSinceDate:", v162);
    v128 = v127;
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138414594;
    *(_QWORD *)&buf[4] = v120;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v121;
    *(_WORD *)&buf[22] = 2048;
    v219 = v163;
    *(_WORD *)v220 = 2048;
    *(_QWORD *)&v220[2] = v102;
    *(_WORD *)&v220[10] = 2048;
    *(_QWORD *)&v220[12] = v122;
    v221 = 2048;
    v222 = v123;
    v223 = 2048;
    v224 = v124;
    v225 = 2048;
    v226 = v125;
    v227 = 2048;
    v228 = v128;
    v229 = 2048;
    v230 = v129;
    _os_log_impl(&dword_1D1A22000, v118, OS_LOG_TYPE_INFO, "%@, %@, after syncing remote and local clusters, totalInputUUIDsCount, %lu, totalOutputUUIDsCount, %lu, outLocalClustersForCreation, %lu, outRemoteClustersForUpdationNewWorkouts, %lu, outRemoteClustersForUpdationWorkoutsToRemove, %lu, outRemoteClustersForDeletion, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x66u);

  }
  v130 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v175, "allKeys");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "setWithArray:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend(v132, "intersectsSet:", v178);

  if (v133)
  {
    v134 = (void *)objc_opt_new();
    v135 = (void *)objc_opt_new();
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    objc_msgSend(v175, "allKeys");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v183, v217, 16);
    if (v137)
    {
      v138 = *(_QWORD *)v184;
      do
      {
        for (m = 0; m != v137; ++m)
        {
          if (*(_QWORD *)v184 != v138)
            objc_enumerationMutation(v136);
          v140 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * m);
          v141 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v140, "clusterUUID");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "addObject:", v142);

          objc_autoreleasePoolPop(v141);
        }
        v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v183, v217, 16);
      }
      while (v137);
    }

    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    v143 = v178;
    v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v179, v216, 16);
    if (v144)
    {
      v145 = *(_QWORD *)v180;
      do
      {
        for (n = 0; n != v144; ++n)
        {
          if (*(_QWORD *)v180 != v145)
            objc_enumerationMutation(v143);
          v147 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * n);
          v148 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v147, "clusterUUID");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "addObject:", v149);

          objc_autoreleasePoolPop(v148);
        }
        v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v179, v216, 16);
      }
      while (v144);
    }

    v150 = (void *)MEMORY[0x1E0CB35C8];
    v214 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updation and deletion remote clusters overlapped, updation cluster uuids, %@, deletion cluster uuids, %@"), v134, v135);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v215 = v151;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v215, &v214, 1);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v152);
    v153 = objc_claimAutoreleasedReturnValue();
    v154 = (void *)v209[5];
    v209[5] = v153;

  }
  objc_autoreleasePoolPop(v100);
  v98 = v133 ^ 1;
  if (a9)
LABEL_123:
    *a9 = objc_retainAutorelease((id)v209[5]);

  _Block_object_dispose(&v208, 8);
LABEL_125:

  return v98;
}

void __230__RTWorkoutRouteManager__syncWithRemoteClustersUsingLocalClusters_distanceMetric_outLocalClustersForCreation_outRemoteClustersForUpdationNewWorkouts_outRemoteClustersForUpdationWorkoutsToRemove_outRemoteClustersForDeletion_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_saveToHealthKitClustersForCreation:(id)a3 remoteClustersForUpdationNewWorkouts:(id)a4 remoteClustersForUpdationWorkoutsToRemove:(id)a5 remoteClustersForDeletion:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  objc_class *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  RTWorkoutRouteManager *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  RTWorkoutRouteManager *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  NSObject *v70;
  objc_class *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  NSObject *v82;
  objc_class *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
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
  uint64_t v107;
  NSObject *v108;
  objc_class *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  RTWorkoutRouteManager *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  RTWorkoutRouteManager *v130;
  uint64_t v131;
  double v132;
  double v133;
  void *v134;
  int v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  NSObject *v140;
  objc_class *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  const __CFString *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  NSObject *v151;
  objc_class *v152;
  void *v153;
  void *v154;
  void *v155;
  const __CFString *v156;
  uint64_t v157;
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
  uint64_t v178;
  objc_class *v179;
  objc_class *v180;
  id v181;
  void *v182;
  void *v183;
  void *v184;
  objc_class *v185;
  id v186;
  void *v187;
  void *v188;
  void *v189;
  NSObject *v190;
  objc_class *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  id v199;
  uint64_t v200;
  RTWorkoutRouteManager *v201;
  uint64_t v202;
  uint64_t i;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  int v208;
  NSObject *v209;
  objc_class *v210;
  void *v211;
  void *v212;
  uint64_t v213;
  void *v214;
  const __CFString *v215;
  objc_class *v216;
  NSObject *v217;
  objc_class *v218;
  void *v219;
  void *v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  objc_class *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t j;
  uint64_t v235;
  void *v236;
  objc_class *v237;
  void *v238;
  void *v239;
  void *v240;
  int v241;
  NSObject *v242;
  id v243;
  objc_class *v244;
  void *v245;
  void *v246;
  const __CFString *v247;
  uint64_t v248;
  int v249;
  id *v250;
  id *v251;
  id v252;
  id v253;
  void *v254;
  id v255;
  uint64_t v256;
  void *v257;
  const __CFString *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  uint64_t v266;
  void *context;
  void *v268;
  void *v269;
  NSObject *v270;
  void *v271;
  void *v272;
  uint64_t v273;
  id v274;
  id v275;
  id v276;
  void *v277;
  void *v278;
  const char *aSelector;
  id v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  RTWorkoutRouteManager *v289;
  id v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  id v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  id v300;
  id v301;
  id v302;
  id v303;
  id v304;
  id v305;
  id v306;
  id v307;
  id v308;
  id v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  id v314;
  id v315;
  id v316;
  id v317;
  id v318;
  id v319;
  id v320;
  id v321;
  id v322;
  id v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  id v328;
  id v329;
  id obj;
  id location;
  _BYTE v332[128];
  uint8_t v333[128];
  uint8_t buf[4];
  void *v335;
  __int16 v336;
  void *v337;
  __int16 v338;
  uint64_t v339;
  __int16 v340;
  uint64_t v341;
  __int16 v342;
  uint64_t v343;
  __int16 v344;
  uint64_t v345;
  __int16 v346;
  double v347;
  __int16 v348;
  double v349;
  _BYTE v350[128];
  _BYTE v351[128];
  uint64_t v352;

  v352 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (v13)
  {
    if (v14)
    {
      if (v15)
      {
        if (v16)
        {
          v289 = self;
          location = 0;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v18 = objc_claimAutoreleasedReturnValue();
          aSelector = a2;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = (objc_class *)objc_opt_class();
            NSStringFromClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v282 = v15;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            v335 = v20;
            v336 = 2112;
            v337 = v21;
            v338 = 2048;
            v339 = objc_msgSend(v13, "count");
            v340 = 2048;
            v341 = objc_msgSend(v14, "count");
            v342 = 2048;
            v343 = objc_msgSend(v282, "count");
            v344 = 2048;
            v345 = objc_msgSend(v17, "count");
            _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, %@, clusters to be created, %lu, clusters to be updated with new workouts, %lu, clusters to be updated with workouts to remove, %lu, clusters to be deleted, %lu", buf, 0x3Eu);

            v15 = v282;
          }

          if (!objc_msgSend(v13, "count")
            && !objc_msgSend(v14, "count")
            && !objc_msgSend(v15, "count")
            && !objc_msgSend(v17, "count"))
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v22 = objc_claimAutoreleasedReturnValue();
            v24 = 1;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v185 = (objc_class *)objc_opt_class();
              NSStringFromClass(v185);
              v186 = v14;
              v187 = v17;
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v335 = v188;
              v336 = 2112;
              v337 = v189;
              _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, no clusters to save", buf, 0x16u);

              v17 = v187;
              v14 = v186;
            }
            goto LABEL_44;
          }
          obj = location;
          -[RTWorkoutRouteManager _getRelevanceLocationWithError:](v289, "_getRelevanceLocationWithError:", &obj);
          v22 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong(&location, obj);
          if (a7 && location)
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v180 = (objc_class *)objc_opt_class();
              NSStringFromClass(v180);
              v181 = v14;
              v182 = v17;
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v184 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v335 = v183;
              v336 = 2112;
              v337 = v184;
              v338 = 2112;
              v339 = (uint64_t)location;
              _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

              v17 = v182;
              v14 = v181;
            }

            v24 = 0;
            *a7 = objc_retainAutorelease(location);
            goto LABEL_44;
          }
          v30 = v15;
          v281 = v14;
          v278 = v17;
          -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "_getWorkoutDefaultStartDateForRaceRoute");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "_getRTWorkoutDefaultTypesForRaceRoute");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v329 = location;
          objc_msgSend(v31, "getLatestWorkoutWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v33, 0, 1, 0, v35, &v329, 1.79769313e308);
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(&location, v329);

          if (a7 && location)
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v36 = objc_claimAutoreleasedReturnValue();
            v15 = v30;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v335 = v38;
              v336 = 2112;
              v337 = v39;
              v338 = 2112;
              v339 = (uint64_t)location;
LABEL_178:
              _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

              goto LABEL_41;
            }
            goto LABEL_41;
          }
          -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "_getWorkoutDefaultStartDateForRaceRoute");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v328 = location;
          v43 = objc_msgSend(v40, "getWorkoutsCountWithStartDate:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:error:", v42, 0, 1, 0, &v328, 1.79769313e308);
          objc_storeStrong(&location, v328);

          v44 = location;
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v45 = objc_claimAutoreleasedReturnValue();
          v36 = v45;
          v15 = v30;
          if (a7 && v44)
          {
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v216 = (objc_class *)objc_opt_class();
              NSStringFromClass(v216);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v335 = v38;
              v336 = 2112;
              v337 = v39;
              v338 = 2112;
              v339 = (uint64_t)location;
              goto LABEL_178;
            }
LABEL_41:
            v17 = v278;
            goto LABEL_42;
          }
          v266 = v43;
          v283 = v30;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v47 = (objc_class *)objc_opt_class();
            NSStringFromClass(v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject latitude](v22, "latitude");
            v51 = v50;
            -[NSObject longitude](v22, "longitude");
            *(_DWORD *)buf = 138413059;
            v335 = v48;
            v336 = 2112;
            v337 = v49;
            v338 = 2049;
            v339 = v51;
            v340 = 2049;
            v341 = v52;
            _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "%@, %@, currentLocation latitude, %{private}f, longitude, %{private}f", buf, 0x2Au);

          }
          v270 = v22;

          context = (void *)MEMORY[0x1D8231EA8]();
          v269 = (void *)objc_opt_new();
          v324 = 0u;
          v325 = 0u;
          v326 = 0u;
          v327 = 0u;
          v280 = v13;
          v53 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v324, v351, 16);
          v54 = v289;
          if (v53)
          {
            v55 = v53;
            v286 = *(_QWORD *)v325;
            do
            {
              v56 = 0;
              do
              {
                if (*(_QWORD *)v325 != v286)
                  objc_enumerationMutation(v280);
                v57 = *(_QWORD *)(*((_QWORD *)&v324 + 1) + 8 * v56);
                v58 = (void *)MEMORY[0x1D8231EA8]();
                v59 = (void *)objc_opt_new();
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTWorkoutRouteManager healthKitManager](v54, "healthKitManager");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v323 = location;
                objc_msgSend(v61, "getWorkoutsWithUUIDs:error:", v57, &v323);
                v62 = v54;
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_storeStrong(&location, v323);

                if (location)
                {
                  v64 = 21;
                  goto LABEL_69;
                }
                v322 = 0;
                -[RTWorkoutRouteManager _sortWorkouts:key:ascending:error:](v62, "_sortWorkouts:key:ascending:error:", v63, CFSTR("startDate"), 0, &v322);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_storeStrong(&location, v322);

                if (!location)
                {
                  v321 = 0;
                  -[RTWorkoutRouteManager _bestWorkoutFromWorkouts:error:](v62, "_bestWorkoutFromWorkouts:error:", v65, &v321);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_storeStrong(&location, v321);
                  if (location)
                  {
                    v64 = 21;
LABEL_67:

                    goto LABEL_68;
                  }
                  v320 = 0;
                  -[RTWorkoutRouteManager _lastWorkoutFromWorkouts:error:](v62, "_lastWorkoutFromWorkouts:error:", v65, &v320);
                  v274 = (id)objc_claimAutoreleasedReturnValue();
                  objc_storeStrong(&location, v320);
                  if (location)
                  {
                    v64 = 21;
LABEL_66:

                    goto LABEL_67;
                  }
                  v319 = 0;
                  -[RTWorkoutRouteManager _mapWorkoutsToUUIDs:error:](v62, "_mapWorkoutsToUUIDs:error:", v65, &v319);
                  v272 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_storeStrong(&location, v319);
                  if (location)
                  {
LABEL_64:
                    v64 = 21;
                  }
                  else
                  {

                    v318 = location;
                    -[RTWorkoutRouteManager _relevanceScoreForWorkoutUUIDs:representativeWorkout:latestWorkoutAcrossAllWorkouts:countOfAllWorkouts:currentLocation:error:](v62, "_relevanceScoreForWorkoutUUIDs:representativeWorkout:latestWorkoutAcrossAllWorkouts:countOfAllWorkouts:currentLocation:error:", v272, v274, v277, v266, v270, &v318);
                    v68 = v67;
                    objc_storeStrong(&location, v318);
                    if (location)
                    {
                      v65 = 0;
                      goto LABEL_64;
                    }
                    objc_msgSend(MEMORY[0x1E0C99D68], "date");
                    v264 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTWorkoutRouteManager _getWorkoutRouteSnapshotForWorkout:error:](v62, "_getWorkoutRouteSnapshotForWorkout:error:", v274, &location);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    if (location)
                    {
                      v64 = 21;
                    }
                    else
                    {
                      v260 = v66;
                      v262 = v69;
                      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                      v70 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                      {
                        v71 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v71);
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        NSStringFromSelector(aSelector);
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        v74 = objc_msgSend(v262, "length");
                        *(_DWORD *)buf = 138412802;
                        v335 = v72;
                        v336 = 2112;
                        v337 = v73;
                        v338 = 2048;
                        v339 = v74;
                        _os_log_impl(&dword_1D1A22000, v70, OS_LOG_TYPE_INFO, "%@, %@, snapshot length, %lu", buf, 0x20u);

                      }
                      v75 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(MEMORY[0x1E0C99D68], "date");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v76, "timeIntervalSinceDate:", v264);
                      objc_msgSend(v75, "numberWithDouble:");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      v317 = location;
                      -[RTWorkoutRouteManager _updateMetricsForCurrentTime:syncToHealthKitKey:error:](v289, "_updateMetricsForCurrentTime:syncToHealthKitKey:error:", v77, 1, &v317);
                      objc_storeStrong(&location, v317);

                      if (location)
                      {
                        v64 = 21;
                      }
                      else
                      {
                        v316 = 0;
                        -[RTWorkoutRouteManager _getWorkoutRouteLabelForWorkout:error:](v289, "_getWorkoutRouteLabelForWorkout:error:", v274, &v316);
                        v259 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_storeStrong(&location, v316);
                        if (location)
                        {
                          v64 = 21;
                        }
                        else
                        {
                          v250 = a7;
                          v252 = v13;
                          -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
                          v78 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v260, "UUID");
                          v79 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v274, "UUID");
                          v80 = (void *)objc_claimAutoreleasedReturnValue();
                          v315 = location;
                          v81 = objc_msgSend(v78, "createWorkoutClusterWithWorkoutUUIDs:bestWorkoutUUID:lastWorkoutUUID:relevanceValue:workoutRouteSnapshot:workoutRouteLabel:error:", v272, v79, v80, v262, v259, &v315, v68);
                          objc_storeStrong(&location, v315);

                          if (location)
                            goto LABEL_86;
                          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                          v82 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
                          {
                            v83 = (objc_class *)objc_opt_class();
                            NSStringFromClass(v83);
                            v84 = (void *)objc_claimAutoreleasedReturnValue();
                            NSStringFromSelector(aSelector);
                            v85 = (void *)objc_claimAutoreleasedReturnValue();
                            v86 = CFSTR("NO");
                            if (v81)
                              v86 = CFSTR("YES");
                            v258 = v86;
                            v256 = objc_msgSend(v272, "count");
                            objc_msgSend(v260, "UUID");
                            v87 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v274, "UUID");
                            v88 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138413826;
                            v335 = v84;
                            v336 = 2112;
                            v337 = v85;
                            v338 = 2112;
                            v339 = (uint64_t)v258;
                            v340 = 2048;
                            v341 = v256;
                            v342 = 2112;
                            v343 = (uint64_t)v87;
                            v344 = 2112;
                            v345 = (uint64_t)v88;
                            v346 = 2048;
                            v347 = v68;
                            _os_log_impl(&dword_1D1A22000, v82, OS_LOG_TYPE_INFO, "%@, %@, created cluster, status, %@, cluster size, %lu, bestWorkoutUUID, %@, lastWorkoutUUID, %@, relevance score, %.3f", buf, 0x48u);

                          }
                          v89 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(MEMORY[0x1E0C99D68], "date");
                          v90 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v90, "timeIntervalSinceDate:", v60);
                          objc_msgSend(v89, "numberWithDouble:");
                          v91 = (void *)objc_claimAutoreleasedReturnValue();
                          v314 = location;
                          -[RTWorkoutRouteManager _updateMetricsForCurrentTime:syncToHealthKitKey:error:](v289, "_updateMetricsForCurrentTime:syncToHealthKitKey:error:", v91, 3, &v314);
                          objc_storeStrong(&location, v314);

                          if (location)
                          {
LABEL_86:
                            v64 = 21;
                          }
                          else
                          {
                            +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v260, "workoutActivityType"));
                            v92 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v59, "setObject:forKeyedSubscript:", v92, CFSTR("activity_type"));

                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RTWorkoutRouteManager _shouldDecimateWorkout:](v289, "_shouldDecimateWorkout:", v260));
                            v93 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v59, "setObject:forKeyedSubscript:", v93, CFSTR("is_decimated"));

                            objc_msgSend(v59, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("is_new_cluster"));
                            v94 = (void *)MEMORY[0x1E0CB37E8];
                            objc_msgSend(v260, "UUID");
                            v95 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v274, "UUID");
                            v96 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v94, "numberWithBool:", objc_msgSend(v95, "isEqual:", v96));
                            v97 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v59, "setObject:forKeyedSubscript:", v97, CFSTR("is_best_also_last_workout"));

                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v272, "count"));
                            v98 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v59, "setObject:forKeyedSubscript:", v98, CFSTR("count_workouts"));

                            v99 = (void *)MEMORY[0x1E0CB37E8];
                            -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
                            v100 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v100, "_getDurationForWorkout:", v260);
                            objc_msgSend(v99, "numberWithDouble:");
                            v101 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v59, "setObject:forKeyedSubscript:", v101, CFSTR("duration"));

                            v102 = (void *)MEMORY[0x1E0CB37E8];
                            -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v103, "_getTotalDistanceForWorkout:", v260);
                            v104 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                            v105 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v104, "doubleValueForUnit:", v105);
                            objc_msgSend(v102, "numberWithDouble:");
                            v106 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v59, "setObject:forKeyedSubscript:", v106, CFSTR("total_distance"));

                            objc_msgSend(v269, "addObject:", v59);
                            v64 = 0;
                          }
                          a7 = v250;
                          v13 = v252;
                        }

                      }
                      v66 = v260;
                      v69 = v262;
                    }

                    v65 = 0;
                  }

                  goto LABEL_66;
                }
                v64 = 21;
LABEL_68:
                v63 = v65;
LABEL_69:

                objc_autoreleasePoolPop(v58);
                v54 = v289;
                if (v64)
                  goto LABEL_93;
                ++v56;
              }
              while (v55 != v56);
              v107 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v324, v351, 16);
              v55 = v107;
            }
            while (v107);
          }
LABEL_93:

          if (location)
          {
            v15 = v283;
            v17 = v278;
            goto LABEL_95;
          }
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
          {
            v109 = (objc_class *)objc_opt_class();
            NSStringFromClass(v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            v112 = objc_msgSend(v280, "count");
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "timeIntervalSinceDate:", v284);
            v115 = v114;
            +[RTRuntime footprint](RTRuntime, "footprint");
            *(_DWORD *)buf = 138413314;
            v335 = v110;
            v336 = 2112;
            v337 = v111;
            v338 = 2048;
            v339 = v112;
            v340 = 2048;
            v341 = v115;
            v342 = 2048;
            v343 = v116;
            _os_log_impl(&dword_1D1A22000, v108, OS_LOG_TYPE_INFO, "%@, %@, created %lu new clusters to healthKit, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v263 = (void *)objc_claimAutoreleasedReturnValue();

          v312 = 0u;
          v313 = 0u;
          v310 = 0u;
          v311 = 0u;
          objc_msgSend(v281, "allKeys");
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v270;
          v117 = v289;
          v275 = (id)objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v310, v350, 16);
          if (!v275)
          {
LABEL_149:

            if (location)
            {
              v284 = v263;
              v17 = v278;
              v15 = v283;
              goto LABEL_151;
            }
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v190 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
            {
              v191 = (objc_class *)objc_opt_class();
              NSStringFromClass(v191);
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              v194 = objc_msgSend(v281, "count");
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v195, "timeIntervalSinceDate:", v263);
              v197 = v196;
              +[RTRuntime footprint](RTRuntime, "footprint");
              *(_DWORD *)buf = 138413314;
              v335 = v192;
              v336 = 2112;
              v337 = v193;
              v338 = 2048;
              v339 = v194;
              v340 = 2048;
              v341 = v197;
              v342 = 2048;
              v343 = v198;
              _os_log_impl(&dword_1D1A22000, v190, OS_LOG_TYPE_INFO, "%@, %@, updated %lu clusters to healthKit, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

            }
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v284 = (void *)objc_claimAutoreleasedReturnValue();

            v299 = 0u;
            v297 = 0u;
            v298 = 0u;
            v296 = 0u;
            v17 = v278;
            v199 = v278;
            v200 = objc_msgSend(v199, "countByEnumeratingWithState:objects:count:", &v296, v333, 16);
            v201 = v289;
            if (v200)
            {
              v202 = v200;
              v288 = *(_QWORD *)v297;
              v276 = v199;
              while (2)
              {
                for (i = 0; i != v202; ++i)
                {
                  if (*(_QWORD *)v297 != v288)
                    objc_enumerationMutation(v276);
                  v204 = *(void **)(*((_QWORD *)&v296 + 1) + 8 * i);
                  v205 = (void *)MEMORY[0x1D8231EA8]();
                  -[RTWorkoutRouteManager healthKitManager](v201, "healthKitManager");
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v204, "clusterUUID");
                  v207 = (void *)objc_claimAutoreleasedReturnValue();
                  v295 = location;
                  v208 = objc_msgSend(v206, "deleteWorkoutCluster:error:", v207, &v295);
                  objc_storeStrong(&location, v295);

                  if (location)
                  {
                    objc_autoreleasePoolPop(v205);
                    v17 = v278;
                    v199 = v276;
                    goto LABEL_175;
                  }
                  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
                  v209 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
                  {
                    v210 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v210);
                    v211 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromSelector(aSelector);
                    v212 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v204, "clusterUUID");
                    v213 = objc_claimAutoreleasedReturnValue();
                    v214 = (void *)v213;
                    *(_DWORD *)buf = 138413058;
                    v215 = CFSTR("NO");
                    if (v208)
                      v215 = CFSTR("YES");
                    v335 = v211;
                    v336 = 2112;
                    v337 = v212;
                    v338 = 2112;
                    v339 = v213;
                    v340 = 2112;
                    v341 = (uint64_t)v215;
                    _os_log_impl(&dword_1D1A22000, v209, OS_LOG_TYPE_INFO, "%@, %@, deleted cluster with cluster uuid, %@, status, %@", buf, 0x2Au);

                  }
                  objc_autoreleasePoolPop(v205);
                  v17 = v278;
                  v201 = v289;
                }
                v199 = v276;
                v202 = objc_msgSend(v276, "countByEnumeratingWithState:objects:count:", &v296, v333, 16);
                if (v202)
                  continue;
                break;
              }
            }
LABEL_175:

            if (!location)
            {
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v217 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
              {
                v218 = (objc_class *)objc_opt_class();
                NSStringFromClass(v218);
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                v220 = (void *)objc_claimAutoreleasedReturnValue();
                v221 = objc_msgSend(v199, "count");
                objc_msgSend(MEMORY[0x1E0C99D68], "date");
                v222 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v222, "timeIntervalSinceDate:", v284);
                v224 = v223;
                +[RTRuntime footprint](RTRuntime, "footprint");
                *(_DWORD *)buf = 138413314;
                v335 = v219;
                v336 = 2112;
                v337 = v220;
                v338 = 2048;
                v339 = v221;
                v340 = 2048;
                v341 = v224;
                v342 = 2048;
                v343 = v225;
                _os_log_impl(&dword_1D1A22000, v217, OS_LOG_TYPE_INFO, "%@, %@, deleted %lu clusters from healthKit, latency, %.4f sec, footprint, %.4f MB", buf, 0x34u);

                v201 = v289;
              }

              v226 = (objc_class *)objc_opt_class();
              NSStringFromClass(v226);
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTWorkoutRouteManager _logClusters:className:selectorName:](v201, "_logClusters:className:selectorName:", v280, v227, v228);

              v229 = (void *)objc_opt_new();
              v291 = 0u;
              v292 = 0u;
              v293 = 0u;
              v294 = 0u;
              objc_msgSend(v281, "allValues");
              v230 = (void *)objc_claimAutoreleasedReturnValue();
              v231 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v291, v332, 16);
              if (v231)
              {
                v232 = v231;
                v233 = *(_QWORD *)v292;
                do
                {
                  for (j = 0; j != v232; ++j)
                  {
                    if (*(_QWORD *)v292 != v233)
                      objc_enumerationMutation(v230);
                    v235 = *(_QWORD *)(*((_QWORD *)&v291 + 1) + 8 * j);
                    v236 = (void *)MEMORY[0x1D8231EA8]();
                    objc_msgSend(v229, "addObject:", v235);
                    objc_autoreleasePoolPop(v236);
                  }
                  v232 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v291, v332, 16);
                }
                while (v232);
              }

              v237 = (objc_class *)objc_opt_class();
              NSStringFromClass(v237);
              v238 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTWorkoutRouteManager _logClusters:className:selectorName:](v289, "_logClusters:className:selectorName:", v229, v238, v239);

              -[RTWorkoutRouteManager workoutMetricsManager](v289, "workoutMetricsManager");
              v240 = (void *)objc_claimAutoreleasedReturnValue();
              v290 = location;
              v241 = objc_msgSend(v240, "submitMetricsForEvent:data:error:", 1, v269, &v290);
              objc_storeStrong(&location, v290);

              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v242 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v242, OS_LOG_TYPE_ERROR))
              {
                v244 = (objc_class *)objc_opt_class();
                NSStringFromClass(v244);
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                v246 = (void *)objc_claimAutoreleasedReturnValue();
                if (v241)
                  v247 = CFSTR("YES");
                else
                  v247 = CFSTR("NO");
                v248 = objc_msgSend(v269, "count");
                *(_DWORD *)buf = 138413058;
                v335 = v245;
                v336 = 2112;
                v337 = v246;
                v338 = 2112;
                v339 = (uint64_t)v247;
                v340 = 2048;
                v341 = v248;
                _os_log_error_impl(&dword_1D1A22000, v242, OS_LOG_TYPE_ERROR, "%@, %@, metrics submission status, %@, metrics count, %lu", buf, 0x2Au);

              }
              v243 = location;

              v15 = v283;
              v22 = v270;
              if (v243)
              {
                v17 = v278;

              }
              else
              {
                v17 = v278;
              }
              goto LABEL_152;
            }
            v15 = v283;
LABEL_95:
            v22 = v270;
LABEL_151:

LABEL_152:
            objc_autoreleasePoolPop(context);
            v24 = 1;
            if (!a7 || !location)
            {
              v14 = v281;
              goto LABEL_43;
            }
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v36 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
LABEL_42:
              v14 = v281;

              v24 = 0;
              *a7 = objc_retainAutorelease(location);
LABEL_43:

LABEL_44:
              goto LABEL_45;
            }
            v179 = (objc_class *)objc_opt_class();
            NSStringFromClass(v179);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(aSelector);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v335 = v38;
            v336 = 2112;
            v337 = v39;
            v338 = 2112;
            v339 = (uint64_t)location;
            goto LABEL_178;
          }
          v273 = *(_QWORD *)v311;
LABEL_100:
          v118 = 0;
          while (1)
          {
            if (*(_QWORD *)v311 != v273)
              objc_enumerationMutation(v271);
            v119 = *(void **)(*((_QWORD *)&v310 + 1) + 8 * v118);
            v120 = (void *)MEMORY[0x1D8231EA8]();
            v285 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTWorkoutRouteManager healthKitManager](v117, "healthKitManager");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v281, "objectForKeyedSubscript:", v119);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "allObjects");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v309 = location;
            objc_msgSend(v121, "getWorkoutsWithUUIDs:error:", v123, &v309);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(&location, v309);

            if (!location)
              break;
            v125 = 23;
LABEL_122:

            objc_autoreleasePoolPop(v120);
            v117 = v289;
            if (v125)
              goto LABEL_149;
            if (v275 == (id)++v118)
            {
              v178 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v310, v350, 16);
              v275 = (id)v178;
              if (!v178)
                goto LABEL_149;
              goto LABEL_100;
            }
          }
          objc_msgSend(v283, "objectForKeyedSubscript:", v119);
          v126 = (void *)objc_claimAutoreleasedReturnValue();

          if (v126)
          {
            objc_msgSend(v283, "objectForKeyedSubscript:", v119);
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "allObjects");
            v128 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v128 = 0;
          }
          v308 = location;
          -[RTWorkoutRouteManager _sortWorkouts:key:ascending:error:](v289, "_sortWorkouts:key:ascending:error:", v124, CFSTR("startDate"), 0, &v308);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(&location, v308);

          if (location)
          {
            v125 = 23;
LABEL_121:

            v124 = v129;
            goto LABEL_122;
          }
          v307 = 0;
          -[RTWorkoutRouteManager _bestWorkoutFromWorkouts:error:](v289, "_bestWorkoutFromWorkouts:error:", v129, &v307);
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(&location, v307);
          if (location)
          {
            v125 = 23;
LABEL_120:

            goto LABEL_121;
          }
          v130 = v289;
          v306 = 0;
          -[RTWorkoutRouteManager _lastWorkoutFromWorkouts:error:](v289, "_lastWorkoutFromWorkouts:error:", v129, &v306);
          v131 = objc_claimAutoreleasedReturnValue();
          objc_storeStrong(&location, v306);
          v265 = (void *)v131;
          if (location)
          {
            v125 = 23;
LABEL_119:

            goto LABEL_120;
          }
          v305 = 0;
          -[RTWorkoutRouteManager _mapWorkoutsToUUIDs:error:](v289, "_mapWorkoutsToUUIDs:error:", v129, &v305);
          v261 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong(&location, v305);
          if (location)
            goto LABEL_117;

          v304 = location;
          -[RTWorkoutRouteManager _relevanceScoreForWorkoutUUIDs:representativeWorkout:latestWorkoutAcrossAllWorkouts:countOfAllWorkouts:currentLocation:error:](v289, "_relevanceScoreForWorkoutUUIDs:representativeWorkout:latestWorkoutAcrossAllWorkouts:countOfAllWorkouts:currentLocation:error:", v261, v131, v277, v266, v22, &v304);
          v133 = v132;
          objc_storeStrong(&location, v304);
          if (location)
          {
            v129 = 0;
LABEL_117:
            v125 = 23;
LABEL_118:

            goto LABEL_119;
          }
          v257 = v128;
          objc_msgSend(v119, "workoutRouteLabel");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = objc_msgSend(v134, "isEqualToString:", &stru_1E92AB3A8);

          if (v135)
          {
            v303 = location;
            -[RTWorkoutRouteManager _getWorkoutRouteLabelForWorkout:error:](v289, "_getWorkoutRouteLabelForWorkout:error:", v265, &v303);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_storeStrong(&location, v303);
            if (location)
            {
LABEL_127:

              goto LABEL_137;
            }
            if ((objc_msgSend(v136, "isEqualToString:", &stru_1E92AB3A8) & 1) == 0)
            {
              -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "clusterUUID");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              v302 = location;
              v139 = objc_msgSend(v137, "updateWorkoutClusterWithUUID:workoutRouteLabel:error:", v138, v136, &v302);
              objc_storeStrong(&location, v302);

              if (location)
                goto LABEL_127;
              v253 = v13;
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v140 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
              {
                v141 = (objc_class *)objc_opt_class();
                NSStringFromClass(v141);
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(aSelector);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "clusterUUID");
                v144 = objc_claimAutoreleasedReturnValue();
                v145 = (void *)v144;
                *(_DWORD *)buf = 138413314;
                v146 = CFSTR("NO");
                if (v139)
                  v146 = CFSTR("YES");
                v335 = v142;
                v336 = 2112;
                v337 = v143;
                v338 = 2112;
                v339 = v144;
                v340 = 2112;
                v341 = (uint64_t)v146;
                v342 = 2112;
                v343 = (uint64_t)v136;
                _os_log_impl(&dword_1D1A22000, v140, OS_LOG_TYPE_INFO, "%@, %@, updated cluster with cluster uuid, %@, status, %@, new route label, %@,", buf, 0x34u);

              }
              v13 = v253;
              v22 = v270;
            }

            v130 = v289;
          }
          -[RTWorkoutRouteManager healthKitManager](v130, "healthKitManager");
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "clusterUUID");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v268, "UUID");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v265, "UUID");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v133);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          v301 = location;
          v249 = objc_msgSend(v254, "updateWorkoutClusterWithUUID:newBestWorkoutUUID:newLastWorkoutUUID:newRelevance:newWorkoutAssociations:workoutAssociationsToRemove:error:", v147, v148, v149, v150, v261, v257, &v301);
          objc_storeStrong(&location, v301);

          if (!location)
          {
            v251 = a7;
            v255 = v13;
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v151 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
            {
              v152 = (objc_class *)objc_opt_class();
              NSStringFromClass(v152);
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(aSelector);
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "clusterUUID");
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              if (v249)
                v156 = CFSTR("YES");
              else
                v156 = CFSTR("NO");
              v157 = objc_msgSend(v261, "count");
              objc_msgSend(v268, "UUID");
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v265, "UUID");
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138414082;
              v335 = v153;
              v336 = 2112;
              v337 = v154;
              v338 = 2112;
              v339 = (uint64_t)v155;
              v340 = 2112;
              v341 = (uint64_t)v156;
              v342 = 2048;
              v343 = v157;
              v344 = 2112;
              v345 = (uint64_t)v158;
              v346 = 2112;
              v347 = *(double *)&v159;
              v348 = 2048;
              v349 = v133;
              _os_log_impl(&dword_1D1A22000, v151, OS_LOG_TYPE_INFO, "%@, %@, updated cluster with cluster uuid, %@, status, %@, cluster size, %lu, bestWorkoutUUID, %@, lastWorkoutUUID, %@, relevance score, %.3f", buf, 0x52u);

            }
            v160 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "timeIntervalSinceDate:", v287);
            objc_msgSend(v160, "numberWithDouble:");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            v300 = location;
            -[RTWorkoutRouteManager _updateMetricsForCurrentTime:syncToHealthKitKey:error:](v289, "_updateMetricsForCurrentTime:syncToHealthKitKey:error:", v162, 2, &v300);
            objc_storeStrong(&location, v300);

            if (location)
            {
              v129 = 0;
              v125 = 23;
            }
            else
            {
              +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v268, "workoutActivityType"));
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "setObject:forKeyedSubscript:", v163, CFSTR("activity_type"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RTWorkoutRouteManager _shouldDecimateWorkout:](v289, "_shouldDecimateWorkout:", v268));
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "setObject:forKeyedSubscript:", v164, CFSTR("is_decimated"));

              objc_msgSend(v285, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("is_new_cluster"));
              v165 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v268, "UUID");
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v265, "UUID");
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v165, "numberWithBool:", objc_msgSend(v166, "isEqual:", v167));
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "setObject:forKeyedSubscript:", v168, CFSTR("is_best_also_last_workout"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v261, "count"));
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "setObject:forKeyedSubscript:", v169, CFSTR("count_workouts"));

              v170 = (void *)MEMORY[0x1E0CB37E8];
              -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
              v171 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "_getDurationForWorkout:", v268);
              objc_msgSend(v170, "numberWithDouble:");
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "setObject:forKeyedSubscript:", v172, CFSTR("duration"));

              v173 = (void *)MEMORY[0x1E0CB37E8];
              -[RTWorkoutRouteManager healthKitManager](v289, "healthKitManager");
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v174, "_getTotalDistanceForWorkout:", v268);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v175, "doubleValueForUnit:", v176);
              objc_msgSend(v173, "numberWithDouble:");
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "setObject:forKeyedSubscript:", v177, CFSTR("total_distance"));

              objc_msgSend(v269, "addObject:", v285);
              v129 = 0;
              v125 = 0;
            }
            a7 = v251;
            v13 = v255;
            v22 = v270;
            goto LABEL_147;
          }
LABEL_137:
          v129 = 0;
          v125 = 23;
LABEL_147:
          v128 = v257;
          goto LABEL_118;
        }
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: remoteClustersForDeletion", buf, 2u);
        }

        if (a7)
        {
          v26 = CFSTR("remoteClustersForDeletion");
          goto LABEL_32;
        }
LABEL_33:
        v24 = 0;
        goto LABEL_45;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: remoteClustersForUpdationWorkoutsToRemove", buf, 2u);
      }

      if (!a7)
        goto LABEL_33;
      v26 = CFSTR("remoteClustersForUpdationWorkoutsToRemove");
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: remoteClustersForUpdationNewWorkouts", buf, 2u);
      }

      if (!a7)
        goto LABEL_33;
      v26 = CFSTR("remoteClustersForUpdationNewWorkouts");
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localClustersForCreation", buf, 2u);
    }

    if (!a7)
      goto LABEL_33;
    v26 = CFSTR("localClustersForCreation");
  }
LABEL_32:
  _RTErrorInvalidParameterCreate((uint64_t)v26);
  v24 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

  return v24;
}

- (BOOL)_syncClustersToWatchWithLimit:(unint64_t)a3 error:(id *)a4
{
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
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  BOOL v30;
  objc_class *v32;
  id v33;
  void *v34;
  objc_class *v35;
  id v36;
  void *v37;
  void *v38;
  _QWORD v40[5];
  NSObject *v41;
  _QWORD *v42;
  uint64_t *v43;
  SEL v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[3];
  char v52;
  _BYTE buf[12];
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _QWORD v58[4];

  v58[1] = *MEMORY[0x1E0C80C00];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v52 = 1;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__133;
  v49 = __Block_byref_object_dispose__133;
  v50 = 0;
  v6 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __61__RTWorkoutRouteManager__syncClustersToWatchWithLimit_error___block_invoke;
  v40[3] = &unk_1E92A3560;
  v42 = v51;
  v43 = &v45;
  v40[4] = self;
  v44 = a2;
  v8 = v6;
  v41 = v8;
  objc_msgSend(v7, "generateRaceRouteClustersWithLimit:handler:", 100, v40);

  v9 = v8;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v9, v11))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v10);
  v14 = v13;
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v58[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v58, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_retainAutorelease(v23);

  }
  else
  {
LABEL_6:
    v24 = 0;
  }

  v25 = v24;
  v26 = v25;
  if (a4 && v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v33;
      v54 = 2112;
      v55 = v34;
      v56 = 2112;
      v57 = v26;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v28 = v26;
  }
  else
  {
    if (!a4 || !v46[5])
    {
      v30 = 1;
      goto LABEL_19;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)v46[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v36;
      v54 = 2112;
      v55 = v37;
      v56 = 2112;
      v57 = v38;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v28 = (void *)v46[5];
  }
  v30 = 0;
  *a4 = objc_retainAutorelease(v28);
LABEL_19:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v51, 8);
  return v30;
}

void __61__RTWorkoutRouteManager__syncClustersToWatchWithLimit_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = 138413058;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2048;
    v18 = 100;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, synced clusters with limit, %lu, status, %@", (uint8_t *)&v13, 0x2Au);

  }
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)_deleteAllClustersFromHealthKitError:(id *)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
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
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v37;
  id v38;
  BOOL v39;
  objc_class *v41;
  id v42;
  void *v43;
  objc_class *v44;
  id v45;
  void *v46;
  uint64_t v47;
  NSObject *dsema;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  NSObject *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _BYTE v67[128];
  _BYTE buf[12];
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  -[RTWorkoutRouteManager _clearInMemoryClusters](self, "_clearInMemoryClusters");
  v4 = (void *)objc_opt_new();
  v5 = dispatch_semaphore_create(0);
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__133;
  v65 = __Block_byref_object_dispose__133;
  v66 = 0;
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __62__RTWorkoutRouteManager__deleteAllClustersFromHealthKitError___block_invoke;
  v57[3] = &unk_1E92A3588;
  v51 = v4;
  v58 = v51;
  v7 = v5;
  v59 = v7;
  v60 = &v61;
  objc_msgSend(v6, "fetchWorkoutClustersWithHandler:", v57);

  dsema = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v9))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v73[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v73, 1);
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
  v24 = v23;
  if (v51 && v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v42;
      v69 = 2112;
      v70 = v43;
      v71 = 2112;
      v72 = v24;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

    }
    objc_msgSend(v51, "addObject:", v24);

    v24 = 0;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v26 = (id)v62[5];
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v54;
    do
    {
      v29 = 0;
      v30 = v24;
      do
      {
        if (*(_QWORD *)v54 != v28)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v29);
        v32 = (void *)MEMORY[0x1D8231EA8]();
        -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "clusterUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v30;
        objc_msgSend(v33, "deleteWorkoutCluster:error:", v34, &v52);
        v24 = v52;

        objc_autoreleasePoolPop(v32);
        ++v29;
        v30 = v24;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    }
    while (v27);
  }

  if (v24)
    v35 = v51 != 0;
  else
    v35 = 0;
  if (v35)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v45;
      v69 = 2112;
      v70 = v46;
      v71 = 2112;
      v72 = v24;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorAndClearError, error, %@", buf, 0x20u);

    }
    objc_msgSend(v51, "addObject:", v24);

    v24 = 0;
  }
  if (a3)
  {
    if (objc_msgSend(v51, "count"))
    {
      v47 = 1;
      _RTSafeArray();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v38;

    }
    else
    {
      *a3 = 0;
    }
  }
  v39 = objc_msgSend(v51, "count", v47) == 0;

  _Block_object_dispose(&v61, 8);
  return v39;
}

void __62__RTWorkoutRouteManager__deleteAllClustersFromHealthKitError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_storeWorkoutDistances:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
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
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  objc_class *v34;
  id v35;
  void *v36;
  objc_class *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  NSObject *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE buf[12];
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__133;
  v50 = __Block_byref_object_dispose__133;
  v51 = 0;
  v7 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __54__RTWorkoutRouteManager__storeWorkoutDistances_error___block_invoke;
  v42[3] = &unk_1E92970D8;
  v45 = &v46;
  v9 = v6;
  v43 = v9;
  v10 = v7;
  v44 = v10;
  objc_msgSend(v8, "storeWorkoutDistances:handler:", v9, v42);

  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v57[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v57, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

  }
  else
  {
LABEL_6:
    v26 = 0;
  }

  v27 = v26;
  v28 = v27;
  if (a4 && v27)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v35;
      v53 = 2112;
      v54 = v36;
      v55 = 2112;
      v56 = v28;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v30 = v28;
  }
  else
  {
    if (!a4 || !v47[5])
    {
      v32 = 1;
      goto LABEL_19;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)v47[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v38;
      v53 = 2112;
      v54 = v39;
      v55 = 2112;
      v56 = v40;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v30 = (void *)v47[5];
  }
  v32 = 0;
  *a4 = objc_retainAutorelease(v30);
LABEL_19:

  _Block_object_dispose(&v46, 8);
  return v32;
}

void __54__RTWorkoutRouteManager__storeWorkoutDistances_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = 134218242;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Stored Distance Records, count, %lu, error, %@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_updateWorkoutDistanceRecordsWithObjectIDs:(id)a3 isVisited:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  objc_class *v37;
  id v38;
  __CFString *v39;
  objc_class *v40;
  id v41;
  __CFString *v42;
  void *v43;
  _QWORD v46[4];
  NSObject *v47;
  uint64_t *v48;
  BOOL v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _BYTE buf[12];
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  void *v60;
  _QWORD v61[3];

  v6 = a4;
  v61[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__133;
  v54 = __Block_byref_object_dispose__133;
  v55 = 0;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v7, "count");
    v10 = CFSTR("NO");
    if (v6)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v9;
    v57 = 2112;
    v58 = v10;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "updating distance records with count, %lu, isVisited, %@", buf, 0x16u);
  }

  v11 = dispatch_semaphore_create(0);
  -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __84__RTWorkoutRouteManager__updateWorkoutDistanceRecordsWithObjectIDs_isVisited_error___block_invoke;
  v46[3] = &unk_1E929A6E0;
  v48 = &v50;
  v49 = v6;
  v13 = v11;
  v47 = v13;
  objc_msgSend(v12, "updateWorkoutDistancesWithObjectIDs:isVisited:handler:", v7, v6, v46);

  v14 = v13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v15);
  v19 = v18;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v26 = (void *)MEMORY[0x1E0CB35C8];
  v61[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v61, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_retainAutorelease(v28);

  }
  else
  {
LABEL_10:
    v29 = 0;
  }

  v30 = v29;
  v31 = v30;
  if (a5 && v30)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v38;
      v57 = 2112;
      v58 = v39;
      v59 = 2112;
      v60 = v31;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v33 = v31;
  }
  else
  {
    if (!a5 || !v51[5])
    {
      v35 = 1;
      goto LABEL_23;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)v51[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v41;
      v57 = 2112;
      v58 = v42;
      v59 = 2112;
      v60 = v43;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v33 = (void *)v51[5];
  }
  v35 = 0;
  *a5 = objc_retainAutorelease(v33);
LABEL_23:

  _Block_object_dispose(&v50, 8);
  return v35;
}

void __84__RTWorkoutRouteManager__updateWorkoutDistanceRecordsWithObjectIDs_isVisited_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 48))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = 134218498;
    v11 = a2;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "updated distance records, count, %lu, isVisited, %@, error, %@", (uint8_t *)&v10, 0x20u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_bestWorkoutFromWorkouts:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  objc_class *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id *v31;
  char *v33;
  id v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[RTWorkoutRouteManager _bestWorkoutFromWorkouts:error:]";
      v43 = 1024;
      LODWORD(v44) = 5594;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts (in %s:%d)", buf, 0x12u);
    }

  }
  v31 = a4;
  v8 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (!v9)
  {
    v11 = 0;
    v34 = 0;
    goto LABEL_22;
  }
  v10 = v9;
  v11 = 0;
  v34 = 0;
  v12 = *(_QWORD *)v38;
  v13 = 1.79769313e308;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v38 != v12)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      v16 = (void *)MEMORY[0x1D8231EA8]();
      v36 = v11;
      -[RTWorkoutRouteManager _paceFromWorkout:error:](self, "_paceFromWorkout:error:", v15, &v36);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v36;

      if (v8 && v18)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v33 = (char *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v25 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v33;
          v43 = 2112;
          v44 = v25;
          v26 = (void *)v25;
          v45 = 2112;
          v46 = v18;
          _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

        }
        objc_msgSend(v8, "addObject:", v18);
        v20 = v18;
        v18 = 0;
      }
      else
      {
        objc_msgSend(v17, "doubleValue");
        if (v21 >= v13)
          goto LABEL_18;
        objc_msgSend(v17, "doubleValue");
        v13 = v22;
        v23 = v15;
        v20 = v34;
        v34 = v23;
      }

LABEL_18:
      v11 = v18;

      objc_autoreleasePoolPop(v16);
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  }
  while (v10);
LABEL_22:

  if (objc_msgSend(v8, "count"))
  {
    if (v31)
    {
      _RTSafeArray();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = 0;
    v29 = v34;
  }
  else
  {
    v29 = v34;
    v28 = v34;
  }

  return v28;
}

- (id)_lastWorkoutFromWorkouts:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id *v19;
  void *v20;
  id *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[RTWorkoutRouteManager _lastWorkoutFromWorkouts:error:]";
      v31 = 1024;
      v32 = 5624;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts (in %s:%d)", buf, 0x12u);
    }

  }
  v22 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v14, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "compare:", v7) == 1)
        {
          v17 = v16;

          v18 = v14;
          v11 = v18;
          v7 = v17;
        }

        objc_autoreleasePoolPop(v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  if (objc_msgSend(v23, "count"))
  {
    v19 = v22;
    if (v22)
    {
      _RTSafeArray();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _RTMultiErrorCreate();
      *v22 = (id)objc_claimAutoreleasedReturnValue();

      v19 = 0;
    }
  }
  else
  {
    v19 = v11;
  }

  return v19;
}

- (id)_getRelevanceLocationWithError:(id *)a3
{
  char v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id *v8;
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
  int v24;
  NSObject *v25;
  objc_class *v26;
  id v27;
  void *v28;
  uint64_t v29;
  dispatch_semaphore_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  id *v34;
  void *v35;
  dispatch_time_t v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  objc_class *v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *context;
  _QWORD v62[4];
  NSObject *v63;
  uint64_t *v64;
  uint64_t *v65;
  _QWORD v66[4];
  NSObject *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  _BYTE buf[12];
  __int16 v83;
  void *v84;
  __int16 v85;
  uint64_t v86;
  _QWORD v87[4];

  v87[1] = *MEMORY[0x1E0C80C00];
  v76 = 0;
  v77 = &v76;
  v3 = 1;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__133;
  v80 = __Block_byref_object_dispose__133;
  v81 = 0;
  v58 = *MEMORY[0x1E0D18598];
  v59 = *MEMORY[0x1E0CB2D50];
  while ((v3 & 1) != 0)
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__133;
    v74 = __Block_byref_object_dispose__133;
    v75 = 0;
    v4 = dispatch_semaphore_create(0);
    -[RTWorkoutRouteManager locationManager](self, "locationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke;
    v66[3] = &unk_1E929AB38;
    v68 = &v76;
    v69 = &v70;
    v6 = v4;
    v67 = v6;
    objc_msgSend(v5, "fetchCurrentLocationWithHandler:", v66);

    v8 = (id *)(v77 + 5);
    v7 = (id)v77[5];
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
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
      v87[0] = v59;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v87, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v58, 15, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v7 = objc_retainAutorelease(v23);

      }
    }

    objc_storeStrong(v8, v7);
    if (v77[5])
    {
      v24 = 2;
    }
    else if (v71[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v71[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v27;
        v83 = 2112;
        v84 = v28;
        v85 = 2112;
        v86 = v29;
        _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, current location, %@", buf, 0x20u);

      }
      v57 = (id)v71[5];
      v24 = 1;
    }
    else
    {
      v30 = dispatch_semaphore_create(0);

      -[RTWorkoutRouteManager locationManager](self, "locationManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke_200;
      v62[3] = &unk_1E929AB38;
      v64 = &v76;
      v65 = &v70;
      v32 = v30;
      v63 = v32;
      objc_msgSend(v31, "fetchLastLocationWithHandler:", v62);

      v34 = (id *)(v77 + 5);
      v33 = (id)v77[5];
      v9 = v32;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = dispatch_time(0, 3600000000000);
      if (dispatch_semaphore_wait(v9, v36))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "timeIntervalSinceDate:", v35);
        v39 = v38;
        v40 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "filteredArrayUsingPredicate:", v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "firstObject");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v40, "submitToCoreAnalytics:type:duration:", v44, 1, v39);
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v46 = (void *)MEMORY[0x1E0CB35C8];
        v87[0] = v59;
        *(_QWORD *)buf = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v87, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "errorWithDomain:code:userInfo:", v58, 15, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          v33 = objc_retainAutorelease(v48);

        }
      }

      objc_storeStrong(v34, v33);
      if (v77[5])
      {
        v24 = 2;
      }
      else if (v71[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v71[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v51;
          v83 = 2112;
          v84 = v52;
          v85 = 2112;
          v86 = v53;
          _os_log_impl(&dword_1D1A22000, v49, OS_LOG_TYPE_INFO, "%@, %@, current location, %@", buf, 0x20u);

        }
        v57 = (id)v71[5];
        v24 = 1;
      }
      else
      {
        v24 = 0;
      }

    }
    _Block_object_dispose(&v70, 8);

    objc_autoreleasePoolPop(context);
    v3 = 0;
    if (v24)
    {
      if (v24 != 2)
        goto LABEL_31;
      break;
    }
  }
  v57 = 0;
  if (a3)
    *a3 = objc_retainAutorelease((id)v77[5]);
LABEL_31:
  _Block_object_dispose(&v76, 8);

  return v57;
}

void __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v6);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __56__RTWorkoutRouteManager__getRelevanceLocationWithError___block_invoke_200(uint64_t a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v6);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (double)_relevanceScoreForWorkoutUUIDs:(id)a3 representativeWorkout:(id)a4 latestWorkoutAcrossAllWorkouts:(id)a5 countOfAllWorkouts:(unint64_t)a6 currentLocation:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
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
  void *v32;
  id v33;
  NSObject *v34;
  double v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  id *v47;
  double v48;
  double v49;
  uint64_t *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  objc_class *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  NSObject *v78;
  objc_class *v79;
  id v80;
  void *v81;
  objc_class *v83;
  id v84;
  void *v85;
  objc_class *v86;
  id v87;
  void *v88;
  double v89;
  objc_class *v90;
  id v91;
  void *v92;
  double v93;
  const char *aSelector;
  void *v95;
  void *v96;
  void *v97;
  NSObject *dsema;
  void *v99;
  id v100;
  id obj;
  _QWORD v102[4];
  NSObject *v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  double *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  _BYTE buf[12];
  __int16 v122;
  void *v123;
  __int16 v124;
  double v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  double v129;
  __int16 v130;
  double v131;
  __int16 v132;
  double v133;
  __int16 v134;
  double v135;
  __int16 v136;
  double v137;
  uint64_t v138;
  void *v139;
  _QWORD v140[4];

  v140[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v99 = v17;
  v100 = a7;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    v35 = 0.0;
    if (!a8)
      goto LABEL_61;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
    v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
    *a8 = v36;
    goto LABEL_61;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: representativeWorkout", buf, 2u);
    }

    v35 = 0.0;
    if (!a8)
      goto LABEL_61;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("representativeWorkout"));
    v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: latestWorkoutAcrossAllWorkouts", buf, 2u);
    }

    v35 = 0.0;
    if (!a8)
      goto LABEL_61;
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("latestWorkoutAcrossAllWorkouts"));
    v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (a6)
  {
    aSelector = a2;
    v115 = 0;
    v116 = (double *)&v115;
    v117 = 0x3032000000;
    v118 = __Block_byref_object_copy__133;
    v119 = __Block_byref_object_dispose__133;
    v120 = 0;
    v111 = 0;
    v112 = &v111;
    v113 = 0x2020000000;
    v114 = 0;
    v107 = 0;
    v108 = &v107;
    v109 = 0x2020000000;
    v110 = 0;
    v18 = dispatch_semaphore_create(0);
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __150__RTWorkoutRouteManager__relevanceScoreForWorkoutUUIDs_representativeWorkout_latestWorkoutAcrossAllWorkouts_countOfAllWorkouts_currentLocation_error___block_invoke;
    v102[3] = &unk_1E92A35B0;
    v104 = &v111;
    v105 = &v107;
    v106 = &v115;
    v20 = v18;
    v103 = v20;
    objc_msgSend(v19, "fetchRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:", v16, 3, 1, 0, v102);

    dsema = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v21))
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "timeIntervalSinceDate:", v96);
    v23 = v22;
    v24 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v30 = (void *)MEMORY[0x1E0CB35C8];
    v140[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v140, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = objc_retainAutorelease(v32);

    }
    else
    {
LABEL_22:
      v33 = 0;
    }

    v39 = v33;
    v40 = v39;
    if (a8 && v39)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v83 = (objc_class *)objc_opt_class();
        NSStringFromClass(v83);
        v84 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v84;
        v122 = 2112;
        v123 = v85;
        v124 = 2112;
        v125 = *(double *)&v40;
        _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v42 = objc_retainAutorelease(v40);
LABEL_38:
      *a8 = v42;
      v35 = 0.0;
LABEL_60:

      _Block_object_dispose(&v107, 8);
      _Block_object_dispose(&v111, 8);
      _Block_object_dispose(&v115, 8);

      goto LABEL_61;
    }
    if (a8 && *((_QWORD *)v116 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v86 = (objc_class *)objc_opt_class();
        NSStringFromClass(v86);
        v87 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v116[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v87;
        v122 = 2112;
        v123 = v88;
        v124 = 2112;
        v125 = v89;
        _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v42 = objc_retainAutorelease(*((id *)v116 + 5));
      goto LABEL_38;
    }
    if (!v108[3])
    {
      v57 = (void *)MEMORY[0x1E0CB35C8];
      v138 = *MEMORY[0x1E0CB2D50];
      v58 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "UUID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("no locations returned for workout UUID, %@"), v59, aSelector);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = v60;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v61);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (void *)*((_QWORD *)v116 + 5);
      *((_QWORD *)v116 + 5) = v62;

      v64 = v112;
      v65 = (void *)v112[3];
      if (v65)
      {
        free(v65);
        v64 = v112;
      }
      v64[3] = 0;
      v35 = 0.0;
      if (a8)
        *a8 = objc_retainAutorelease(*((id *)v116 + 5));
      goto LABEL_60;
    }
    -[RTWorkoutRouteManager _getRTLocationUsingCLLocationCoordinate2D:](self, "_getRTLocationUsingCLLocationCoordinate2D:", v112[3]);
    v45 = objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager distanceCalculator](self, "distanceCalculator");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (id *)(v116 + 5);
    obj = (id)*((_QWORD *)v116 + 5);
    objc_msgSend(v46, "distanceFromLocation:toLocation:error:", v100, v45, &obj);
    v49 = v48;
    v97 = (void *)v45;
    objc_storeStrong(v47, obj);

    v50 = v112;
    v51 = (void *)v112[3];
    if (v51)
    {
      free(v51);
      v50 = v112;
    }
    v50[3] = 0;
    if (a8 && *((_QWORD *)v116 + 5))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v90 = (objc_class *)objc_opt_class();
        NSStringFromClass(v90);
        v91 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v116[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v91;
        v122 = 2112;
        v123 = v92;
        v124 = 2112;
        v125 = v93;
        _os_log_error_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *a8 = objc_retainAutorelease(*((id *)v116 + 5));
    }
    else
    {
      if (v49 <= 80467.0)
      {
        v66 = objc_msgSend(v15, "count");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "endDate");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "timeIntervalSinceDate:", v68);
        v70 = v69;

        objc_msgSend(v99, "endDate");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "timeIntervalSinceDate:", v71);
        v73 = v72;

        v74 = (double)v66 / (double)a6 * 50.0;
        v75 = v70 / 86400.0;
        v76 = v73 / 86400.0;
        v77 = v76 / (v70 / 86400.0) * 50.0;
        v35 = v74 + v77;
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          v79 = (objc_class *)objc_opt_class();
          NSStringFromClass(v79);
          v80 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414338;
          *(_QWORD *)&buf[4] = v80;
          v122 = 2112;
          v123 = v81;
          v124 = 2048;
          v125 = v49;
          v126 = 2048;
          v127 = 0x40F3A53000000000;
          v128 = 2048;
          v129 = v74 + v77;
          v130 = 2048;
          v131 = v74;
          v132 = 2048;
          v133 = v77;
          v134 = 2048;
          v135 = v75;
          v136 = 2048;
          v137 = v76;
          _os_log_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_INFO, "%@, %@, distanceFromCurrentLocationToCluster, %.5f, distance threshold, %.5f, relevanceScore, %.5f, clusterSizeScore, %.5f, daysSinceLastRunScore, %.5f, secondsSinceLastWorkout, %.5f, secondsSinceLatestWorkoutAcrossAllWorkouts, %.5f", buf, 0x5Cu);

        }
        goto LABEL_59;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v55;
        v122 = 2112;
        v123 = v56;
        v124 = 2048;
        v125 = v49;
        v126 = 2048;
        v127 = 0x40F3A53000000000;
        v128 = 2048;
        v129 = 0.0;
        _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "%@, %@, distanceFromCurrentLocationToCluster, %.5f, cluster is outside the distance threshold, %.5f, relevanceScore, %.5f", buf, 0x34u);

      }
    }
    v35 = 0.0;
LABEL_59:

    goto LABEL_60;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: countOfAllWorkouts", buf, 2u);
  }

  v35 = 0.0;
  if (a8)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("countOfAllWorkouts"));
    v36 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
LABEL_61:

  return v35;
}

void __150__RTWorkoutRouteManager__relevanceScoreForWorkoutUUIDs_representativeWorkout_latestWorkoutAcrossAllWorkouts_countOfAllWorkouts_currentLocation_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id obj)
{
  id v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
  v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_getWorkoutRouteSnapshotForWorkout:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
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
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t (*v28)(uint64_t, uint64_t);
  NSObject *v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  double latitude;
  double longitude;
  double latitudeDelta;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  dispatch_semaphore_t v42;
  NSObject *v43;
  void *v44;
  dispatch_time_t v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _BOOL4 v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  CGContext *CurrentContext;
  id v73;
  CGColor *v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  CGFloat v78;
  CGFloat v79;
  void (**v80)(_QWORD, _QWORD, _QWORD, double, double);
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  id v90;
  uint64_t *v91;
  void *v92;
  UIImage *v93;
  objc_class *v95;
  id v96;
  void *v97;
  objc_class *v98;
  id v99;
  void *v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  objc_class *v102;
  id v103;
  void *v104;
  objc_class *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *dsema;
  void *v114;
  void *context;
  void *v116;
  _QWORD v117[4];
  __int128 v118;
  _QWORD v119[4];
  NSObject *v120;
  uint64_t *v121;
  _BYTE *v122;
  _QWORD v123[4];
  NSObject *v124;
  uint64_t *v125;
  uint64_t *v126;
  uint64_t *v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t (*v139)(uint64_t, uint64_t);
  void (*v140)(uint64_t);
  id v141;
  _BYTE v142[12];
  __int16 v143;
  void *v144;
  __int16 v145;
  id v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  _BYTE buf[24];
  uint64_t (*v154)(uint64_t, uint64_t);
  void (*v155)(uint64_t);
  id v156;
  _QWORD v157[4];
  CLLocationCoordinate2D v158;
  CLLocationCoordinate2D v159;
  CGSize v160;
  MKMapRect v161;
  MKCoordinateRegion v162;

  v157[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  context = (void *)MEMORY[0x1D8231EA8]();
  v136 = 0;
  v137 = &v136;
  v138 = 0x3032000000;
  v139 = __Block_byref_object_copy__133;
  v140 = __Block_byref_object_dispose__133;
  v141 = 0;
  v132 = 0;
  v133 = &v132;
  v134 = 0x2020000000;
  v135 = 0;
  v128 = 0;
  v129 = &v128;
  v130 = 0x2020000000;
  v131 = 0;
  v7 = dispatch_semaphore_create(0);
  v116 = v6;
  LODWORD(v6) = -[RTWorkoutRouteManager _shouldDecimateWorkout:](self, "_shouldDecimateWorkout:", v6);
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v6)
    v9 = 2;
  else
    v9 = 3;
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke;
  v123[3] = &unk_1E92A35B0;
  v125 = &v132;
  v126 = &v128;
  v127 = &v136;
  v10 = v7;
  v124 = v10;
  objc_msgSend(v8, "fetchRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:", v116, v9, 0, 1, v123);

  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13))
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
  v147 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v147, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

  }
  else
  {
LABEL_9:
    v26 = 0;
  }

  v27 = (uint64_t (*)(uint64_t, uint64_t))v26;
  v28 = v27;
  if (a4 && v27)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v95 = (objc_class *)objc_opt_class();
      NSStringFromClass(v95);
      v96 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v96;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v97;
      *(_WORD *)&buf[22] = 2112;
      v154 = v28;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v30 = v28;
LABEL_20:
    v32 = 0;
    v33 = *a4;
    *a4 = v30;
LABEL_55:

    goto LABEL_56;
  }
  if (a4 && v137[5])
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v98 = (objc_class *)objc_opt_class();
      NSStringFromClass(v98);
      v99 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = (uint64_t (*)(uint64_t, uint64_t))v137[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v99;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v100;
      *(_WORD *)&buf[22] = 2112;
      v154 = v101;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v30 = (uint64_t (*)(uint64_t, uint64_t))(id)v137[5];
    goto LABEL_20;
  }
  if (v129[3])
  {
    objc_msgSend(MEMORY[0x1E0CC1928], "polylineWithCoordinates:count:", v133[3]);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_opt_new();
    objc_msgSend(v34, "_setUseSnapshotService:", 1);
    v114 = v34;
    objc_msgSend(v111, "boundingMapRect");
    v162 = MKCoordinateRegionForMapRect(v161);
    latitude = v162.center.latitude;
    longitude = v162.center.longitude;
    if (v162.span.latitudeDelta >= v162.span.longitudeDelta)
      latitudeDelta = v162.span.latitudeDelta;
    else
      latitudeDelta = v162.span.longitudeDelta;
    v38 = latitudeDelta * 0.5;
    v158 = CLLocationCoordinate2DMake(latitude + latitudeDelta * 0.5, v162.center.longitude - latitudeDelta * 0.5);
    MKMapPointForCoordinate(v158);
    v159 = CLLocationCoordinate2DMake(latitude - v38, longitude + v38);
    MKMapPointForCoordinate(v159);
    _MKMapRectThatFits();
    objc_msgSend(v34, "setMapRect:", 0x4044000000000000, 0x4044000000000000, 0x4044000000000000, 0x4044000000000000);
    objc_msgSend(v34, "setSize:", 157.0, 157.0);
    objc_msgSend(v34, "setShowsBuildings:", 0);
    objc_msgSend(MEMORY[0x1E0CC1910], "filterExcludingAllCategories");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setPointOfInterestFilter:", v39);

    objc_msgSend(v114, "setMapType:", 5);
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setTraitCollection:", v40);

    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1868]), "initWithOptions:", v114);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v154 = __Block_byref_object_copy__133;
    v155 = __Block_byref_object_dispose__133;
    v156 = 0;
    v147 = 0;
    v148 = &v147;
    v149 = 0x3032000000;
    v150 = __Block_byref_object_copy__133;
    v151 = __Block_byref_object_dispose__133;
    v152 = 0;
    v42 = dispatch_semaphore_create(0);
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_214;
    v119[3] = &unk_1E92A35D8;
    v121 = &v147;
    v122 = buf;
    v43 = v42;
    v120 = v43;
    v110 = v41;
    objc_msgSend(v41, "startWithCompletionHandler:", v119);
    dsema = v43;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(dsema, v45))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "timeIntervalSinceDate:", v44);
      v47 = v46;
      v48 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "filteredArrayUsingPredicate:", v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "firstObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "submitToCoreAnalytics:type:duration:", v52, 1, v47);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v142 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v142, 2u);
      }

      v54 = (void *)MEMORY[0x1E0CB35C8];
      v157[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v142 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v157, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v55);
      v56 = (id)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        v56 = objc_retainAutorelease(v56);

      }
    }
    else
    {
      v56 = 0;
    }

    v57 = v56;
    if (v57)
      v58 = a4 != 0;
    else
      v58 = 0;
    if (v58)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        v102 = (objc_class *)objc_opt_class();
        NSStringFromClass(v102);
        v103 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v142 = 138412802;
        *(_QWORD *)&v142[4] = v103;
        v143 = 2112;
        v144 = v104;
        v145 = 2112;
        v146 = v57;
        _os_log_error_impl(&dword_1D1A22000, v59, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v142, 0x20u);

      }
      v60 = v57;
    }
    else
    {
      if (!a4 || !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
        v64 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend((id)v148[5], "image");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "size");
        v67 = v66;
        v69 = v68;
        objc_msgSend(v65, "scale");
        v71 = v70;
        v160.width = v67;
        v160.height = v69;
        UIGraphicsBeginImageContextWithOptions(v160, 1, v71);
        objc_msgSend(v65, "drawAtPoint:", 0.0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        -[RTWorkoutRouteManager _colorFromHexString:](self, "_colorFromHexString:", CFSTR("00FFA8"));
        v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v74 = (CGColor *)objc_msgSend(v73, "CGColor");

        CGContextSetStrokeColorWithColor(CurrentContext, v74);
        CGContextSetLineWidth(CurrentContext, 2.0);
        CGContextSetLineCap(CurrentContext, kCGLineCapRound);
        CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
        CGContextBeginPath(CurrentContext);
        if (v129[3])
        {
          v75 = 0;
          v76 = 0;
          do
          {
            v77 = (void *)MEMORY[0x1D8231EA8]();
            objc_msgSend((id)v148[5], "pointForCoordinate:", *(double *)(v133[3] + v75), *(double *)(v133[3] + v75 + 8));
            if (v76)
              CGContextAddLineToPoint(CurrentContext, v78, v79);
            else
              CGContextMoveToPoint(CurrentContext, v78, v79);
            objc_autoreleasePoolPop(v77);
            ++v76;
            v75 += 16;
          }
          while (v76 < v129[3]);
        }
        CGContextStrokePath(CurrentContext);
        v117[0] = MEMORY[0x1E0C809B0];
        v117[1] = 3221225472;
        v117[2] = __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_216;
        v117[3] = &__block_descriptor_48_e47_v40__0__CGContext__8_CGPoint_dd_16__CGColor__32l;
        v118 = xmmword_1D1EEE0B0;
        v80 = (void (**)(_QWORD, _QWORD, _QWORD, double, double))MEMORY[0x1D8232094](v117);
        v81 = v133[3] + 16 * v129[3];
        objc_msgSend((id)v148[5], "pointForCoordinate:", *(double *)(v81 - 16), *(double *)(v81 - 8));
        v83 = v82;
        v85 = v84;
        objc_msgSend((id)v148[5], "pointForCoordinate:", *(double *)v133[3], *(double *)(v133[3] + 8));
        v87 = v86;
        v89 = v88;
        objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
        v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        ((void (**)(_QWORD, CGContext *, uint64_t, double, double))v80)[2](v80, CurrentContext, objc_msgSend(v90, "CGColor"), v83, v85);

        ((void (**)(_QWORD, CGContext *, CGColor *, double, double))v80)[2](v80, CurrentContext, v74, v87, v89);
        v91 = v133;
        v92 = (void *)v133[3];
        if (v92)
        {
          free(v92);
          v91 = v133;
        }
        v91[3] = 0;
        UIGraphicsGetImageFromCurrentImageContext();
        v93 = (UIImage *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        UIImagePNGRepresentation(v93);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v64);
        goto LABEL_54;
      }
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v105 = (objc_class *)objc_opt_class();
        NSStringFromClass(v105);
        v106 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v142 = 138412802;
        *(_QWORD *)&v142[4] = v106;
        v143 = 2112;
        v144 = v107;
        v145 = 2112;
        v146 = v108;
        _os_log_error_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v142, 0x20u);

      }
      v60 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    v62 = v60;
    v63 = *a4;
    *a4 = v62;

    v32 = 0;
LABEL_54:

    _Block_object_dispose(&v147, 8);
    _Block_object_dispose(buf, 8);

    v33 = v111;
    goto LABEL_55;
  }
  v32 = 0;
LABEL_56:

  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(&v132, 8);
  _Block_object_dispose(&v136, 8);

  objc_autoreleasePoolPop(context);
  return v32;
}

void __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id obj)
{
  id v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), obj);
  v6 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_214(uint64_t a1, void *a2, void *a3)
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

void __66__RTWorkoutRouteManager__getWorkoutRouteSnapshotForWorkout_error___block_invoke_216(uint64_t a1, CGContext *a2, CGColor *a3, double a4, double a5)
{
  id v10;
  CGRect v11;
  CGRect v12;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v10, "CGColor"));

  v11.size.width = *(CGFloat *)(a1 + 32);
  v11.origin.x = a4 - v11.size.width * 0.5;
  v11.origin.y = a5 - v11.size.width * 0.5;
  v11.size.height = v11.size.width;
  CGContextFillEllipseInRect(a2, v11);
  CGContextSetFillColorWithColor(a2, a3);
  v12.size.width = *(CGFloat *)(a1 + 40);
  v12.origin.x = a4 - v12.size.width * 0.5;
  v12.origin.y = a5 - v12.size.width * 0.5;
  v12.size.height = v12.size.width;
  CGContextFillEllipseInRect(a2, v12);
}

- (id)_getWorkoutRouteLabelForWorkout:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  uint64_t *v19;
  void *v20;
  dispatch_semaphore_t v21;
  id v22;
  objc_class *v23;
  void *v24;
  RTMapServiceManager *mapServiceManager;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  dispatch_time_t v29;
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
  id v42;
  _BOOL4 v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v49;
  uint64_t v50;
  void *v51;
  __CFString *v52;
  objc_class *v53;
  id v54;
  void *v55;
  void *v56;
  objc_class *v57;
  id v58;
  void *v59;
  objc_class *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v69[4];
  NSObject *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[6];
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE buf[12];
  __int16 v97;
  void *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  _QWORD v105[4];

  v105[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[RTWorkoutRouteManager lastTimeRouteLabelFailed](self, "lastTimeRouteLabelFailed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager lastTimeRouteLabelFailed](self, "lastTimeRouteLabelFailed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;
    v12 = (double)(unint64_t)kRTWorkoutRouteLabelBackOffDuration;

    if (v11 >= v12)
    {
LABEL_4:
      v92 = 0;
      v93 = &v92;
      v94 = 0x2020000000;
      v95 = 0;
      v86 = 0;
      v87 = &v86;
      v88 = 0x3032000000;
      v89 = __Block_byref_object_copy__133;
      v90 = __Block_byref_object_dispose__133;
      v91 = 0;
      v13 = MEMORY[0x1E0C809B0];
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke;
      v85[3] = &unk_1E92A3620;
      v85[4] = &v92;
      v85[5] = &v86;
      -[RTWorkoutRouteManager _getLocationsForWorkout:decimationLevel:limit:handler:](self, "_getLocationsForWorkout:decimationLevel:limit:handler:", v6, 3, 1, v85);
      if (v87[5])
      {
        v14 = v93;
        v15 = (void *)v93[3];
        if (v15)
        {
          free(v15);
          v14 = v93;
        }
        v14[3] = 0;
      }
      if (a4 && v87[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v53 = (objc_class *)objc_opt_class();
          NSStringFromClass(v53);
          v54 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)v87[5];
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v54;
          v97 = 2112;
          v98 = v55;
          v99 = 2112;
          v100 = v56;
          _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        *a4 = objc_retainAutorelease((id)v87[5]);
        v17 = &stru_1E92AB3A8;
        goto LABEL_40;
      }
      -[RTWorkoutRouteManager _getRTLocationUsingCLLocationCoordinate2D:](self, "_getRTLocationUsingCLLocationCoordinate2D:", v93[3]);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v93;
      v20 = (void *)v93[3];
      if (v20)
      {
        free(v20);
        v19 = v93;
      }
      v19[3] = 0;
      v79 = 0;
      v80 = &v79;
      v81 = 0x3032000000;
      v82 = __Block_byref_object_copy__133;
      v83 = __Block_byref_object_dispose__133;
      v84 = 0;
      v73 = 0;
      v74 = &v73;
      v75 = 0x3032000000;
      v76 = __Block_byref_object_copy__133;
      v77 = __Block_byref_object_dispose__133;
      v78 = 0;
      v21 = dispatch_semaphore_create(0);
      v22 = objc_alloc(MEMORY[0x1E0D183F8]);
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v22, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", 1, v24, CFSTR("com.apple.CoreRoutine.workoutRoute"));

      mapServiceManager = self->_mapServiceManager;
      v69[0] = v13;
      v69[1] = 3221225472;
      v69[2] = __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke_221;
      v69[3] = &unk_1E9296EE0;
      v71 = &v79;
      v72 = &v73;
      v26 = v21;
      v70 = v26;
      -[RTMapServiceManager fetchMapItemsFromLocation:options:handler:](mapServiceManager, "fetchMapItemsFromLocation:options:handler:", v67, v66, v69);
      v27 = v26;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v27, v29))
        goto LABEL_25;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "timeIntervalSinceDate:", v28);
      v31 = v30;
      v32 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v38 = (void *)MEMORY[0x1E0CB35C8];
      v105[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v105, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        v41 = objc_retainAutorelease(v40);

      }
      else
      {
LABEL_25:
        v41 = 0;
      }

      v42 = v41;
      if (v42)
        v43 = a4 != 0;
      else
        v43 = 0;
      if (v43)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          v58 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v58;
          v97 = 2112;
          v98 = v59;
          v99 = 2112;
          v100 = v42;
          _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        *a4 = objc_retainAutorelease(v42);
      }
      else
      {
        v45 = (void *)v80[5];
        if (v45 && !v74[5])
        {
          objc_msgSend(v45, "address");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "locality");
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)v50;
          v52 = &stru_1E92AB3A8;
          if (v50)
            v52 = (__CFString *)v50;
          v17 = v52;

          goto LABEL_39;
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTWorkoutRouteManager setLastTimeRouteLabelFailed:](self, "setLastTimeRouteLabelFailed:", v46);

        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v60 = (objc_class *)objc_opt_class();
          NSStringFromClass(v60);
          v61 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v80[5];
          v64 = v74[5];
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v61;
          v97 = 2112;
          v98 = v62;
          v99 = 2112;
          v100 = v67;
          v101 = 2112;
          v102 = v63;
          v103 = 2112;
          v104 = v64;
          _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "%@, %@, Failed to reverse geocode start location of the workout, %@, reverseGeocodedMapItem, %@, reverseGeocodeError, %@", buf, 0x34u);

        }
      }
      v17 = &stru_1E92AB3A8;
LABEL_39:

      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v79, 8);

LABEL_40:
      _Block_object_dispose(&v86, 8);

      _Block_object_dispose(&v92, 8);
      goto LABEL_41;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v17 = &stru_1E92AB3A8;
LABEL_41:

  return v17;
}

void __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke(uint64_t a1, uint64_t a2, int a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __63__RTWorkoutRouteManager__getWorkoutRouteLabelForWorkout_error___block_invoke_221(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_areWorkoutsSimilarBetweenClusterSet1:(id)a3 clusterSet2:(id)a4 workoutActivityType:(int64_t)a5 maxDistanceThreshold:(double)a6 error:(id *)a7
{
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  int v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  dispatch_semaphore_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  dispatch_time_t v48;
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
  void *v59;
  void *v60;
  id v61;
  id v62;
  id *v63;
  BOOL v64;
  dispatch_semaphore_t v65;
  void *v66;
  NSObject *v67;
  void *v68;
  dispatch_time_t v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  double v88;
  NSObject *v89;
  objc_class *v90;
  id v91;
  void *v92;
  uint64_t v93;
  NSObject *dsema;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *context;
  void *v107;
  void *v112;
  void *v113;
  _QWORD v114[4];
  NSObject *v115;
  uint64_t *v116;
  uint64_t *v117;
  _QWORD v118[4];
  NSObject *v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  id *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t);
  void (*v130)(uint64_t);
  id v131;
  _BYTE buf[12];
  __int16 v133;
  id v134;
  __int16 v135;
  uint64_t v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  double v140;
  __int16 v141;
  uint64_t v142;
  _QWORD v143[4];

  v143[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v112 = v10;
  v113 = v9;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inputClusterSet1", buf, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("inputClusterSet1"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v21 = 0;
      *a7 = v24;
      goto LABEL_30;
    }
LABEL_23:
    v21 = 0;
    goto LABEL_30;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inputClusterSet2", buf, 2u);
    }

    if (a7)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("inputClusterSet2"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v126 = 0;
  v127 = (id *)&v126;
  v128 = 0x3032000000;
  v129 = __Block_byref_object_copy__133;
  v130 = __Block_byref_object_dispose__133;
  v131 = 0;
  context = (void *)MEMORY[0x1D8231EA8]();
  v122 = 0;
  v123 = &v122;
  v124 = 0x2020000000;
  v125 = 0;
  if (objc_msgSend(v9, "count") || objc_msgSend(v112, "count"))
  {
    if (objc_msgSend(v9, "count") && objc_msgSend(v112, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v113, "count");
        v16 = objc_msgSend(v112, "count");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v13;
        v133 = 2112;
        v134 = v14;
        v135 = 2048;
        v136 = v15;
        v137 = 2048;
        v138 = v16;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, clusterSet1 count, %lu, clusterSet2 count, %lu", buf, 0x2Au);

      }
      v17 = (void *)objc_msgSend(v113, "mutableCopy");
      v18 = (void *)objc_msgSend(v112, "mutableCopy");
      v98 = objc_msgSend(v17, "count");
      v97 = objc_msgSend(v18, "count");
      v96 = objc_msgSend(v17, "count");
      v103 = (void *)objc_msgSend(v17, "mutableCopy");
      objc_msgSend(v17, "minusSet:", v18);
      objc_msgSend(v18, "minusSet:", v103);
      v104 = v17;
      v95 = objc_msgSend(v17, "count");
      v19 = objc_msgSend(v17, "count");
      v101 = v18;
      if (v19 <= kRTSQLQueryMaxPredicatesCount
        && (v20 = objc_msgSend(v18, "count"), v20 <= kRTSQLQueryMaxPredicatesCount))
      {
        v27 = objc_msgSend(v17, "count");
        v28 = objc_msgSend(v18, "count") * v27;
        if (v28 <= kRTSQLQueryMaxPredicatesCount)
        {
          v65 = dispatch_semaphore_create(0);
          -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v114[0] = MEMORY[0x1E0C809B0];
          v114[1] = 3221225472;
          v114[2] = __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke_2;
          v114[3] = &unk_1E92971F0;
          v116 = &v122;
          v117 = &v126;
          v67 = v65;
          v115 = v67;
          objc_msgSend(v66, "fetchTotalWorkoutDistancesCountWithClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:handler:", v104, v18, a5, v114, a6);

          dsema = v67;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v69))
            goto LABEL_62;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "timeIntervalSinceDate:", v68);
          v72 = v71;
          v73 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "filteredArrayUsingPredicate:", v74);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "firstObject");
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v73, "submitToCoreAnalytics:type:duration:", v77, 1, v72);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v78, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v79 = (void *)MEMORY[0x1E0CB35C8];
          v143[0] = *MEMORY[0x1E0CB2D50];
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v143, 1);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          if (v81)
          {
            v82 = objc_retainAutorelease(v81);

          }
          else
          {
LABEL_62:
            v82 = 0;
          }

          v84 = v82;
          if (v84)
            objc_storeStrong(v127 + 5, v82);

          v83 = v115;
        }
        else
        {
          v29 = objc_msgSend(v104, "count");
          v30 = objc_msgSend(v18, "count");
          if (v29 >= v30)
            v31 = v18;
          else
            v31 = v104;
          if (v29 >= v30)
            v32 = v104;
          else
            v32 = v18;
          v33 = v31;
          v34 = v32;
          dsema = v33;
          -[NSObject allObjects](v33, "allObjects");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = kRTSQLQueryMaxPredicatesCount;
          v102 = v34;
          v36 = -[NSObject count](v34, "count");
          v37 = 0;
          if (v36 > v35)
            v38 = 1;
          else
            v38 = v35 / v36;
          v99 = *MEMORY[0x1E0D18598];
          v100 = *MEMORY[0x1E0CB2D50];
          do
          {
            if (v37 >= objc_msgSend(v107, "count"))
              break;
            v105 = (void *)MEMORY[0x1D8231EA8]();
            v39 = objc_msgSend(v107, "count");
            if (v39 - v37 < v38)
              v38 = v39 - v37;
            v40 = dispatch_semaphore_create(0);
            -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)MEMORY[0x1E0C99E60];
            objc_msgSend(v107, "subarrayWithRange:", v37, v38);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setWithArray:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v118[0] = MEMORY[0x1E0C809B0];
            v118[1] = 3221225472;
            v118[2] = __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke;
            v118[3] = &unk_1E92971F0;
            v120 = &v122;
            v121 = &v126;
            v45 = v40;
            v119 = v45;
            objc_msgSend(v41, "fetchTotalWorkoutDistancesCountWithClusterSet1:clusterSet2:workoutActivityType:maxDistanceThreshold:handler:", v44, v102, a5, v118, a6);

            v46 = v45;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = dispatch_time(0, 3600000000000);
            if (!dispatch_semaphore_wait(v46, v48))
              goto LABEL_50;
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "timeIntervalSinceDate:", v47);
            v51 = v50;
            v52 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
            v143[0] = v100;
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v143, 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "errorWithDomain:code:userInfo:", v99, 15, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
            {
              v61 = objc_retainAutorelease(v60);

            }
            else
            {
LABEL_50:
              v61 = 0;
            }

            v62 = v61;
            v63 = v127 + 5;
            if (v62)
            {
              objc_storeStrong(v63, v61);
              v64 = 0;
            }
            else
            {
              v64 = *v63 == 0;
            }

            objc_autoreleasePoolPop(v105);
            v37 += v38;
          }
          while (v64);

          v83 = v102;
        }

        if (v127[5])
        {
          v21 = 0;
          v22 = 11;
          goto LABEL_13;
        }
        v85 = v123[3];
        v86 = objc_msgSend(v104, "count");
        v87 = v85 + (v86 + v96 - v95 + objc_msgSend(v101, "count")) * (v96 - v95);
        v123[3] = v87;
        if (v97 * v98)
          v88 = (double)v87 / (double)(unint64_t)(v97 * v98);
        else
          v88 = 1.0;
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          v90 = (objc_class *)objc_opt_class();
          NSStringFromClass(v90);
          v91 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v123[3];
          *(_DWORD *)buf = 138413570;
          *(_QWORD *)&buf[4] = v91;
          v133 = 2112;
          v134 = v92;
          v135 = 2048;
          v136 = v93;
          v137 = 2048;
          v138 = v97 * v98;
          v139 = 2048;
          v140 = v88;
          v141 = 2048;
          v142 = 0x3FE0000000000000;
          _os_log_impl(&dword_1D1A22000, v89, OS_LOG_TYPE_INFO, "%@, %@, totalCount, %lu, idealCount, %lu, percentage overlap, %.5f, cluster overlap threshold, %.5f", buf, 0x3Eu);

        }
        v21 = v88 >= 0.5;
      }
      else
      {
        v21 = 0;
      }
      v22 = 1;
LABEL_13:

      goto LABEL_26;
    }
    v21 = 0;
    v22 = 1;
  }
  else
  {
    v22 = 1;
    v21 = 1;
  }
LABEL_26:
  _Block_object_dispose(&v122, 8);
  objc_autoreleasePoolPop(context);
  if (v22 == 11)
  {
    v21 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v127[5]);
  }
  _Block_object_dispose(&v126, 8);

LABEL_30:
  return v21;
}

void __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __122__RTWorkoutRouteManager__areWorkoutsSimilarBetweenClusterSet1_clusterSet2_workoutActivityType_maxDistanceThreshold_error___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_getWorkoutUUIDsForCluster:(id)a3 error:(id *)a4
{
  id v7;
  dispatch_semaphore_t v8;
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
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  objc_class *v35;
  id v36;
  void *v37;
  const char *aSelector;
  _QWORD v39[4];
  NSObject *v40;
  uint8_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t v49[8];
  uint8_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE buf[12];
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    aSelector = a2;
    v8 = dispatch_semaphore_create(0);
    *(_QWORD *)v49 = 0;
    v50 = v49;
    v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__133;
    v53 = __Block_byref_object_dispose__133;
    v54 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__133;
    v47 = __Block_byref_object_dispose__133;
    v48 = 0;
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clusterUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __58__RTWorkoutRouteManager__getWorkoutUUIDsForCluster_error___block_invoke;
    v39[3] = &unk_1E92A3538;
    v41 = v49;
    v11 = v8;
    v40 = v11;
    v42 = &v43;
    objc_msgSend(v9, "fetchWorkoutUUIDsForClusterUUID:handler:", v10, v39);

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
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
    v60[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v60, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = objc_retainAutorelease(v26);

    }
    else
    {
LABEL_7:
      v27 = 0;
    }

    v28 = v27;
    v29 = v28;
    if (a4 && v28)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v36;
        v56 = 2112;
        v57 = v37;
        v58 = 2112;
        v59 = v29;
        _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      *a4 = objc_retainAutorelease(v29);
      v31 = (id)objc_opt_new();
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(*((id *)v50 + 5));
      v31 = (id)v44[5];
    }
    v33 = v31;

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(v49, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v49 = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cluster", v49, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("cluster"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)objc_opt_new();
  }

  return v33;
}

void __58__RTWorkoutRouteManager__getWorkoutUUIDsForCluster_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_getRemoteWorkoutClustersForWorkoutUUIDs:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
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
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t (*v28)(uint64_t, uint64_t);
  NSObject *v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  NSObject *v31;
  dispatch_semaphore_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  _BOOL4 v50;
  NSObject *v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  NSObject *v53;
  id v54;
  objc_class *v56;
  id v57;
  void *v58;
  objc_class *v59;
  id v60;
  void *v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  objc_class *v63;
  id v64;
  void *v65;
  objc_class *v66;
  id v67;
  void *v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void *v70;
  const char *aSelector;
  _QWORD v73[4];
  NSObject *v74;
  uint64_t *v75;
  uint8_t *v76;
  _BYTE *v77;
  _QWORD v78[4];
  NSObject *v79;
  uint64_t *v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint8_t v88[8];
  uint8_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  _BYTE v94[12];
  __int16 v95;
  void *v96;
  __int16 v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  _QWORD v103[4];

  v103[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    aSelector = a2;
    *(_QWORD *)v88 = 0;
    v89 = v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__133;
    v92 = __Block_byref_object_dispose__133;
    v93 = (id)objc_opt_new();
    v82 = 0;
    v83 = &v82;
    v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__133;
    v86 = __Block_byref_object_dispose__133;
    v87 = 0;
    v7 = dispatch_semaphore_create(0);
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke;
    v78[3] = &unk_1E92A3538;
    v80 = &v82;
    v9 = v7;
    v79 = v9;
    v81 = v88;
    objc_msgSend(v8, "fetchWorkoutClusterUUIDsContainingWorkoutUUIDs:handler:", v6, v78);

    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v10, v12))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v11);
      v15 = v14;
      v16 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
      *(_QWORD *)v94 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v94, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v24 = objc_retainAutorelease(v24);

      }
    }
    else
    {
      v24 = 0;
    }

    v27 = (uint64_t (*)(uint64_t, uint64_t))v24;
    v28 = v27;
    if (a4 && v27)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v56 = (objc_class *)objc_opt_class();
        NSStringFromClass(v56);
        v57 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v58;
        *(_WORD *)&buf[22] = 2112;
        v100 = v28;
        _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v30 = v28;
LABEL_23:
      *a4 = objc_retainAutorelease(v30);
      v26 = (void *)objc_opt_new();
LABEL_45:

      _Block_object_dispose(&v82, 8);
      _Block_object_dispose(v88, 8);

      goto LABEL_46;
    }
    if (a4 && v83[5])
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v59 = (objc_class *)objc_opt_class();
        NSStringFromClass(v59);
        v60 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v61;
        *(_WORD *)&buf[22] = 2112;
        v100 = v62;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v30 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
      goto LABEL_23;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v100 = __Block_byref_object_copy__133;
    v101 = __Block_byref_object_dispose__133;
    v102 = (id)objc_opt_new();
    v32 = dispatch_semaphore_create(0);

    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke_228;
    v73[3] = &unk_1E92A3648;
    v75 = &v82;
    v34 = v32;
    v74 = v34;
    v76 = v88;
    v77 = buf;
    objc_msgSend(v33, "fetchWorkoutClustersWithHandler:", v73);

    v10 = v34;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = dispatch_time(0, 3600000000000);
    v37 = v28;
    if (dispatch_semaphore_wait(v10, v36))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "timeIntervalSinceDate:", v35);
      v39 = v38;
      v40 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "filteredArrayUsingPredicate:", v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "submitToCoreAnalytics:type:duration:", v44, 1, v39);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v94 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v94, 2u);
      }

      v46 = (void *)MEMORY[0x1E0CB35C8];
      v103[0] = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v94 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v103, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = v28;
      if (v48)
      {
        v37 = objc_retainAutorelease(v48);

      }
    }

    v49 = v37;
    if (v49)
      v50 = a4 != 0;
    else
      v50 = 0;
    if (v50)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v63 = (objc_class *)objc_opt_class();
        NSStringFromClass(v63);
        v64 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(aSelector);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v94 = 138412802;
        *(_QWORD *)&v94[4] = v64;
        v95 = 2112;
        v96 = v65;
        v97 = 2112;
        v98 = v49;
        _os_log_error_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v94, 0x20u);

      }
      v52 = v49;
LABEL_41:
      *a4 = objc_retainAutorelease(v52);
      v54 = (id)objc_opt_new();
LABEL_44:
      v26 = v54;

      _Block_object_dispose(buf, 8);
      v28 = v49;
      goto LABEL_45;
    }
    if (a4)
    {
      if (v83[5])
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v66 = (objc_class *)objc_opt_class();
          NSStringFromClass(v66);
          v67 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(aSelector);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
          *(_DWORD *)v94 = 138412802;
          *(_QWORD *)&v94[4] = v67;
          v95 = 2112;
          v96 = v68;
          v97 = 2112;
          v98 = v69;
          _os_log_error_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v94, 0x20u);

        }
        v52 = (uint64_t (*)(uint64_t, uint64_t))v83[5];
        goto LABEL_41;
      }
      *a4 = 0;
    }
    v54 = *(id *)(*(_QWORD *)&buf[8] + 40);
    goto LABEL_44;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v88 = 0;
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", v88, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)objc_opt_new();
LABEL_46:

  return v26;
}

void __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v5;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __72__RTWorkoutRouteManager__getRemoteWorkoutClustersForWorkoutUUIDs_error___block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1D8231EA8]();
          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(v12, "clusterUUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = objc_msgSend(v14, "containsObject:", v15);

          if ((_DWORD)v14)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v12);
          objc_autoreleasePoolPop(v13);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    v5 = v16;
  }

}

- (id)_sortWorkoutUUIDsByDistance:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  RTWorkoutRouteManager *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v63;
  id obj;
  void *context;
  void *contexta;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  uint64_t v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v60 = (id)objc_opt_new();
    v53 = (void *)MEMORY[0x1D8231EA8]();
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(v6, "count");
    v63 = v7;
    v55 = v6;
    if (v8)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v56 = (void *)MEMORY[0x1D8231EA8](v8);
        v11 = objc_msgSend(v6, "count", v53);
        if ((unint64_t)(v11 - v10) >= 0x32)
          v12 = 50;
        else
          v12 = v11 - v10;
        -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v10;
        objc_msgSend(v6, "subarrayWithRange:", v10, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v9;
        objc_msgSend(v13, "getWorkoutsWithUUIDs:error:", v14, &v75);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v75;

        v7 = v63;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        obj = v15;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v72;
          v61 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v72 != v18)
                objc_enumerationMutation(obj);
              v20 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              context = (void *)MEMORY[0x1D8231EA8]();
              -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "_getTotalDistanceForWorkout:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "UUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v23);

              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                v25 = (objc_class *)objc_opt_class();
                NSStringFromClass(v25);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "UUID");
                v28 = self;
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "UUID");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "objectForKeyedSubscript:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
                v32 = v17;
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "doubleValueForUnit:", v33);
                *(_DWORD *)buf = 138413058;
                v78 = v26;
                v79 = 2112;
                v80 = v27;
                v81 = 2112;
                v82 = v29;
                v83 = 2048;
                v84 = v34;
                _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, before sorting, uuid, %@, distance, %.5f", buf, 0x2Au);

                v17 = v32;
                v7 = v63;

                self = v28;
                v18 = v61;

              }
              objc_autoreleasePoolPop(context);
            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
          }
          while (v17);
        }

        objc_autoreleasePoolPop(v56);
        v10 = v57 + 50;
        v6 = v55;
        v8 = objc_msgSend(v55, "count");
        v35 = v58;
        v9 = v58;
      }
      while (v57 + 50 < v8);
    }
    else
    {
      v35 = 0;
    }
    if (objc_msgSend(v7, "count", v53))
    {
      v59 = v35;
      objc_msgSend(v7, "keysSortedByValueUsingComparator:", &__block_literal_global_103);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v60 = v37;
      v38 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v68;
        do
        {
          v41 = 0;
          contexta = (void *)v39;
          do
          {
            if (*(_QWORD *)v68 != v40)
              objc_enumerationMutation(v60);
            v42 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v41);
            v43 = (void *)MEMORY[0x1D8231EA8]();
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              v45 = (objc_class *)objc_opt_class();
              NSStringFromClass(v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v47 = v40;
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "objectForKeyedSubscript:", v42);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "doubleValueForUnit:", v50);
              *(_DWORD *)buf = 138413058;
              v78 = v46;
              v79 = 2112;
              v80 = v48;
              v81 = 2112;
              v82 = v42;
              v83 = 2048;
              v84 = v51;
              _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, %@, after sorting, uuid, %@, distance, %.5f", buf, 0x2Au);

              v40 = v47;
              v39 = (uint64_t)contexta;

            }
            objc_autoreleasePoolPop(v43);
            ++v41;
          }
          while (v39 != v41);
          v39 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
        }
        while (v39);
      }

      v6 = v55;
      v7 = v63;
      v35 = v59;
    }

    objc_autoreleasePoolPop(v54);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutUUIDs"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v60 = (id)objc_opt_new();
  }

  return v60;
}

uint64_t __59__RTWorkoutRouteManager__sortWorkoutUUIDsByDistance_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)_pruneDistanceMatrixWithHandler:(id)a3
{
  uint64_t (*v4)(uint64_t, uint64_t);
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  id v35;
  void *v36;
  objc_class *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  id v52;
  void *v53;
  void (**v54)(id, id);
  void *v55;
  id obj;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  dispatch_semaphore_t v61;
  uint64_t v62;
  RTWorkoutRouteManager *v63;
  void *v64;
  _QWORD v65[4];
  NSObject *v66;
  _BYTE *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  _BYTE buf[12];
  __int16 v74;
  void *v75;
  __int16 v76;
  id v77;
  uint8_t v78[128];
  _BYTE v79[24];
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _QWORD v83[4];

  v83[1] = *MEMORY[0x1E0C80C00];
  v54 = (void (**)(id, id))a3;
  v72 = 0;
  v63 = self;
  -[RTWorkoutRouteManager _retrieveUUIDsToPruneWithError:](self, "_retrieveUUIDsToPruneWithError:", &v72);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t (*)(uint64_t, uint64_t))v72;
  if (v4)
    v5 = 1;
  else
    v5 = v55 == 0;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v79 = 138412802;
      *(_QWORD *)&v79[4] = v49;
      *(_WORD *)&v79[12] = 2112;
      *(_QWORD *)&v79[14] = v50;
      *(_WORD *)&v79[22] = 2112;
      v80 = v4;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@, %@, %@, Error fetching prune UUIDs", v79, 0x20u);

    }
    v54[2](v54, v4);

  }
  else
  {
    if (objc_msgSend(v55, "count"))
    {
      v61 = dispatch_semaphore_create(0);
      v64 = (void *)objc_opt_new();
      *(_QWORD *)v79 = 0;
      *(_QWORD *)&v79[8] = v79;
      *(_QWORD *)&v79[16] = 0x3032000000;
      v80 = __Block_byref_object_copy__133;
      v81 = __Block_byref_object_dispose__133;
      v82 = 0;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      obj = v55;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      v8 = 0;
      if (!v7)
        goto LABEL_35;
      v58 = *MEMORY[0x1E0D18598];
      v59 = *MEMORY[0x1E0CB2D50];
      v60 = *(_QWORD *)v69;
      while (1)
      {
        v62 = v7;
        for (i = 0; i != v62; ++i)
        {
          if (*(_QWORD *)v69 != v60)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
          -[RTWorkoutRouteManager workoutDistanceStore](v63, "workoutDistanceStore");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __57__RTWorkoutRouteManager__pruneDistanceMatrixWithHandler___block_invoke;
          v65[3] = &unk_1E9297038;
          v67 = v79;
          v12 = v61;
          v66 = v12;
          objc_msgSend(v11, "deleteWorkoutDistanceWithWorkoutUUID:handler:", v10, v65);

          v13 = v12;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = dispatch_time(0, 3600000000000);
          v16 = v8;
          if (dispatch_semaphore_wait(v13, v15))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "timeIntervalSinceDate:", v14);
            v19 = v18;
            v20 = (void *)objc_opt_new();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "firstObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
            }

            v26 = (void *)MEMORY[0x1E0CB35C8];
            v83[0] = v59;
            *(_QWORD *)buf = CFSTR("semaphore wait timeout");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v83, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "errorWithDomain:code:userInfo:", v58, 15, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v8;
            if (v28)
            {
              v16 = objc_retainAutorelease(v28);

            }
          }

          v29 = v16;
          if (v29)
            v30 = v64 == 0;
          else
            v30 = 1;
          if (!v30)
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v34 = (objc_class *)objc_opt_class();
              NSStringFromClass(v34);
              v35 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v35;
              v74 = 2112;
              v75 = v36;
              v76 = 2112;
              v77 = v29;
              _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

            }
            objc_msgSend(v64, "addObject:", v29);
            v32 = v29;
            v29 = 0;
            goto LABEL_32;
          }
          if (v64 && *(_QWORD *)(*(_QWORD *)&v79[8] + 40))
          {
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v37 = (objc_class *)objc_opt_class();
              NSStringFromClass(v37);
              v38 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = *(void **)(*(_QWORD *)&v79[8] + 40);
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v38;
              v74 = 2112;
              v75 = v39;
              v76 = 2112;
              v77 = v40;
              _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTAppendErrorContinueAndClearError, error, %@", buf, 0x20u);

            }
            objc_msgSend(v64, "addObject:", *(_QWORD *)(*(_QWORD *)&v79[8] + 40));
            v32 = *(void **)(*(_QWORD *)&v79[8] + 40);
            *(_QWORD *)(*(_QWORD *)&v79[8] + 40) = 0;
LABEL_32:

          }
          v8 = v29;

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
        if (!v7)
        {
LABEL_35:

          -[RTWorkoutRouteManager _clearInMemoryClusters](v63, "_clearInMemoryClusters");
          if (objc_msgSend(v64, "count"))
          {
            _RTSafeArray();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            _RTMultiErrorCreate();
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v51 = (objc_class *)objc_opt_class();
              NSStringFromClass(v51);
              v52 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v52;
              v74 = 2112;
              v75 = v53;
              v76 = 2112;
              v77 = v42;
              _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

            }
          }
          else
          {
            v42 = 0;
          }
          v54[2](v54, v42);
          _Block_object_dispose(v79, 8);

          goto LABEL_44;
        }
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v79 = 138412546;
      *(_QWORD *)&v79[4] = v46;
      *(_WORD *)&v79[12] = 2112;
      *(_QWORD *)&v79[14] = v47;
      _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, %@, No UUIDS to prune", v79, 0x16u);

    }
    v54[2](v54, 0);
  }
LABEL_44:

}

void __57__RTWorkoutRouteManager__pruneDistanceMatrixWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_retrieveUUIDsToPruneWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
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
  id v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  NSObject *v37;
  NSObject *v38;
  objc_class *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  id v47;
  void *v48;
  objc_class *v49;
  id v50;
  void *v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void *v53;
  uint64_t (*v56)(uint64_t, uint64_t);
  _QWORD v57[5];
  uint64_t (*v58)(uint64_t, uint64_t);
  NSObject *v59;
  _BYTE *v60;
  SEL v61;
  id v62;
  _BYTE v63[12];
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getWorkoutDefaultSortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_getRTWorkoutDefaultTypesForRaceRoute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v4, "getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v5, 0, v7, 0, 1, 0, 1.79769313e308, v9, &v62);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (uint64_t (*)(uint64_t, uint64_t))v62;

  if (!v56)
    goto LABEL_8;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v42;
    *(_WORD *)&buf[22] = 2112;
    v69 = v56;
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, %@", buf, 0x20u);

  }
  if (a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v45;
      *(_WORD *)&buf[22] = 2112;
      v69 = v56;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v13 = 0;
    *a3 = objc_retainAutorelease(v56);
  }
  else
  {
LABEL_8:
    v14 = (void *)objc_opt_new();
    if (objc_msgSend(v10, "count"))
    {
      v15 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v17);

        ++v15;
      }
      while (objc_msgSend(v10, "count") > v15);
    }
    v18 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v69 = __Block_byref_object_copy__133;
    v70 = __Block_byref_object_dispose__133;
    v71 = (id)objc_opt_new();
    -[RTWorkoutRouteManager workoutDistanceStore](self, "workoutDistanceStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __56__RTWorkoutRouteManager__retrieveUUIDsToPruneWithError___block_invoke;
    v57[3] = &unk_1E92A3690;
    v57[4] = self;
    v61 = a2;
    v52 = v56;
    v58 = v52;
    v60 = buf;
    v20 = v18;
    v59 = v20;
    objc_msgSend(v19, "fetchUniqueWorkoutUUIDsWithHandler:", v57);

    v21 = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v21, v23))
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "timeIntervalSinceDate:", v22);
    v25 = v24;
    v26 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
      *(_WORD *)v63 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v63, 2u);
    }

    v32 = (void *)MEMORY[0x1E0CB35C8];
    v72[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v63 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v72, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_retainAutorelease(v34);

    }
    else
    {
LABEL_16:
      v35 = 0;
    }

    v36 = (uint64_t (*)(uint64_t, uint64_t))v35;
    if (!v36)
      goto LABEL_24;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v63 = 138412802;
      *(_QWORD *)&v63[4] = v47;
      v64 = 2112;
      v65 = v48;
      v66 = 2112;
      v67 = v52;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, %@, %@", v63, 0x20u);

    }
    if (a3)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v49 = (objc_class *)objc_opt_class();
        NSStringFromClass(v49);
        v50 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v63 = 138412802;
        *(_QWORD *)&v63[4] = v50;
        v64 = 2112;
        v65 = v51;
        v66 = 2112;
        v67 = v36;
        _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", v63, 0x20u);

      }
      v13 = 0;
      *a3 = objc_retainAutorelease(v36);
    }
    else
    {
LABEL_24:
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "removeObjectsInArray:", v14);
      v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
    }

    _Block_object_dispose(buf, 8);
  }

  return v13;
}

void __56__RTWorkoutRouteManager__retrieveUUIDsToPruneWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@, %@, %@", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    v5 = objc_msgSend(a2, "mutableCopy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

- (BOOL)_initProcessWorkoutMetrics:(id *)a3
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  objc_class *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  -[RTWorkoutRouteManager _initProcessWorkoutMetricsForDistanceMatrixWithError:](self, "_initProcessWorkoutMetricsForDistanceMatrixWithError:", &v31);
  v6 = v31;
  v7 = v6;
  if (a3 && v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

      v9 = v7;
LABEL_9:
      v10 = objc_retainAutorelease(v9);
      v12 = 0;
      *a3 = v10;
      goto LABEL_10;
    }
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v7;
LABEL_28:
    _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    goto LABEL_4;
  }
  v30 = v6;
  -[RTWorkoutRouteManager _initProcessWorkoutMetricsForClusteringWithError:](self, "_initProcessWorkoutMetricsForClusteringWithError:", &v30);
  v10 = v30;

  if (a3 && v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      v9 = v10;
      goto LABEL_9;
    }
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v20;
    v34 = 2112;
    v35 = v21;
    v36 = 2112;
    v37 = v10;
LABEL_30:
    _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    goto LABEL_8;
  }
  v29 = v10;
  -[RTWorkoutRouteManager _initProcessWorkoutMetricsForSyncFromHealthKitWithError:](self, "_initProcessWorkoutMetricsForSyncFromHealthKitWithError:", &v29);
  v7 = v29;

  if (a3 && v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 2112;
    v37 = v7;
    goto LABEL_28;
  }
  v28 = v7;
  -[RTWorkoutRouteManager _initProcessWorkoutMetricsForSyncToHealthKitWithError:](self, "_initProcessWorkoutMetricsForSyncToHealthKitWithError:", &v28);
  v17 = v28;

  if (a3 && v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v25;
      v34 = 2112;
      v35 = v26;
      v36 = 2112;
      v37 = v17;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v9 = v17;
    goto LABEL_9;
  }
  v27 = v17;
  -[RTWorkoutRouteManager _initProcessWorkoutMetricsForSyncToWatchKitWithError:](self, "_initProcessWorkoutMetricsForSyncToWatchKitWithError:", &v27);
  v10 = v27;

  if (a3 && v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = v20;
    v34 = 2112;
    v35 = v21;
    v36 = 2112;
    v37 = v10;
    goto LABEL_30;
  }
  if (a3)
    *a3 = objc_retainAutorelease(v10);
  v12 = v10 == 0;
LABEL_10:

  return v12;
}

- (BOOL)_initProcessWorkoutMetricsForDistanceMatrixWithError:(id *)a3
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
  void *v104;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("distance_matrix_initial_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("distance_matrix_final_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("distance_matrix_min_time_prefiltered_metadata"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("distance_matrix_min_time_prefiltered_firstlocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("distance_matrix_min_time_prefiltered_locationscount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("distance_matrix_min_time_prefiltered_lastlocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("distance_matrix_min_time_prefiltered_cache"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("distance_matrix_min_time_prefiltered_centroid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("distance_matrix_min_time_prefiltered_iou"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("distance_matrix_min_time_lessthan_orequal_quicksimilarity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("distance_matrix_min_time_exceeded_quicksimilarity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("distance_matrix_min_time_exceeded_dtw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("distance_matrix_min_time_lessthan_orequal_dtw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, CFSTR("distance_matrix_min_time_already_computed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("distance_matrix_max_time_prefiltered_metadata"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("distance_matrix_max_time_prefiltered_firstlocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, CFSTR("distance_matrix_max_time_prefiltered_locationscount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, CFSTR("distance_matrix_max_time_prefiltered_lastlocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, CFSTR("distance_matrix_max_time_prefiltered_cache"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, CFSTR("distance_matrix_max_time_prefiltered_centroid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("distance_matrix_max_time_prefiltered_iou"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, CFSTR("distance_matrix_max_time_lessthan_orequal_quicksimilarity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, CFSTR("distance_matrix_max_time_exceeded_quicksimilarity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, CFSTR("distance_matrix_max_time_exceeded_dtw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKeyedSubscript:", v52, CFSTR("distance_matrix_max_time_lessthan_orequal_dtw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, CFSTR("distance_matrix_max_time_already_computed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v56, CFSTR("distance_matrix_average_time_prefiltered_metadata"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, CFSTR("distance_matrix_average_time_prefiltered_firstlocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, CFSTR("distance_matrix_average_time_prefiltered_locationscount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, CFSTR("distance_matrix_average_time_prefiltered_lastlocation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, CFSTR("distance_matrix_average_time_prefiltered_cache"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setObject:forKeyedSubscript:", v66, CFSTR("distance_matrix_average_time_prefiltered_centroid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v68, CFSTR("distance_matrix_average_time_prefiltered_iou"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v70, CFSTR("distance_matrix_average_time_lessthan_orequal_quicksimilarity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v72, CFSTR("distance_matrix_average_time_exceeded_quicksimilarity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setObject:forKeyedSubscript:", v74, CFSTR("distance_matrix_average_time_exceeded_dtw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setObject:forKeyedSubscript:", v76, CFSTR("distance_matrix_average_time_lessthan_orequal_dtw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setObject:forKeyedSubscript:", v78, CFSTR("distance_matrix_average_time_already_computed"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_prefiltered_metadata"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_prefiltered_firstlocation"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_prefiltered_locationscount"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_prefiltered_lastlocation"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matric_count_prefiltercache"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_prefiltered_centroid"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_prefiltered_iou"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_lessthan_orequal_quicksimilarity"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_exceeded_quicksimilarity"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_exceeded_dtw"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_lessthan_orequal_dtw"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_already_computed"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_no_workout_decimated"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_single_workout_decimated"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_count_both_workouts_decimated"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("distance_matrix_total_number_of_comparisons"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setObject:forKeyedSubscript:", v96, CFSTR("distance_matrix_is_success"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setObject:forKeyedSubscript:", v98, CFSTR("distance_matrix_footprint_delta"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, CFSTR("distance_matrix_time_elapsed"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("number_of_workouts_running"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("number_of_workouts_cycling"));

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setObject:forKeyedSubscript:", &unk_1E93290A8, CFSTR("number_of_workouts_wheel_chair_run_pace"));

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForClusteringWithError:(id *)a3
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
  void *v19;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("clustering_percentage_workouts_clustered"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("clustering_count_clusters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("clustering_min_cluster_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("clustering_max_cluster_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("clustering_average_cluster_size"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("clustering_is_success"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("clustering_footprint_delta"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("clustering_time_elapsed"));

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForSyncFromHealthKitWithError:(id *)a3
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

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sync_from_healthkit_count_local_clusters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("sync_from_healthkit_count_remote_clusters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("sync_from_healthkit_count_final_local_clusters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("sync_from_healthkit_count_final_remote_clusters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("sync_from_healthkit_is_success"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("sync_from_healthkit_footprint_delta"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("sync_from_healthkit_time_elapsed"));

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForSyncToHealthKitWithError:(id *)a3
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sync_to_healthkit_min_time_snapshot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("sync_to_healthkit_min_time_update_cluster"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("sync_to_healthkit_min_time_save_new_cluster"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("sync_to_healthkit_max_time_snapshot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("sync_to_healthkit_max_time_update_cluster"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("sync_to_healthkit_max_time_save_new_cluster"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("sync_to_healthkit_average_time_snapshot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, CFSTR("sync_to_healthkit_average_time_update_cluster"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("sync_to_healthkit_average_time_save_new_cluster"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("sync_to_healthkit_is_success"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, CFSTR("sync_to_healthkit_footprint_delta"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("sync_to_healthkit_time_elapsed"));

  return 1;
}

- (BOOL)_initProcessWorkoutMetricsForSyncToWatchKitWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("sync_to_watch_count_clusters"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("sync_to_watch_is_success"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("sync_to_watch_footprint_delta"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("sync_to_watch_time_elapsed"));

  return 1;
}

- (BOOL)_updateMetricsForCurrentTime:(id)a3 distanceMatrixKey:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  id *v15;
  uint64_t *v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[16];

  v8 = a3;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D8231EA8]();
    v10 = v9;
    switch(a4)
    {
      case 1uLL:
        v11 = CFSTR("distance_matrix_min_time_already_computed");
        v12 = CFSTR("distance_matrix_max_time_already_computed");
        v13 = CFSTR("distance_matrix_average_time_already_computed");
        v14 = CFSTR("distance_matrix_count_already_computed");
        v32 = 0;
        v15 = (id *)&v32;
        v16 = &v32;
        break;
      case 2uLL:
        v11 = CFSTR("distance_matrix_min_time_prefiltered_metadata");
        v12 = CFSTR("distance_matrix_max_time_prefiltered_metadata");
        v13 = CFSTR("distance_matrix_average_time_prefiltered_metadata");
        v14 = CFSTR("distance_matrix_count_prefiltered_metadata");
        v31 = 0;
        v15 = (id *)&v31;
        v16 = &v31;
        break;
      case 3uLL:
        v11 = CFSTR("distance_matrix_min_time_prefiltered_firstlocation");
        v12 = CFSTR("distance_matrix_max_time_prefiltered_firstlocation");
        v13 = CFSTR("distance_matrix_average_time_prefiltered_firstlocation");
        v14 = CFSTR("distance_matrix_count_prefiltered_firstlocation");
        v29 = 0;
        v15 = (id *)&v29;
        v16 = &v29;
        break;
      case 4uLL:
        v11 = CFSTR("distance_matrix_min_time_prefiltered_lastlocation");
        v12 = CFSTR("distance_matrix_max_time_prefiltered_lastlocation");
        v13 = CFSTR("distance_matrix_average_time_prefiltered_lastlocation");
        v14 = CFSTR("distance_matrix_count_prefiltered_lastlocation");
        v26 = 0;
        v15 = (id *)&v26;
        v16 = &v26;
        break;
      case 5uLL:
        v11 = CFSTR("distance_matrix_min_time_prefiltered_cache");
        v12 = CFSTR("distance_matrix_max_time_prefiltered_cache");
        v13 = CFSTR("distance_matrix_average_time_prefiltered_cache");
        v14 = CFSTR("distance_matric_count_prefiltercache");
        v28 = 0;
        v15 = (id *)&v28;
        v16 = &v28;
        break;
      case 6uLL:
        v11 = CFSTR("distance_matrix_min_time_prefiltered_centroid");
        v12 = CFSTR("distance_matrix_max_time_prefiltered_centroid");
        v13 = CFSTR("distance_matrix_average_time_prefiltered_centroid");
        v14 = CFSTR("distance_matrix_count_prefiltered_centroid");
        v27 = 0;
        v15 = (id *)&v27;
        v16 = &v27;
        break;
      case 7uLL:
        v11 = CFSTR("distance_matrix_min_time_prefiltered_locationscount");
        v12 = CFSTR("distance_matrix_max_time_prefiltered_locationscount");
        v13 = CFSTR("distance_matrix_average_time_prefiltered_locationscount");
        v14 = CFSTR("distance_matrix_count_prefiltered_locationscount");
        v30 = 0;
        v15 = (id *)&v30;
        v16 = &v30;
        break;
      case 8uLL:
        v11 = CFSTR("distance_matrix_min_time_prefiltered_iou");
        v12 = CFSTR("distance_matrix_max_time_prefiltered_iou");
        v13 = CFSTR("distance_matrix_average_time_prefiltered_iou");
        v14 = CFSTR("distance_matrix_count_prefiltered_iou");
        v25 = 0;
        v15 = (id *)&v25;
        v16 = &v25;
        break;
      case 9uLL:
        v11 = CFSTR("distance_matrix_min_time_exceeded_dtw");
        v12 = CFSTR("distance_matrix_max_time_exceeded_dtw");
        v13 = CFSTR("distance_matrix_average_time_exceeded_dtw");
        v14 = CFSTR("distance_matrix_count_exceeded_dtw");
        v24 = 0;
        v15 = (id *)&v24;
        v16 = &v24;
        break;
      case 0xAuLL:
        v11 = CFSTR("distance_matrix_min_time_exceeded_quicksimilarity");
        v12 = CFSTR("distance_matrix_max_time_exceeded_quicksimilarity");
        v13 = CFSTR("distance_matrix_average_time_exceeded_quicksimilarity");
        v14 = CFSTR("distance_matrix_count_exceeded_quicksimilarity");
        v22 = 0;
        v15 = (id *)&v22;
        v16 = &v22;
        break;
      case 0xBuLL:
        v11 = CFSTR("distance_matrix_min_time_lessthan_orequal_dtw");
        v12 = CFSTR("distance_matrix_max_time_lessthan_orequal_dtw");
        v13 = CFSTR("distance_matrix_average_time_lessthan_orequal_dtw");
        v14 = CFSTR("distance_matrix_count_lessthan_orequal_dtw");
        v23 = 0;
        v15 = (id *)&v23;
        v16 = &v23;
        break;
      case 0xCuLL:
        v11 = CFSTR("distance_matrix_min_time_lessthan_orequal_quicksimilarity");
        v12 = CFSTR("distance_matrix_max_time_lessthan_orequal_quicksimilarity");
        v13 = CFSTR("distance_matrix_average_time_lessthan_orequal_quicksimilarity");
        v14 = CFSTR("distance_matrix_count_lessthan_orequal_quicksimilarity");
        v21 = 0;
        v15 = (id *)&v21;
        v16 = &v21;
        break;
      default:
        objc_autoreleasePoolPop(v9);
        goto LABEL_9;
    }
    -[RTWorkoutRouteManager _updateMetricsForCurrentTime:minTimeKey:maxTimeKey:averageTimeKey:countKey:error:](self, "_updateMetricsForCurrentTime:minTimeKey:maxTimeKey:averageTimeKey:countKey:error:", v8, v11, v12, v13, v14, v16, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
      v32);
    v19 = *v15;
    objc_autoreleasePoolPop(v10);
    if (a5)
      *a5 = objc_retainAutorelease(v19);
    v18 = v19 != 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: currentTime", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("currentTime"));
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_9:
      v18 = 0;
    }
  }

  return v18;
}

- (BOOL)_updateMetricsForCurrentTime:(id)a3 syncToHealthKitKey:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  id *v13;
  uint64_t *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[16];

  v8 = a3;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1D8231EA8]();
    switch(a4)
    {
      case 3uLL:
        v10 = CFSTR("sync_to_healthkit_min_time_save_new_cluster");
        v11 = CFSTR("sync_to_healthkit_max_time_save_new_cluster");
        v12 = CFSTR("sync_to_healthkit_average_time_save_new_cluster");
        v19 = 0;
        v13 = (id *)&v19;
        v14 = &v19;
        break;
      case 2uLL:
        v10 = CFSTR("sync_to_healthkit_min_time_update_cluster");
        v11 = CFSTR("sync_to_healthkit_max_time_update_cluster");
        v12 = CFSTR("sync_to_healthkit_average_time_update_cluster");
        v18 = 0;
        v13 = (id *)&v18;
        v14 = &v18;
        break;
      case 1uLL:
        v10 = CFSTR("sync_to_healthkit_min_time_snapshot");
        v11 = CFSTR("sync_to_healthkit_max_time_snapshot");
        v12 = CFSTR("sync_to_healthkit_average_time_snapshot");
        v20 = 0;
        v13 = (id *)&v20;
        v14 = &v20;
        break;
      default:
        v16 = 0;
        goto LABEL_14;
    }
    -[RTWorkoutRouteManager _updateMetricsForCurrentTime:minTimeKey:maxTimeKey:averageTimeKey:countKey:error:](self, "_updateMetricsForCurrentTime:minTimeKey:maxTimeKey:averageTimeKey:countKey:error:", v8, v10, v11, v12, 0, v14);

    v16 = 1;
LABEL_14:
    objc_autoreleasePoolPop(v9);
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: currentTime", buf, 2u);
  }

  if (a5)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("currentTime"));
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
LABEL_15:

  return v16;
}

- (BOOL)_updateMetricsForCurrentTime:(id)a3 minTimeKey:(id)a4 maxTimeKey:(id)a5 averageTimeKey:(id)a6 countKey:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  BOOL v31;
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
  int v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_class *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *context;
  id v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  id v77;
  __int16 v78;
  id v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = v19;
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: currentTime", buf, 2u);
    }

    if (!a8)
      goto LABEL_31;
    v26 = CFSTR("currentTime");
    goto LABEL_30;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: minTimeKey", buf, 2u);
    }

    if (!a8)
      goto LABEL_31;
    v26 = CFSTR("minTimeKey");
    goto LABEL_30;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: maxTimeKey", buf, 2u);
    }

    if (!a8)
      goto LABEL_31;
    v26 = CFSTR("maxTimeKey");
    goto LABEL_30;
  }
  if (!v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: averageTimeKey", buf, 2u);
    }

    if (!a8)
      goto LABEL_31;
    v26 = CFSTR("averageTimeKey");
LABEL_30:
    _RTErrorInvalidParameterCreate((uint64_t)v26);
    v31 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: countKey", buf, 2u);
    }

    if (a8)
    {
      v26 = CFSTR("countKey");
      goto LABEL_30;
    }
LABEL_31:
    v31 = 0;
    goto LABEL_42;
  }
  v69 = v19;
  context = (void *)MEMORY[0x1D8231EA8]();
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v63 = (objc_class *)objc_opt_class();
    NSStringFromClass(v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v71 = v64;
    v72 = 2112;
    v73 = v65;
    v74 = 2112;
    v75 = v16;
    v76 = 2112;
    v77 = v17;
    v78 = 2112;
    v79 = v18;
    v80 = 2112;
    v81 = v69;
    _os_log_debug_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_DEBUG, "%@, %@, updating metrics for minTimeKey, %@, maxTimeKey, %@, averageTimeKey, %@, countKey, %@", buf, 0x3Eu);

  }
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isEqualToNumber:", v24))
  {

  }
  else
  {
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v33, "compare:", v15);

    if (v66 != 1)
      goto LABEL_34;
  }
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v15, v16);

LABEL_34:
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "isEqualToNumber:", v37))
  {

LABEL_37:
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v15, v17);

    goto LABEL_38;
  }
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", v17);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v39, "compare:", v15);

  if (v67 == -1)
    goto LABEL_37;
LABEL_38:
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", v18);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v42, "isEqualToNumber:", v43);

  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v44)
  {
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v15, v18);
    v20 = v69;
  }
  else
  {
    objc_msgSend(v45, "objectForKeyedSubscript:", v18);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    v49 = v48;

    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v69;
    objc_msgSend(v50, "objectForKeyedSubscript:", v69);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "doubleValue");
    v53 = v52;

    v54 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "doubleValue");
    objc_msgSend(v54, "numberWithDouble:", (v55 + v49 * v53) / (v53 + 1.0));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setObject:forKeyedSubscript:", v46, v18);

  }
  v57 = (void *)MEMORY[0x1E0CB37E8];
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", v20);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "numberWithUnsignedInteger:", objc_msgSend(v59, "unsignedIntegerValue") + 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutRouteManager processWorkoutMetrics](self, "processWorkoutMetrics");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v60, v20);

  objc_autoreleasePoolPop(context);
  v31 = 1;
LABEL_42:

  return v31;
}

- (double)_getMaxDistanceThresholdForMetric:(int64_t)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = objc_msgSend(&unk_1E932CA18, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (!v7)
  {
    v23 = 0;
    v10 = -1.79769313e308;
    goto LABEL_19;
  }
  v8 = v7;
  v9 = *(_QWORD *)v34;
  v10 = -1.79769313e308;
  v30 = a4;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(&unk_1E932CA18);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      v13 = (void *)MEMORY[0x1D8231EA8]();
      v14 = objc_msgSend(v12, "integerValue");
      v32 = 0;
      -[RTWorkoutRouteManager _getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:](self, "_getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:", a3, 1, v14, &v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v32;
      if (v16)
      {
        v23 = v16;
LABEL_18:

        objc_autoreleasePoolPop(v13);
        a4 = v30;
        goto LABEL_19;
      }
      v17 = objc_msgSend(v12, "integerValue");
      v31 = 0;
      -[RTWorkoutRouteManager _getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:](self, "_getConstantValueForDistanceThresholdUsingDistanceMetric:isDecimated:workoutActivityType:error:", a3, 0, v17, &v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v31;
      if (v19)
      {
        v23 = v19;

        goto LABEL_18;
      }
      objc_msgSend(v15, "doubleValue");
      v21 = v20;
      objc_msgSend(v18, "doubleValue");
      if (v21 >= v22)
        v22 = v21;
      if (v10 < v22)
        v10 = v22;

      objc_autoreleasePoolPop(v13);
    }
    v8 = objc_msgSend(&unk_1E932CA18, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    v23 = 0;
    a4 = v30;
    if (v8)
      continue;
    break;
  }
LABEL_19:
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v38 = v26;
    v39 = 2112;
    v40 = v27;
    v41 = 2048;
    v42 = v10;
    _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "%@, %@, max distance threshold, %.5f", buf, 0x20u);

  }
  if (a4)
    *a4 = objc_retainAutorelease(v23);

  return v10;
}

- (id)_getRTPairsFromCoordinates:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4
{
  void *i;
  void *v8;
  void *v9;

  for (i = (void *)objc_opt_new(); a4; --a4)
  {
    v8 = (void *)MEMORY[0x1D8231EA8]();
    -[RTWorkoutRouteManager _getRTPairUsingCLLocationCoordinate2D:](self, "_getRTPairUsingCLLocationCoordinate2D:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v9);

    objc_autoreleasePoolPop(v8);
    ++a3;
  }
  return i;
}

- (CGRect)_getCGRectFromCoordinates:(CLLocationCoordinate2D *)a3 verticesCount:(unint64_t)a4 outError:(id *)a5
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_class *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];
  CGRect result;

  v40[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4 > 3)
    {
      -[RTWorkoutRouteManager distanceCalculator](self, "distanceCalculator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v19, "cgrectFromCoordinates:locationsCount:error:", a3, a4, &v32);
      v13 = v20;
      v14 = v21;
      v15 = v22;
      v16 = v23;
      v10 = v32;

      if (!a5 || !v10)
        goto LABEL_15;
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v30;
        v35 = 2112;
        v36 = v31;
        v37 = 2112;
        v38 = v10;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v11 = objc_retainAutorelease(v10);
      v10 = v11;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0D18598];
      v39 = *MEMORY[0x1E0CB2D50];
      v40[0] = CFSTR("less number of locations than required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 7, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!a5)
      {
LABEL_14:
        v13 = *MEMORY[0x1E0C9D628];
        v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_15:

        goto LABEL_16;
      }
      v11 = objc_retainAutorelease(v10);
    }
    *a5 = v11;
    goto LABEL_14;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: verticesCoordinates", buf, 2u);
  }

  v13 = *MEMORY[0x1E0C9D628];
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_16:
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CLLocationCoordinate2D)_getCoordinatesFromRTPairs:(id)a3
{
  id v3;
  CLLocationCoordinate2D *v4;
  unint64_t v5;
  CLLocationDegrees *p_longitude;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CLLocationDegrees v11;
  void *v12;
  void *v13;
  CLLocationDegrees v14;

  v3 = a3;
  v4 = (CLLocationCoordinate2D *)malloc_type_malloc(16 * objc_msgSend(v3, "count"), 0x1000040451B5BE8uLL);
  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    p_longitude = &v4->longitude;
    do
    {
      v7 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "secondObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      *(CLLocationCoordinate2D *)(p_longitude - 1) = CLLocationCoordinate2DMake(v11, v14);

      objc_autoreleasePoolPop(v7);
      ++v5;
      p_longitude += 2;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }

  return v4;
}

- (BOOL)_refreshWorkoutsCache:(id)a3 workoutUUIDs:(id)a4 startingIndex:(unint64_t)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  NSObject *v37;
  const __CFString *v38;
  NSObject *v39;
  NSUInteger range;
  const char *aSelector;
  id v43;
  void *v44;
  void *context;
  id *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;
  NSRange v64;

  v63 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutsCache", buf, 2u);
    }

    if (a6)
    {
      v38 = CFSTR("workoutsCache");
LABEL_26:
      _RTErrorInvalidParameterCreate((uint64_t)v38);
      v36 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
LABEL_27:
    v36 = 0;
    goto LABEL_28;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (a6)
    {
      v38 = CFSTR("workoutUUIDs");
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  aSelector = a2;
  v46 = a6;
  context = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");
  v14 = objc_msgSend(v13, "count");
  if (v14 - a5 >= 0x32)
    v15 = 50;
  else
    v15 = v14 - a5;
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  range = v15;
  objc_msgSend(v13, "subarrayWithRange:", a5, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v16, "getWorkoutsWithUUIDs:error:", v17, &v51);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v51;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v48 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v25 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v24, "UUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, v26);

        objc_autoreleasePoolPop(v25);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v21);
  }

  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(aSelector);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v64.location = a5;
    v64.length = range;
    NSStringFromRange(v64);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSinceDate:", v44);
    v34 = v33;
    +[RTRuntime footprint](RTRuntime, "footprint");
    *(_DWORD *)buf = 138413314;
    v53 = v29;
    v54 = 2112;
    v55 = v30;
    v56 = 2112;
    v57 = v31;
    v58 = 2048;
    v59 = v34;
    v60 = 2048;
    v61 = v35;
    _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@, %@, refreshed workouts cache in the range %@, latency, %.4f, footprint, %.4f", buf, 0x34u);

  }
  objc_autoreleasePoolPop(context);
  if (v46)
    *v46 = objc_retainAutorelease(v43);

  v36 = 1;
LABEL_28:

  return v36;
}

- (id)_getWorkoutFromWorkouts:(id)a3 UUID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[8];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutsCache", buf, 2u);
    }

    if (!a5)
      goto LABEL_17;
    v13 = CFSTR("workoutsCache");
    goto LABEL_13;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUID", buf, 2u);
    }

    if (!a5)
      goto LABEL_17;
    v13 = CFSTR("workoutUUID");
LABEL_13:
    _RTErrorInvalidParameterCreate((uint64_t)v13);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v22 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("workout UUID %@ not found in the workouts"), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v19);

LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v11;
}

- (void)_getLocationsForWorkout:(id)a3 decimationLevel:(unint64_t)a4 limit:(int64_t)a5 handler:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  dispatch_time_t v20;
  id v21;
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
  NSObject *v35;
  objc_class *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  char v44;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v51;
  void *context;
  _QWORD v54[4];
  NSObject *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _BYTE buf[12];
  __int16 v74;
  id v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;
  const __CFString *v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v48 = a6;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__133;
  v71 = __Block_byref_object_dispose__133;
  v72 = 0;
  v46 = *MEMORY[0x1E0D18598];
  v47 = *MEMORY[0x1E0CB2D50];
  v51 = v7;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v82 = *MEMORY[0x1E0CB2D50];
    v83 = CFSTR("workout is nil");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v46, 7, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v68[5];
    v68[5] = v10;

    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v48 + 2))(v48, 0, 0, v68[5]);
  }
  v12 = 0;
  v63 = 0;
  v64 = &v63;
  v13 = 1;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  while ((v13 & 1) != 0)
  {
    context = (void *)MEMORY[0x1D8231EA8]();
    v14 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __79__RTWorkoutRouteManager__getLocationsForWorkout_decimationLevel_limit_handler___block_invoke;
    v54[3] = &unk_1E92A35B0;
    v56 = &v63;
    v57 = &v59;
    v58 = &v67;
    v17 = v14;
    v55 = v17;
    objc_msgSend(v16, "fetchRouteLocationsUsingWorkout:decimationLevel:limit:shift:handler:", v51, a4, a5, 0, v54);

    v18 = v17;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = dispatch_time(0, 3600000000000);
    v21 = v12;
    if (dispatch_semaphore_wait(v18, v20))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v19);
      v24 = v23;
      v25 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_497);
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
      v84[0] = v47;
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v84, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v46, 15, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v12;
      if (v33)
      {
        v21 = objc_retainAutorelease(v33);

      }
    }

    v34 = v21;
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = v60[3];
      v40 = v68[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeIntervalSinceDate:", v15);
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v37;
      v74 = 2112;
      v75 = v38;
      v76 = 2048;
      v77 = v39;
      v78 = 2112;
      v79 = v40;
      v80 = 2048;
      v81 = v42;
      _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "%@, %@, locations count, %lu, error, %@, latency, %.4f sec", buf, 0x34u);

    }
    v43 = v34;
    if (v34 || (v43 = (id)v68[5]) != 0)
    {
      (*((void (**)(id, _QWORD, _QWORD, id))v48 + 2))(v48, 0, 0, v43);
      v44 = 0;
    }
    else
    {
      v44 = 1;
    }

    objc_autoreleasePoolPop(context);
    v13 = 0;
    v12 = v34;
    if ((v44 & 1) == 0)
      goto LABEL_19;
  }
  (*((void (**)(id, uint64_t, uint64_t, uint64_t))v48 + 2))(v48, v64[3], v60[3], v68[5]);
  v34 = v12;
LABEL_19:
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);

}

void __79__RTWorkoutRouteManager__getLocationsForWorkout_decimationLevel_limit_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;
  id v9;

  v8 = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold:(double)a3 topN:(unint64_t)a4 error:(id *)a5
{
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  __CFString *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
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
  uint64_t v52;
  NSObject *v53;
  objc_class *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  __CFString *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  NSObject *v68;
  objc_class *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  char *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  uint64_t v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *v100;
  objc_class *v101;
  id v102;
  id v103;
  void *v104;
  uint64_t v105;
  void *v106;
  __CFString *v107;
  __CFString *v108;
  void *v109;
  void *v110;
  objc_class *v112;
  void *v113;
  void *v114;
  objc_class *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  unint64_t v124;
  id obj;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  id *v130;
  uint64_t v131;
  void *context;
  void *contexta;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  id v145;
  char *v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  id v167;
  id v168;
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  void *v173;
  void *v174;
  uint8_t v175[128];
  uint8_t buf[4];
  id v177;
  __int16 v178;
  id v179;
  __int16 v180;
  uint64_t v181;
  __int16 v182;
  uint64_t v183;
  __int16 v184;
  uint64_t v185;
  __int16 v186;
  __CFString *v187;
  __int16 v188;
  void *v189;
  __int16 v190;
  uint64_t v191;
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = (void *)objc_opt_new();
  v124 = a4;
  if (a4 == 0x7FFFFFFF)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v177 = v10;
      v178 = 2112;
      v179 = v11;
      v180 = 2048;
      v181 = 5000;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, top N is passed as Infinity. Manually reducing it to maximum count of %lu", buf, 0x20u);

    }
    v124 = 5000;
  }
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_getWorkoutDefaultStartDateForRaceRoute");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = 0;
  -[RTWorkoutRouteManager _getRelevanceLocationWithError:](self, "_getRelevanceLocationWithError:", &v168);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v168;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5 && v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v112 = (objc_class *)objc_opt_class();
      NSStringFromClass(v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v177 = v113;
      v178 = 2112;
      v179 = v114;
      v180 = 2112;
      v181 = (uint64_t)v14;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v17 = objc_retainAutorelease(v14);
    *a5 = v17;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v144 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v130 = a5;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (a3 == 1.79769313e308)
      {
        v22 = CFSTR("infinity");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v124);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTRuntime footprint](RTRuntime, "footprint");
      *(_DWORD *)buf = 138414082;
      v177 = v19;
      v178 = 2112;
      v179 = v20;
      v180 = 2048;
      v181 = 50;
      v182 = 2112;
      v183 = (uint64_t)v21;
      v184 = 2112;
      v185 = (uint64_t)v121;
      v186 = 2112;
      v187 = v22;
      v188 = 2112;
      v189 = v23;
      v190 = 2048;
      v191 = v24;
      _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, %@, before beginning, batch size, %lu, startDate, %@, location, %@, distance threshold, %@, top N, %@, footprint, %.4f MB", buf, 0x52u);

      if (a3 != 1.79769313e308)
    }

    v139 = (void *)objc_opt_new();
    v25 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x1D8231EA8]();
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "getWorkoutDefaultSortDescriptors");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_getRTWorkoutDefaultTypesForRaceRoute");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = v14;
      v135 = v13;
      objc_msgSend(v26, "getWorkoutsWithStartDate:limit:sortDescriptors:nearLocation:distanceThreshold:onlySourcedFromFitnessApp:includePastureModeRoutes:workoutTypes:error:", v13, 50, v28, v121, 1, 0, a3, v30, &v167);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = v167;

      v165 = 0u;
      v166 = 0u;
      v163 = 0u;
      v164 = 0u;
      v25 = v31;
      v145 = (id)objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v163, v175, 16);
      v32 = 0;
      if (v145)
      {
        v137 = *(_QWORD *)v164;
        do
        {
          for (i = 0; i != v145; i = (char *)i + 1)
          {
            if (*(_QWORD *)v164 != v137)
              objc_enumerationMutation(v25);
            v34 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)i);
            v35 = (void *)MEMORY[0x1D8231EA8]();
            v36 = v25;
            v37 = objc_msgSend(v25, "count");
            objc_msgSend(v34, "UUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v173 = v38;
            -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "_getTotalDistanceForWorkout:", v34);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v174 = v40;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "addObject:", v41);

            objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v34, "workoutActivityType"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v43)
            {
              v44 = (void *)objc_opt_new();
              objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v34, "workoutActivityType"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "setObject:forKeyedSubscript:", v44, v45);

            }
            v32 += v37;
            objc_msgSend((id)objc_opt_class(), "stringFromWorkoutActivityType:", objc_msgSend(v34, "workoutActivityType"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "objectForKeyedSubscript:", v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "UUID");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v48);

            objc_autoreleasePoolPop(v35);
            v25 = v36;
          }
          v145 = (id)objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v163, v175, 16);
        }
        while (v145);
      }

      v49 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v25, "lastObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "startDate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "dateWithTimeInterval:sinceDate:", v51, 0.001);
      v52 = objc_claimAutoreleasedReturnValue();

      v17 = v122;
      if (v122)
        break;
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = (objc_class *)objc_opt_class();
        NSStringFromClass(v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v25, "count");
        v58 = (void *)v52;
        v59 = objc_msgSend(v141, "count");
        objc_msgSend(v58, "stringFromDate");
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413826;
        v177 = v55;
        v178 = 2112;
        v179 = v56;
        v180 = 2048;
        v181 = v57;
        v182 = 2048;
        v183 = (uint64_t)v32;
        v184 = 2048;
        v185 = v59;
        v52 = (uint64_t)v58;
        v186 = 2112;
        v187 = v60;
        v188 = 2048;
        v189 = v61;
        _os_log_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_INFO, "%@, %@, workouts count, %lu, valid Workouts count, %lu, total workout UUIDs count, %lu, next startDate, %@, footprint, %.4f MB", buf, 0x48u);

      }
      objc_autoreleasePoolPop(context);
      v14 = 0;
      v13 = (void *)v52;
      if (!objc_msgSend(v25, "count"))
        goto LABEL_36;
    }
    objc_autoreleasePoolPop(context);
    if (!v130)
    {
LABEL_36:
      v119 = v52;
      v120 = v25;
      v118 = (void *)MEMORY[0x1D8231EA8]();
      objc_msgSend(v141, "reverseObjectEnumerator");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "allObjects");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = objc_msgSend(v64, "count");
      if (v124 >= v65)
        v66 = v65;
      else
        v66 = v124;
      objc_msgSend(v64, "subarrayWithRange:", 0, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        v69 = (objc_class *)objc_opt_class();
        NSStringFromClass(v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v71 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v124);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v67, "count");
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138413314;
        v177 = v70;
        v178 = 2112;
        v179 = v71;
        v180 = 2112;
        v181 = (uint64_t)v72;
        v182 = 2048;
        v183 = v73;
        v184 = 2048;
        v185 = v74;
        _os_log_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_INFO, "%@, %@, after filtering top N, %@, workout UUIDs count, %lu, footprint, %.4f MB", buf, 0x34u);

      }
      objc_msgSend(v67, "sortedArrayUsingComparator:", &__block_literal_global_258);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = (void *)objc_opt_new();
      v159 = 0u;
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      obj = v75;
      v77 = v139;
      v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v172, 16);
      if (v128)
      {
        v127 = *(_QWORD *)v160;
        do
        {
          v78 = 0;
          do
          {
            if (*(_QWORD *)v160 != v127)
              objc_enumerationMutation(obj);
            v131 = v78;
            v79 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * v78);
            v129 = (void *)MEMORY[0x1D8231EA8]();
            v155 = 0u;
            v156 = 0u;
            v157 = 0u;
            v158 = 0u;
            objc_msgSend(v79, "allKeys");
            contexta = (void *)objc_claimAutoreleasedReturnValue();
            v138 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
            if (v138)
            {
              v136 = *(_QWORD *)v156;
              do
              {
                v80 = 0;
                do
                {
                  if (*(_QWORD *)v156 != v136)
                    objc_enumerationMutation(contexta);
                  v146 = v80;
                  v81 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)v80);
                  v142 = (void *)MEMORY[0x1D8231EA8]();
                  v151 = 0u;
                  v152 = 0u;
                  v153 = 0u;
                  v154 = 0u;
                  v82 = v77;
                  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
                  if (v83)
                  {
                    v84 = v83;
                    v85 = *(_QWORD *)v152;
                    do
                    {
                      for (j = 0; j != v84; ++j)
                      {
                        if (*(_QWORD *)v152 != v85)
                          objc_enumerationMutation(v82);
                        v87 = *(_QWORD *)(*((_QWORD *)&v151 + 1) + 8 * j);
                        v88 = (void *)MEMORY[0x1D8231EA8]();
                        objc_msgSend(v82, "objectForKeyedSubscript:", v87);
                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                        v90 = objc_msgSend(v89, "containsObject:", v81);

                        if (v90)
                        {
                          objc_msgSend(v76, "objectForKeyedSubscript:", v87);
                          v91 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v91)
                          {
                            v92 = (void *)objc_opt_new();
                            objc_msgSend(v76, "setObject:forKeyedSubscript:", v92, v87);

                          }
                          objc_msgSend(v76, "objectForKeyedSubscript:", v87);
                          v93 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v93, "addObject:", v81);

                        }
                        objc_autoreleasePoolPop(v88);
                      }
                      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
                    }
                    while (v84);
                  }

                  objc_autoreleasePoolPop(v142);
                  v80 = v146 + 1;
                  v77 = v139;
                }
                while (v146 + 1 != (char *)v138);
                v138 = objc_msgSend(contexta, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
              }
              while (v138);
            }

            objc_autoreleasePoolPop(v129);
            v78 = v131 + 1;
          }
          while (v131 + 1 != v128);
          v128 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v159, v172, 16);
        }
        while (v128);
      }

      v149 = 0u;
      v150 = 0u;
      v147 = 0u;
      v148 = 0u;
      v144 = v76;
      v94 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
      if (v94)
      {
        v95 = v94;
        v96 = *(_QWORD *)v148;
        v140 = *(_QWORD *)v148;
        do
        {
          v97 = 0;
          v143 = (void *)v95;
          do
          {
            if (*(_QWORD *)v148 != v96)
              objc_enumerationMutation(v144);
            v98 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v97);
            v99 = (void *)MEMORY[0x1D8231EA8]();
            _rt_log_facility_get_os_log(RTLogFacilityWorkout);
            v100 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
            {
              v101 = (objc_class *)objc_opt_class();
              NSStringFromClass(v101);
              v102 = (id)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v103 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v144, "objectForKeyedSubscript:", v98);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = objc_msgSend(v104, "count");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v124);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              +[RTRuntime footprint](RTRuntime, "footprint");
              v108 = v107;
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "timeIntervalSinceDate:", v123);
              *(_DWORD *)buf = 138413826;
              v177 = v102;
              v178 = 2112;
              v179 = v103;
              v180 = 2112;
              v181 = v98;
              v182 = 2048;
              v183 = v105;
              v95 = (uint64_t)v143;
              v184 = 2112;
              v185 = (uint64_t)v106;
              v186 = 2048;
              v187 = v108;
              v188 = 2048;
              v189 = v110;
              _os_log_impl(&dword_1D1A22000, v100, OS_LOG_TYPE_INFO, "%@, %@, activity type, %@, workout UUIDs count, %lu, top N, %@, footprint, %.4f MB, latency, %.4f sec", buf, 0x48u);

              v96 = v140;
            }

            objc_autoreleasePoolPop(v99);
            ++v97;
          }
          while (v95 != v97);
          v95 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
        }
        while (v95);
      }

      objc_autoreleasePoolPop(v118);
      v141 = 0;
      v52 = v119;
      v25 = v120;
      v17 = v122;
      goto LABEL_76;
    }
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      v115 = (objc_class *)objc_opt_class();
      NSStringFromClass(v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v177 = v116;
      v178 = 2112;
      v179 = v117;
      v180 = 2112;
      v181 = (uint64_t)v122;
      _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    *v130 = objc_retainAutorelease(v122);
    v144 = (id)objc_opt_new();

LABEL_76:
    v13 = (void *)v52;
  }

  return v144;
}

uint64_t __100__RTWorkoutRouteManager__getActivityTypeToWorkoutUUIDsMapFilteredUsingDistanceThreshold_topN_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (id)_getRTLocationUsingRTPair:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithRTPair:", v3);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pair", v7, 2u);
    }

    v4 = 0;
  }

  return v4;
}

- (id)_getRTLocationUsingCLLocationCoordinate2D:(CLLocationCoordinate2D *)a3
{
  id v4;
  double latitude;
  double longitude;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  if (a3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D183B0]);
    latitude = a3->latitude;
    longitude = a3->longitude;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithLatitude:longitude:horizontalUncertainty:date:", v7, latitude, longitude, 0.0);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinate", v11, 2u);
    }

    v8 = 0;
  }
  return v8;
}

- (id)_getRTPairUsingCLLocationCoordinate2D:(CLLocationCoordinate2D *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  if (a3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D18408]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->latitude);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->longitude);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithFirstObject:secondObject:", v5, v6);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinate", v10, 2u);
    }

    v7 = 0;
  }
  return v7;
}

- (BOOL)_shouldDecimateWorkout:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_getDurationForWorkout:", v5);
    v8 = v7 / 60.0;
    v9 = v7 / 60.0 > 90.0;

    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v18 = 138413314;
      v16 = CFSTR("NO");
      v19 = v12;
      if (v8 > 90.0)
        v16 = CFSTR("YES");
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v16;
      _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "%@, %@, workout UUID, %@, should decimate, %@, duration threshold exceeded, %@", (uint8_t *)&v18, 0x34u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", (uint8_t *)&v18, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_mapWorkoutsToUUIDs:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1D8231EA8](v8);
          objc_msgSend(v12, "UUID", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        v9 = v8;
      }
      while (v8);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workouts"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_sortWorkoutUUIDs:(id)a3 key:(id)a4 ascending:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v7 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutUUIDs", buf, 2u);
    }

    if (!a6)
      goto LABEL_17;
    v21 = CFSTR("workoutUUIDs");
    goto LABEL_16;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", buf, 2u);
    }

    if (!a6)
      goto LABEL_17;
    v21 = CFSTR("key");
LABEL_16:
    _RTErrorInvalidParameterCreate((uint64_t)v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v14, "getWorkoutsWithUUIDs:error:", v11, &v41);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v41;

  if (a6 && v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v43 = v31;
      v44 = 2112;
      v45 = v32;
      v46 = 2112;
      v47 = v16;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v18 = objc_retainAutorelease(v16);
    *a6 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = v16;
    -[RTWorkoutRouteManager _sortWorkouts:key:ascending:error:](self, "_sortWorkouts:key:ascending:error:", v15, v13, v7, &v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v40;

    if (a6 && v24)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v43 = v34;
        v44 = 2112;
        v45 = v35;
        v46 = 2112;
        v47 = v24;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v18 = objc_retainAutorelease(v24);
      *a6 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = v24;
      -[RTWorkoutRouteManager _mapWorkoutsToUUIDs:error:](self, "_mapWorkoutsToUUIDs:error:", v23, &v39);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v39;

      if (a6 && v18)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v43 = v37;
          v44 = 2112;
          v45 = v38;
          v46 = 2112;
          v47 = v18;
          _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        *a6 = objc_retainAutorelease(v18);
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = v26;
      }
      v19 = v28;

    }
  }

LABEL_32:
  return v19;
}

- (id)_sortWorkouts:(id)a3 key:(id)a4 ascending:(BOOL)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  uint8_t v19[16];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workouts", v19, 2u);
    }

    if (!a6)
      goto LABEL_13;
    v16 = CFSTR("workouts");
    goto LABEL_12;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", v19, 2u);
    }

    if (!a6)
      goto LABEL_13;
    v16 = CFSTR("key");
LABEL_12:
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v11);
LABEL_14:

  return v14;
}

- (id)_paceFromWorkout:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_getTotalDistanceForWorkout:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", v9);
    v11 = v10;

    -[RTWorkoutRouteManager healthKitManager](self, "healthKitManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_getDurationForWorkout:", v6);
    v14 = v13;

    if (v11 == 0.0)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v36 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "UUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("total distance for workout is 0, workout UUID, %@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (a4)
      {
        v21 = objc_retainAutorelease(v21);
        v22 = 0;
        *a4 = v21;
      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "UUIDString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v29 = v26;
        v30 = 2048;
        v31 = v14;
        v32 = 2048;
        v33 = v11;
        v34 = 2048;
        v35 = v14 / v11;
        _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "workout UUID, %@, totalSeconds, %.5f, totalDistance, %.5f, pace, %.5f", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 / v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workout", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workout"));
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
  }

  return v22;
}

- (void)_logClusters:(id)a3 className:(id)a4 selectorName:(id)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  void *context;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v29 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v42 = v30;
    v43 = 2112;
    v44 = v29;
    v45 = 2048;
    v46 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, clusters count, %lu", buf, 0x20u);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v37;
    v31 = 1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v25)
          objc_enumerationMutation(obj);
        v28 = v9;
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        context = (void *)MEMORY[0x1D8231EA8]();
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = objc_msgSend(v10, "count");
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413314;
          v42 = v30;
          v43 = 2112;
          v44 = v29;
          v45 = 2048;
          v46 = v31;
          v47 = 2048;
          v48 = v12;
          v49 = 2048;
          v50 = v13;
          _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, %@, cluster, %lu, workouts, %lu, footprint, %.4f MB", buf, 0x34u);
        }

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = v10;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v33;
          v18 = 1;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v14);
              v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v21 = (void *)MEMORY[0x1D8231EA8]();
              _rt_log_facility_get_os_log(RTLogFacilityWorkout);
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v20, "UUIDString");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413314;
                v42 = v30;
                v43 = 2112;
                v44 = v29;
                v45 = 2048;
                v46 = v31;
                v47 = 2048;
                v48 = v18 + i;
                v49 = 2112;
                v50 = v23;
                _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, %@, cluster, %lu, workout, %lu, uuid, %@", buf, 0x34u);

              }
              objc_autoreleasePoolPop(v21);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            v18 += i;
          }
          while (v16);
        }

        ++v31;
        objc_autoreleasePoolPop(context);
        v9 = v28 + 1;
      }
      while (v28 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
    }
    while (v26);
  }

}

- (id)_latestWorkoutUUIDAcrossWorkouts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
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
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1D8231EA8](v6);
        objc_msgSend(v11, "endDate", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "compare:", v13);

        if (v14 == -1)
        {
          objc_msgSend(v11, "endDate");
          v15 = objc_claimAutoreleasedReturnValue();

          v16 = v11;
          v8 = v16;
          v4 = (void *)v15;
        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v7 != v10);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v7 = v6;
    }
    while (v6);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v8, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_stepCallerWithName:(id)a3 counter:(int64_t)a4 totalCount:(int64_t)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  int64_t v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    +[RTRuntime footprint](RTRuntime, "footprint");
    v10 = 134218754;
    v11 = a4;
    v12 = 2048;
    v13 = a5;
    v14 = 2112;
    v15 = v7;
    v16 = 2048;
    v17 = v9;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "Step %lu/%lu %@ done, footprint, %.4f MB", (uint8_t *)&v10, 0x2Au);
  }

}

- (double)_getConstantValueForString:(id)a3 isDecimated:(BOOL)a4 workoutActivityType:(unint64_t)a5 error:(id *)a6
{
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  double v12;
  NSObject *v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[8];
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v8 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = (__CFString *)a3;
  v10 = v9;
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutActivityType", buf, 2u);
    }

    if (!a6)
      goto LABEL_26;
    v14 = CFSTR("workoutActivityType");
    goto LABEL_25;
  }
  if (v9)
  {
    if ((objc_msgSend((id)objc_opt_class(), "isPermittedWorkoutActivityType:", a5) & 1) != 0)
    {
      if (v10 == CFSTR("kRTClusteringCentroidDistanceThreshold"))
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          v11 = 0;
          v12 = 500.0;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTClusteringDTWDistanceEuclideanThreshold")
             || v10 == CFSTR("kRTClusteringDTWDistanceFirstNormThreshold"))
      {
        if (a5 == 13 || a5 == 71 || a5 == 37)
        {
          v11 = 0;
          if (v8)
            v12 = 0.6;
          else
            v12 = 0.5;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTPreFilterCentroidDistanceThreshold"))
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          v11 = 0;
          v12 = 0.06;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTPreFilterIntersectionOverUnionThreshold"))
      {
        if (a5 == 13 || a5 == 71 || a5 == 37)
        {
          v11 = 0;
          if (v8)
            v12 = 0.4;
          else
            v12 = 0.8;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTPreFilterTotalDistanceDifferenceThreshold"))
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          v11 = 0;
          v12 = 0.1;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTPreFilterFirstLocationsDistanceThreshold"))
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          v11 = 0;
          v12 = 0.04;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTPreFilterLastLocationsDistanceThreshold"))
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          v11 = 0;
          v12 = 0.03;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTPreFilterDifferenceBetweenLocationsThreshold"))
      {
        if (a5 - 13 <= 0x3A && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
        {
          v11 = 0;
          v12 = 0.4;
          goto LABEL_62;
        }
      }
      else if (v10 == CFSTR("kRTPreFilterLocationsRateThreshold")
             && a5 - 13 <= 0x3A
             && ((1 << (a5 - 13)) & 0x400000001000001) != 0)
      {
        v11 = 0;
        v12 = 0.85;
LABEL_62:

        goto LABEL_63;
      }
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D18598];
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid constant string, %@"), v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("invalid workout activity type");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v18);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    if (a6)
    {
      v11 = objc_retainAutorelease(v11);
      *a6 = v11;
    }
    v12 = 1.79769313e308;
    goto LABEL_62;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: constantString", buf, 2u);
  }

  if (a6)
  {
    v14 = CFSTR("constantString");
LABEL_25:
    _RTErrorInvalidParameterCreate((uint64_t)v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_26:
  v12 = 1.79769313e308;
LABEL_63:

  return v12;
}

- (id)_getConstantValueForDistanceThresholdUsingDistanceMetric:(int64_t)a3 isDecimated:(BOOL)a4 workoutActivityType:(unint64_t)a5 error:(id *)a6
{
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    switch(a3)
    {
      case 3:
        -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTClusteringDTWDistanceEuclideanThreshold"), a4);
        v9 = v12;
        break;
      case 2:
        -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTClusteringDTWDistanceFirstNormThreshold"), a4);
        v9 = v13;
        break;
      case 1:
        -[RTWorkoutRouteManager _getConstantValueForString:isDecimated:workoutActivityType:error:](self, "_getConstantValueForString:isDecimated:workoutActivityType:error:", CFSTR("kRTClusteringCentroidDistanceThreshold"), a4);
        v9 = v8;
        break;
      default:
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = *MEMORY[0x1E0D18598];
        v30 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid distance metric"), a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v18);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v9 = 1.79769313e308;
        if (!a6)
          goto LABEL_19;
        goto LABEL_15;
    }
    v14 = 0;
    if (!a6)
      goto LABEL_19;
LABEL_15:
    if (v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityWorkout);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v25 = v22;
        v26 = 2112;
        v27 = v23;
        v28 = 2112;
        v29 = v14;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v11 = 0;
      *a6 = objc_retainAutorelease(v14);
      goto LABEL_20;
    }
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    return v11;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutActivityType", buf, 2u);
  }

  if (a6)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("workoutActivityType"));
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_colorFromHexString:(id)a3
{
  void *v3;
  void *v4;
  int v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScanLocation:", 0);
  objc_msgSend(v3, "scanHexInt:", &v6);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (double)BYTE2(v6) / 255.0, (double)BYTE1(v6) / 255.0, (double)v6 / 255.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_validateWorkout:(id)a3 otherWorkout:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "workoutActivityType");
  if (v9 != objc_msgSend(v8, "workoutActivityType"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v7, "workoutActivityType"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v8, "workoutActivityType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "workout workoutActivityType, %@, otherWorkout workoutActivityType, %@", buf, 0x16u);

    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D18598];
    v31 = *MEMORY[0x1E0CB2D50];
    v17 = (void *)MEMORY[0x1E0CB3940];
    +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v7, "workoutActivityType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v8, "workoutActivityType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("workout activity type mismatch, workout workoutActivityType, %@, otherWorkout workoutActivityType, %@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v21);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5)
      goto LABEL_12;
    goto LABEL_8;
  }
  if (!+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", objc_msgSend(v7, "workoutActivityType"))|| !+[RTHealthKitManager isPermittedWorkoutActivityType:](RTHealthKitManager, "isPermittedWorkoutActivityType:", objc_msgSend(v8, "workoutActivityType")))
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v7, "workoutActivityType"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTHealthKitManager stringFromWorkoutActivityType:](RTHealthKitManager, "stringFromWorkoutActivityType:", objc_msgSend(v8, "workoutActivityType"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v23;
      v35 = 2112;
      v36 = v24;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "workout workoutActivityType, %@, otherWorkout workoutActivityType, %@", buf, 0x16u);

    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("workout activity type not permitted");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 7, v27);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5)
    {
LABEL_12:
      v11 = 0;
      goto LABEL_13;
    }
LABEL_8:
    v10 = objc_retainAutorelease(v10);
    v11 = 0;
    *a5 = v10;
    goto LABEL_13;
  }
  v10 = 0;
  v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)isSchedulerTriggered
{
  return self->_isSchedulerTriggered;
}

- (void)setIsSchedulerTriggered:(BOOL)a3
{
  self->_isSchedulerTriggered = a3;
}

- (NSDate)lastTimeRouteLabelFailed
{
  return self->_lastTimeRouteLabelFailed;
}

- (void)setLastTimeRouteLabelFailed:(id)a3
{
  objc_storeStrong((id *)&self->_lastTimeRouteLabelFailed, a3);
}

- (int64_t)distanceMetric
{
  return self->_distanceMetric;
}

- (void)setDistanceMetric:(int64_t)a3
{
  self->_distanceMetric = a3;
}

- (NSMutableDictionary)processWorkoutMetrics
{
  return self->_processWorkoutMetrics;
}

- (void)setProcessWorkoutMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_processWorkoutMetrics, a3);
}

- (NSMutableDictionary)workoutActivityTypeToclustersSet
{
  return self->_workoutActivityTypeToclustersSet;
}

- (void)setWorkoutActivityTypeToclustersSet:(id)a3
{
  objc_storeStrong((id *)&self->_workoutActivityTypeToclustersSet, a3);
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

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
  objc_storeStrong((id *)&self->_healthKitManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (RTWorkoutDistanceStore)workoutDistanceStore
{
  return self->_workoutDistanceStore;
}

- (void)setWorkoutDistanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_workoutDistanceStore, a3);
}

- (RTWorkoutMetricsManager)workoutMetricsManager
{
  return self->_workoutMetricsManager;
}

- (void)setWorkoutMetricsManager:(id)a3
{
  objc_storeStrong((id *)&self->_workoutMetricsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutMetricsManager, 0);
  objc_storeStrong((id *)&self->_workoutDistanceStore, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_workoutActivityTypeToclustersSet, 0);
  objc_storeStrong((id *)&self->_processWorkoutMetrics, 0);
  objc_storeStrong((id *)&self->_lastTimeRouteLabelFailed, 0);
}

@end
