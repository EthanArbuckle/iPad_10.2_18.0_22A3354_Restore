@implementation IXADefaultLogFacility

void __IXADefaultLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "IXADefault");
  v1 = (void *)IXADefaultLogFacility_logFacility;
  IXADefaultLogFacility_logFacility = (uint64_t)v0;

}

@end
