@implementation PLLogPush

void __PLLogPush_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "push");
  v1 = (void *)PLLogPush___logObj;
  PLLogPush___logObj = (uint64_t)v0;

}

@end
