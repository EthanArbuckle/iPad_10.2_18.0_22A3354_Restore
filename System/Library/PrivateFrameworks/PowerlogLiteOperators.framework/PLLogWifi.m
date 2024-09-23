@implementation PLLogWifi

void __PLLogWifi_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "wifi");
  v1 = (void *)qword_1ED885050;
  qword_1ED885050 = (uint64_t)v0;

}

@end
