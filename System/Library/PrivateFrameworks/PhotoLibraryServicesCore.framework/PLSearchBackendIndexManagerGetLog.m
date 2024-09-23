@implementation PLSearchBackendIndexManagerGetLog

void __PLSearchBackendIndexManagerGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendIndexManager");
  v1 = (void *)PLSearchBackendIndexManagerGetLog_log;
  PLSearchBackendIndexManagerGetLog_log = (uint64_t)v0;

}

@end
