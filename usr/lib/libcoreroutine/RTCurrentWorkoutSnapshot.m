@implementation RTCurrentWorkoutSnapshot

- (RTCurrentWorkoutSnapshot)initWithSessionIdentifier:(id)a3 activityType:(unint64_t)a4 locationType:(int64_t)a5 swimmingLocationType:(int64_t)a6 isFirstPartyWorkout:(BOOL)a7 sessionState:(unint64_t)a8 workoutStartDate:(id)a9 snapshotDate:(id)a10
{
  id v15;
  id v16;
  id v17;
  RTCurrentWorkoutSnapshot *v18;
  RTCurrentWorkoutSnapshot *v19;
  objc_super v23;

  v15 = a3;
  v16 = a9;
  v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)RTCurrentWorkoutSnapshot;
  v18 = -[RTCurrentWorkoutSnapshot init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sessionIdentifier, a3);
    v19->_activityType = a4;
    v19->_locationType = a5;
    v19->_isFirstPartyWorkout = a7;
    v19->_swimmingLocationType = a6;
    v19->_sessionState = a8;
    objc_storeStrong((id *)&v19->_workoutStartDate, a9);
    objc_storeStrong((id *)&v19->_snapshotDate, a10);
  }

  return v19;
}

- (RTCurrentWorkoutSnapshot)initWithHKCurrentWorkoutSnapshot:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  RTCurrentWorkoutSnapshot *v13;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "sessionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "activityType");
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "locationType");
  objc_msgSend(v3, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "swimmingLocationType");
  v9 = objc_msgSend(v3, "isFirstPartyWorkout");
  v10 = +[RTHealthKitManager RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:](RTHealthKitManager, "RTHealthKitWorkoutSessionStateFromHKWorkoutSessionState:", objc_msgSend(v3, "sessionState"));
  objc_msgSend(v3, "builderStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[RTCurrentWorkoutSnapshot initWithSessionIdentifier:activityType:locationType:swimmingLocationType:isFirstPartyWorkout:sessionState:workoutStartDate:snapshotDate:](self, "initWithSessionIdentifier:activityType:locationType:swimmingLocationType:isFirstPartyWorkout:sessionState:workoutStartDate:snapshotDate:", v16, v15, v6, v8, v9, v10, v11, v12);
  return v13;
}

- (id)description
{
  void *v3;
  int64_t locationType;
  int64_t swimmingLocationType;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11 = *(_OWORD *)&self->_sessionIdentifier;
  locationType = self->_locationType;
  swimmingLocationType = self->_swimmingLocationType;
  if (self->_isFirstPartyWorkout)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  +[RTHealthKitManager workoutSessionStateToString:](RTHealthKitManager, "workoutSessionStateToString:", self->_sessionState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_workoutStartDate, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("sessionIdentifier, %@, activityType, %lu, locationType, %lu, swimmingLocationType, %lu, isFirstPartyWorkout, %@, sessionState, %@, workoutStartDate, %@"), v11, locationType, swimmingLocationType, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)swimmingLocationType
{
  return self->_swimmingLocationType;
}

- (BOOL)isFirstPartyWorkout
{
  return self->_isFirstPartyWorkout;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (NSDate)workoutStartDate
{
  return self->_workoutStartDate;
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotDate, 0);
  objc_storeStrong((id *)&self->_workoutStartDate, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
