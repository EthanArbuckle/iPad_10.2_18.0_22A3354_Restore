@implementation CPLSyndicationOSLogDomain

void ____CPLSyndicationOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = (const char *)_CPLOSLogSubsystem();
  v1 = os_log_create(v0, "client.assetsd.manager.syndication");
  v2 = (void *)__CPLSyndicationOSLogDomain_result;
  __CPLSyndicationOSLogDomain_result = (uint64_t)v1;

}

@end
