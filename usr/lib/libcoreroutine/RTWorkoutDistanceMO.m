@implementation RTWorkoutDistanceMO

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("RTWorkoutDistanceMO"));
}

+ (id)managedObjectWithWorkoutDistance:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  uint8_t buf[2];
  __int16 v23;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v17 = 0;
      goto LABEL_8;
    }
    v23 = 0;
    v19 = "Invalid parameter not satisfying: workoutDistance";
    v20 = (uint8_t *)&v23;
LABEL_10:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_7;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: managedObjectContext";
    v20 = buf;
    goto LABEL_10;
  }
  objc_msgSend(v5, "firstWorkout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondWorkout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "distanceMetric");
  v11 = objc_msgSend(v5, "workoutActivityType");
  v12 = objc_msgSend(v5, "areBothWorkoutsDecimated");
  objc_msgSend(v5, "distance");
  v14 = v13;
  v15 = objc_msgSend(v5, "isVisited");
  objc_msgSend(v5, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTWorkoutDistanceMO managedObjectWithFirstWorkout:secondWorkout:distanceMetric:workoutActivityType:areBothWorkoutsDecimated:distance:isVisited:date:inManagedObjectContext:](RTWorkoutDistanceMO, "managedObjectWithFirstWorkout:secondWorkout:distanceMetric:workoutActivityType:areBothWorkoutsDecimated:distance:isVisited:date:inManagedObjectContext:", v8, v9, v10, v11, v12, v15, v14, v16, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v17;
}

+ (id)managedObjectWithFirstWorkout:(id)a3 secondWorkout:(id)a4 distanceMetric:(int64_t)a5 workoutActivityType:(int64_t)a6 areBothWorkoutsDecimated:(BOOL)a7 distance:(double)a8 isVisited:(BOOL)a9 date:(id)a10 inManagedObjectContext:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  int64_t v30;
  int64_t v31;
  double v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v17 = a3;
  v18 = a4;
  v19 = a10;
  v20 = a11;
  v21 = v20;
  if (v20)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__151;
    v39 = __Block_byref_object_dispose__151;
    v40 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __174__RTWorkoutDistanceMO_managedObjectWithFirstWorkout_secondWorkout_distanceMetric_workoutActivityType_areBothWorkoutsDecimated_distance_isVisited_date_inManagedObjectContext___block_invoke;
    v24[3] = &unk_1E92A4BA0;
    v29 = &v35;
    v25 = v20;
    v26 = v17;
    v27 = v18;
    v30 = a5;
    v31 = a6;
    v33 = a7;
    v32 = a8;
    v34 = a9;
    v28 = v19;
    objc_msgSend(v25, "performBlockAndWait:", v24);
    v22 = (id)v36[5];

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

uint64_t __174__RTWorkoutDistanceMO_managedObjectWithFirstWorkout_secondWorkout_distanceMetric_workoutActivityType_areBothWorkoutsDecimated_distance_isVisited_date_inManagedObjectContext___block_invoke(uint64_t a1)
{
  RTWorkoutDistanceMO *v2;
  uint64_t v3;
  void *v4;

  v2 = -[RTWorkoutDistanceMO initWithContext:]([RTWorkoutDistanceMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setFirstWorkout:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setSecondWorkout:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDistanceMetric:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setWorkoutActivityType:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setAreBothWorkoutsDecimated:", *(unsigned __int8 *)(a1 + 96));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDistance:", *(double *)(a1 + 88));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setIsVisited:", *(unsigned __int8 *)(a1 + 97));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setDate:", *(_QWORD *)(a1 + 56));
}

@end
