@implementation PLSearchBackendIndexingEngineGetLog

void __PLSearchBackendIndexingEngineGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendIndexingEngine");
  v1 = (void *)PLSearchBackendIndexingEngineGetLog_log;
  PLSearchBackendIndexingEngineGetLog_log = (uint64_t)v0;

}

@end
