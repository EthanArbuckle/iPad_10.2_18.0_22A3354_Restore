@implementation SADPDeviceSearchCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicePlaySound");
}

- (id)encodedClassName
{
  return CFSTR("DeviceSearchCompleted");
}

+ (id)deviceSearchCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)remotePlaySoundRestricted
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("remotePlaySoundRestricted"));
}

- (void)setRemotePlaySoundRestricted:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("remotePlaySoundRestricted"), a3);
}

- (NSArray)resolvedDevices
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("resolvedDevices"), v3);
}

- (void)setResolvedDevices:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("resolvedDevices"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
