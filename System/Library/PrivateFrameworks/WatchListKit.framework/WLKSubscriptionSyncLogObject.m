@implementation WLKSubscriptionSyncLogObject

void __WLKSubscriptionSyncLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchListKit", "SubscriptionSync");
  v1 = (void *)WLKSubscriptionSyncLogObject_logger;
  WLKSubscriptionSyncLogObject_logger = (uint64_t)v0;

}

@end
