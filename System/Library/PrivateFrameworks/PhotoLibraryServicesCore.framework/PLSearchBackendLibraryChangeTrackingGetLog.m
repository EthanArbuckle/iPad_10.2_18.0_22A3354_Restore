@implementation PLSearchBackendLibraryChangeTrackingGetLog

void __PLSearchBackendLibraryChangeTrackingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendLibraryChangeTracking");
  v1 = (void *)PLSearchBackendLibraryChangeTrackingGetLog_log;
  PLSearchBackendLibraryChangeTrackingGetLog_log = (uint64_t)v0;

}

@end
