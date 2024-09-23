@implementation RTWorkoutDistance

- (RTWorkoutDistance)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithObjectID_firstWorkout_secondWorkout_distanceMetric_workoutActivityType_areBothWorkoutsDecimated_distance_isVisited_date_);
}

- (RTWorkoutDistance)initWithObjectID:(id)a3 firstWorkout:(id)a4 secondWorkout:(id)a5 distanceMetric:(int64_t)a6 workoutActivityType:(int64_t)a7 areBothWorkoutsDecimated:(BOOL)a8 distance:(double)a9 isVisited:(BOOL)a10 date:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  RTWorkoutDistance *v24;
  RTWorkoutDistance *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  RTWorkoutDistance *v29;
  NSObject *v30;
  const char *v31;
  objc_super v33;
  uint8_t buf[16];

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a11;
  v23 = v22;
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: firstWorkout";
LABEL_25:
    _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_26;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: secondWorkout";
    goto LABEL_25;
  }
  if (!a7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: workoutActivityType";
    goto LABEL_25;
  }
  if (!a6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v31 = "Invalid parameter not satisfying: distanceMetric";
    goto LABEL_25;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v31 = "Invalid parameter not satisfying: date";
      goto LABEL_25;
    }
LABEL_26:

    v29 = 0;
    goto LABEL_27;
  }
  v33.receiver = self;
  v33.super_class = (Class)RTWorkoutDistance;
  v24 = -[RTWorkoutDistance init](&v33, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_objectID, a3);
    v26 = objc_msgSend(v20, "compare:", v21);
    if (v26 == -1)
      v27 = v20;
    else
      v27 = v21;
    if (v26 == -1)
      v28 = v21;
    else
      v28 = v20;
    objc_storeStrong((id *)&v25->_firstWorkout, v27);
    objc_storeStrong((id *)&v25->_secondWorkout, v28);
    v25->_distanceMetric = a6;
    v25->_workoutActivityType = a7;
    v25->_areBothWorkoutsDecimated = a8;
    v25->_distance = a9;
    v25->_isVisited = a10;
    objc_storeStrong((id *)&v25->_date, a11);
  }
  self = v25;
  v29 = self;
LABEL_27:

  return v29;
}

- (NSString)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[RTWorkoutDistance objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[RTWorkoutDistance objectID](self, "objectID");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("nil");
  }
  -[RTWorkoutDistance firstWorkout](self, "firstWorkout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutDistance secondWorkout](self, "secondWorkout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTDistanceCalculator distanceMetricToString:](RTDistanceCalculator, "distanceMetricToString:", -[RTWorkoutDistance distanceMetric](self, "distanceMetric"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringFromRTHealthKitWorkoutActivityType:", -[RTWorkoutDistance workoutActivityType](self, "workoutActivityType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("YES");
  if (-[RTWorkoutDistance areBothWorkoutsDecimated](self, "areBothWorkoutsDecimated"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[RTWorkoutDistance distance](self, "distance");
  v12 = v11;
  if (!-[RTWorkoutDistance isVisited](self, "isVisited"))
    v9 = CFSTR("NO");
  -[RTWorkoutDistance date](self, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("objectId, %@, firstWorkout, %@, secondWorkout, %@, distanceMetric, %@, workoutActivityType, %@, areBothWorkoutsDecimated, %@, distance, %.2f, isVisited, %@, date, %@"), v4, v5, v6, v7, v8, v10, v12, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  return (NSString *)v15;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (NSUUID)firstWorkout
{
  return self->_firstWorkout;
}

- (NSUUID)secondWorkout
{
  return self->_secondWorkout;
}

- (double)distance
{
  return self->_distance;
}

- (BOOL)areBothWorkoutsDecimated
{
  return self->_areBothWorkoutsDecimated;
}

- (int64_t)distanceMetric
{
  return self->_distanceMetric;
}

- (int64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (BOOL)isVisited
{
  return self->_isVisited;
}

- (void)setIsVisited:(BOOL)a3
{
  self->_isVisited = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_secondWorkout, 0);
  objc_storeStrong((id *)&self->_firstWorkout, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

+ (id)createWithManagedObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2080;
      v10 = "+[RTWorkoutDistance(RTCoreDataTransformable) createWithManagedObject:]";
      v11 = 1024;
      v12 = 30;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTHint+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "createWithWorkoutDistanceMO:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v4;
}

+ (id)createWithWorkoutDistanceMO:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)buf = 0;
    v13 = buf;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__154;
    v16 = __Block_byref_object_dispose__154;
    v17 = 0;
    objc_msgSend(v3, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__RTWorkoutDistance_RTCoreDataTransformable__createWithWorkoutDistanceMO___block_invoke;
    v9[3] = &unk_1E929A690;
    v11 = buf;
    v10 = v4;
    objc_msgSend(v5, "performBlockAndWait:", v9);

    v6 = *((id *)v13 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workoutDistanceMO", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

void __74__RTWorkoutDistance_RTCoreDataTransformable__createWithWorkoutDistanceMO___block_invoke(uint64_t a1)
{
  RTWorkoutDistance *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v2 = [RTWorkoutDistance alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "firstWorkout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "secondWorkout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "distanceMetric");
  v6 = objc_msgSend(*(id *)(a1 + 32), "workoutActivityType");
  v7 = objc_msgSend(*(id *)(a1 + 32), "areBothWorkoutsDecimated");
  objc_msgSend(*(id *)(a1 + 32), "distance");
  v9 = v8;
  v10 = objc_msgSend(*(id *)(a1 + 32), "isVisited");
  objc_msgSend(*(id *)(a1 + 32), "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = v10;
  v12 = -[RTWorkoutDistance initWithObjectID:firstWorkout:secondWorkout:distanceMetric:workoutActivityType:areBothWorkoutsDecimated:distance:isVisited:date:](v2, "initWithObjectID:firstWorkout:secondWorkout:distanceMetric:workoutActivityType:areBothWorkoutsDecimated:distance:isVisited:date:", v16, v3, v4, v5, v6, v7, v9, v15, v11);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (id)managedObjectWithContext:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (a3)
  {
    +[RTWorkoutDistanceMO managedObjectWithWorkoutDistance:inManagedObjectContext:](RTWorkoutDistanceMO, "managedObjectWithWorkoutDistance:inManagedObjectContext:", self, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

@end
