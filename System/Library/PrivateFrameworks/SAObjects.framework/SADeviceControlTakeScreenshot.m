@implementation SADeviceControlTakeScreenshot

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicecontrol");
}

- (id)encodedClassName
{
  return CFSTR("TakeScreenshot");
}

+ (id)takeScreenshot
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
