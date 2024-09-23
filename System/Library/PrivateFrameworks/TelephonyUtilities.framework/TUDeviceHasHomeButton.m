@implementation TUDeviceHasHomeButton

uint64_t __TUDeviceHasHomeButton_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  TUDeviceHasHomeButton_homeButtonType = result;
  return result;
}

@end
