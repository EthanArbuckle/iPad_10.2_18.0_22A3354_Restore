@implementation PXSupportsImageModulation

uint64_t __PXSupportsImageModulation_block_invoke()
{
  uint64_t result;

  PXSupportsImageModulation_is2DBLDevice = MGIsDeviceOneOfType();
  if ((PXSupportsImageModulation_is2DBLDevice & 1) != 0)
    result = 1;
  else
    result = MGIsDeviceOneOfType();
  PXSupportsImageModulation_is2DBLDevice = result;
  return result;
}

@end
