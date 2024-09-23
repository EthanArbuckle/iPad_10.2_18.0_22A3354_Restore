@implementation PLLogThreadStats

void __PLLogThreadStats_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog.threadstats", ");
  v1 = (void *)PLLogThreadStats___logObj;
  PLLogThreadStats___logObj = (uint64_t)v0;

}

@end
