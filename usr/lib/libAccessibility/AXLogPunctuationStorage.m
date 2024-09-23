@implementation AXLogPunctuationStorage

void __AXLogPunctuationStorage_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXPunctuationStorage");
  v1 = (void *)AXLogPunctuationStorage___logObj;
  AXLogPunctuationStorage___logObj = (uint64_t)v0;

}

@end
