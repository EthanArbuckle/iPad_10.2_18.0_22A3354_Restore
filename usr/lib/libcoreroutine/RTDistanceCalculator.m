@implementation RTDistanceCalculator

void __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (double)distanceFromLocation:(id)a3 toLocation:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
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
  void *v28;
  void *v29;
  id v30;
  char v31;
  id v32;
  id v33;
  id *v35;
  _QWORD block[4];
  id v37;
  id v38;
  RTDistanceCalculator *v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  id *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[16];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0x7FEFFFFFFFFFFFFFLL;
  v11 = 1.79769313e308;
  if (v8 && v9)
  {
    v35 = a5;
    v43 = 0;
    v44 = (id *)&v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__65;
    v47 = __Block_byref_object_dispose__65;
    v48 = 0;
    v12 = dispatch_semaphore_create(0);
    -[RTNotifier queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke;
    block[3] = &unk_1E929D460;
    v37 = v10;
    v38 = v8;
    v39 = self;
    v41 = &v43;
    v42 = &v49;
    v14 = v12;
    v40 = v14;
    dispatch_async(v13, block);

    v15 = v14;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v17))
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSinceDate:", v16);
    v20 = v19;
    v21 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_49);
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
    v53 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v53, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_retainAutorelease(v29);

      v31 = 0;
    }
    else
    {
LABEL_8:
      v30 = 0;
      v31 = 1;
    }

    v32 = v30;
    if ((v31 & 1) == 0)
      objc_storeStrong(v44 + 5, v30);
    if (v35)
    {
      v33 = v44[5];
      if (v33)
        *v35 = objc_retainAutorelease(v33);
    }
    v11 = v50[3];

    _Block_object_dispose(&v43, 8);
  }
  _Block_object_dispose(&v49, 8);

  return v11;
}

void __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "locationShifter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RTDistanceCalculator_distanceFromLocation_toLocation_error___block_invoke_2;
  v7[3] = &unk_1E929D438;
  v9 = *(_QWORD *)(a1 + 72);
  v6 = *(_OWORD *)(a1 + 56);
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v2, "distanceFromLocation:locationShifter:handler:", v3, v4, v7);

}

- (RTLocationShifter)locationShifter
{
  RTLocationShifter *locationShifter;
  RTLocationShifter *v4;
  RTLocationShifter *v5;

  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    v4 = (RTLocationShifter *)objc_opt_new();
    v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }
  return locationShifter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
}

+ (id)distanceMetricToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Centroid");
  else
    return off_1E929D4A0[a3];
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (double)distanceFromLocationCoordinate:(CLLocationCoordinate2D *)a3 toLocationCoordinate:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  double result;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = 0;
    v7 = "Invalid parameter not satisfying: fromLocationCoordinate";
    v8 = (uint8_t *)&v10;
LABEL_9:
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    goto LABEL_7;
  }
  if (a4)
  {
    RTCommonCalculateDistanceHighPrecision();
    return result;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v9 = 0;
    v7 = "Invalid parameter not satisfying: toLocationCoordinate";
    v8 = (uint8_t *)&v9;
    goto LABEL_9;
  }
LABEL_7:

  return 1.79769313e308;
}

- (double)fractionOfUncertaintyAreaOverlapOfTheSmalestUncertaintyAreaBetweenLocation:(id)a3 otherLocation:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  const char *v16;
  uint8_t *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v23;
  uint8_t buf[2];
  __int16 v25;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = 0.0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v25 = 0;
    v16 = "Invalid parameter not satisfying: location";
    v17 = (uint8_t *)&v25;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = 0.0;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: otherLocation";
    v17 = buf;
    goto LABEL_10;
  }
  v23 = 0;
  -[RTDistanceCalculator distanceFromLocation:toLocation:error:](self, "distanceFromLocation:toLocation:error:", v8, v9, &v23);
  v12 = v11;
  v13 = v23;
  v14 = v13;
  if (v13)
  {
    v15 = 0.0;
    if (a5)
    {
      v14 = objc_retainAutorelease(v13);
      *a5 = v14;
    }
  }
  else
  {
    objc_msgSend(v8, "horizontalUncertainty");
    v19 = v18;
    objc_msgSend(v10, "horizontalUncertainty");
    -[RTDistanceCalculator computeCircleIntersectionPercentageOfMinRadiusCircleWithDistance:firstRadius:secondRadius:](self, "computeCircleIntersectionPercentageOfMinRadiusCircleWithDistance:firstRadius:secondRadius:", v12, v19, v20);
    v15 = v21;
  }
LABEL_12:

  return v15;
}

- (BOOL)checkFractionAreaOverlapBetweenLocation:(id)a3 otherLocation:(id)a4 largerThanThreshold:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v19 = 0;
  -[RTDistanceCalculator fractionOfUncertaintyAreaOverlapOfTheSmalestUncertaintyAreaBetweenLocation:otherLocation:error:](self, "fractionOfUncertaintyAreaOverlapOfTheSmalestUncertaintyAreaBetweenLocation:otherLocation:error:", v10, v11, &v19);
  v13 = v12;
  v14 = v19;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    -[RTDistanceCalculator distanceFromLocation:toLocation:error:](self, "distanceFromLocation:toLocation:error:", v10, v11, 0);
    *(_DWORD *)buf = 138413314;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2048;
    v25 = v18;
    v26 = 2048;
    v27 = v13;
    v28 = 2048;
    v29 = a5;
    _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "check uncertainty overlap for reference location, %@, other location, %@, distance between locations, %f, overlap percentage, %f, overlap treshold, %f", buf, 0x34u);
  }

  if (v14)
  {
    v16 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }
  else
  {
    v16 = v13 > a5;
  }

  return v16;
}

- (BOOL)checkConsistencyBetweenLocation:(id)a3 otherLocation:(id)a4 error:(id *)a5
{
  return -[RTDistanceCalculator checkFractionAreaOverlapBetweenLocation:otherLocation:largerThanThreshold:error:](self, "checkFractionAreaOverlapBetweenLocation:otherLocation:largerThanThreshold:error:", a3, a4, a5, 0.1);
}

- (double)computeCircleIntersectionAreaWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5
{
  double v5;
  double result;
  double v9;
  long double v10;

  v5 = a4;
  result = 0.0;
  if (a4 + a5 > a3)
  {
    if (a4 >= a5)
      a4 = a5;
    if (a4 != 0.0)
    {
      if (v5 >= a5)
        v9 = v5;
      else
        v9 = a5;
      if (a4 + a3 <= v9)
      {
        return a4 * (a4 * 3.14159265);
      }
      else
      {
        v10 = v5 * v5 * acos((a3 * a3 + v5 * v5 - a5 * a5) / (a3 + a3) / v5);
        return v10
             + a5 * a5 * acos((a3 * a3 - v5 * v5 + a5 * a5) / (a3 + a3) / a5)
             + sqrt((a3 + v5 + a5) * ((a3 + v5 - a5) * ((v5 - a3 + a5) * (a3 - v5 + a5)))) * -0.5;
      }
    }
  }
  return result;
}

