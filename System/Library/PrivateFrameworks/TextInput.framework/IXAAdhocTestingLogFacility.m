@implementation IXAAdhocTestingLogFacility

void __IXAAdhocTestingLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "IXAAdhocTesting");
  v1 = (void *)IXAAdhocTestingLogFacility_logFacility;
  IXAAdhocTestingLogFacility_logFacility = (uint64_t)v0;

}

@end
