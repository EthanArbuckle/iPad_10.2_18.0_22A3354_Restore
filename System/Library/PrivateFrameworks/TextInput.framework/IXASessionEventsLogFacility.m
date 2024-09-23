@implementation IXASessionEventsLogFacility

void __IXASessionEventsLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "IXASessionEvents");
  v1 = (void *)IXASessionEventsLogFacility_logFacility;
  IXASessionEventsLogFacility_logFacility = (uint64_t)v0;

}

@end
