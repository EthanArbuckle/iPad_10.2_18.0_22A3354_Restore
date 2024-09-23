@implementation MLLog

void __16___MLLog_common__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ml.remotelog", "RemoteCommon");
  v1 = (void *)common__common;
  common__common = (uint64_t)v0;

}

void __25___MLLog_clientFramework__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ml.remotelog", "RemoteClient");
  v1 = (void *)clientFramework__framework;
  clientFramework__framework = (uint64_t)v0;

}

void __16___MLLog_daemon__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ml.remotelog", "RemoteDaemon");
  v1 = (void *)daemon__daemon;
  daemon__daemon = (uint64_t)v0;

}

void __25___MLLog_serverFramework__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ml.remotelog", "RemoteServer");
  v1 = (void *)serverFramework__framework;
  serverFramework__framework = (uint64_t)v0;

}

void __14___MLLog_tool__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ml.remotelog", "RemoteTool");
  v1 = (void *)tool__tool;
  tool__tool = (uint64_t)v0;

}

@end
