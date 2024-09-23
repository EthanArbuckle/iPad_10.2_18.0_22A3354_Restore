@implementation WLKPushNotificationsLogObject

void __WLKPushNotificationsLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.WatchListKit", "PushNotifications");
  v1 = (void *)WLKPushNotificationsLogObject_logger;
  WLKPushNotificationsLogObject_logger = (uint64_t)v0;

}

@end
