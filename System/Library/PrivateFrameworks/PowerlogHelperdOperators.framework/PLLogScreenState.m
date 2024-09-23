@implementation PLLogScreenState

void __PLLogScreenState_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "screenState");
  v1 = (void *)PLLogScreenState___logObj;
  PLLogScreenState___logObj = (uint64_t)v0;

}

@end
