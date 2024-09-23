@implementation PLFetchPerformanceGetLog

void __PLFetchPerformanceGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "FetchPerformance");
  v1 = (void *)PLFetchPerformanceGetLog_log;
  PLFetchPerformanceGetLog_log = (uint64_t)v0;

}

@end
