@implementation WGCachedNSHomeDirectory

void __WGCachedNSHomeDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;

  NSHomeDirectory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WGCachedNSHomeDirectory___homeDir;
  WGCachedNSHomeDirectory___homeDir = v0;

}

@end
