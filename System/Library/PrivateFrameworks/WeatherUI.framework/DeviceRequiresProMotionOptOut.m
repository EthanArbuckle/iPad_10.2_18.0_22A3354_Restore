@implementation DeviceRequiresProMotionOptOut

uint64_t __DeviceRequiresProMotionOptOut_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  DeviceRequiresProMotionOptOut_result = result;
  return result;
}

@end
