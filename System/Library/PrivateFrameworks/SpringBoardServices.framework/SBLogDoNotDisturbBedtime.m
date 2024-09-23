@implementation SBLogDoNotDisturbBedtime

void __SBLogDoNotDisturbBedtime_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)SBLoggingSubsystem, "DoNotDisturbBedtime");
  v1 = (void *)SBLogDoNotDisturbBedtime___logObj;
  SBLogDoNotDisturbBedtime___logObj = (uint64_t)v0;

}

@end
