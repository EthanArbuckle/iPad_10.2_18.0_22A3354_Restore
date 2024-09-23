@implementation TVRUITipsLog

void ___TVRUITipsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "Tips");
  v1 = (void *)_TVRUITipsLog_log;
  _TVRUITipsLog_log = (uint64_t)v0;

}

@end
