@implementation TVRUIButtonLog

void ___TVRUIButtonLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "Buttons");
  v1 = (void *)_TVRUIButtonLog_log;
  _TVRUIButtonLog_log = (uint64_t)v0;

}

@end
