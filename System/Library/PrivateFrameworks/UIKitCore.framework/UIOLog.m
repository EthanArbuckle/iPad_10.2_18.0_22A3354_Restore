@implementation UIOLog

void __UIOLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.uikit.uioverlayd", "General");
  v1 = (void *)UIOLog_log;
  UIOLog_log = (uint64_t)v0;

}

@end
