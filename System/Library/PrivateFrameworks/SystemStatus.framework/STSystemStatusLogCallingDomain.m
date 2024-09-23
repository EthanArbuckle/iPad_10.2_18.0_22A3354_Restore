@implementation STSystemStatusLogCallingDomain

void __STSystemStatusLogCallingDomain_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(STSystemStatusLoggingSubsystem, "CallingDomain");
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v0;

}

@end
