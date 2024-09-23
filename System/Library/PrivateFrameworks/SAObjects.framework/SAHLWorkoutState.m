@implementation SAHLWorkoutState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("WorkoutState");
}

+ (id)workoutState
{
  return objc_alloc_init((Class)a1);
}

- (NSString)workoutStateValue
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("workoutStateValue"));
}

- (void)setWorkoutStateValue:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("workoutStateValue"), a3);
}

@end
