@implementation SAHLGetActiveWorkoutApplicationIdentifier

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.health");
}

- (id)encodedClassName
{
  return CFSTR("GetActiveWorkoutApplicationIdentifier");
}

+ (id)getActiveWorkoutApplicationIdentifier
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
