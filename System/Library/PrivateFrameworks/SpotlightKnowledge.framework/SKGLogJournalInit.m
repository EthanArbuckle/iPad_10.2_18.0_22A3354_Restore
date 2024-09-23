@implementation SKGLogJournalInit

void __SKGLogJournalInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeJournals");
  v1 = (void *)SKGLogJournalInit_sSKGJournalLog;
  SKGLogJournalInit_sSKGJournalLog = (uint64_t)v0;

}

@end
