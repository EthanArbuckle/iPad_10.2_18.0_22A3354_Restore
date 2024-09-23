@implementation SBSLoggingFacility

void ___SBSLoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.soundboard.services", "log");
  v1 = (void *)_SBSLoggingFacility_oslog;
  _SBSLoggingFacility_oslog = (uint64_t)v0;

}

@end
