@implementation SKGLogEventInit

void __SKGLogEventInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeEvent");
  v1 = (void *)SKGLogEventInit_sSKGEventLog;
  SKGLogEventInit_sSKGEventLog = (uint64_t)v0;

}

@end
