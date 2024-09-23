@implementation IXASessionDetailsLogFacility

void __IXASessionDetailsLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "IXASessionDetails");
  v1 = (void *)IXASessionDetailsLogFacility_logFacility;
  IXASessionDetailsLogFacility_logFacility = (uint64_t)v0;

}

@end
