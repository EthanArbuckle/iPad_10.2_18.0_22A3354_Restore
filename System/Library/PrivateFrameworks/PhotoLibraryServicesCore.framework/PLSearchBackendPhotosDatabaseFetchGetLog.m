@implementation PLSearchBackendPhotosDatabaseFetchGetLog

void __PLSearchBackendPhotosDatabaseFetchGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendPhotosDatabaseFetch");
  v1 = (void *)PLSearchBackendPhotosDatabaseFetchGetLog_log;
  PLSearchBackendPhotosDatabaseFetchGetLog_log = (uint64_t)v0;

}

@end
