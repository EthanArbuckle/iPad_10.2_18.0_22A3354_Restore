@implementation SPLogForSPLogCategoryQuery

void __SPLogForSPLogCategoryQuery_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "query");
  v1 = (void *)SPLogForSPLogCategoryQuery_sQueryLog;
  SPLogForSPLogCategoryQuery_sQueryLog = (uint64_t)v0;

}

@end
