@implementation TVRCMDMLog

void ___TVRCMDMLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteCore", "MDM");
  v1 = (void *)_TVRCMDMLog_log;
  _TVRCMDMLog_log = (uint64_t)v0;

}

@end
