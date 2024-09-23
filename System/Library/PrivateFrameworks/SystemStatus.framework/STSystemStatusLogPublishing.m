@implementation STSystemStatusLogPublishing

void __STSystemStatusLogPublishing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(STSystemStatusLoggingSubsystem, "Publishing");
  v1 = (void *)STSystemStatusLogPublishing___logObj;
  STSystemStatusLogPublishing___logObj = (uint64_t)v0;

}

@end
