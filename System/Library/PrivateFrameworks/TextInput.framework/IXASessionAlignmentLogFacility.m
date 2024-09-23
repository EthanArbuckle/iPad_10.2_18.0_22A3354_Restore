@implementation IXASessionAlignmentLogFacility

void __IXASessionAlignmentLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "IXASessionAlignment");
  v1 = (void *)IXASessionAlignmentLogFacility_logFacility;
  IXASessionAlignmentLogFacility_logFacility = (uint64_t)v0;

}

@end
