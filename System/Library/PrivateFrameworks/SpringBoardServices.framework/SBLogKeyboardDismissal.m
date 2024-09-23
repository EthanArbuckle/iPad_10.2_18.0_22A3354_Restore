@implementation SBLogKeyboardDismissal

void __SBLogKeyboardDismissal_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "KeyboardDismissal");
  v1 = (void *)SBLogKeyboardDismissal___logObj;
  SBLogKeyboardDismissal___logObj = (uint64_t)v0;

}

@end
