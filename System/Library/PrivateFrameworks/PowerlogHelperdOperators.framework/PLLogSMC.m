@implementation PLLogSMC

void __PLLogSMC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "smc");
  v1 = (void *)PLLogSMC___logObj;
  PLLogSMC___logObj = (uint64_t)v0;

}

@end
