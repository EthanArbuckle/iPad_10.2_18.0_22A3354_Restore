@implementation PLLogZlib

void __PLLogZlib_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "zlib");
  v1 = (void *)PLLogZlib___logObj;
  PLLogZlib___logObj = (uint64_t)v0;

}

@end
