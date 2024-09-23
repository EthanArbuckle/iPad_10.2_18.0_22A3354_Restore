@implementation RTWorkoutMetricsManager

- (RTWorkoutMetricsManager)init
{
  void *v3;
  RTWorkoutMetricsManager *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[RTWorkoutMetricsManager initWithManagedConfiguration:](self, "initWithManagedConfiguration:", v3);

  return v4;
}

- (RTWorkoutMetricsManager)initWithManagedConfiguration:(id)a3
{
  RTWorkoutMetricsManager *v3;
  RTWorkoutMetricsManager *v4;
  uint64_t v5;
  RTManagedConfiguration *managedConfiguration;
  RTWorkoutMetricsManager *v7;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[16];

  v3 = self;
  if (a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)RTWorkoutMetricsManager;
    v4 = -[RTWorkoutMetricsManager init](&v10, sel_init);
    if (v4)
    {
      v5 = objc_opt_new();
      managedConfiguration = v4->_managedConfiguration;
      v4->_managedConfiguration = (RTManagedConfiguration *)v5;

    }
    v3 = v4;
    v7 = v3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedConfiguration", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)stringFromWorkoutMetricsEvent:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E92A1E90[a3 - 1];
}

- (BOOL)submitMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  objc_class *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  id *v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  const __CFString *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[RTWorkoutMetricsManager managedConfiguration](self, "managedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHealthDataSubmissionAllowed");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v11 = v8;
    v54 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v61;
      v52 = v11;
      v50 = a5;
      v51 = v8;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v55)
          objc_enumerationMutation(v11);
        v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1D8231EA8]();
        v59 = 0;
        v15 = -[RTWorkoutMetricsManager _doesMandatoryKeysExist:data:error:](self, "_doesMandatoryKeysExist:data:error:", a3, v13, &v59);
        v16 = v59;
        if (v16)
        {
LABEL_23:
          v35 = v16;
LABEL_34:
          objc_autoreleasePoolPop(v14);
          a5 = v50;
          v8 = v51;
          goto LABEL_35;
        }
        if (!v15)
          break;
        v58 = 0;
        v15 = -[RTWorkoutMetricsManager _computeMetricsForEvent:data:error:](self, "_computeMetricsForEvent:data:error:", a3, v13, &v58);
        v16 = v58;
        if (v16)
          goto LABEL_23;
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v15)
        {
          v8 = v51;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_opt_class(), "stringFromWorkoutMetricsEvent:", a3);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v65 = v47;
            v66 = 2112;
            v67 = v48;
            v68 = 2112;
            v69 = v49;
            _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "%@, %@, metrics computation for event, %@, failed", buf, 0x20u);

          }
          goto LABEL_30;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "stringFromWorkoutMetricsEvent:", a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 138413058;
          v65 = v20;
          v66 = 2112;
          v67 = v21;
          v68 = 2112;
          v69 = v22;
          v70 = 2048;
          v71 = (const __CFString *)v23;
          _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, %@, submiting metrics for event, %@, keys count, %lu", buf, 0x2Au);

        }
        v57 = 0;
        -[RTWorkoutMetricsManager _submitMetricsForEvent:data:error:](self, "_submitMetricsForEvent:data:error:", a3, v13, &v57);
        v24 = v57;
        if (v24)
        {
          v35 = v24;
          v15 = 1;
          goto LABEL_34;
        }
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "stringFromWorkoutMetricsEvent:", a3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v13, "count");
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "timeIntervalSinceDate:", v53);
          v33 = v32;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413570;
          v65 = v27;
          v66 = 2112;
          v67 = v28;
          v68 = 2112;
          v69 = v29;
          v70 = 2048;
          v71 = (const __CFString *)v30;
          v72 = 2048;
          v73 = v33;
          v74 = 2048;
          v75 = v34;
          _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, submitted metrics for event, %@, keys count, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x3Eu);

          v11 = v52;
        }

        objc_autoreleasePoolPop(v14);
        if (v54 == ++v12)
        {
          v35 = 0;
          v15 = 1;
          a5 = v50;
          v8 = v51;
          v54 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
          if (v54)
            goto LABEL_4;
          goto LABEL_35;
        }
      }
      _rt_log_facility_get_os_log(RTLogFacilityMetric);
      v36 = objc_claimAutoreleasedReturnValue();
      v8 = v51;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "stringFromWorkoutMetricsEvent:", a3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 138413314;
        v65 = v38;
        v66 = 2112;
        v67 = v39;
        v68 = 2112;
        v69 = v40;
        v70 = 2112;
        v71 = CFSTR("NO");
        v72 = 2048;
        v73 = v41;
        _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "%@, %@, does mandatory keys for event, %@, exist, %@, keys count, %lu, skipping metric submission", buf, 0x34u);

        v11 = v52;
      }

