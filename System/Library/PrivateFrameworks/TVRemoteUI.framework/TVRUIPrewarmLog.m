@implementation TVRUIPrewarmLog

void ___TVRUIPrewarmLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "Prewarm");
  v1 = (void *)_TVRUIPrewarmLog_log;
  _TVRUIPrewarmLog_log = (uint64_t)v0;

}

@end
