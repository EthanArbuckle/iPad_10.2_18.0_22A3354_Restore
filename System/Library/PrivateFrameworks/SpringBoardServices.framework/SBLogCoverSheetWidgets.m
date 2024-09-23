@implementation SBLogCoverSheetWidgets

void __SBLogCoverSheetWidgets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "CoverSheetWidgets");
  v1 = (void *)SBLogCoverSheetWidgets___logObj;
  SBLogCoverSheetWidgets___logObj = (uint64_t)v0;

}

@end