- (double)computeCircleIntersectionPercentageOfMinRadiusCircleWithDistance:(double)a3 firstRadius:(double)a4 secondRadius:(double)a5
{
  double v5;
  BOOL v6;
  double result;
  double v8;

  if (a4 >= a5)
    v5 = a5;
  else
    v5 = a4;
  if (v5 == 0.0)
  {
    if (a4 < a5)
      a4 = a5;
    v6 = a4 < a3;
    result = 1.0;
    if (v6)
      return 0.0;
  }
  else
  {
    -[RTDistanceCalculator computeCircleIntersectionAreaWithDistance:firstRadius:secondRadius:](self, "computeCircleIntersectionAreaWithDistance:firstRadius:secondRadius:", a3);
    return v8 / (v5 * (v5 * 3.14159265));
  }
  return result;
}

- (double)distanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 distanceMetric:(int64_t)a7 threshold:(double)a8 error:(id *)a9
{
  double result;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  uint8_t v21[8];
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromLocations", v21, 2u);
    }

    if (!a9)
      return 1.79769313e308;
    v12 = CFSTR("fromLocations");
LABEL_15:
    _RTErrorInvalidParameterCreate((uint64_t)v12);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    return 1.79769313e308;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toLocations", v21, 2u);
    }

    if (!a9)
      return 1.79769313e308;
    v12 = CFSTR("toLocations");
    goto LABEL_15;
  }
  if (!a4 || !a6)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("locations count is zero");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = (const __CFString **)v25;
    v18 = &v24;
LABEL_17:
    objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1, a6, a7, a8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (a9)
      *a9 = objc_retainAutorelease(v20);

    return 1.79769313e308;
  }
  if (a7 == 1)
  {
    -[RTDistanceCalculator _centroidDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:error:](self, "_centroidDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:error:", a8);
    return result;
  }
  if ((a7 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v22 = *MEMORY[0x1E0CB2D50];
    v23 = CFSTR("invalid distance metric");
    v16 = (void *)MEMORY[0x1E0C99D80];
    v17 = &v23;
    v18 = &v22;
    goto LABEL_17;
  }
  -[RTDistanceCalculator _dtwDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:distanceMetric:threshold:error:](self, "_dtwDistanceFromLocations:countOfFromLocations:toLocations:countOfToLocations:distanceMetric:threshold:error:", a8);
  return result;
}

- (double)_dtwDistanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 distanceMetric:(int64_t)a7 threshold:(double)a8 error:(id *)a9
{
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_class *v40;
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromLocations", buf, 2u);
    }

    if (!a9)
      return 1.79769313e308;
    v27 = CFSTR("fromLocations");
    goto LABEL_21;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toLocations", buf, 2u);
    }

    if (!a9)
      return 1.79769313e308;
    v27 = CFSTR("toLocations");
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v27);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    return 1.79769313e308;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 && a6)
  {
    v19 = (void *)MEMORY[0x1D8231EA8]();
    v43 = 0;
    -[RTDistanceCalculator _fastDTWForX:xCount:y:yCount:radius:distanceMetric:threshold:error:](self, "_fastDTWForX:xCount:y:yCount:radius:distanceMetric:threshold:error:", a3, a4, a5, a6, a7, &v43, 1.0, a8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v43;
    v22 = 1.79769313e308;
    if (!v21 && v20)
    {
      objc_msgSend(v20, "distance");
      v22 = v23;

      v20 = 0;
    }

    objc_autoreleasePoolPop(v19);
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a9 && v21)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v45 = v41;
        v46 = 2112;
        v47 = v42;
        v48 = 2112;
        v49 = (unint64_t)v21;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

      }
      v21 = objc_retainAutorelease(v21);
      *a9 = v21;
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "timeIntervalSinceDate:", v18);
        v37 = v36;
        +[RTRuntime footprint](RTRuntime, "footprint");
        *(_DWORD *)buf = 138414082;
        v45 = v33;
        v46 = 2112;
        v47 = v34;
        v48 = 2048;
        v49 = a4;
        v50 = 2048;
        v51 = a6;
        v52 = 2048;
        v53 = a8;
        v54 = 2048;
        v55 = v22;
        v56 = 2048;
        v57 = v37;
        v58 = 2048;
        v59 = v38;
        _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, fromLocations count, %lu, toLocations count, %lu, dtw threshold, %.5f, dtw distance, %.5f, latency, %.4f sec, footprint, %.4f MB", buf, 0x52u);

      }
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D18598];
    v60 = *MEMORY[0x1E0CB2D50];
    v61[0] = CFSTR("locations count is zero");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 7, v31);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (a9)
    {
      v21 = objc_retainAutorelease(v21);
      *a9 = v21;
    }
    v22 = 1.79769313e308;
  }

  return v22;
}

- (id)_convertToRTPairsFromLocations:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v21 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1D8231EA8]();
          v13 = objc_alloc(MEMORY[0x1E0D18408]);
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "latitude");
          objc_msgSend(v14, "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "longitude");
          objc_msgSend(v16, "numberWithDouble:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v13, "initWithFirstObject:secondObject:", v15, v17);

          objc_msgSend(v6, "addObject:", v18);
          objc_autoreleasePoolPop(v12);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v8);
    }

    v5 = v21;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("locations"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_fastDTWForX:(CLLocationCoordinate2D *)a3 xCount:(unint64_t)a4 y:(CLLocationCoordinate2D *)a5 yCount:(unint64_t)a6 radius:(double)a7 distanceMetric:(int64_t)a8 threshold:(double)a9 error:(id *)a10
{
  double v20;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const __CFString *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  CLLocationCoordinate2D *v34;
  id v35;
  CLLocationCoordinate2D *v36;
  const char *v37;
  id v38;
  CLLocationCoordinate2D *v39;
  double v40;
  objc_class *v41;
  void *v42;
  void *v44;
  void *context;
  CLLocationCoordinate2D *v46;
  void *v47;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  id v54;
  id v55;
  _BYTE buf[12];
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a5)
    {
      v20 = a7 + 2.0;
      if (v20 > (double)a4 || v20 > (double)a6)
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        -[RTDistanceCalculator _dtwForX:xCount:y:yCount:window:distanceMetric:threshold:error:](self, "_dtwForX:xCount:y:yCount:window:distanceMetric:threshold:error:", a3, a4, a5, a6, v22, a8, a9, &v55);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = v55;

        if (a10 && v24)
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v27;
            v57 = 2112;
            v58 = v28;
            v59 = 2112;
            v60 = v24;
LABEL_37:
            _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

            goto LABEL_27;
          }
          goto LABEL_27;
        }
        goto LABEL_48;
      }
      v33 = (void *)MEMORY[0x1D8231EA8]();
      *(_QWORD *)buf = 0;
      v54 = 0;
      v34 = -[RTDistanceCalculator _reduce_by_half:count:outputCount:error:](self, "_reduce_by_half:count:outputCount:error:", a3, a4, buf, &v54);
      v35 = v54;
      if (v35
        || (v46 = v34,
            v52 = 0,
            v53 = 0,
            v36 = -[RTDistanceCalculator _reduce_by_half:count:outputCount:error:](self, "_reduce_by_half:count:outputCount:error:", a5, a6, &v53, &v52), (v35 = v52) != 0))
      {
        v24 = v35;
        v23 = 0;
      }
      else
      {
        context = v33;
        v51 = 0;
        -[RTDistanceCalculator _fastDTWForX:xCount:y:yCount:radius:distanceMetric:threshold:error:](self, "_fastDTWForX:xCount:y:yCount:radius:distanceMetric:threshold:error:", v46, *(_QWORD *)buf, v36, v53, a8, &v51, a7, a9);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v51;
        if (!v38)
        {
          v39 = v36;
          objc_msgSend(v32, "distance");
          if (v40 > a9)
          {
            if (v46)
              free(v46);
            if (v36)
              free(v36);
            objc_autoreleasePoolPop(context);
            v23 = 0;
            v24 = 0;
            goto LABEL_49;
          }
          if (v46)
            free(v46);
          v37 = a2;
          if (v39)
            free(v39);
          objc_msgSend(v32, "cellIndices");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0;
          -[RTDistanceCalculator _expand_windowWithPath:len_x:len_y:radius:error:](self, "_expand_windowWithPath:len_x:len_y:radius:error:", v44, (__int16)a4, (__int16)a6, (int)a7, &v50);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v50;

          if (v24)
          {
            v23 = 0;
            v42 = v47;
          }
          else
          {

            v49 = 0;
            -[RTDistanceCalculator _dtwForX:xCount:y:yCount:window:distanceMetric:threshold:error:](self, "_dtwForX:xCount:y:yCount:window:distanceMetric:threshold:error:", a3, a4, a5, a6, v47, a8, a9, &v49);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            v24 = v49;
            v42 = v47;
            if (!v24)
            {

              objc_autoreleasePoolPop(context);
              goto LABEL_48;
            }
            v32 = 0;
          }

          v33 = context;
          goto LABEL_25;
        }
        v24 = v38;

        v23 = 0;
        v33 = context;
      }
      v37 = a2;
