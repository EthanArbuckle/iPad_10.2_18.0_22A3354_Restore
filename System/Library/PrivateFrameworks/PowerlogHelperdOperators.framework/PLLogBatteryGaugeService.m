@implementation PLLogBatteryGaugeService

void __PLLogBatteryGaugeService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "batteryGaugeService");
  v1 = (void *)PLLogBatteryGaugeService_log;
  PLLogBatteryGaugeService_log = (uint64_t)v0;

}

@end
