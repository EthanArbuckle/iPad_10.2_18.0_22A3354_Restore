@implementation TVRCMediaRemoteLog

void ___TVRCMediaRemoteLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteCore", "MediaRemote");
  v1 = (void *)_TVRCMediaRemoteLog_log;
  _TVRCMediaRemoteLog_log = (uint64_t)v0;

}

@end