LABEL_25:
      objc_autoreleasePoolPop(v33);
      if (a10)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(v37);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v27;
          v57 = 2112;
          v58 = v28;
          v59 = 2112;
          v60 = v24;
          goto LABEL_37;
        }
LABEL_27:

        v24 = objc_retainAutorelease(v24);
        v32 = 0;
        *a10 = v24;
LABEL_49:

        return v32;
      }
LABEL_48:
      v23 = v23;
      v32 = v23;
      goto LABEL_49;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", buf, 2u);
    }

    if (a10)
    {
      v30 = CFSTR("y");
      goto LABEL_19;
    }
LABEL_20:
    v32 = 0;
    return v32;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
  }

  if (!a10)
    goto LABEL_20;
  v30 = CFSTR("x");
LABEL_19:
  _RTErrorInvalidParameterCreate((uint64_t)v30);
  v32 = 0;
  *a10 = (id)objc_claimAutoreleasedReturnValue();
  return v32;
}

- (id)_dtwForX:(CLLocationCoordinate2D *)a3 xCount:(unint64_t)a4 y:(CLLocationCoordinate2D *)a5 yCount:(unint64_t)a6 window:(id)a7 distanceMetric:(int64_t)a8 threshold:(double)a9 error:(id *)a10
{
  id v15;
  void *v16;
  _UNKNOWN **v17;
  void *v18;
  NSObject *v19;
  const __CFString *v20;
  NSObject *v21;
  id v22;
  RTDTWResult *v23;
  NSObject *v24;
  void *v25;
  __int16 v26;
  void *v27;
  int v28;
  void *v29;
  RTCellIndex *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  RTCostMatrixCell *v39;
  RTCellIndex *v40;
  RTCostMatrixCell *v41;
  RTCellIndex *v42;
  uint64_t j;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  void *v55;
  void *v56;
  const __CFString **v57;
  uint64_t *v58;
  void *v60;
  int v61;
  RTCellIndex *v62;
  CLLocationCoordinate2D *v63;
  RTCellIndex *v64;
  id *v65;
  double v66;
  CLLocationCoordinate2D *v67;
  RTCellIndex *v68;
  void *v69;
  RTCostMatrixCell *v70;
  RTCellIndex *v71;
  RTCostMatrixCell *v72;
  void *v73;
  void *v74;
  RTCostMatrixCell *v75;
  RTCellIndex *v76;
  RTCostMatrixCell *v77;
  void *v78;
  RTCostMatrixCell *v79;
  RTCellIndex *v80;
  RTCostMatrixCell *v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  RTCostMatrixCell *v94;
  double v95;
  double v96;
  RTCellIndex *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  RTCostMatrixCell *v106;
  double v107;
  double v108;
  RTCellIndex *v109;
  uint64_t v110;
  double v111;
  RTCostMatrixCell *v112;
  double v113;
  RTCostMatrixCell *v114;
  id *v115;
  NSObject *v116;
  RTCellIndex *v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  int v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  RTDTWResult *v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  objc_class *v138;
  void *v139;
  void *v140;
  const char *aSelector;
  uint64_t v142;
  CLLocationCoordinate2D *v143;
  CLLocationCoordinate2D *v144;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  id obj;
  uint64_t v150;
  uint64_t v151;
  int64_t v152;
  void *v153;
  RTCellIndex *v155;
  void *v156;
  void *context;
  void *v158;
  void *v159;
  void *v160;
  RTCellIndex *v161;
  RTCellIndex *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint8_t buf[4];
  void *v172;
  __int16 v173;
  void *v174;
  __int16 v175;
  RTCellIndex *v176;
  uint64_t v177;
  const __CFString *v178;
  uint64_t v179;
  const __CFString *v180;
  _BYTE v181[128];
  _BYTE v182[128];
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  v15 = a7;
  v16 = v15;
  v144 = a3;
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
    }

    if (!a10)
      goto LABEL_87;
    v20 = CFSTR("x");
    goto LABEL_14;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", buf, 2u);
    }

    if (!a10)
      goto LABEL_87;
    v20 = CFSTR("y");
LABEL_14:
    _RTErrorInvalidParameterCreate((uint64_t)v20);
    v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v23 = 0;
    *a10 = v22;
    goto LABEL_88;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: window", buf, 2u);
    }

    if (a10)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("window"));
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      goto LABEL_15;
    }
    v16 = 0;