LABEL_30:
      if (v50)
        *v50 = 0;
      objc_autoreleasePoolPop(v14);

      v35 = 0;
      v15 = 0;
    }
    else
    {
      v35 = 0;
      v15 = 1;
LABEL_35:

      if (a5)
      {
        v35 = objc_retainAutorelease(v35);
        *a5 = v35;
      }
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      NSStringFromClass(v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v65 = v44;
      v66 = 2112;
      v67 = v45;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "%@, %@, Health Data Submission not allowed on this device.", buf, 0x16u);

    }
    v15 = 0;
  }

  return v15;
}

- (BOOL)_doesMandatoryKeysExist:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v10[16];

  v6 = a4;
  if (v6)
  {
    if (a5)
    {
      v7 = 0;
LABEL_8:
      *a5 = v7;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", v10, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }

  return v6 != 0;
}

- (BOOL)_computeMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  id v9;
  id *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    switch(a3)
    {
      case 1uLL:
        v32 = 0;
        v10 = (id *)&v32;
        v11 = -[RTWorkoutMetricsManager _computeMetricsForClustersEventWithData:error:](self, "_computeMetricsForClustersEventWithData:error:", v9, &v32);
        goto LABEL_12;
      case 2uLL:
        v31 = 0;
        v10 = (id *)&v31;
        v11 = -[RTWorkoutMetricsManager _computeMetricsForProcessNewWorkoutEventWithData:error:](self, "_computeMetricsForProcessNewWorkoutEventWithData:error:", v9, &v31);
        goto LABEL_12;
      case 3uLL:
        v30 = 0;
        v10 = (id *)&v30;
        v11 = -[RTWorkoutMetricsManager _computeMetricsForProcessWorkoutsEventWithData:error:](self, "_computeMetricsForProcessWorkoutsEventWithData:error:", v9, &v30);
        goto LABEL_12;
      case 4uLL:
        v29 = 0;
        v10 = (id *)&v29;
        v11 = -[RTWorkoutMetricsManager _computeMetricsForUpdateRelevanceScoresEventWithData:error:](self, "_computeMetricsForUpdateRelevanceScoresEventWithData:error:", v9, &v29);
LABEL_12:
        v13 = v11;
        v14 = *v10;
        _rt_log_facility_get_os_log(RTLogFacilityMetric);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "stringFromWorkoutMetricsEvent:", a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = CFSTR("NO");
          if (v13)
            v18 = CFSTR("YES");
          v19 = objc_msgSend(v9, "count", v18);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceDate:", v28);
          v22 = v21;
          +[RTRuntime footprint](RTRuntime, "footprint");
          *(_DWORD *)buf = 138413826;
          v34 = v27;
          v35 = 2112;
          v36 = v26;
          v37 = 2112;
          v38 = v17;
          v39 = 2112;
          v40 = v25;
          v41 = 2048;
          v42 = v19;
          v43 = 2048;
          v44 = v22;
          v45 = 2048;
          v46 = v23;
          _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, %@, computed metrics for event, %@, status, %@, keys count, %lu, latency, %.4f sec, footprint, %.4f MB", buf, 0x48u);

        }
        if (a5)
        {
          v14 = objc_retainAutorelease(v14);
          *a5 = v14;
        }
        break;
      default:
        v14 = 0;
        LOBYTE(v13) = 0;
        break;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      LOBYTE(v13) = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }

  return v13;
}

