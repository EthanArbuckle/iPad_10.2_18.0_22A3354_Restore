@implementation SWLogPower

void __SWLogPower_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SystemWake", "Power");
  v1 = (void *)SWLogPower___logObj;
  SWLogPower___logObj = (uint64_t)v0;

}

@end
