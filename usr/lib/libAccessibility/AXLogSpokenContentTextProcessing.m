@implementation AXLogSpokenContentTextProcessing

void __AXLogSpokenContentTextProcessing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXSpokenContentTextProcessing");
  v1 = (void *)AXLogSpokenContentTextProcessing___logObj;
  AXLogSpokenContentTextProcessing___logObj = (uint64_t)v0;

}

@end
