@implementation SKGLogKeyphraseInit

void __SKGLogKeyphraseInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeKeyphrases");
  v1 = (void *)SKGLogKeyphraseInit_sSKGKeyphraseLog;
  SKGLogKeyphraseInit_sSKGKeyphraseLog = (uint64_t)v0;

}

@end
