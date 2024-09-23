@implementation SKIDefaultLog

void __SKIDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SKILogSubsystem, "SiriKitInvocation");
  v1 = (void *)SKIDefaultLog_SKIDefaultLog;
  SKIDefaultLog_SKIDefaultLog = (uint64_t)v0;

}

@end
