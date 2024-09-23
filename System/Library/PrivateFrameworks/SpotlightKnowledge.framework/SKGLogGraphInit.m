@implementation SKGLogGraphInit

void __SKGLogGraphInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeGraph");
  v1 = (void *)SKGLogGraphInit_sSKGGraphLog;
  SKGLogGraphInit_sSKGGraphLog = (uint64_t)v0;

}

@end
