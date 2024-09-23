@implementation PSLoggingFacility

void ___PSLoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.preferences", "log");
  v1 = (void *)_PSLoggingFacility_oslog;
  _PSLoggingFacility_oslog = (uint64_t)v0;

}

@end
