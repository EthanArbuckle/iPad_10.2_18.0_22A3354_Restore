@implementation PLSearchBackendIndexRebuildGetLog

void __PLSearchBackendIndexRebuildGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendIndexRebuild");
  v1 = (void *)PLSearchBackendIndexRebuildGetLog_log;
  PLSearchBackendIndexRebuildGetLog_log = (uint64_t)v0;

}

@end
