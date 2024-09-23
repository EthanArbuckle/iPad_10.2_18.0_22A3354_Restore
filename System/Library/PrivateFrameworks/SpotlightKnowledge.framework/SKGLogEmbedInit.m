@implementation SKGLogEmbedInit

void __SKGLogEmbedInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeEmbedding");
  v1 = (void *)SKGLogEmbedInit_sSKGEmbedLog;
  SKGLogEmbedInit_sSKGEmbedLog = (uint64_t)v0;

}

@end
