@implementation SPLogForSPLogCategoryRanking

void __SPLogForSPLogCategoryRanking_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "ranking");
  v1 = (void *)SPLogForSPLogCategoryRanking_sQueryLog;
  SPLogForSPLogCategoryRanking_sQueryLog = (uint64_t)v0;

}

@end
