@implementation INLogSystem

void ___INLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloudnotification", "log");
  v1 = (void *)_INLogSystem_log;
  _INLogSystem_log = (uint64_t)v0;

}

@end
