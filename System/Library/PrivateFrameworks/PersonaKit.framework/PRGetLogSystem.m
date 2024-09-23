@implementation PRGetLogSystem

void ___PRGetLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.persona", "core");
  v1 = (void *)_PRGetLogSystem_log;
  _PRGetLogSystem_log = (uint64_t)v0;

}

@end
