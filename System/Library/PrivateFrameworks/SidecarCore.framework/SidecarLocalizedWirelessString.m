@implementation SidecarLocalizedWirelessString

uint64_t __SidecarLocalizedWirelessString_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  SidecarLocalizedWirelessString_usesWAPI = result;
  return result;
}

@end
