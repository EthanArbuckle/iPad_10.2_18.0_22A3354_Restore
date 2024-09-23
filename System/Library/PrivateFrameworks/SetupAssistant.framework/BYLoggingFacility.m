@implementation BYLoggingFacility

void ___BYLoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.purplebuddy", "general");
  v1 = (void *)_BYLoggingFacility_oslog;
  _BYLoggingFacility_oslog = (uint64_t)v0;

}

@end
