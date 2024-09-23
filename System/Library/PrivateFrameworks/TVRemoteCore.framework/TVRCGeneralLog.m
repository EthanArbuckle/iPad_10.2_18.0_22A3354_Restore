@implementation TVRCGeneralLog

void ___TVRCGeneralLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteCore", "General");
  v1 = (void *)_TVRCGeneralLog_log;
  _TVRCGeneralLog_log = (uint64_t)v0;

}

@end
