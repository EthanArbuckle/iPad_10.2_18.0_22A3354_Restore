@implementation DeviceIsSlow

uint64_t __DeviceIsSlow_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  DeviceIsSlow_result = result;
  return result;
}

@end
