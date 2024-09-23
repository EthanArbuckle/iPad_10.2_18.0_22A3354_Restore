@implementation PXGDeviceIsKnownToHaveExtendedColorDisplay

uint64_t __PXGDeviceIsKnownToHaveExtendedColorDisplay_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay = result;
  return result;
}

@end
