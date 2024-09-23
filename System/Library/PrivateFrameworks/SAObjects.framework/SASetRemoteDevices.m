@implementation SASetRemoteDevices

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("SetRemoteDevices");
}

+ (id)setRemoteDevices
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)remoteDeviceHasNoAssistantId
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("remoteDeviceHasNoAssistantId"));
}

- (void)setRemoteDeviceHasNoAssistantId:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("remoteDeviceHasNoAssistantId"), a3);
}

- (BOOL)remoteDeviceNotSetup
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("remoteDeviceNotSetup"));
}

- (void)setRemoteDeviceNotSetup:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("remoteDeviceNotSetup"), a3);
}

- (BOOL)remoteDeviceUnreachable
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("remoteDeviceUnreachable"));
}

- (void)setRemoteDeviceUnreachable:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("remoteDeviceUnreachable"), a3);
}

- (NSArray)remoteDevices
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("remoteDevices"), v3);
}

- (void)setRemoteDevices:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("remoteDevices"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
