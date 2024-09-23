@implementation POLogInitIfNeeded

void __POLogInitIfNeeded_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create((const char *)POLoggingSubsystem, (const char *)POLoggingContextCommand);
  v1 = (void *)POLogContextCommand;
  POLogContextCommand = (uint64_t)v0;

  v2 = os_log_create((const char *)POLoggingSubsystem, (const char *)POLoggingContextCommand);
  v3 = (void *)POLogContextSync;
  POLogContextSync = (uint64_t)v2;

}

@end
