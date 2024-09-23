@implementation TPModelLog

void __TPModelLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.security.trustedpeers", "model");
  v1 = (void *)TPModelLog_log;
  TPModelLog_log = (uint64_t)v0;

}

@end
