@implementation PLLogDuetServiceDAS

void __PLLogDuetServiceDAS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "DuetServiceDAS");
  v1 = (void *)PLLogDuetServiceDAS___logObj;
  PLLogDuetServiceDAS___logObj = (uint64_t)v0;

}

@end
