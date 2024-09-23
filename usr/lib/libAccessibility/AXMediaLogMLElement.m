@implementation AXMediaLogMLElement

void __AXMediaLogMLElement_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaMLElement");
  v1 = (void *)AXMediaLogMLElement___logObj;
  AXMediaLogMLElement___logObj = (uint64_t)v0;

}

@end
