@implementation PDCGlobalDeviceSettings

void __PDCGlobalDeviceSettings_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.PrivacyDisclosure"));
  v1 = (void *)PDCGlobalDeviceSettings_result;
  PDCGlobalDeviceSettings_result = v0;

}

@end