LABEL_87:
    v23 = 0;
    goto LABEL_88;
  }
  v143 = a5;
  v152 = a8;
  aSelector = a2;
  v17 = &off_1E9294000;
  if (objc_msgSend(v15, "count"))
  {
    v18 = v16;
  }
  else
  {
    v25 = (void *)MEMORY[0x1D8231EA8]();
    v18 = (void *)objc_opt_new();
    if (a4)
    {
      v26 = 0;
      do
      {
        v27 = (void *)MEMORY[0x1D8231EA8]();
        if (a6)
        {
          v28 = 0;
          do
          {
            v29 = (void *)MEMORY[0x1D8231EA8]();
            v30 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", v26, (__int16)v28);
            objc_msgSend(v18, "addObject:", v30);

            objc_autoreleasePoolPop(v29);
            ++v28;
          }
          while (a6 > (__int16)v28);
        }
        objc_autoreleasePoolPop(v27);
        ++v26;
      }
      while (a4 > v26);
    }

    objc_autoreleasePoolPop(v25);
  }
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v31 = v18;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v167, v182, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v168;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v168 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * i);
        v37 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v36, "setX:", (__int16)(objc_msgSend(v36, "x") + 1));
        objc_msgSend(v36, "setY:", (__int16)(objc_msgSend(v36, "y") + 1));
        objc_autoreleasePoolPop(v37);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v167, v182, 16);
    }
    while (v33);
  }

  v142 = MEMORY[0x1D8231EA8]();
  v38 = (void *)objc_opt_new();
  v39 = [RTCostMatrixCell alloc];
  v40 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", 0, 0);
  v41 = -[RTCostMatrixCell initWithDistance:cellIndex:](v39, "initWithDistance:cellIndex:", v40, 0.0);
  v42 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", 0, 0);
  v153 = v38;
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, v42);

  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  obj = v31;
  v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v181, 16);
  if (!v151)
  {
    v155 = 0;
    goto LABEL_76;
  }
  v155 = 0;
  v150 = *(_QWORD *)v164;
  v148 = *MEMORY[0x1E0D18598];
  v146 = a6;
  v147 = *MEMORY[0x1E0CB2D50];
  while (2)
  {
    for (j = 0; j != v151; ++j)
    {
      if (*(_QWORD *)v164 != v150)
        objc_enumerationMutation(obj);
      v44 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * j);
      context = (void *)MEMORY[0x1D8231EA8]();
      v45 = objc_msgSend(v44, "x");
      v156 = v44;
      v46 = objc_msgSend(v44, "y");
      v47 = (int)v45 - 1;
      v48 = (__int16)v47;
      v49 = objc_msgSend(objc_alloc((Class)v17[238]), "initWithX:Y:", v48, v46);
      v50 = (int)v46 - 1;
      v51 = (__int16)v50;
      v159 = (void *)objc_msgSend(objc_alloc((Class)v17[238]), "initWithX:Y:", v45, v51);
      v160 = (void *)objc_msgSend(objc_alloc((Class)v17[238]), "initWithX:Y:", v48, v51);
      v158 = (void *)v49;
      if (v152 == 3)
      {
        v53 = v153;
        if (v47 < a4 && v50 < a6)
        {
          v67 = &v144[v47];
          v64 = v155;
          v161 = v155;
          v65 = (id *)&v161;
          -[RTDistanceCalculator _dtwDistanceEuclideanBetweenX:y:error:](self, "_dtwDistanceEuclideanBetweenX:y:error:", v67, &v143[v50], &v161);
          goto LABEL_54;
        }
        v55 = (void *)MEMORY[0x1E0CB35C8];
        v177 = v147;
        v178 = CFSTR("index out of bounds");
        v56 = (void *)MEMORY[0x1E0C99D80];
        v57 = &v178;
        v58 = &v177;
LABEL_53:
        objc_msgSend(v56, "dictionaryWithObjects:forKeys:count:", v57, v58, 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "errorWithDomain:code:userInfo:", v148, 7, v60);
        v61 = 0;
        v62 = v155;
        v155 = (RTCellIndex *)objc_claimAutoreleasedReturnValue();
        goto LABEL_70;
      }
      v52 = 0.0;
      v53 = v153;
      if (v152 == 2)
      {
        if ((int)v47 < a4 && (int)v50 < a6)
        {
          v63 = &v144[(int)v47];
          v64 = v155;
          v162 = v155;
          v65 = (id *)&v162;
          -[RTDistanceCalculator _dtwDistanceFirstNormBetweenX:y:error:](self, "_dtwDistanceFirstNormBetweenX:y:error:", v63, &v143[(int)v50], &v162);
LABEL_54:
          v52 = v66;
          v68 = (RTCellIndex *)*v65;

          v155 = v68;
          v49 = (uint64_t)v158;
          goto LABEL_55;
        }
        v55 = (void *)MEMORY[0x1E0CB35C8];
        v179 = v147;
        v180 = CFSTR("index out of bounds");
        v56 = (void *)MEMORY[0x1E0C99D80];
        v57 = &v180;
        v58 = &v179;
        goto LABEL_53;
      }
LABEL_55:
      objc_msgSend(v53, "objectForKeyedSubscript:", v49);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v69)
      {
        v70 = [RTCostMatrixCell alloc];
        v71 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", 0xFFFFFFFFLL, 0xFFFFFFFFLL);
        v72 = -[RTCostMatrixCell initWithDistance:cellIndex:](v70, "initWithDistance:cellIndex:", v71, 1.79769313e308);
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v72, v49);

      }
      v73 = v159;
      objc_msgSend(v53, "objectForKeyedSubscript:", v159);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v74)
      {
        v75 = [RTCostMatrixCell alloc];
        v76 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", 0xFFFFFFFFLL, 0xFFFFFFFFLL);
        v77 = -[RTCostMatrixCell initWithDistance:cellIndex:](v75, "initWithDistance:cellIndex:", v76, 1.79769313e308);
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v77, v159);

        v73 = v159;
      }
      objc_msgSend(v53, "objectForKeyedSubscript:", v160);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v78)
      {
        v79 = [RTCostMatrixCell alloc];
        v80 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", 0xFFFFFFFFLL, 0xFFFFFFFFLL);
        v81 = -[RTCostMatrixCell initWithDistance:cellIndex:](v79, "initWithDistance:cellIndex:", v80, 1.79769313e308);
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v81, v160);

        v73 = v159;
      }
      objc_msgSend(v53, "objectForKeyedSubscript:", v49);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "distance");
      v84 = v83;
      objc_msgSend(v53, "objectForKeyedSubscript:", v73);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "distance");
      v87 = v86;

      if (v84 >= v87)
      {
        objc_msgSend(v53, "objectForKeyedSubscript:", v73);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "distance");
        v102 = v101;
        objc_msgSend(v53, "objectForKeyedSubscript:", v160);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "distance");
        v105 = v104;

        v106 = [RTCostMatrixCell alloc];
        if (v102 >= v105)
        {
          objc_msgSend(v53, "objectForKeyedSubscript:", v160);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "distance");
          v108 = v52 + v113;
          v109 = [RTCellIndex alloc];
          v110 = v48;
        }
        else
        {
          objc_msgSend(v53, "objectForKeyedSubscript:", v73);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "distance");
          v108 = v52 + v107;
          v109 = [RTCellIndex alloc];
          v110 = v45;
        }
        v62 = -[RTCellIndex initWithX:Y:](v109, "initWithX:Y:", v110, v51);
        v114 = -[RTCostMatrixCell initWithDistance:cellIndex:](v106, "initWithDistance:cellIndex:", v62, v108);
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v114, v156);

        v61 = 1;
        a6 = v146;
      }
      else
      {
        objc_msgSend(v53, "objectForKeyedSubscript:", v49);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "distance");
        v90 = v89;
        objc_msgSend(v53, "objectForKeyedSubscript:", v160);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "distance");
        v93 = v92;

        v94 = [RTCostMatrixCell alloc];
        a6 = v146;
        if (v90 >= v93)
        {
          objc_msgSend(v53, "objectForKeyedSubscript:", v160);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "distance");
          v96 = v52 + v111;
          v97 = [RTCellIndex alloc];
          v98 = v48;
          v99 = v51;
        }
        else
        {
          objc_msgSend(v53, "objectForKeyedSubscript:", v49);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "distance");
          v96 = v52 + v95;
          v97 = [RTCellIndex alloc];
          v98 = v48;
          v99 = v46;
        }
        v62 = -[RTCellIndex initWithX:Y:](v97, "initWithX:Y:", v98, v99);
        v112 = -[RTCostMatrixCell initWithDistance:cellIndex:](v94, "initWithDistance:cellIndex:", v62, v96);
        objc_msgSend(v53, "setObject:forKeyedSubscript:", v112, v156);

        v61 = 1;
      }
