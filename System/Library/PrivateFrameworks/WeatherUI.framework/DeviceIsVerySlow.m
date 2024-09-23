@implementation DeviceIsVerySlow

uint64_t __DeviceIsVerySlow_block_invoke()
{
  uint64_t result;

  if (DeviceIsSlow_onceToken != -1)
    dispatch_once(&DeviceIsSlow_onceToken, &__block_literal_global_176);
  if (DeviceIsSlow_result)
    result = MGIsDeviceOneOfType();
  else
    result = 0;
  DeviceIsVerySlow_result = result;
  return result;
}

@end
