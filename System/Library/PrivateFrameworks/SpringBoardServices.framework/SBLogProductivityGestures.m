@implementation SBLogProductivityGestures

void __SBLogProductivityGestures_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "ProductivityGestures");
  v1 = (void *)SBLogProductivityGestures___logObj;
  SBLogProductivityGestures___logObj = (uint64_t)v0;

}

@end
