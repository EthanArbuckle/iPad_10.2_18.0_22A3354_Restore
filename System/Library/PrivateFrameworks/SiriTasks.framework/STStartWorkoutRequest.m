@implementation STStartWorkoutRequest

- (id)_initWithType:(int64_t)a3 location:(int64_t)a4 goal:(id)a5 goalType:(int64_t)a6 userMode:(int64_t)a7 isOpenGoal:(BOOL)a8 skipActivitySetup:(BOOL)a9
{
  id v16;
  STStartWorkoutRequest *v17;
  objc_super v19;

  v16 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STStartWorkoutRequest;
  v17 = -[AFSiriRequest init](&v19, sel_init);
  if (v17)
  {
    initHKQuantity();
    v17->_activityType = a3;
    v17->_locationType = a4;
    v17->_userMode = a7;
    objc_storeStrong((id *)&v17->_goal, a5);
    v17->_goalType = a6;
    v17->_isOpenGoal = a8;
    v17->_skipActivitySetup = a9;
  }

  return v17;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)userMode
{
  return self->_userMode;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (id)workoutGoal
{
  return self->_goal;
}

- (BOOL)skipActivitySetup
{
  return self->_skipActivitySetup;
}

- (BOOL)isOpenGoal
{
  return self->_isOpenGoal;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStartWorkoutRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_locationType, CFSTR("kSTStartWorkoutRequestLocationTypeKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_activityType, CFSTR("kSTStartWorkoutRequestActivityTypeKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_userMode, CFSTR("kSTStartWorkoutRequestUserModeTypeKey"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goalType, CFSTR("kSTStartWorkoutRequestGoalTypeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_goal, CFSTR("kSTStartWorkoutRequestGoalKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_skipActivitySetup, CFSTR("kSTStartWorkoutRequestSkipActivitySetupKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isOpenGoal, CFSTR("kSTStartWorkoutRequestIsOpenGoalKey"));

}

- (STStartWorkoutRequest)initWithCoder:(id)a3
{
  id v4;
  STStartWorkoutRequest *v5;
  id HKQuantityClass;
  uint64_t v7;
  HKQuantity *goal;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STStartWorkoutRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_locationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSTStartWorkoutRequestLocationTypeKey"));
    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSTStartWorkoutRequestActivityTypeKey"));
    v5->_userMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSTStartWorkoutRequestUserModeTypeKey"));
    v5->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSTStartWorkoutRequestGoalTypeKey"));
    HKQuantityClass = getHKQuantityClass();
    if (HKQuantityClass)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", HKQuantityClass, CFSTR("kSTStartWorkoutRequestGoalKey"));
      v7 = objc_claimAutoreleasedReturnValue();
      goal = v5->_goal;
      v5->_goal = (HKQuantity *)v7;

    }
    v5->_skipActivitySetup = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSTStartWorkoutRequestSkipActivitySetupKey"));
    v5->_isOpenGoal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSTStartWorkoutRequestIsOpenGoalKey"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goal, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
