@implementation VOTLogEvent

void __VOTLogEvent_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTEvent");
  v1 = (void *)VOTLogEvent___logObj;
  VOTLogEvent___logObj = (uint64_t)v0;

}

@end
