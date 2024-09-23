@implementation SBLogZStackSystemApertureSuppression

void __SBLogZStackSystemApertureSuppression_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "ZStackSystemApertureSuppression");
  v1 = (void *)SBLogZStackSystemApertureSuppression___logObj;
  SBLogZStackSystemApertureSuppression___logObj = (uint64_t)v0;

}

@end
