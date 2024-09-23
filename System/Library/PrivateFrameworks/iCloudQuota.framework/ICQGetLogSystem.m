@implementation ICQGetLogSystem

void ___ICQGetLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iCloudQuota", "core");
  v1 = (void *)_ICQGetLogSystem_log;
  _ICQGetLogSystem_log = (uint64_t)v0;

}

@end
