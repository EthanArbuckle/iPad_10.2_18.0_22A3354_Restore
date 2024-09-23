@implementation RPConnectionLog

void __RPConnectionLog_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = LogCategoryCopyOSLogHandle();
  v1 = (void *)RPConnectionLog___logger;
  RPConnectionLog___logger = v0;

}

@end
