@implementation TVRUISignpostLog

void ___TVRUISignpostLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "Signpost");
  v1 = (void *)_TVRUISignpostLog_log;
  _TVRUISignpostLog_log = (uint64_t)v0;

}

@end
