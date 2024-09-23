@implementation SFDeviceSupportsForceTouch

uint64_t __SFDeviceSupportsForceTouch_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SFDeviceSupportsForceTouch_supportsForceTouch = result;
  return result;
}

@end
