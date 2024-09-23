@implementation AXPlatformTranslationLogCommon

void __AXPlatformTranslationLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXPlatformTranslationCommon");
  v1 = (void *)AXPlatformTranslationLogCommon___logObj;
  AXPlatformTranslationLogCommon___logObj = (uint64_t)v0;

}

@end