LABEL_70:

      objc_autoreleasePoolPop(context);
      if (!v61)
      {
        v17 = &off_1E9294000;
        goto LABEL_76;
      }
      v17 = &off_1E9294000;
    }
    v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v181, 16);
    if (v151)
      continue;
    break;
  }
LABEL_76:

  v115 = a10;
  if (a10 && v155)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v116 = objc_claimAutoreleasedReturnValue();
    v117 = v155;
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    {
      v138 = (objc_class *)objc_opt_class();
      NSStringFromClass(v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v172 = v139;
      v173 = 2112;
      v174 = v140;
      v115 = a10;
      v175 = 2112;
      v176 = v155;
      _os_log_error_impl(&dword_1D1A22000, v116, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v23 = 0;
    *v115 = objc_retainAutorelease(v155);
    v118 = (void *)v142;
    v119 = v153;
  }
  else
  {
    v120 = (void *)objc_opt_new();
    if ((unsigned __int16)a6 | (unsigned __int16)a4)
    {
      LOWORD(v121) = a6;
      LOWORD(v122) = a4;
      do
      {
        v123 = (void *)MEMORY[0x1D8231EA8]();
        v124 = (void *)objc_msgSend(objc_alloc((Class)v17[238]), "initWithX:Y:", (__int16)(v122 - 1), (__int16)(v121 - 1));
        objc_msgSend(v120, "addObject:", v124);

        v125 = (void *)objc_msgSend(objc_alloc((Class)v17[238]), "initWithX:Y:", (__int16)v122, (__int16)v121);
        objc_msgSend(v153, "objectForKeyedSubscript:", v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "cellIndex");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v127, "x");

        objc_msgSend(v153, "objectForKeyedSubscript:", v125);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "cellIndex");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = objc_msgSend(v129, "y");

        objc_autoreleasePoolPop(v123);
      }
      while (v121 | v122);
    }
    v130 = (void *)objc_msgSend(objc_alloc((Class)v17[238]), "initWithX:Y:", (__int16)a4, (__int16)a6);
    v131 = [RTDTWResult alloc];
    objc_msgSend(v153, "objectForKeyedSubscript:", v130);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "distance");
    v134 = v133;
    objc_msgSend(v120, "reverseObjectEnumerator");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "allObjects");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[RTDTWResult initWithDistance:cellIndices:](v131, "initWithDistance:cellIndices:", v136, v134);

    v119 = 0;
    v117 = v155;
    v118 = (void *)v142;
  }

  objc_autoreleasePoolPop(v118);
  v16 = 0;
LABEL_88:

  return v23;
}

- (CLLocationCoordinate2D)_reduce_by_half:(CLLocationCoordinate2D *)a3 count:(unint64_t)a4 outputCount:(unint64_t *)a5 error:(id *)a6
{
  char *v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  CLLocationCoordinate2D *v15;
  unint64_t v16;
  void *v17;
  double latitude;
  double longitude;
  double v20;
  double v21;
  void *v22;
  NSObject *v23;
  CLLocationCoordinate2D *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = (char *)malloc_type_malloc(((8 * a4) & 0xFFFFFFFFFFFFFFF0) + 16, 0x1000040451B5BE8uLL);
    v11 = v10;
    v12 = 0;
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0)
    {
      v13 = (((a4 & 0xFFFFFFFFFFFFFFFELL) - 1) >> 1) + 1;
      v14 = v10 + 8;
      v15 = a3 + 1;
      v16 = 1;
      while (1)
      {
        v17 = (void *)MEMORY[0x1D8231EA8]();
        if (v16 >= a4)
          break;
        latitude = v15[-1].latitude;
        longitude = v15[-1].longitude;
        v20 = v15->latitude;
        v21 = v15->longitude;
        v15 += 2;
        ++v12;
        *(CLLocationCoordinate2D *)(v14 - 8) = CLLocationCoordinate2DMake((latitude + v20) * 0.5, (longitude + v21) * 0.5);
        objc_autoreleasePoolPop(v17);
        v16 += 2;
        v14 += 16;
        if (v13 == v12)
        {
          v22 = 0;
          LODWORD(v12) = v13;
          goto LABEL_13;
        }
      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0D18598];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("index out of bounds");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 7, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v17);
    }
    else
    {
      v22 = 0;
    }
LABEL_13:
    v24 = (CLLocationCoordinate2D *)malloc_type_realloc(v11, 16 * v12, 0x1000040451B5BE8uLL);
    *a5 = v12;
    if (v22)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v22);
      if (v24)
      {
        free(v24);
        v24 = 0;
      }
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v29 = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", (uint8_t *)&v29, 2u);
    }

    if (a6)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("x"));
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v24;
}

