@implementation PBFLogSnapshotter

void __PBFLogSnapshotter_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Snapshotter");
  v1 = (void *)PBFLogSnapshotter___logObj;
  PBFLogSnapshotter___logObj = (uint64_t)v0;

}

@end
