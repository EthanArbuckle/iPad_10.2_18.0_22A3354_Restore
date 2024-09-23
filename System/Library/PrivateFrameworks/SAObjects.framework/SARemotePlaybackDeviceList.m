@implementation SARemotePlaybackDeviceList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("RemotePlaybackDeviceList");
}

+ (id)remotePlaybackDeviceList
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)remotePlaybackDevices
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("remotePlaybackDevices"), v3);
}

- (void)setRemotePlaybackDevices:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("remotePlaybackDevices"), (uint64_t)a3);
}

@end
