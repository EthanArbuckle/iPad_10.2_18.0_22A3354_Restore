@implementation PLLogArchiving

void __PLLogArchiving_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "archiving");
  v1 = (void *)PLLogArchiving___logObj;
  PLLogArchiving___logObj = (uint64_t)v0;

}

@end
