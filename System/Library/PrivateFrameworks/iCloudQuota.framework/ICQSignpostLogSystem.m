@implementation ICQSignpostLogSystem

void ___ICQSignpostLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iCloudQuota", "core.signpost");
  v1 = (void *)_ICQSignpostLogSystem_log;
  _ICQSignpostLogSystem_log = (uint64_t)v0;

}

@end
