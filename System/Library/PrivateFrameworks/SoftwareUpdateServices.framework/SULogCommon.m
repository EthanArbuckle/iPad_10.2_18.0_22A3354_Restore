@implementation SULogCommon

void __SULogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.softwareupdateservices", "Common");
  v1 = (void *)SULogCommon___instance;
  SULogCommon___instance = (uint64_t)v0;

}

@end
