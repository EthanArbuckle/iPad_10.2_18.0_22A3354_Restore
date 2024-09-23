@implementation AXLogTapticTime

void __AXLogTapticTime_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTapticTime");
  v1 = (void *)AXLogTapticTime___logObj;
  AXLogTapticTime___logObj = (uint64_t)v0;

}

@end
