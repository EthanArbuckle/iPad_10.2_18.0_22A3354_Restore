@implementation RWIDefaultLog

void __RWIDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WebInspector", "default");
  v1 = (void *)RWIDefaultLog_defaultLog;
  RWIDefaultLog_defaultLog = (uint64_t)v0;

}

@end
