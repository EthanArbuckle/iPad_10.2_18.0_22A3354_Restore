@implementation DeviceSupportsMapsControlEffects

uint64_t __DeviceSupportsMapsControlEffects_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  DeviceSupportsMapsControlEffects_result = result ^ 1;
  return result;
}

@end