- (id)_expand_windowWithPath:(id)a3 len_x:(signed __int16)a4 len_y:(signed __int16)a5 radius:(signed __int16)a6 error:(id *)a7
{
  int v8;
  id v9;
  void *v10;
  char *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  RTCellIndex *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  RTCellIndex *v25;
  RTCellIndex *v26;
  RTCellIndex *v27;
  RTCellIndex *v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  void *v33;
  RTCellIndex *v34;
  int v35;
  NSObject *v36;
  void *v38;
  void *v39;
  int v40;
  int v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  void *context;
  char *v46;
  void *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[16];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v8 = a6;
  v40 = a4;
  v41 = a5;
  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    v39 = (void *)objc_opt_new();
    v38 = (void *)MEMORY[0x1D8231EA8]();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = v9;
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v44)
    {
      v43 = *(_QWORD *)v54;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v54 != v43)
            objc_enumerationMutation(obj);
          v46 = v11;
          v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v11);
          context = (void *)MEMORY[0x1D8231EA8]();
          if ((__int16)-(__int16)v8 <= v8)
          {
            LOWORD(v13) = -(__int16)v8;
            do
            {
              v14 = (void *)MEMORY[0x1D8231EA8]();
              LOWORD(v15) = -(__int16)v8;
              do
              {
                v16 = (void *)MEMORY[0x1D8231EA8]();
                v17 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)(objc_msgSend(v12, "x") + v13), (__int16)(objc_msgSend(v12, "y") + v15));
                objc_msgSend(v10, "addObject:", v17);

                objc_autoreleasePoolPop(v16);
                v15 = (__int16)(v15 + 1);
              }
              while (v15 <= v8);
              objc_autoreleasePoolPop(v14);
              v13 = (__int16)(v13 + 1);
            }
            while (v13 <= v8);
          }
          objc_autoreleasePoolPop(context);
          v11 = v46 + 1;
        }
        while (v46 + 1 != (char *)v44);
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      }
      while (v44);
    }

    v18 = (void *)objc_opt_new();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v48 = v10;
    v19 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v50 != v21)
            objc_enumerationMutation(v48);
          v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v24 = (void *)MEMORY[0x1D8231EA8]();
          v25 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)(2 * objc_msgSend(v23, "x")), (__int16)(2 * objc_msgSend(v23, "y")));
          objc_msgSend(v18, "addObject:", v25);

          v26 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)(2 * objc_msgSend(v23, "x")), (__int16)((2 * objc_msgSend(v23, "y")) | 1));
          objc_msgSend(v18, "addObject:", v26);

          v27 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)((2 * objc_msgSend(v23, "x")) | 1), (__int16)(2 * objc_msgSend(v23, "y")));
          objc_msgSend(v18, "addObject:", v27);

          v28 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)((2 * objc_msgSend(v23, "x")) | 1), (__int16)((2 * objc_msgSend(v23, "y")) | 1));
          objc_msgSend(v18, "addObject:", v28);

          objc_autoreleasePoolPop(v24);
        }
        v20 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      }
      while (v20);
    }

    v29 = v39;
    if (v40 < 1)
      goto LABEL_35;
    LOWORD(v30) = 0;
    v31 = 0;
    while (1)
    {
      v47 = (void *)MEMORY[0x1D8231EA8]();
      if (v41 <= (__int16)v31)
      {
        v35 = 0xFFFF;
        goto LABEL_34;
      }
      v32 = 0xFFFF;
      while (1)
      {
        v33 = (void *)MEMORY[0x1D8231EA8]();
        v34 = -[RTCellIndex initWithX:Y:]([RTCellIndex alloc], "initWithX:Y:", (__int16)v30, (__int16)v31);
        if (objc_msgSend(v18, "containsObject:", v34))
        {
          objc_msgSend(v39, "addObject:", v34);
          if ((_WORD)v32 == 0xFFFF)
            v35 = v31;
          else
            v35 = v32;
          goto LABEL_30;
        }
        v35 = 0xFFFF;
        if ((_WORD)v32 != 0xFFFF)
          break;
LABEL_30:

        objc_autoreleasePoolPop(v33);
        v31 = (__int16)(v31 + 1);
        v32 = v35;
        if (v31 >= v41)
          goto LABEL_34;
      }

      objc_autoreleasePoolPop(v33);
      v35 = v32;
LABEL_34:
      objc_autoreleasePoolPop(v47);
      v30 = (__int16)(v30 + 1);
      v31 = v35;
      if (v30 >= v40)
      {
LABEL_35:

        objc_autoreleasePoolPop(v38);
        goto LABEL_41;
      }
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: path", buf, 2u);
  }

  if (a7)
  {
    _RTErrorInvalidParameterCreate((uint64_t)CFSTR("path"));
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v29;
}

- (double)_dtwDistanceFirstNormBetweenX:(CLLocationCoordinate2D *)a3 y:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
    }

    if (!a5)
      return 1.79769313e308;
    v8 = CFSTR("x");
    goto LABEL_12;
  }
  if (a4)
    return vaddvq_f64(vabdq_f64(*(float64x2_t *)a3, *(float64x2_t *)a4));
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", v10, 2u);
  }

  if (a5)
  {
    v8 = CFSTR("y");
LABEL_12:
    _RTErrorInvalidParameterCreate((uint64_t)v8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1.79769313e308;
}

- (double)_dtwDistanceEuclideanBetweenX:(CLLocationCoordinate2D *)a3 y:(CLLocationCoordinate2D *)a4 error:(id *)a5
{
  float64x2_t v6;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: x", buf, 2u);
    }

    if (!a5)
      return 1.79769313e308;
    v9 = CFSTR("x");
    goto LABEL_12;
  }
  if (a4)
  {
    v6 = vsubq_f64(*(float64x2_t *)a3, *(float64x2_t *)a4);
    return sqrt(vaddvq_f64(vmulq_f64(v6, v6)));
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: y", v11, 2u);
  }

  if (a5)
  {
    v9 = CFSTR("y");
LABEL_12:
    _RTErrorInvalidParameterCreate((uint64_t)v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1.79769313e308;
}

- (double)_centroidDistanceFromLocations:(CLLocationCoordinate2D *)a3 countOfFromLocations:(unint64_t)a4 toLocations:(CLLocationCoordinate2D *)a5 countOfToLocations:(unint64_t)a6 error:(id *)a7
{
  double v10;
  void *v15;
  double v16;
  CLLocationDegrees v17;
  double v18;
  CLLocationDegrees v19;
  id v20;
  double v21;
  CLLocationDegrees v22;
  double v23;
  CLLocationDegrees v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  double v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[2];
  id v38;
  _BYTE buf[22];
  __int16 v40;
  id v41;
  uint64_t v42;
  CLLocationCoordinate2D v43;
  CLLocationCoordinate2D v44;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromLocations", buf, 2u);
    }

    if (!a7)
      return 1.79769313e308;
    v28 = CFSTR("fromLocations");
    goto LABEL_21;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toLocations", buf, 2u);
    }

    if (!a7)
      return 1.79769313e308;
    v28 = CFSTR("toLocations");
LABEL_21:
    _RTErrorInvalidParameterCreate((uint64_t)v28);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    return 1.79769313e308;
  }
  v10 = 1.79769313e308;
  if (a4 && a6)
  {
    v15 = (void *)MEMORY[0x1D8231EA8]();
    v38 = 0;
    -[RTDistanceCalculator computeCentroid:locationsCount:error:](self, "computeCentroid:locationsCount:error:", a3, a4, &v38);
    v17 = v16;
    v19 = v18;
    v20 = v38;
    *(CLLocationDegrees *)buf = v17;
    *(CLLocationDegrees *)&buf[8] = v19;
    if (v20
      || (v36 = 0,
          -[RTDistanceCalculator computeCentroid:locationsCount:error:](self, "computeCentroid:locationsCount:error:", a5, a6, &v36), v22 = v21, v24 = v23, v20 = v36, *(CLLocationDegrees *)v37 = v22, *(CLLocationDegrees *)&v37[1] = v24, v20))
    {
      v25 = v20;
      v10 = 1.79769313e308;
      goto LABEL_8;
    }
    v43.latitude = v17;
    v43.longitude = v19;
    if (CLLocationCoordinate2DIsValid(v43)
      && (v44.latitude = v22, v44.longitude = v24, CLLocationCoordinate2DIsValid(v44)))
    {
      v35 = 0;
      -[RTDistanceCalculator distanceFromLocationCoordinate:toLocationCoordinate:error:](self, "distanceFromLocationCoordinate:toLocationCoordinate:error:", buf, v37, &v35);
      v10 = v31;
      v25 = v35;
      if (v25)
      {
LABEL_8:
        objc_autoreleasePoolPop(v15);
        if (a7)
        {
          _rt_log_facility_get_os_log(RTLogFacilityWorkout);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v32 = (objc_class *)objc_opt_class();
            NSStringFromClass(v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v34;
            v40 = 2112;
            v41 = v25;
            _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

          }
          v25 = objc_retainAutorelease(v25);
          *a7 = v25;
        }
        goto LABEL_12;
      }
    }
    else
    {
      v10 = 1.79769313e308;
    }
    objc_autoreleasePoolPop(v15);
    v25 = 0;
LABEL_12:

  }
  return v10;
}

