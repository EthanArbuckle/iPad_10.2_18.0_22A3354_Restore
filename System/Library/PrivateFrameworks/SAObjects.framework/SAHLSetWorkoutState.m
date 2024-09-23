@implementation SAHLSetWorkoutState

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("SetWorkoutState");
}

+ (id)setWorkoutState
{
  return objc_alloc_init((Class)a1);
}

- (SAHLWorkoutState)targetWorkoutState
{
  return (SAHLWorkoutState *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("targetWorkoutState"));
}

- (void)setTargetWorkoutState:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("targetWorkoutState"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
