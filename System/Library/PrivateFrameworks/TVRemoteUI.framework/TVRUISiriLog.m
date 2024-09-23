@implementation TVRUISiriLog

void ___TVRUISiriLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "Siri");
  v1 = (void *)_TVRUISiriLog_log;
  _TVRUISiriLog_log = (uint64_t)v0;

}

@end
