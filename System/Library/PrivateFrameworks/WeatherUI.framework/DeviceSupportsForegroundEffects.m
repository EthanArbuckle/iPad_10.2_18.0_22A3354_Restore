@implementation DeviceSupportsForegroundEffects

uint64_t __DeviceSupportsForegroundEffects_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  DeviceSupportsForegroundEffects_result = result ^ 1;
  return result;
}

@end
