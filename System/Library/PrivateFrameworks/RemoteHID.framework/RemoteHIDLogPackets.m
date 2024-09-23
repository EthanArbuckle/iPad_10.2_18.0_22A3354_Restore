@implementation RemoteHIDLogPackets

void __RemoteHIDLogPackets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.RemoteHID", "packets");
  v1 = (void *)RemoteHIDLogPackets_log;
  RemoteHIDLogPackets_log = (uint64_t)v0;

}

@end
