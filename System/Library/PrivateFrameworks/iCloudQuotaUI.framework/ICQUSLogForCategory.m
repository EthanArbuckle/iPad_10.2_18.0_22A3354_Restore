@implementation ICQUSLogForCategory

void __ICQUSLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iCloudQuotaUI.UsageSettings", "Base");
  v1 = (void *)ICQUSLogForCategory_logObjects_0;
  ICQUSLogForCategory_logObjects_0 = (uint64_t)v0;

}

@end
