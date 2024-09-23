@implementation PLSearchBackendPSIDatabaseGetLog

void __PLSearchBackendPSIDatabaseGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendPSIDatabase");
  v1 = (void *)PLSearchBackendPSIDatabaseGetLog_log;
  PLSearchBackendPSIDatabaseGetLog_log = (uint64_t)v0;

}

@end
