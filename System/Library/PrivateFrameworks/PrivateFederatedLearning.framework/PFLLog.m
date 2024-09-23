@implementation PFLLog

void __20___PFLLog_framework__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivateFederatedLearning", "Framework");
  v1 = (void *)framework__framework;
  framework__framework = (uint64_t)v0;

}

void __20___PFLLog_telemetry__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivateFederatedLearning", "Telemetry");
  v1 = (void *)telemetry_telemetry;
  telemetry_telemetry = (uint64_t)v0;

}

void __20___PFLLog_extension__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PrivateFederatedLearning", "MLRuntimePlugin");
  v1 = (void *)extension__extension;
  extension__extension = (uint64_t)v0;

}

@end
