@implementation SharedCacheQueue

void ___SharedCacheQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("passd_cache_queue", 0);
  v1 = (void *)qword_1ECF220B8;
  qword_1ECF220B8 = (uint64_t)v0;

}

@end
