@implementation PLSearchBackendPhotoKitAPIGetLog

void __PLSearchBackendPhotoKitAPIGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendPhotoKitAPI");
  v1 = (void *)PLSearchBackendPhotoKitAPIGetLog_log;
  PLSearchBackendPhotoKitAPIGetLog_log = (uint64_t)v0;

}

@end
