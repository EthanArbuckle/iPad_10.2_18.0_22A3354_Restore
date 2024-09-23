@implementation PLSearchBackendIndexStatusGetLog

void __PLSearchBackendIndexStatusGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendIndexStatus");
  v1 = (void *)PLSearchBackendIndexStatusGetLog_log;
  PLSearchBackendIndexStatusGetLog_log = (uint64_t)v0;

}

@end
