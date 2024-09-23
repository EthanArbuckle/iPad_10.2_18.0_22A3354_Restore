@implementation TVRCMediaEventsLog

void ___TVRCMediaEventsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteCore", "MediaEvents");
  v1 = (void *)_TVRCMediaEventsLog_log;
  _TVRCMediaEventsLog_log = (uint64_t)v0;

}

@end
