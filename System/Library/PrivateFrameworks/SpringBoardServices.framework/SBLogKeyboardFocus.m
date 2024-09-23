@implementation SBLogKeyboardFocus

void __SBLogKeyboardFocus_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "KeyboardFocus");
  v1 = (void *)SBLogKeyboardFocus___logObj;
  SBLogKeyboardFocus___logObj = (uint64_t)v0;

}

@end
