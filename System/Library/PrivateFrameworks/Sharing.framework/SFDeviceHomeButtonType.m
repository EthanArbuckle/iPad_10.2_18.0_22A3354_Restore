@implementation SFDeviceHomeButtonType

uint64_t __SFDeviceHomeButtonType_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  if (result <= 2)
    SFDeviceHomeButtonType_sType = result + 1;
  return result;
}

@end
