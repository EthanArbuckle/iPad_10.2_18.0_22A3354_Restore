@implementation PFVideoEncoding

+ (BOOL)deviceSupportsHardwareHEVCEncoding
{
  return +[PFMediaCapabilities currentDeviceHEVCCapabilities](PFMediaCapabilities, "currentDeviceHEVCCapabilities") & 1;
}

@end
