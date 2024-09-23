@implementation SNSetupLogging

void __SNSetupLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SNLogSubsystemIdentifier, "Snappy");
  v1 = (void *)SNDefaultLog;
  SNDefaultLog = (uint64_t)v0;

}

@end
