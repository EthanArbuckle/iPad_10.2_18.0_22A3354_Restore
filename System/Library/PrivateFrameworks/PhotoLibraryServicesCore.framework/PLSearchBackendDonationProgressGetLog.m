@implementation PLSearchBackendDonationProgressGetLog

void __PLSearchBackendDonationProgressGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendDonationProgress");
  v1 = (void *)PLSearchBackendDonationProgressGetLog_log;
  PLSearchBackendDonationProgressGetLog_log = (uint64_t)v0;

}

@end
