@implementation SBLogApplicationRestrictionMonitoring

void __SBLogApplicationRestrictionMonitoring_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "ApplicationRestrictionMonitoring");
  v1 = (void *)SBLogApplicationRestrictionMonitoring___logObj;
  SBLogApplicationRestrictionMonitoring___logObj = (uint64_t)v0;

}

@end
