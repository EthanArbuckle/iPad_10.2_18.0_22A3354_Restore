@implementation PBFLogPower

void __PBFLogPower_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Power");
  v1 = (void *)PBFLogPower___logObj;
  PBFLogPower___logObj = (uint64_t)v0;

}

@end