- (CLLocationCoordinate2D)computeCentroid:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  double latitude;
  double longitude;
  CLLocationCoordinate2D v11;
  NSObject *v13;
  float64x2_t v14;
  uint8_t buf[16];
  CLLocationCoordinate2D result;

  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
    }

    if (a5)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("locations"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
  if (!a4)
  {
LABEL_10:
    latitude = *MEMORY[0x1E0C9E500];
    longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
    goto LABEL_11;
  }
  v7 = 0;
  v14 = 0u;
  do
  {
    v8 = (void *)MEMORY[0x1D8231EA8](self, a2);
    v14 = vaddq_f64(v14, (float64x2_t)a3[v7]);
    objc_autoreleasePoolPop(v8);
    ++v7;
  }
  while (a4 != v7);
  v11 = CLLocationCoordinate2DMake(v14.f64[0] / (double)a4, v14.f64[1] / (double)a4);
  longitude = v11.longitude;
  latitude = v11.latitude;
LABEL_11:
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (double)computeBoundingBoxArea:(CGRect)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  CGFloat v25;
  __int16 v26;
  CGFloat v27;
  __int16 v28;
  CGFloat v29;
  __int16 v30;
  CGFloat v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x1E0C80C00];
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", a4, a5);
  v12 = v11;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138414083;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2048;
    v23 = a4;
    v24 = 2049;
    v25 = x;
    v26 = 2049;
    v27 = y;
    v28 = 2049;
    v29 = width;
    v30 = 2049;
    v31 = height;
    v32 = 2049;
    v33 = v12;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, %@, locations count, %lu, rect x, %{private}f, rect y, %{private}f, rect width, %{private}f, rect height, %{private}f, rectArea, %{private}f", (uint8_t *)&v18, 0x52u);

  }
  return v12;
}

- (double)computeIntersectionOverUnionUsingBoundingBoxBetweenLocations:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 otherLocations:(CLLocationCoordinate2D *)a5 otherLocationsCount:(unint64_t)a6 error:(id *)a7
{
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  NSObject *v38;
  double v39;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  void *v54;
  objc_class *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  void *v61;
  void *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  double v66;
  id v67[2];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  unint64_t v75;
  __int16 v76;
  double v77;
  __int16 v78;
  double v79;
  __int16 v80;
  double v81;
  __int16 v82;
  CGFloat v83;
  __int16 v84;
  double v85;
  __int16 v86;
  CGFloat v87;
  __int16 v88;
  CGFloat v89;
  __int16 v90;
  CGFloat v91;
  __int16 v92;
  double v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;
  uint64_t v100;
  _QWORD v101[2];
  CGRect v102;
  CGRect v103;
  CGRect v104;

  v101[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: locations";
LABEL_14:
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    }
LABEL_24:
    v39 = 2.22507386e-308;
    goto LABEL_25;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: otherLocations";
      goto LABEL_14;
    }
    goto LABEL_24;
  }
  if (a4 < 4 || a6 <= 3)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D18598];
    v100 = *MEMORY[0x1E0CB2D50];
    v101[0] = CFSTR("less number of locations than required");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, &v100, 1, a6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 7, v29);
    v25 = objc_claimAutoreleasedReturnValue();

    if (!a7)
      goto LABEL_24;
    goto LABEL_22;
  }
  v67[1] = 0;
  -[RTDistanceCalculator cgrectFromCoordinates:locationsCount:error:](self, "cgrectFromCoordinates:locationsCount:error:");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = 0;
  v22 = v21;
  if (a7 && v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v69 = v58;
      v70 = 2112;
      v71 = v59;
      v72 = 2112;
      v73 = (unint64_t)v22;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v24 = v22;
    goto LABEL_23;
  }
  v67[0] = v21;
  -[RTDistanceCalculator cgrectFromCoordinates:locationsCount:error:](self, "cgrectFromCoordinates:locationsCount:error:", a5, a6, v67);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v25 = v67[0];

  if (a7 && v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v60 = (objc_class *)objc_opt_class();
      NSStringFromClass(v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v69 = v61;
      v70 = 2112;
      v71 = v62;
      v72 = 2112;
      v73 = (unint64_t)v25;
      _os_log_error_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
LABEL_22:
    v24 = v25;
LABEL_23:
    v25 = objc_retainAutorelease(v24);
    *a7 = v25;
    goto LABEL_24;
  }
  v102.origin.x = v14;
  v102.origin.y = v16;
  v102.size.width = v18;
  v102.size.height = v20;
  v104.origin.x = v31;
  v104.origin.y = v33;
  v104.size.width = v35;
  v104.size.height = v37;
  v103 = CGRectIntersection(v102, v104);
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height);
  v41 = v20;
  v43 = v42;
  v63 = v41;
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", v14, v16, v18);
  v44 = v35;
  v46 = v45;
  v64 = v33;
  v47 = v33;
  v48 = v44;
  v65 = v37;
  -[RTDistanceCalculator _computeAreaFromRect:](self, "_computeAreaFromRect:", v31, v47);
  v66 = v49;
  v50 = v46 + v49 - v43;
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    v52 = (objc_class *)objc_opt_class();
    NSStringFromClass(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138416131;
    v69 = v53;
    v70 = 2112;
    v71 = v54;
    v72 = 2048;
    v73 = a4;
    v74 = 2048;
    v75 = a6;
    v76 = 2049;
    v77 = v14;
    v78 = 2049;
    v79 = v16;
    v80 = 2049;
    v81 = v18;
    v82 = 2049;
    v83 = v63;
    v84 = 2049;
    v85 = v31;
    v86 = 2049;
    v87 = v64;
    v88 = 2049;
    v89 = v48;
    v90 = 2049;
    v91 = v65;
    v92 = 2049;
    v93 = v46;
    v94 = 2049;
    v95 = v66;
    v96 = 2049;
    v97 = v43;
    v98 = 2049;
    v99 = v50;
    _os_log_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_INFO, "%@, %@, locations count, %lu, otherLocations count, %lu, rect1 x, %{private}f, rect1 y, %{private}f, rect1 width, %{private}f, rect1 height, %{private}f, rect2 x, %{private}f, rect2 y, %{private}f, rect2 width, %{private}f, rect2 height, %{private}f, rect1Area, %{private}f, rect2Area, %{private}f, intersectionArea, %{private}f, unionArea, %{private}f,", buf, 0xA2u);

  }
  if (v66 == 0.0 || v46 == 0.0 || v50 == 0.0)
    v39 = 0.0;
  else
    v39 = v43 / v50;
LABEL_25:

  return v39;
}

