@implementation TVRCXPCLog

void ___TVRCXPCLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.tvremotecore.xpc", "Client");
  v1 = (void *)_TVRCXPCLog_log;
  _TVRCXPCLog_log = (uint64_t)v0;

}

@end
