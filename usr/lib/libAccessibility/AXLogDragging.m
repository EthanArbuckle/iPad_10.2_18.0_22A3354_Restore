@implementation AXLogDragging

void __AXLogDragging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXDragging");
  v1 = (void *)AXLogDragging___logObj;
  AXLogDragging___logObj = (uint64_t)v0;

}

@end
