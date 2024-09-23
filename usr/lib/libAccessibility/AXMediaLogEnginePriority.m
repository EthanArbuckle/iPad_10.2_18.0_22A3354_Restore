@implementation AXMediaLogEnginePriority

void __AXMediaLogEnginePriority_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaEnginePriority");
  v1 = (void *)AXMediaLogEnginePriority___logObj;
  AXMediaLogEnginePriority___logObj = (uint64_t)v0;

}

@end
