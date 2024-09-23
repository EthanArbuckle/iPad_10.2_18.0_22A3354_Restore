@implementation AXMediaLogTextProcessing

void __AXMediaLogTextProcessing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMediaTextProcessing");
  v1 = (void *)AXMediaLogTextProcessing___logObj;
  AXMediaLogTextProcessing___logObj = (uint64_t)v0;

}

@end
