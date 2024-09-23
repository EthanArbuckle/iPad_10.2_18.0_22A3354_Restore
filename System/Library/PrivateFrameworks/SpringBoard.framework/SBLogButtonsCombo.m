@implementation SBLogButtonsCombo

void __SBLogButtonsCombo_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBButtonLoggingSubsystem, "Combo");
  v1 = (void *)SBLogButtonsCombo___logObj;
  SBLogButtonsCombo___logObj = (uint64_t)v0;

}

@end
