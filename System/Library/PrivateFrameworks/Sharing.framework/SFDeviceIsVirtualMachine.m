@implementation SFDeviceIsVirtualMachine

uint64_t __SFDeviceIsVirtualMachine_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SFDeviceIsVirtualMachine_result = result;
  return result;
}

@end
