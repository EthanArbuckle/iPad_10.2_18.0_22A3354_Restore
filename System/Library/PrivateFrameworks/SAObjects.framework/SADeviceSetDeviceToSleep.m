@implementation SADeviceSetDeviceToSleep

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.device");
}

- (id)encodedClassName
{
  return CFSTR("SetDeviceToSleep");
}

+ (id)setDeviceToSleep
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
