@implementation SADeviceMyriadConfiguration

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("DeviceMyriadConfiguration");
}

+ (id)deviceMyriadConfiguration
{
  return objc_alloc_init((Class)a1);
}

- (double)deviceAdjustment
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("deviceAdjustment"));
}

- (void)setDeviceAdjustment:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("deviceAdjustment"), a3);
}

- (double)deviceClass
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("deviceClass"));
}

- (void)setDeviceClass:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("deviceClass"), a3);
}

- (double)deviceDelay
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("deviceDelay"));
}

- (void)setDeviceDelay:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("deviceDelay"), a3);
}

- (double)deviceTrumpDelay
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("deviceTrumpDelay"));
}

- (void)setDeviceTrumpDelay:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("deviceTrumpDelay"), a3);
}

- (double)deviceVTEndtimeDistanceThreshold
{
  return AceObjectDoubleForProperty(self, (uint64_t)CFSTR("deviceVTEndtimeDistanceThreshold"));
}

- (void)setDeviceVTEndtimeDistanceThreshold:(double)a3
{
  AceObjectSetDoubleForProperty(self, CFSTR("deviceVTEndtimeDistanceThreshold"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
