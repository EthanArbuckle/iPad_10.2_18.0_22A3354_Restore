@implementation TYALog

void __TYALog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "typologyAccess");
  v1 = (void *)TYALog_log;
  TYALog_log = (uint64_t)v0;

}

@end
