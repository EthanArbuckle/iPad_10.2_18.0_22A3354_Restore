@implementation PLLogSensor

void __PLLogSensor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "sensor");
  v1 = (void *)_MergedGlobals_1_56;
  _MergedGlobals_1_56 = (uint64_t)v0;

}

@end
