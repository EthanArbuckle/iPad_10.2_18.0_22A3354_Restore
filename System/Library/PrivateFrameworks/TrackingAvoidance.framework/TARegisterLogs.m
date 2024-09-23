@implementation TARegisterLogs

void __TARegisterLogs_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;

  v0 = os_log_create("com.apple.tracking-avoidance", "Status");
  v1 = (void *)TAStatusLog;
  TAStatusLog = (uint64_t)v0;

  v2 = os_log_create("com.apple.tracking-avoidance", "Events");
  v3 = (void *)TAEventsLog;
  TAEventsLog = (uint64_t)v2;

  v4 = os_log_create("com.apple.TrackingAvoidance", "SeparationAlerts");
  v5 = (void *)TASALog;
  TASALog = (uint64_t)v4;

  v6 = os_log_create("com.apple.TrackingAvoidance", "SeparationAlertsEvents");
  v7 = (void *)TASAEventsLog;
  TASAEventsLog = (uint64_t)v6;

}

@end
