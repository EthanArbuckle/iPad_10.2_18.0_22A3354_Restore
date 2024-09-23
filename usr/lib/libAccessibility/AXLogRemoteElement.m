@implementation AXLogRemoteElement

void __AXLogRemoteElement_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXRemoteElement");
  v1 = (void *)AXLogRemoteElement___logObj;
  AXLogRemoteElement___logObj = (uint64_t)v0;

}

@end
