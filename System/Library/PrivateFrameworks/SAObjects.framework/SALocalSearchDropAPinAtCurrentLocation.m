@implementation SALocalSearchDropAPinAtCurrentLocation

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.localsearch");
}

- (id)encodedClassName
{
  return CFSTR("DropAPinAtCurrentLocation");
}

+ (id)dropAPinAtCurrentLocation
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
