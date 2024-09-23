@implementation PLUpNextGetLog

void __PLUpNextGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.memories.upNext", "UpNextGeneration");
  v1 = (void *)PLUpNextGetLog_log;
  PLUpNextGetLog_log = (uint64_t)v0;

}

@end
