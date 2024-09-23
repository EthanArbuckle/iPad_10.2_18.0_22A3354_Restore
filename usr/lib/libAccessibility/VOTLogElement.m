@implementation VOTLogElement

void __VOTLogElement_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "VOTElement");
  v1 = (void *)VOTLogElement___logObj;
  VOTLogElement___logObj = (uint64_t)v0;

}

@end
