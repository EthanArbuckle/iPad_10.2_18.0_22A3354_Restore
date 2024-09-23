@implementation TPClassificationLog

void __TPClassificationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.security.trustedpeers", "classification");
  v1 = (void *)TPClassificationLog_log;
  TPClassificationLog_log = (uint64_t)v0;

}

@end
