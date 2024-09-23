@implementation PFPosterDeviceSupportsLowLuminance

uint64_t __PFPosterDeviceSupportsLowLuminance_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  PFPosterDeviceSupportsLowLuminance_supportsLowLuminance = result;
  return result;
}

@end
