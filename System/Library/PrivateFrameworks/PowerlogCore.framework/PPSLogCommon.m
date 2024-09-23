@implementation PPSLogCommon

void __PPSLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "PerfPowerServices");
  v1 = (void *)PPSLogCommon___logObj;
  PPSLogCommon___logObj = (uint64_t)v0;

}

@end
