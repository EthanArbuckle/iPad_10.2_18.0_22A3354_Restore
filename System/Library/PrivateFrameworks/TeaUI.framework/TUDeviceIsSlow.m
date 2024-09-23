@implementation TUDeviceIsSlow

uint64_t __TUDeviceIsSlow_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  TUDeviceIsSlow_result = result;
  return result;
}

@end
