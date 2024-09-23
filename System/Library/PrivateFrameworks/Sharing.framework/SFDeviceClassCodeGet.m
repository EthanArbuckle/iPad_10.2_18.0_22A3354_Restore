@implementation SFDeviceClassCodeGet

uint64_t __SFDeviceClassCodeGet_block_invoke()
{
  uint64_t result;
  int v1;

  result = MGGetSInt32Answer();
  v1 = result - 1;
  if ((result - 1) <= 0xA && ((0x46Fu >> v1) & 1) != 0)
    SFDeviceClassCodeGet_sResult = byte_1A2AF7DCD[v1];
  return result;
}

@end
