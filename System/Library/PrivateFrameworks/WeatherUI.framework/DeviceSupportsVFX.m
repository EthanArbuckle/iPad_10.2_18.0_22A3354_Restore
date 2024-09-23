@implementation DeviceSupportsVFX

uint64_t __DeviceSupportsVFX_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  DeviceSupportsVFX_result = result ^ 1;
  return result;
}

@end
