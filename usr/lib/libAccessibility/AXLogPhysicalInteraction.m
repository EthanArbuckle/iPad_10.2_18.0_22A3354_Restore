@implementation AXLogPhysicalInteraction

void __AXLogPhysicalInteraction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXPhysicalInteraction");
  v1 = (void *)AXLogPhysicalInteraction___logObj;
  AXLogPhysicalInteraction___logObj = (uint64_t)v0;

}

@end
