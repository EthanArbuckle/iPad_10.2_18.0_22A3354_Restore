@implementation MOEventWorkout

- (MOEventWorkout)init
{
  MOEventWorkout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOEventWorkout;
  result = -[MOEventWorkout init](&v3, "init");
  if (result)
    *(_WORD *)&result->_isFitnessPlusSession = 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *workoutType;
  id v5;

  workoutType = self->_workoutType;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", workoutType, CFSTR("workoutType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutTotalDistance, CFSTR("workoutTotalDistance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutTotalEnergyBurned, CFSTR("workoutTotalEnergyBurned"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutDuration, CFSTR("workoutDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutLocationStart, CFSTR("workoutLocationStart"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutLocationRoute, CFSTR("workoutLocationRoute"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFitnessPlusSession, CFSTR("isFitnessPlusSession"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIndoors, CFSTR("isIndoors"));

}

- (MOEventWorkout)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventWorkout *v6;
  id v7;
  uint64_t v8;
  NSString *workoutType;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSNumber *workoutTotalDistance;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSNumber *workoutTotalEnergyBurned;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSNumber *workoutDuration;
  uint64_t v22;
  id v23;
  uint64_t v24;
  CLLocation *workoutLocationStart;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSArray *workoutLocationRoute;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MOEventWorkout;
  v6 = -[MOEventWorkout init](&v35, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("workoutType"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    workoutType = v6->_workoutType;
    v6->_workoutType = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("workoutTotalDistance"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    workoutTotalDistance = v6->_workoutTotalDistance;
    v6->_workoutTotalDistance = (NSNumber *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v14), CFSTR("workoutTotalEnergyBurned"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    workoutTotalEnergyBurned = v6->_workoutTotalEnergyBurned;
    v6->_workoutTotalEnergyBurned = (NSNumber *)v16;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v18), CFSTR("workoutDuration"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    workoutDuration = v6->_workoutDuration;
    v6->_workoutDuration = (NSNumber *)v20;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CLLocation, v22), CFSTR("workoutLocationStart"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    workoutLocationStart = v6->_workoutLocationStart;
    v6->_workoutLocationStart = (CLLocation *)v24;

    v26 = objc_autoreleasePoolPush();
    v27 = objc_alloc((Class)NSSet);
    v29 = objc_opt_class(NSArray, v28);
    v31 = objc_msgSend(v27, "initWithObjects:", v29, objc_opt_class(CLLocation, v30), 0);
    objc_autoreleasePoolPop(v26);
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("workoutLocationRoute")));
    workoutLocationRoute = v6->_workoutLocationRoute;
    v6->_workoutLocationRoute = (NSArray *)v32;

    v6->_isFitnessPlusSession = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFitnessPlusSession"));
    v6->_isIndoors = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIndoors"));
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventWorkout *v4;

  v4 = objc_alloc_init(MOEventWorkout);
  objc_storeStrong((id *)&v4->_workoutType, self->_workoutType);
  objc_storeStrong((id *)&v4->_workoutTotalDistance, self->_workoutTotalDistance);
  objc_storeStrong((id *)&v4->_workoutTotalEnergyBurned, self->_workoutTotalEnergyBurned);
  objc_storeStrong((id *)&v4->_workoutDuration, self->_workoutDuration);
  objc_storeStrong((id *)&v4->_workoutLocationStart, self->_workoutLocationStart);
  objc_storeStrong((id *)&v4->_workoutLocationRoute, self->_workoutLocationRoute);
  v4->_isFitnessPlusSession = self->_isFitnessPlusSession;
  v4->_isIndoors = self->_isIndoors;
  return v4;
}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("workoutType, %@"), self->_workoutType);
}

- (NSString)workoutType
{
  return self->_workoutType;
}

- (void)setWorkoutType:(id)a3
{
  objc_storeStrong((id *)&self->_workoutType, a3);
}

- (NSNumber)workoutTotalDistance
{
  return self->_workoutTotalDistance;
}

- (void)setWorkoutTotalDistance:(id)a3
{
  objc_storeStrong((id *)&self->_workoutTotalDistance, a3);
}

- (NSNumber)workoutTotalEnergyBurned
{
  return self->_workoutTotalEnergyBurned;
}

- (void)setWorkoutTotalEnergyBurned:(id)a3
{
  objc_storeStrong((id *)&self->_workoutTotalEnergyBurned, a3);
}

- (NSNumber)workoutDuration
{
  return self->_workoutDuration;
}

- (void)setWorkoutDuration:(id)a3
{
  objc_storeStrong((id *)&self->_workoutDuration, a3);
}

- (CLLocation)workoutLocationStart
{
  return self->_workoutLocationStart;
}

- (void)setWorkoutLocationStart:(id)a3
{
  objc_storeStrong((id *)&self->_workoutLocationStart, a3);
}

- (NSArray)workoutLocationRoute
{
  return self->_workoutLocationRoute;
}

- (void)setWorkoutLocationRoute:(id)a3
{
  objc_storeStrong((id *)&self->_workoutLocationRoute, a3);
}

- (BOOL)isFitnessPlusSession
{
  return self->_isFitnessPlusSession;
}

- (void)setIsFitnessPlusSession:(BOOL)a3
{
  self->_isFitnessPlusSession = a3;
}

- (BOOL)isIndoors
{
  return self->_isIndoors;
}

- (void)setIsIndoors:(BOOL)a3
{
  self->_isIndoors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutLocationRoute, 0);
  objc_storeStrong((id *)&self->_workoutLocationStart, 0);
  objc_storeStrong((id *)&self->_workoutDuration, 0);
  objc_storeStrong((id *)&self->_workoutTotalEnergyBurned, 0);
  objc_storeStrong((id *)&self->_workoutTotalDistance, 0);
  objc_storeStrong((id *)&self->_workoutType, 0);
}

@end
