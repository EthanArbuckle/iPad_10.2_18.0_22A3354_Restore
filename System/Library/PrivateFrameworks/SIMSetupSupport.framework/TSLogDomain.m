@implementation TSLogDomain

void ___TSLogDomain_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SIMSetupSupport", "log");
  v1 = (void *)_TSLogDomain_oslog;
  _TSLogDomain_oslog = (uint64_t)v0;

}

@end
