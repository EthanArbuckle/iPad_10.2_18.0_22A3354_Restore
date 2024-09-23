@implementation MCCLogSystem

void ___MCCLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloudMCCKit", "core");
  v1 = (void *)_MCCLogSystem_log;
  _MCCLogSystem_log = (uint64_t)v0;

}

@end
