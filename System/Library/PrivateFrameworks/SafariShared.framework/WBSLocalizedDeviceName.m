@implementation WBSLocalizedDeviceName

void __WBSLocalizedDeviceName_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGGetStringAnswer();
  v1 = (void *)WBSLocalizedDeviceName_localizedDeviceName;
  WBSLocalizedDeviceName_localizedDeviceName = v0;

}

@end
