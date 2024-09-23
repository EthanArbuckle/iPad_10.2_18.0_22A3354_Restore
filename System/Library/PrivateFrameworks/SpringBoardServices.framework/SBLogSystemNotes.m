@implementation SBLogSystemNotes

void __SBLogSystemNotes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "SystemNotes");
  v1 = (void *)SBLogSystemNotes___logObj;
  SBLogSystemNotes___logObj = (uint64_t)v0;

}

@end
