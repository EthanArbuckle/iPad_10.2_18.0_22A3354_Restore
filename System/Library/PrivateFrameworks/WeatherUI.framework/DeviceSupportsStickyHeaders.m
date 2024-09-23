@implementation DeviceSupportsStickyHeaders

uint64_t __DeviceSupportsStickyHeaders_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  DeviceSupportsStickyHeaders_result = result ^ 1;
  return result;
}

@end
