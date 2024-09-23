@implementation PLSearchBackendResultProcessingGetLog

void __PLSearchBackendResultProcessingGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendResultProcessing");
  v1 = (void *)PLSearchBackendResultProcessingGetLog_log;
  PLSearchBackendResultProcessingGetLog_log = (uint64_t)v0;

}

@end
