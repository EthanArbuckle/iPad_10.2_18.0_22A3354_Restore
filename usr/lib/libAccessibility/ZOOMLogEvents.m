@implementation ZOOMLogEvents

void __ZOOMLogEvents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "ZOOMEvents");
  v1 = (void *)ZOOMLogEvents___logObj;
  ZOOMLogEvents___logObj = (uint64_t)v0;

}

@end
