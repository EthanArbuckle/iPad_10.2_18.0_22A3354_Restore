@implementation RemoteHIDLog

void __RemoteHIDLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.RemoteHID", "default");
  v1 = (void *)RemoteHIDLog_log;
  RemoteHIDLog_log = (uint64_t)v0;

}

@end
