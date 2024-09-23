@implementation PRGetDeviceWifiChipset

void __PRGetDeviceWifiChipset_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswerWithError();
  v1 = (void *)PRGetDeviceWifiChipset::result;
  PRGetDeviceWifiChipset::result = v0;

}

@end
