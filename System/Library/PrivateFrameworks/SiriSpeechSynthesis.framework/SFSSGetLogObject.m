@implementation SFSSGetLogObject

void __SFSSGetLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.speech.speechsynthesis.logging", "default");
  v1 = (void *)SFSSGetLogObject___log_default;
  SFSSGetLogObject___log_default = (uint64_t)v0;

}

@end
