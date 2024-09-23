@implementation MSLogSystem

void ___MSLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloudMCCKit", "icloudMailSettings");
  v1 = (void *)_MSLogSystem_log;
  _MSLogSystem_log = (uint64_t)v0;

}

@end
