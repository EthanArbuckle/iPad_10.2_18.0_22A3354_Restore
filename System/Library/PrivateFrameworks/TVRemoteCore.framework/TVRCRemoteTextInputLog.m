@implementation TVRCRemoteTextInputLog

void ___TVRCRemoteTextInputLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteCore", "RemoteTextInput");
  v1 = (void *)_TVRCRemoteTextInputLog_log;
  _TVRCRemoteTextInputLog_log = (uint64_t)v0;

}

@end
