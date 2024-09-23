@implementation CPLSystemLibraryOSLogDomain

void ____CPLSystemLibraryOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = (const char *)_CPLOSLogSubsystem();
  v1 = os_log_create(v0, "client.assetsd.manager.systemlibrary");
  v2 = (void *)__CPLSystemLibraryOSLogDomain_result;
  __CPLSystemLibraryOSLogDomain_result = (uint64_t)v1;

}

@end
