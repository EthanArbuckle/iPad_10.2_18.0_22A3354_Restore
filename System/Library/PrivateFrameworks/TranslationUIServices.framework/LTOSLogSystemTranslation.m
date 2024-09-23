@implementation LTOSLogSystemTranslation

void ___LTOSLogSystemTranslation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "SystemTranslation");
  v1 = (void *)_LTOSLogSystemTranslation_log;
  _LTOSLogSystemTranslation_log = (uint64_t)v0;

}

@end
