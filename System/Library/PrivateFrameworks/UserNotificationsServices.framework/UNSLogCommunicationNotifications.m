@implementation UNSLogCommunicationNotifications

void __UNSLogCommunicationNotifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)UserNotificationsServicesLogSubsystem, "CommunicationNotifications");
  v1 = (void *)UNSLogCommunicationNotifications___logger;
  UNSLogCommunicationNotifications___logger = (uint64_t)v0;

}

@end
