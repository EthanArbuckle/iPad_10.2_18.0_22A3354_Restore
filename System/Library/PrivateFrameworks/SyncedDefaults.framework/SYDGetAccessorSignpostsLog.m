@implementation SYDGetAccessorSignpostsLog

void __SYDGetAccessorSignpostsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "AccessorSignposts");
  v1 = (void *)SYDGetAccessorSignpostsLog_log;
  SYDGetAccessorSignpostsLog_log = (uint64_t)v0;

}

@end
