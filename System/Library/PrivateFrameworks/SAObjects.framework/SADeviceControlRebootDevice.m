@implementation SADeviceControlRebootDevice

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicecontrol");
}

- (id)encodedClassName
{
  return CFSTR("RebootDevice");
}

+ (id)rebootDevice
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)isShutdownOnly
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("isShutdownOnly"));
}

- (void)setIsShutdownOnly:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("isShutdownOnly"), a3);
}

@end
