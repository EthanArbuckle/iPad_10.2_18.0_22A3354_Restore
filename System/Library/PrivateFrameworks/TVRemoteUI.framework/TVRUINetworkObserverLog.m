@implementation TVRUINetworkObserverLog

void ___TVRUINetworkObserverLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "NetworkObserver");
  v1 = (void *)_TVRUINetworkObserverLog_log;
  _TVRUINetworkObserverLog_log = (uint64_t)v0;

}

@end