- (CGRect)cgrectFromCoordinates:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 error:(id *)a5
{
  unint64_t v6;
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
  CLLocationDegrees *p_longitude;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  double v30;
  NSObject *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_class *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  CLLocationCoordinate2D v44;
  CLLocationCoordinate2D v45;
  CLLocationCoordinate2D v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;
  _QWORD v54[2];
  CGRect result;

  v54[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a4;
    if (a4 >= 4)
    {
      p_longitude = &a3->longitude;
      v20 = -1.79769313e308;
      v13 = 1.79769313e308;
      v14 = 1.79769313e308;
      v21 = -1.79769313e308;
      do
      {
        v22 = (void *)MEMORY[0x1D8231EA8]();
        v23 = *(p_longitude - 1);
        v24 = *p_longitude;
        if (v23 < v13)
          v13 = *(p_longitude - 1);
        if (v23 > v20)
          v20 = *(p_longitude - 1);
        if (v24 < v14)
          v14 = *p_longitude;
        if (v24 > v21)
          v21 = *p_longitude;
        objc_autoreleasePoolPop(v22);
        p_longitude += 2;
        --v6;
      }
      while (v6);
      v46 = CLLocationCoordinate2DMake(v13, v14);
      v45 = CLLocationCoordinate2DMake(v13, v21);
      v44 = CLLocationCoordinate2DMake(v20, v21);
      v43 = 0;
      -[RTDistanceCalculator distanceFromLocationCoordinate:toLocationCoordinate:error:](self, "distanceFromLocationCoordinate:toLocationCoordinate:error:", &v46, &v45, &v43);
      v15 = v25;
      v26 = v43;
      v27 = v26;
      if (a5 && v26)
      {
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v48 = v37;
          v49 = 2112;
          v50 = v38;
          v51 = 2112;
          v52 = v27;
          _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v29 = v27;
      }
      else
      {
        v42 = v26;
        -[RTDistanceCalculator distanceFromLocationCoordinate:toLocationCoordinate:error:](self, "distanceFromLocationCoordinate:toLocationCoordinate:error:", &v45, &v44, &v42);
        v16 = v30;
        v10 = v42;

        if (!a5 || !v10)
        {
          if (v15 < 0.00001)
            v15 = 0.00001;
          if (v16 < 0.00001)
            v16 = 0.00001;
          goto LABEL_31;
        }
        _rt_log_facility_get_os_log(RTLogFacilityWorkout);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v48 = v40;
          v49 = 2112;
          v50 = v41;
          v51 = 2112;
          v52 = v10;
          _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

        }
        v29 = v10;
      }
      v11 = objc_retainAutorelease(v29);
      v10 = v11;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0D18598];
      v53 = *MEMORY[0x1E0CB2D50];
      v54[0] = CFSTR("less number of locations than required");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 7, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!a5)
      {
LABEL_30:
        v13 = *MEMORY[0x1E0C9D628];
        v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
        v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_31:

        goto LABEL_32;
      }
      v11 = objc_retainAutorelease(v10);
    }
    *a5 = v11;
    goto LABEL_30;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", buf, 2u);
  }

  v13 = *MEMORY[0x1E0C9D628];
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_32:
  v32 = v13;
  v33 = v14;
  v34 = v15;
  v35 = v16;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CLLocationCoordinate2D)rectVerticesFromCoordinates:(CLLocationCoordinate2D *)a3 locationsCount:(unint64_t)a4 ignoreNFirstAndLastLocations:(unint64_t)a5 error:(id *)a6
{
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  CLLocationCoordinate2D *v11;
  unint64_t v13;
  CLLocationDegrees *p_longitude;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  objc_class *v24;
  void *v25;
  void *v26;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  CLLocationDegrees v29;
  CLLocationDegrees v30;
  CLLocationDegrees v31;
  CLLocationDegrees v32;
  CLLocationDegrees v33;
  CLLocationDegrees v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  CLLocationDegrees v40;
  __int16 v41;
  CLLocationDegrees v42;
  __int16 v43;
  CLLocationDegrees v44;
  __int16 v45;
  CLLocationDegrees v46;
  __int16 v47;
  CLLocationDegrees v48;
  __int16 v49;
  CLLocationDegrees v50;
  __int16 v51;
  CLLocationDegrees v52;
  __int16 v53;
  CLLocationDegrees v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v35) = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations", (uint8_t *)&v35, 2u);
    }
    goto LABEL_7;
  }
  if (2 * a5 + 4 > a4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D18598];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = CFSTR("less number of locations than required");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 7, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (a6)
    {
      v10 = objc_retainAutorelease(v10);
      v11 = 0;
      *a6 = v10;
      goto LABEL_24;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_24;
  }
  if (a4 - a5 <= a5)
  {
    v17 = 1.79769313e308;
    v18 = -1.79769313e308;
    v15 = -1.79769313e308;
    v16 = 1.79769313e308;
  }
  else
  {
    v13 = a4 - 2 * a5;
    p_longitude = &a3[a5].longitude;
    v15 = -1.79769313e308;
    v16 = 1.79769313e308;
    v17 = 1.79769313e308;
    v18 = -1.79769313e308;
    do
    {
      v19 = (void *)MEMORY[0x1D8231EA8](self);
      v20 = *(p_longitude - 1);
      v21 = *p_longitude;
      if (v20 < v16)
        v16 = *(p_longitude - 1);
      if (v20 > v15)
        v15 = *(p_longitude - 1);
      if (v21 < v17)
        v17 = *p_longitude;
      if (v21 > v18)
        v18 = *p_longitude;
      objc_autoreleasePoolPop(v19);
      p_longitude += 2;
      --v13;
    }
    while (v13);
  }
  v11 = (CLLocationCoordinate2D *)malloc_type_malloc(0x40uLL, 0x1000040451B5BE8uLL);
  *v11 = CLLocationCoordinate2DMake(v16, v17);
  v11[1] = CLLocationCoordinate2DMake(v16, v18);
  v11[2] = CLLocationCoordinate2DMake(v15, v17);
  v11[3] = CLLocationCoordinate2DMake(v15, v18);
  _rt_log_facility_get_os_log(RTLogFacilityWorkout);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    latitude = v11->latitude;
    longitude = v11->longitude;
    v29 = v11[1].latitude;
    v30 = v11[1].longitude;
    v31 = v11[2].latitude;
    v32 = v11[2].longitude;
    v33 = v11[3].latitude;
    v34 = v11[3].longitude;
    v35 = 138414595;
    v36 = v25;
    v37 = 2112;
    v38 = v26;
    v39 = 2049;
    v40 = latitude;
    v41 = 2049;
    v42 = longitude;
    v43 = 2049;
    v44 = v29;
    v45 = 2049;
    v46 = v30;
    v47 = 2049;
    v48 = v31;
    v49 = 2049;
    v50 = v32;
    v51 = 2049;
    v52 = v33;
    v53 = 2049;
    v54 = v34;
    _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "%@, %@, rect vertices, 0, lat, %{private}f, lon, %{private}f, 1, lat, %{private}f, lon, %{private}f, 2, lat, %{private}f, lon, %{private}f, 3, lat, %{private}f, lon, %{private}f, ", (uint8_t *)&v35, 0x66u);

  }
  v10 = 0;
LABEL_24:

  return v11;
}

- (double)_computeAreaFromRect:(CGRect)a3
{
  return a3.size.width * a3.size.height;
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

@end
