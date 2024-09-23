@implementation TVRUIIntentManagerLog

void ___TVRUIIntentManagerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "IntentManager");
  v1 = (void *)_TVRUIIntentManagerLog_log;
  _TVRUIIntentManagerLog_log = (uint64_t)v0;

}

@end
