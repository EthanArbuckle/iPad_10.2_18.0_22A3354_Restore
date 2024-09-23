@implementation PUILogSnapshotter

void __PUILogSnapshotter_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterUIFoundation", "Snapshotter");
  v1 = (void *)PUILogSnapshotter___logObj;
  PUILogSnapshotter___logObj = (uint64_t)v0;

}

@end
