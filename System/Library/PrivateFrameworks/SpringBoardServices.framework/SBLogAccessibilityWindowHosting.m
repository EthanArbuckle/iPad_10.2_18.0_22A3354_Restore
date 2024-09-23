@implementation SBLogAccessibilityWindowHosting

void __SBLogAccessibilityWindowHosting_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "AccessibilityWindowHosting");
  v1 = (void *)SBLogAccessibilityWindowHosting___logObj;
  SBLogAccessibilityWindowHosting___logObj = (uint64_t)v0;

}

@end
