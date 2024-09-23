@implementation PLSearchBackendDonationsGetLog

void __PLSearchBackendDonationsGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendDonations");
  v1 = (void *)PLSearchBackendDonationsGetLog_log;
  PLSearchBackendDonationsGetLog_log = (uint64_t)v0;

}

@end
