@implementation SCLogger

void __SCLogger_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.safetycheckd", "SCLogger");
  v1 = (void *)SCLogger_log;
  SCLogger_log = (uint64_t)v0;

}

@end
