@implementation SADPDevicePlaySound

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicePlaySound");
}

- (id)encodedClassName
{
  return CFSTR("DevicePlaySound");
}

+ (id)devicePlaySound
{
  return objc_alloc_init((Class)a1);
}

- (NSString)action
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("action"));
}

- (void)setAction:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("action"), a3);
}

- (NSArray)devices
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("devices"), v3);
}

- (void)setDevices:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("devices"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
