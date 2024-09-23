@implementation SBLogSystemGestureHome

void __SBLogSystemGestureHome_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DAB4F8], "SystemGestureHome");
  v1 = (void *)SBLogSystemGestureHome___logObj;
  SBLogSystemGestureHome___logObj = (uint64_t)v0;

}

@end
