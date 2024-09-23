@implementation SALog

void __SALog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spaceattributiond.log", "default");
  v1 = (void *)SALog__log;
  SALog__log = (uint64_t)v0;

}

@end
