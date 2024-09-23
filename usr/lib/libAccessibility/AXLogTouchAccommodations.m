@implementation AXLogTouchAccommodations

void __AXLogTouchAccommodations_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXTouchAccommodations");
  v1 = (void *)AXLogTouchAccommodations___logObj;
  AXLogTouchAccommodations___logObj = (uint64_t)v0;

}

@end
