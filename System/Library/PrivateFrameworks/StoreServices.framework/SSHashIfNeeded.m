@implementation SSHashIfNeeded

void __SSHashIfNeeded_block_invoke()
{
  SSLRUCache *v0;
  void *v1;

  v0 = objc_alloc_init(SSLRUCache);
  v1 = (void *)SSHashIfNeeded_ss_once_object___COUNTER__;
  SSHashIfNeeded_ss_once_object___COUNTER__ = (uint64_t)v0;

}

@end
