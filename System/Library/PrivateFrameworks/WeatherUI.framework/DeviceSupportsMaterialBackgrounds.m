@implementation DeviceSupportsMaterialBackgrounds

uint64_t __DeviceSupportsMaterialBackgrounds_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  DeviceSupportsMaterialBackgrounds_result = result ^ 1;
  return result;
}

@end
