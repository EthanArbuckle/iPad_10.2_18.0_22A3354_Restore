@implementation CreateSearchLog

void __CreateSearchLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PhotosGraph", "Search");
  v1 = (void *)CreateSearchLog_log;
  CreateSearchLog_log = (uint64_t)v0;

}

@end
