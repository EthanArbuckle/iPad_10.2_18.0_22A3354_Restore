@implementation TVRCRapportLog

void ___TVRCRapportLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteCore", "Rapport");
  v1 = (void *)_TVRCRapportLog_log;
  _TVRCRapportLog_log = (uint64_t)v0;

}

@end
