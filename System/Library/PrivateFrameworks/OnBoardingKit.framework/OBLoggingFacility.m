@implementation OBLoggingFacility

void ___OBLoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.onboarding", "log");
  v1 = (void *)_OBLoggingFacility_oslog;
  _OBLoggingFacility_oslog = (uint64_t)v0;

}

@end
