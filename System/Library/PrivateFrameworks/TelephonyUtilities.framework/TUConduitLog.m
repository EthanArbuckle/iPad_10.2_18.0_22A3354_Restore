@implementation TUConduitLog

void __TUConduitLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.telephonyutilities", "NeighborhoodActivityCore");
  v1 = (void *)TUConduitLog___log;
  TUConduitLog___log = (uint64_t)v0;

}

@end
