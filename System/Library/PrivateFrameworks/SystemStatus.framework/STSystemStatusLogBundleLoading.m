@implementation STSystemStatusLogBundleLoading

void __STSystemStatusLogBundleLoading_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create(STSystemStatusLoggingSubsystem, "BundleLoading");
  v1 = (void *)STSystemStatusLogBundleLoading___logObj;
  STSystemStatusLogBundleLoading___logObj = (uint64_t)v0;

}

@end
