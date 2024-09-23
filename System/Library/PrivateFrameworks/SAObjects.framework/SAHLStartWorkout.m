@implementation SAHLStartWorkout

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("StartWorkout");
}

+ (id)startWorkout
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)isOpenGoal
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isOpenGoal"));
}

- (void)setIsOpenGoal:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isOpenGoal"), a3);
}

- (BOOL)skipActivitySetup
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("skipActivitySetup"));
}

- (void)setSkipActivitySetup:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("skipActivitySetup"), a3);
}

- (SAHLWorkoutGoal)workoutGoal
{
  return (SAHLWorkoutGoal *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("workoutGoal"));
}

- (void)setWorkoutGoal:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("workoutGoal"), a3);
}

- (SAHLWorkoutType)workoutType
{
  return (SAHLWorkoutType *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("workoutType"));
}

- (void)setWorkoutType:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("workoutType"), a3);
}

- (NSString)workoutUserMode
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("workoutUserMode"));
}

- (void)setWorkoutUserMode:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("workoutUserMode"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
