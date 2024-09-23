@implementation PLLogMDNS

void __PLLogMDNS_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "MDNS");
  v1 = (void *)qword_1ED882740;
  qword_1ED882740 = (uint64_t)v0;

}

@end
