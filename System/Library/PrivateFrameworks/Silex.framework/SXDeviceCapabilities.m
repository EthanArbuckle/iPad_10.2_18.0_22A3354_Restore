@implementation SXDeviceCapabilities

- (BOOL)hasCellularTelephonyCapabilities
{
  return MGGetBoolAnswer();
}

@end
