@implementation TVRCBLEDiscoveryLog

void ___TVRCBLEDiscoveryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteCore", "BLEDiscovery");
  v1 = (void *)_TVRCBLEDiscoveryLog_log;
  _TVRCBLEDiscoveryLog_log = (uint64_t)v0;

}

@end
