@implementation PLLogDisplay

void __PLLogDisplay_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "display");
  v1 = (void *)PLLogDisplay___logObj;
  PLLogDisplay___logObj = (uint64_t)v0;

}

@end
