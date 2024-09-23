@implementation SAHLWorkoutGoal

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("WorkoutGoal");
}

+ (id)workoutGoal
{
  return objc_alloc_init((Class)a1);
}

- (double)goalValue
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("goalValue"));
}

- (void)setGoalValue:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("goalValue"), a3);
}

- (NSString)workoutGoalUnitType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("workoutGoalUnitType"));
}

- (void)setWorkoutGoalUnitType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("workoutGoalUnitType"), a3);
}

@end
