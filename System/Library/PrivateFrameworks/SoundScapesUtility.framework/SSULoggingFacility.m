@implementation SSULoggingFacility

void ___SSULoggingFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.soundscapes.utility", "log");
  v1 = (void *)_SSULoggingFacility_oslog;
  _SSULoggingFacility_oslog = (uint64_t)v0;

}

@end
