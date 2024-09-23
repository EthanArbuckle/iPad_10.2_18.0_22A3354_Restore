@implementation SWSetupLogging

void __SWSetupLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SWLogSubsystemIdentifier, "WebContent");
  v1 = (void *)SWDefaultLog;
  SWDefaultLog = (uint64_t)v0;

}

@end
