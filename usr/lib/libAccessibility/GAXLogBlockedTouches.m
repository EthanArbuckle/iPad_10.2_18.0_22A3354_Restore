@implementation GAXLogBlockedTouches

void __GAXLogBlockedTouches_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "GAXBlockedTouches");
  v1 = (void *)GAXLogBlockedTouches___logObj;
  GAXLogBlockedTouches___logObj = (uint64_t)v0;

}

@end
