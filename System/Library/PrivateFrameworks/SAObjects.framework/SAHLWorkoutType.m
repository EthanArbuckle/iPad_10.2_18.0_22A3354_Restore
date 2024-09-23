@implementation SAHLWorkoutType

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("WorkoutType");
}

+ (id)workoutType
{
  return objc_alloc_init((Class)a1);
}

- (NSString)swimmingLocationType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("swimmingLocationType"));
}

- (void)setSwimmingLocationType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("swimmingLocationType"), a3);
}

- (NSString)workoutCategory
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("workoutCategory"));
}

- (void)setWorkoutCategory:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("workoutCategory"), a3);
}

- (NSString)workoutLocationType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("workoutLocationType"));
}

- (void)setWorkoutLocationType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("workoutLocationType"), a3);
}

@end
