@implementation PLPhotoAnalysisQueriesGetLog

void __PLPhotoAnalysisQueriesGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "photoanalysisd");
  v1 = (void *)PLPhotoAnalysisQueriesGetLog_log;
  PLPhotoAnalysisQueriesGetLog_log = (uint64_t)v0;

}

@end
