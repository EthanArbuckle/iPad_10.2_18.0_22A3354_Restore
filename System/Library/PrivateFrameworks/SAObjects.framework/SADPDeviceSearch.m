@implementation SADPDeviceSearch

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.devicePlaySound");
}

- (id)encodedClassName
{
  return CFSTR("DeviceSearch");
}

+ (id)deviceSearch
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)deviceSearchQueries
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("deviceSearchQueries"), v3);
}

- (void)setDeviceSearchQueries:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("deviceSearchQueries"), (uint64_t)a3);
}

- (BOOL)requiresResponse
{
  return 1;
}

@end
