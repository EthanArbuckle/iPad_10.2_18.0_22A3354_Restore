@implementation SMCurrentWorkoutSnapshot

- (SMCurrentWorkoutSnapshot)initWithSessionIdentifier:(id)a3 activityType:(unint64_t)a4 isWorkoutOngoing:(BOOL)a5 isFirstPartyWorkout:(BOOL)a6
{
  id v11;
  SMCurrentWorkoutSnapshot *v12;
  SMCurrentWorkoutSnapshot *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SMCurrentWorkoutSnapshot;
  v12 = -[SMCurrentWorkoutSnapshot init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionIdentifier, a3);
    v13->_activityType = a4;
    v13->_isWorkoutOngoing = a5;
    v13->_isFirstPartyWorkout = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMCurrentWorkoutSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SMCurrentWorkoutSnapshot *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMWorkoutSessionIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("__kSMWorkoutActivityTypeKey"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMIsWorkoutOngoingKey"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("__kSMIsFirstPartyWorkoutKey"));

  v9 = -[SMCurrentWorkoutSnapshot initWithSessionIdentifier:activityType:isWorkoutOngoing:isFirstPartyWorkout:](self, "initWithSessionIdentifier:activityType:isWorkoutOngoing:isFirstPartyWorkout:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *sessionIdentifier;
  id v5;

  sessionIdentifier = self->_sessionIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sessionIdentifier, CFSTR("__kSMWorkoutSessionIdentifierKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_activityType, CFSTR("__kSMWorkoutActivityTypeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isWorkoutOngoing, CFSTR("__kSMIsWorkoutOngoingKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFirstPartyWorkout, CFSTR("__kSMIsFirstPartyWorkoutKey"));

}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (BOOL)isWorkoutOngoing
{
  return self->_isWorkoutOngoing;
}

- (BOOL)isFirstPartyWorkout
{
  return self->_isFirstPartyWorkout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
