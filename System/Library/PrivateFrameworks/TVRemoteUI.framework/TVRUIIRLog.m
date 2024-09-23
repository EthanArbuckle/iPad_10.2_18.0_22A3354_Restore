@implementation TVRUIIRLog

void ___TVRUIIRLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "IntelligentRouting");
  v1 = (void *)_TVRUIIRLog_log;
  _TVRUIIRLog_log = (uint64_t)v0;

}

@end
