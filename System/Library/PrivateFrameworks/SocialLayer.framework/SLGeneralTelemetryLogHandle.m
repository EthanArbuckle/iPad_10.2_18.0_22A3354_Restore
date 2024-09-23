@implementation SLGeneralTelemetryLogHandle

void __SLGeneralTelemetryLogHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SocialLayer.telemetry", "General");
  v1 = (void *)SLGeneralTelemetryLogHandle_osLog;
  SLGeneralTelemetryLogHandle_osLog = (uint64_t)v0;

}

@end
