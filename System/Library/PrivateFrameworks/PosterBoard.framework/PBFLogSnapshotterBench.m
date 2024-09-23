@implementation PBFLogSnapshotterBench

void __PBFLogSnapshotterBench_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "SnapshotterBench");
  v1 = (void *)PBFLogSnapshotterBench___logObj;
  PBFLogSnapshotterBench___logObj = (uint64_t)v0;

}

@end
