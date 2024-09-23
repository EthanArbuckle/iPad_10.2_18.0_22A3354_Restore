@implementation AXLogMIDI

void __AXLogMIDI_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXMIDI");
  v1 = (void *)AXLogMIDI___logObj;
  AXLogMIDI___logObj = (uint64_t)v0;

}

@end
