@implementation PLSyndicationGetLog

void __PLSyndicationGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "Syndication");
  v1 = (void *)PLSyndicationGetLog_log;
  PLSyndicationGetLog_log = (uint64_t)v0;

}

@end
