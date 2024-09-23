@implementation SBLogInCallPresentation

void __SBLogInCallPresentation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "InCallPresentation");
  v1 = (void *)SBLogInCallPresentation___logObj;
  SBLogInCallPresentation___logObj = (uint64_t)v0;

}

@end
