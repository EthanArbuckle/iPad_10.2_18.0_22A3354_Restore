@implementation PLLogTimeManager

void __PLLogTimeManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "time");
  v1 = (void *)PLLogTimeManager__logHandle;
  PLLogTimeManager__logHandle = (uint64_t)v0;

}

@end
