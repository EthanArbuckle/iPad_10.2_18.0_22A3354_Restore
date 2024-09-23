@implementation RTILogFacility

void __RTILogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.RemoteTextInput", "RTILog");
  v1 = (void *)RTILogFacility_logFacility;
  RTILogFacility_logFacility = (uint64_t)v0;

}

@end
