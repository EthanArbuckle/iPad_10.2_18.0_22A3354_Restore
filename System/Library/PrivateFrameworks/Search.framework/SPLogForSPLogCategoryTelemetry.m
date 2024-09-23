@implementation SPLogForSPLogCategoryTelemetry

void __SPLogForSPLogCategoryTelemetry_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "telemetry");
  v1 = (void *)SPLogForSPLogCategoryTelemetry_sQueryLog;
  SPLogForSPLogCategoryTelemetry_sQueryLog = (uint64_t)v0;

}

@end
