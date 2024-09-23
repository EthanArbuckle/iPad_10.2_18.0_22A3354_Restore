@implementation PLLogXPC

void __PLLogXPC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "xpc");
  v1 = (void *)PLLogXPC___logObj;
  PLLogXPC___logObj = (uint64_t)v0;

}

@end
