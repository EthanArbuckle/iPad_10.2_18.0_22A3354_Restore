@implementation PRLogSnapshotter

void __PRLogSnapshotter_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterKit", "Snapshotter");
  v1 = (void *)PRLogSnapshotter___logObj;
  PRLogSnapshotter___logObj = (uint64_t)v0;

}

@end
