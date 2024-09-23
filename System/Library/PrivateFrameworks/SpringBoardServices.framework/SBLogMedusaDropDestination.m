@implementation SBLogMedusaDropDestination

void __SBLogMedusaDropDestination_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "MedusaDropDestination");
  v1 = (void *)SBLogMedusaDropDestination___logObj;
  SBLogMedusaDropDestination___logObj = (uint64_t)v0;

}

@end
