@implementation PLSearchBackendIndexWorkerGetLog

void __PLSearchBackendIndexWorkerGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.backend.search", "SearchBackendIndexWorker");
  v1 = (void *)PLSearchBackendIndexWorkerGetLog_log;
  PLSearchBackendIndexWorkerGetLog_log = (uint64_t)v0;

}

@end
