@implementation PBFLogModal

void __PBFLogModal_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Modal");
  v1 = (void *)PBFLogModal___logObj;
  PBFLogModal___logObj = (uint64_t)v0;

}

@end
