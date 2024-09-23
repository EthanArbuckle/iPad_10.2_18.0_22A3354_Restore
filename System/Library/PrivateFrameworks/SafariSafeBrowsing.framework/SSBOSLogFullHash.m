@implementation SSBOSLogFullHash

void __SSBOSLogFullHash_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "FullHash");
  v1 = (void *)SSBOSLogFullHash_log;
  SSBOSLogFullHash_log = (uint64_t)v0;

}

@end