- (BOOL)_submitMetricsForEvent:(unint64_t)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint8_t buf[16];

  v7 = a4;
  if (v7)
  {
    switch(a3)
    {
      case 1uLL:
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9 = 1;
        v10 = (void *)objc_msgSend(v8, "initWithCString:encoding:", RTAnalyticsEventWorkoutRouteManagerClusters, 1);
        log_analytics_submission(v10, v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        break;
      case 2uLL:
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = RTAnalyticsEventWorkoutRouteManagerProcessNewWorkout;
        goto LABEL_12;
      case 3uLL:
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = RTAnalyticsEventWorkoutRouteManagerProcessWorkouts;
        goto LABEL_12;
      case 4uLL:
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = RTAnalyticsEventWorkoutRouteManagerUpdateRelevanceScores;
LABEL_12:
        v15 = (void *)objc_msgSend(v13, "initWithCString:encoding:", v14, 1);
        log_analytics_submission(v15, v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        v9 = 1;
        break;
      default:
        goto LABEL_8;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      v9 = 0;
    }
  }

  return v9;
}

- (id)_mandatoryMetricKeysForEvent:(unint64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[13];
  _QWORD v13[96];
  _QWORD v14[8];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D8231EA8](self, a2, a3, a4);
  switch(a3)
  {
    case 1uLL:
      v15[0] = CFSTR("activity_type");
      v15[1] = CFSTR("is_decimated");
      v15[2] = CFSTR("is_new_cluster");
      v15[3] = CFSTR("is_best_also_last_workout");
      v15[4] = CFSTR("count_workouts");
      v15[5] = CFSTR("duration");
      v15[6] = CFSTR("total_distance");
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v15;
      v8 = 7;
      goto LABEL_7;
    case 2uLL:
      v14[0] = CFSTR("footprint_delta");
      v14[1] = CFSTR("is_reference_route_best_route");
      v14[2] = CFSTR("is_reference_route_last_route");
      v14[3] = CFSTR("time_elapsed_mini_worldbuild_check");
      v14[4] = CFSTR("is_new_workout_similar_to_reference_route");
      v14[5] = CFSTR("is_new_workout_clustered_other");
      v14[6] = CFSTR("is_new_workout_clustered_reference_route");
      v14[7] = CFSTR("time_elapsed_reference_route_cluster_check");
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v14;
      v8 = 8;
      goto LABEL_7;
    case 3uLL:
      v13[0] = CFSTR("clustering_average_cluster_size");
      v13[1] = CFSTR("clustering_count_clusters");
      v13[2] = CFSTR("clustering_footprint_delta");
      v13[3] = CFSTR("clustering_is_success");
      v13[4] = CFSTR("clustering_max_cluster_size");
      v13[5] = CFSTR("clustering_min_cluster_size");
      v13[6] = CFSTR("clustering_percentage_workouts_clustered");
      v13[7] = CFSTR("clustering_time_elapsed");
      v13[8] = CFSTR("distance_matric_count_prefiltercache");
      v13[9] = CFSTR("distance_matrix_average_time_already_computed");
      v13[10] = CFSTR("distance_matrix_average_time_exceeded_dtw");
      v13[11] = CFSTR("distance_matrix_average_time_exceeded_quicksimilarity");
      v13[12] = CFSTR("distance_matrix_average_time_lessthan_orequal_dtw");
      v13[13] = CFSTR("distance_matrix_average_time_lessthan_orequal_quicksimilarity");
      v13[14] = CFSTR("distance_matrix_average_time_prefiltered_centroid");
      v13[15] = CFSTR("distance_matrix_average_time_prefiltered_firstlocation");
      v13[16] = CFSTR("distance_matrix_average_time_prefiltered_iou");
      v13[17] = CFSTR("distance_matrix_average_time_prefiltered_lastlocation");
      v13[18] = CFSTR("distance_matrix_average_time_prefiltered_locationscount");
      v13[19] = CFSTR("distance_matrix_average_time_prefiltered_metadata");
      v13[20] = CFSTR("distance_matrix_count_already_computed");
      v13[21] = CFSTR("distance_matrix_count_both_workouts_decimated");
      v13[22] = CFSTR("distance_matrix_count_exceeded_dtw");
      v13[23] = CFSTR("distance_matrix_count_exceeded_quicksimilarity");
      v13[24] = CFSTR("distance_matrix_count_lessthan_orequal_dtw");
      v13[25] = CFSTR("distance_matrix_count_lessthan_orequal_quicksimilarity");
      v13[26] = CFSTR("distance_matrix_count_no_workout_decimated");
      v13[27] = CFSTR("distance_matrix_count_prefiltered_centroid");
      v13[28] = CFSTR("distance_matrix_count_prefiltered_firstlocation");
      v13[29] = CFSTR("distance_matrix_count_prefiltered_iou");
      v13[30] = CFSTR("distance_matrix_count_prefiltered_lastlocation");
      v13[31] = CFSTR("distance_matrix_count_prefiltered_locationscount");
      v13[32] = CFSTR("distance_matrix_count_prefiltered_metadata");
      v13[33] = CFSTR("distance_matrix_count_single_workout_decimated");
      v13[34] = CFSTR("distance_matrix_final_size");
      v13[35] = CFSTR("distance_matrix_footprint_delta");
      v13[36] = CFSTR("distance_matrix_initial_size");
      v13[37] = CFSTR("distance_matrix_is_success");
      v13[38] = CFSTR("distance_matrix_max_time_already_computed");
      v13[39] = CFSTR("distance_matrix_max_time_exceeded_dtw");
      v13[40] = CFSTR("distance_matrix_max_time_exceeded_quicksimilarity");
      v13[41] = CFSTR("distance_matrix_max_time_lessthan_orequal_dtw");
      v13[42] = CFSTR("distance_matrix_max_time_lessthan_orequal_quicksimilarity");
      v13[43] = CFSTR("distance_matrix_max_time_prefiltered_centroid");
      v13[44] = CFSTR("distance_matrix_max_time_prefiltered_firstlocation");
      v13[45] = CFSTR("distance_matrix_max_time_prefiltered_iou");
      v13[46] = CFSTR("distance_matrix_max_time_prefiltered_lastlocation");
      v13[47] = CFSTR("distance_matrix_max_time_prefiltered_locationscount");
      v13[48] = CFSTR("distance_matrix_max_time_prefiltered_metadata");
      v13[49] = CFSTR("distance_matrix_min_time_already_computed");
      v13[50] = CFSTR("distance_matrix_min_time_exceeded_dtw");
      v13[51] = CFSTR("distance_matrix_min_time_exceeded_quicksimilarity");
      v13[52] = CFSTR("distance_matrix_min_time_lessthan_orequal_dtw");
      v13[53] = CFSTR("distance_matrix_min_time_lessthan_orequal_quicksimilarity");
      v13[54] = CFSTR("distance_matrix_min_time_prefiltered_centroid");
      v13[55] = CFSTR("distance_matrix_min_time_prefiltered_firstlocation");
      v13[56] = CFSTR("distance_matrix_min_time_prefiltered_iou");
      v13[57] = CFSTR("distance_matrix_min_time_prefiltered_lastlocation");
      v13[58] = CFSTR("distance_matrix_min_time_prefiltered_locationscount");
      v13[59] = CFSTR("distance_matrix_min_time_prefiltered_metadata");
      v13[60] = CFSTR("distance_matrix_time_elapsed");
      v13[61] = CFSTR("distance_matrix_total_number_of_comparisons");
      v13[62] = CFSTR("is_scheduler_triggered");
      v13[63] = CFSTR("number_of_workouts_cycling");
      v13[64] = CFSTR("number_of_workouts_running");
      v13[65] = CFSTR("number_of_workouts_wheel_chair_run_pace");
      v13[66] = CFSTR("parameter_buildDistanceMatrix");
      v13[67] = CFSTR("parameter_clearClusters");
      v13[68] = CFSTR("parameter_clearExistingDistanceMatrix");
      v13[69] = CFSTR("parameter_distance_threshold");
      v13[70] = CFSTR("parameter_filter_size");
      v13[71] = CFSTR("parameter_syncClustersToHealhtKit");
      v13[72] = CFSTR("parameter_syncClustersToWatch");
      v13[73] = CFSTR("sync_from_healthkit_count_final_local_clusters");
      v13[74] = CFSTR("sync_from_healthkit_count_final_remote_clusters");
      v13[75] = CFSTR("sync_from_healthkit_count_local_clusters");
      v13[76] = CFSTR("sync_from_healthkit_count_remote_clusters");
      v13[77] = CFSTR("sync_from_healthkit_footprint_delta");
      v13[78] = CFSTR("sync_from_healthkit_is_success");
      v13[79] = CFSTR("sync_from_healthkit_time_elapsed");
      v13[80] = CFSTR("sync_to_healthkit_average_time_save_new_cluster");
      v13[81] = CFSTR("sync_to_healthkit_average_time_snapshot");
      v13[82] = CFSTR("sync_to_healthkit_average_time_update_cluster");
      v13[83] = CFSTR("sync_to_healthkit_footprint_delta");
      v13[84] = CFSTR("sync_to_healthkit_is_success");
      v13[85] = CFSTR("sync_to_healthkit_max_time_save_new_cluster");
      v13[86] = CFSTR("sync_to_healthkit_max_time_snapshot");
      v13[87] = CFSTR("sync_to_healthkit_max_time_update_cluster");
      v13[88] = CFSTR("sync_to_healthkit_min_time_save_new_cluster");
      v13[89] = CFSTR("sync_to_healthkit_min_time_snapshot");
      v13[90] = CFSTR("sync_to_healthkit_min_time_update_cluster");
      v13[91] = CFSTR("sync_to_healthkit_time_elapsed");
      v13[92] = CFSTR("sync_to_watch_count_clusters");
      v13[93] = CFSTR("sync_to_watch_footprint_delta");
      v13[94] = CFSTR("sync_to_watch_is_success");
      v13[95] = CFSTR("sync_to_watch_time_elapsed");
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v13;
      v8 = 96;
      goto LABEL_7;
    case 4uLL:
      v12[0] = CFSTR("count_clusters_existing");
      v12[1] = CFSTR("count_clusters_existing_zero_relevance");
      v12[2] = CFSTR("count_clusters_existing_greaterthanzero_relevance");
      v12[3] = CFSTR("count_clusters_new_zero_relevance");
      v12[4] = CFSTR("count_clusters_new_greaterthanzero_relevance");
      v12[5] = CFSTR("count_clusters_relevance_decreased");
      v12[6] = CFSTR("count_clusters_relevance_increased");
      v12[7] = CFSTR("count_clusters_relevance_score_not_updated");
      v12[8] = CFSTR("count_clusters_relevance_score_updated");
      v12[9] = CFSTR("count_clusters_relevance_to_zero");
      v12[10] = CFSTR("count_clusters_zero_to_relevance");
      v12[11] = CFSTR("footprint_delta");
      v12[12] = CFSTR("time_elapsed");
      v6 = (void *)MEMORY[0x1E0C99D20];
      v7 = v12;
      v8 = 13;
LABEL_7:
      objc_msgSend(v6, "arrayWithObjects:count:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v10 = (void *)v9;
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (BOOL)_computeMetricsForClustersEventWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D8231EA8]();
    v14 = 0;
    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_workouts"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v14);
    v8 = v14;
    if (!v8)
    {
      v13 = 0;
      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("duration"), &unk_1E9328AC0, &unk_1E9328B08, &unk_1E9328AF0, &v13);
      v8 = v13;
      if (!v8)
      {
        v12 = 0;
        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("total_distance"), &unk_1E9328AC0, &unk_1E9328B20, &unk_1E9328AF0, &v12);
        v8 = v12;
      }
    }
    objc_autoreleasePoolPop(v7);
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    v9 = v8 == 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_computeMetricsForProcessNewWorkoutEventWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D8231EA8]();
    v14 = 0;
    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("footprint_delta"), &unk_1E9328AC0, &unk_1E9328B38, &unk_1E9328AF0, &v14);
    v8 = v14;
    if (!v8)
    {
      v13 = 0;
      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("time_elapsed_mini_worldbuild_check"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v13);
      v8 = v13;
      if (!v8)
      {
        v12 = 0;
        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("time_elapsed_reference_route_cluster_check"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v12);
        v8 = v12;
      }
    }
    objc_autoreleasePoolPop(v7);
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    v9 = v8 == 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_computeMetricsForProcessWorkoutsEventWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
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
  uint8_t buf[16];

  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D8231EA8]();
    v96 = 0;
    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("clustering_average_cluster_size"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v96);
    v8 = v96;
    if (!v8)
    {
      v95 = 0;
      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("clustering_count_clusters"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v95);
      v8 = v95;
      if (!v8)
      {
        v94 = 0;
        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("clustering_footprint_delta"), &unk_1E9328AC0, &unk_1E9328B38, &unk_1E9328AF0, &v94);
        v8 = v94;
        if (!v8)
        {
          v93 = 0;
          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("clustering_max_cluster_size"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v93);
          v8 = v93;
          if (!v8)
          {
            v92 = 0;
            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("clustering_min_cluster_size"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v92);
            v8 = v92;
            if (!v8)
            {
              v91 = 0;
              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("clustering_percentage_workouts_clustered"), &unk_1E9328AC0, &unk_1E9328B80, &unk_1E9328AF0, &v91);
              v8 = v91;
              if (!v8)
              {
                v90 = 0;
                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("clustering_time_elapsed"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v90);
                v8 = v90;
                if (!v8)
                {
                  v89 = 0;
                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matric_count_prefiltercache"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v89);
                  v8 = v89;
                  if (!v8)
                  {
                    v88 = 0;
                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_already_computed"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v88);
                    v8 = v88;
                    if (!v8)
                    {
                      v87 = 0;
                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_exceeded_dtw"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v87);
                      v8 = v87;
                      if (!v8)
                      {
                        v86 = 0;
                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_exceeded_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v86);
                        v8 = v86;
                        if (!v8)
                        {
                          v85 = 0;
                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_lessthan_orequal_dtw"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v85);
                          v8 = v85;
                          if (!v8)
                          {
                            v84 = 0;
                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_lessthan_orequal_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v84);
                            v8 = v84;
                            if (!v8)
                            {
                              v83 = 0;
                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_prefiltered_centroid"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v83);
                              v8 = v83;
                              if (!v8)
                              {
                                v82 = 0;
                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_prefiltered_firstlocation"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v82);
                                v8 = v82;
                                if (!v8)
                                {
                                  v81 = 0;
                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_prefiltered_iou"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v81);
                                  v8 = v81;
                                  if (!v8)
                                  {
                                    v80 = 0;
                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_prefiltered_lastlocation"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v80);
                                    v8 = v80;
                                    if (!v8)
                                    {
                                      v79 = 0;
                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_prefiltered_locationscount"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v79);
                                      v8 = v79;
                                      if (!v8)
                                      {
                                        v78 = 0;
                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_average_time_prefiltered_metadata"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v78);
                                        v8 = v78;
                                        if (!v8)
                                        {
                                          v77 = 0;
                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_already_computed"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v77);
                                          v8 = v77;
                                          if (!v8)
                                          {
                                            v76 = 0;
                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_both_workouts_decimated"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v76);
                                            v8 = v76;
                                            if (!v8)
                                            {
                                              v75 = 0;
                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_exceeded_dtw"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v75);
                                              v8 = v75;
                                              if (!v8)
                                              {
                                                v74 = 0;
                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_exceeded_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v74);
                                                v8 = v74;
                                                if (!v8)
                                                {
                                                  v73 = 0;
                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_lessthan_orequal_dtw"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v73);
                                                  v8 = v73;
                                                  if (!v8)
                                                  {
                                                    v72 = 0;
                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_lessthan_orequal_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v72);
                                                    v8 = v72;
                                                    if (!v8)
                                                    {
                                                      v71 = 0;
                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_no_workout_decimated"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v71);
                                                      v8 = v71;
                                                      if (!v8)
                                                      {
                                                        v70 = 0;
                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_prefiltered_centroid"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v70);
                                                        v8 = v70;
                                                        if (!v8)
                                                        {
                                                          v69 = 0;
                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_prefiltered_firstlocation"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v69);
                                                          v8 = v69;
                                                          if (!v8)
                                                          {
                                                            v68 = 0;
                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_prefiltered_iou"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v68);
                                                            v8 = v68;
                                                            if (!v8)
                                                            {
                                                              v67 = 0;
                                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_prefiltered_lastlocation"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v67);
                                                              v8 = v67;
                                                              if (!v8)
                                                              {
                                                                v66 = 0;
                                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_prefiltered_locationscount"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v66);
                                                                v8 = v66;
                                                                if (!v8)
                                                                {
                                                                  v65 = 0;
                                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_prefiltered_metadata"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v65);
                                                                  v8 = v65;
                                                                  if (!v8)
                                                                  {
                                                                    v64 = 0;
                                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_count_single_workout_decimated"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v64);
                                                                    v8 = v64;
                                                                    if (!v8)
                                                                    {
                                                                      v63 = 0;
                                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_final_size"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v63);
                                                                      v8 = v63;
                                                                      if (!v8)
                                                                      {
                                                                        v62 = 0;
                                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_footprint_delta"), &unk_1E9328AC0, &unk_1E9328B38, &unk_1E9328AF0, &v62);
                                                                        v8 = v62;
                                                                        if (!v8)
                                                                        {
                                                                          v61 = 0;
                                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_initial_size"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v61);
                                                                          v8 = v61;
                                                                          if (!v8)
                                                                          {
                                                                            v60 = 0;
                                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_already_computed"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v60);
                                                                            v8 = v60;
                                                                            if (!v8)
                                                                            {
                                                                              v59 = 0;
                                                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_exceeded_dtw"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v59);
                                                                              v8 = v59;
                                                                              if (!v8)
                                                                              {
                                                                                v58 = 0;
                                                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_exceeded_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v58);
                                                                                v8 = v58;
                                                                                if (!v8)
                                                                                {
                                                                                  v57 = 0;
                                                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_lessthan_orequal_dtw"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v57);
                                                                                  v8 = v57;
                                                                                  if (!v8)
                                                                                  {
                                                                                    v56 = 0;
                                                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_lessthan_orequal_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v56);
                                                                                    v8 = v56;
                                                                                    if (!v8)
                                                                                    {
                                                                                      v55 = 0;
                                                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_prefiltered_centroid"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v55);
                                                                                      v8 = v55;
                                                                                      if (!v8)
                                                                                      {
                                                                                        v54 = 0;
                                                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_prefiltered_firstlocation"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v54);
                                                                                        v8 = v54;
                                                                                        if (!v8)
                                                                                        {
                                                                                          v53 = 0;
                                                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_prefiltered_iou"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v53);
                                                                                          v8 = v53;
                                                                                          if (!v8)
                                                                                          {
                                                                                            v52 = 0;
                                                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_prefiltered_lastlocation"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v52);
                                                                                            v8 = v52;
                                                                                            if (!v8)
                                                                                            {
                                                                                              v51 = 0;
                                                                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_prefiltered_locationscount"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v51);
                                                                                              v8 = v51;
                                                                                              if (!v8)
                                                                                              {
                                                                                                v50 = 0;
                                                                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_max_time_prefiltered_metadata"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v50);
                                                                                                v8 = v50;
                                                                                                if (!v8)
                                                                                                {
                                                                                                  v49 = 0;
                                                                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_already_computed"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v49);
                                                                                                  v8 = v49;
                                                                                                  if (!v8)
                                                                                                  {
                                                                                                    v48 = 0;
                                                                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_exceeded_dtw"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v48);
                                                                                                    v8 = v48;
                                                                                                    if (!v8)
                                                                                                    {
                                                                                                      v47 = 0;
                                                                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_exceeded_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v47);
                                                                                                      v8 = v47;
                                                                                                      if (!v8)
                                                                                                      {
                                                                                                        v46 = 0;
                                                                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_lessthan_orequal_dtw"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v46);
                                                                                                        v8 = v46;
                                                                                                        if (!v8)
                                                                                                        {
                                                                                                          v45 = 0;
                                                                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_lessthan_orequal_quicksimilarity"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v45);
                                                                                                          v8 = v45;
                                                                                                          if (!v8)
                                                                                                          {
                                                                                                            v44 = 0;
                                                                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_prefiltered_centroid"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v44);
                                                                                                            v8 = v44;
                                                                                                            if (!v8)
                                                                                                            {
                                                                                                              v43 = 0;
                                                                                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_prefiltered_firstlocation"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v43);
                                                                                                              v8 = v43;
                                                                                                              if (!v8)
                                                                                                              {
                                                                                                                v42 = 0;
                                                                                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_prefiltered_iou"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v42);
                                                                                                                v8 = v42;
                                                                                                                if (!v8)
                                                                                                                {
                                                                                                                  v41 = 0;
                                                                                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_prefiltered_lastlocation"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v41);
                                                                                                                  v8 = v41;
                                                                                                                  if (!v8)
                                                                                                                  {
                                                                                                                    v40 = 0;
                                                                                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_prefiltered_locationscount"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v40);
                                                                                                                    v8 = v40;
                                                                                                                    if (!v8)
                                                                                                                    {
                                                                                                                      v39 = 0;
                                                                                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_min_time_prefiltered_metadata"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v39);
                                                                                                                      v8 = v39;
                                                                                                                      if (!v8)
                                                                                                                      {
                                                                                                                        v38 = 0;
                                                                                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_time_elapsed"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v38);
                                                                                                                        v8 = v38;
                                                                                                                        if (!v8)
                                                                                                                        {
                                                                                                                          v37 = 0;
                                                                                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("distance_matrix_total_number_of_comparisons"), &unk_1E9328AC0, &unk_1E9328BB0, &unk_1E9328B80, &v37);
                                                                                                                          v8 = v37;
                                                                                                                          if (!v8)
                                                                                                                          {
                                                                                                                            v36 = 0;
                                                                                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("number_of_workouts_cycling"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v36);
                                                                                                                            v8 = v36;
                                                                                                                            if (!v8)
                                                                                                                            {
                                                                                                                              v35 = 0;
                                                                                                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("number_of_workouts_running"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v35);
                                                                                                                              v8 = v35;
                                                                                                                              if (!v8)
                                                                                                                              {
                                                                                                                                v34 = 0;
                                                                                                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("number_of_workouts_wheel_chair_run_pace"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v34);
                                                                                                                                v8 = v34;
                                                                                                                                if (!v8)
                                                                                                                                {
                                                                                                                                  v33 = 0;
                                                                                                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("parameter_distance_threshold"), &unk_1E9328AC0, &unk_1E9328BC8, &unk_1E9328AF0, &v33);
                                                                                                                                  v8 = v33;
                                                                                                                                  if (!v8)
                                                                                                                                  {
                                                                                                                                    v32 = 0;
                                                                                                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("parameter_filter_size"), &unk_1E9328AC0, &unk_1E9328AD8, &unk_1E9328AF0, &v32);
                                                                                                                                    v8 = v32;
                                                                                                                                    if (!v8)
                                                                                                                                    {
                                                                                                                                      v31 = 0;
                                                                                                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_from_healthkit_count_final_local_clusters"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v31);
                                                                                                                                      v8 = v31;
                                                                                                                                      if (!v8)
                                                                                                                                      {
                                                                                                                                        v30 = 0;
                                                                                                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_from_healthkit_count_final_remote_clusters"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v30);
                                                                                                                                        v8 = v30;
                                                                                                                                        if (!v8)
                                                                                                                                        {
                                                                                                                                          v29 = 0;
                                                                                                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_from_healthkit_count_local_clusters"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v29);
                                                                                                                                          v8 = v29;
                                                                                                                                          if (!v8)
                                                                                                                                          {
                                                                                                                                            v28 = 0;
                                                                                                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_from_healthkit_count_remote_clusters"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v28);
                                                                                                                                            v8 = v28;
                                                                                                                                            if (!v8)
                                                                                                                                            {
                                                                                                                                              v27 = 0;
                                                                                                                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_from_healthkit_footprint_delta"), &unk_1E9328AC0, &unk_1E9328B38, &unk_1E9328AF0, &v27);
                                                                                                                                              v8 = v27;
                                                                                                                                              if (!v8)
                                                                                                                                              {
                                                                                                                                                v26 = 0;
                                                                                                                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_from_healthkit_time_elapsed"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v26);
                                                                                                                                                v8 = v26;
                                                                                                                                                if (!v8)
                                                                                                                                                {
                                                                                                                                                  v25 = 0;
                                                                                                                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_average_time_save_new_cluster"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v25);
                                                                                                                                                  v8 = v25;
                                                                                                                                                  if (!v8)
                                                                                                                                                  {
                                                                                                                                                    v24 = 0;
                                                                                                                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_average_time_snapshot"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v24);
                                                                                                                                                    v8 = v24;
                                                                                                                                                    if (!v8)
                                                                                                                                                    {
                                                                                                                                                      v23 = 0;
                                                                                                                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_average_time_update_cluster"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v23);
                                                                                                                                                      v8 = v23;
                                                                                                                                                      if (!v8)
                                                                                                                                                      {
                                                                                                                                                        v22 = 0;
                                                                                                                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_footprint_delta"), &unk_1E9328AC0, &unk_1E9328B38, &unk_1E9328AF0, &v22);
                                                                                                                                                        v8 = v22;
                                                                                                                                                        if (!v8)
                                                                                                                                                        {
                                                                                                                                                          v21 = 0;
                                                                                                                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_max_time_save_new_cluster"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v21);
                                                                                                                                                          v8 = v21;
                                                                                                                                                          if (!v8)
                                                                                                                                                          {
                                                                                                                                                            v20 = 0;
                                                                                                                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_max_time_snapshot"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v20);
                                                                                                                                                            v8 = v20;
                                                                                                                                                            if (!v8)
                                                                                                                                                            {
                                                                                                                                                              v19 = 0;
                                                                                                                                                              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_max_time_update_cluster"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v19);
                                                                                                                                                              v8 = v19;
                                                                                                                                                              if (!v8)
                                                                                                                                                              {
                                                                                                                                                                v18 = 0;
                                                                                                                                                                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_min_time_save_new_cluster"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v18);
                                                                                                                                                                v8 = v18;
                                                                                                                                                                if (!v8)
                                                                                                                                                                {
                                                                                                                                                                  v17 = 0;
                                                                                                                                                                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_min_time_snapshot"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v17);
                                                                                                                                                                  v8 = v17;
                                                                                                                                                                  if (!v8)
                                                                                                                                                                  {
                                                                                                                                                                    v16 = 0;
                                                                                                                                                                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_min_time_update_cluster"), &unk_1E9328AC0, &unk_1E9328B98, &unk_1E9328AF0, &v16);
                                                                                                                                                                    v8 = v16;
                                                                                                                                                                    if (!v8)
                                                                                                                                                                    {
                                                                                                                                                                      v15 = 0;
                                                                                                                                                                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_healthkit_time_elapsed"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v15);
                                                                                                                                                                      v8 = v15;
                                                                                                                                                                      if (!v8)
                                                                                                                                                                      {
                                                                                                                                                                        v14 = 0;
                                                                                                                                                                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_watch_count_clusters"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v14);
                                                                                                                                                                        v8 = v14;
                                                                                                                                                                        if (!v8)
                                                                                                                                                                        {
                                                                                                                                                                          v13 = 0;
                                                                                                                                                                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_watch_footprint_delta"), &unk_1E9328AC0, &unk_1E9328B38, &unk_1E9328AF0, &v13);
                                                                                                                                                                          v8 = v13;
                                                                                                                                                                          if (!v8)
                                                                                                                                                                          {
                                                                                                                                                                            v12 = 0;
                                                                                                                                                                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("sync_to_watch_time_elapsed"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v12);
                                                                                                                                                                            v8 = v12;
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    objc_autoreleasePoolPop(v7);
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    v9 = v8 == 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_computeMetricsForUpdateRelevanceScoresEventWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D8231EA8]();
    v24 = 0;
    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_existing"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v24);
    v8 = v24;
    if (!v8)
    {
      v23 = 0;
      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_existing_zero_relevance"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v23);
      v8 = v23;
      if (!v8)
      {
        v22 = 0;
        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_existing_greaterthanzero_relevance"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v22);
        v8 = v22;
        if (!v8)
        {
          v21 = 0;
          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_new_zero_relevance"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v21);
          v8 = v21;
          if (!v8)
          {
            v20 = 0;
            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_new_greaterthanzero_relevance"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v20);
            v8 = v20;
            if (!v8)
            {
              v19 = 0;
              -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_relevance_decreased"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v19);
              v8 = v19;
              if (!v8)
              {
                v18 = 0;
                -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_relevance_increased"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v18);
                v8 = v18;
                if (!v8)
                {
                  v17 = 0;
                  -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_relevance_score_not_updated"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v17);
                  v8 = v17;
                  if (!v8)
                  {
                    v16 = 0;
                    -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_relevance_score_updated"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v16);
                    v8 = v16;
                    if (!v8)
                    {
                      v15 = 0;
                      -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_relevance_to_zero"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v15);
                      v8 = v15;
                      if (!v8)
                      {
                        v14 = 0;
                        -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("count_clusters_zero_to_relevance"), &unk_1E9328AC0, &unk_1E9328B68, &unk_1E9328AF0, &v14);
                        v8 = v14;
                        if (!v8)
                        {
                          v13 = 0;
                          -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("footprint_delta"), &unk_1E9328AC0, &unk_1E9328B38, &unk_1E9328AF0, &v13);
                          v8 = v13;
                          if (!v8)
                          {
                            v12 = 0;
                            -[RTWorkoutMetricsManager _updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:](self, "_updateNSNumberMetricsData:key:binsStart:binsEnd:gap:error:", v6, CFSTR("time_elapsed"), &unk_1E9328AC0, &unk_1E9328B50, &unk_1E9328AF0, &v12);
                            v8 = v12;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    objc_autoreleasePoolPop(v7);
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    v9 = v8 == 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_updateNSNumberMetricsData:(id)a3 key:(id)a4 binsStart:(id)a5 binsEnd:(id)a6 gap:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (!a8)
      goto LABEL_23;
    v25 = CFSTR("data");
    goto LABEL_22;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v32 = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: binsStart", v32, 2u);
    }

    if (!a8)
      goto LABEL_23;
    v25 = CFSTR("binsStart");
    goto LABEL_22;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v31 = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: binsEnd", v31, 2u);
    }

    if (!a8)
      goto LABEL_23;
    v25 = CFSTR("binsEnd");
LABEL_22:
    _RTErrorInvalidParameterCreate((uint64_t)v25);
    v23 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v30 = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: gap", v30, 2u);
    }

    if (a8)
    {
      v25 = CFSTR("gap");
      goto LABEL_22;
    }
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  v19 = (void *)MEMORY[0x1D8231EA8]();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binsFromStart:toEnd:gap:](RTMetric, "binsFromStart:toEnd:gap:", v15, v16, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTMetric binForNumber:bins:](RTMetric, "binForNumber:bins:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v14);
  objc_autoreleasePoolPop(v19);
  v23 = 1;
LABEL_24:

  return v23;
}

- (RTManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end
