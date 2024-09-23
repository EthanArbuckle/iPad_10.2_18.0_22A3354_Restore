@implementation PLSearchBackendQueryGetLog

void __PLSearchBackendQueryGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendQuery");
  v1 = (void *)PLSearchBackendQueryGetLog_log;
  PLSearchBackendQueryGetLog_log = (uint64_t)v0;

}

@end
