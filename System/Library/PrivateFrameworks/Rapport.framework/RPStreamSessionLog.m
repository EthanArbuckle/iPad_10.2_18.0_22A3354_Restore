@implementation RPStreamSessionLog

void __RPStreamSessionLog_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = LogCategoryCopyOSLogHandle();
  v1 = (void *)RPStreamSessionLog___logger;
  RPStreamSessionLog___logger = v0;

}

@end
