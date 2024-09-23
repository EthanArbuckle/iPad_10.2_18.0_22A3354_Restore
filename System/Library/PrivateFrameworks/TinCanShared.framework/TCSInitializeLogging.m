@implementation TCSInitializeLogging

void ___TCSInitializeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.tincan"), "UTF8String"), "default");
  v1 = (void *)TCSLogDefault;
  TCSLogDefault = (uint64_t)v0;

}

@end
