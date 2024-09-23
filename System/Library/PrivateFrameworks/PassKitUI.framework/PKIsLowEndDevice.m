@implementation PKIsLowEndDevice

uint64_t __PKIsLowEndDevice_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  _MergedGlobals_669 = result;
  return result;
}

@end
