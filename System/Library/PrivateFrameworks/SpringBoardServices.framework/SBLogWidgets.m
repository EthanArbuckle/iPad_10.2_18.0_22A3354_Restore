@implementation SBLogWidgets

void __SBLogWidgets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "Widgets");
  v1 = (void *)SBLogWidgets___logObj;
  SBLogWidgets___logObj = (uint64_t)v0;

}

@end
