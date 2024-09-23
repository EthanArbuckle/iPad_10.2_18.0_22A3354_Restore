@implementation ICQBannerLogSystem

void ___ICQBannerLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iCloudQuota", "banner");
  v1 = (void *)_ICQBannerLogSystem_log;
  _ICQBannerLogSystem_log = (uint64_t)v0;

}

@end
