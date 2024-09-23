@implementation SKGLogAgentInit

void __SKGLogAgentInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeAgent");
  v1 = (void *)SKGLogAgentInit_sSKGAgentLog;
  SKGLogAgentInit_sSKGAgentLog = (uint64_t)v0;

}

@end
