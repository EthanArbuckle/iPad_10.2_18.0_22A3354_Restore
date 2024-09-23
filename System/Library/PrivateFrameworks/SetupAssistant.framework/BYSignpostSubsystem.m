@implementation BYSignpostSubsystem

void ___BYSignpostSubsystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.purplebuddy", "signpost");
  v1 = (void *)_BYSignpostSubsystem_log;
  _BYSignpostSubsystem_log = (uint64_t)v0;

}

@end
