@implementation PLLogDuetServiceLpmSource

void __PLLogDuetServiceLpmSource_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "lpmsource");
  v1 = (void *)PLLogDuetServiceLpmSource___logObj;
  PLLogDuetServiceLpmSource___logObj = (uint64_t)v0;

}

@end
