@implementation TRALogCommon

void __TRALogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)TRALoggingSubsystem, "Common");
  v1 = (void *)TRALogCommon___logObj;
  TRALogCommon___logObj = (uint64_t)v0;

}

@end
