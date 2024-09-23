@implementation SPLogForSPLogCategoryIndex

void __SPLogForSPLogCategoryIndex_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "index");
  v1 = (void *)SPLogForSPLogCategoryIndex_sIndexLog;
  SPLogForSPLogCategoryIndex_sIndexLog = (uint64_t)v0;

}

@end
