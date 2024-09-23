@implementation TVRDXPCLog

void ___TVRDXPCLog_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.tvremotecore.xpc", "Daemon");
  v2 = (void *)_TVRDXPCLog_log;
  _TVRDXPCLog_log = (uint64_t)v1;

}

@end
