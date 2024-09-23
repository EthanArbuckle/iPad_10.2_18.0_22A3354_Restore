@implementation SnapshotCacheQueue

void ___SnapshotCacheQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.passkit.snapshotcache", 0);
  v1 = (void *)qword_1ED06C7D8;
  qword_1ED06C7D8 = (uint64_t)v0;

}

@end
