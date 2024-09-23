@implementation APDefaultLog

void __APDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.apppersonalization", "Default");
  v1 = (void *)APDefaultLog_result;
  APDefaultLog_result = (uint64_t)v0;

}

@end
