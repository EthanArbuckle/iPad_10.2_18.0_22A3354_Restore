@implementation ICQDaemonAlertMemoryInitOnce

void ___ICQDaemonAlertMemoryInitOnce_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)_ICQDaemonAlertMemoryLock;
  _ICQDaemonAlertMemoryLock = v0;

  v2 = objc_opt_new();
  v3 = (void *)_ICQDaemonAlertMemoryDict;
  _ICQDaemonAlertMemoryDict = v2;

}

@end
