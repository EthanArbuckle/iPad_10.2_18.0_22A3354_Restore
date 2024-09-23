@implementation TIInputManagerOSLogFacility

void __TIInputManagerOSLogFacility_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "KBDInputManager");
  v1 = (void *)TIInputManagerOSLogFacility_logFacility;
  TIInputManagerOSLogFacility_logFacility = (uint64_t)v0;

}

@end
