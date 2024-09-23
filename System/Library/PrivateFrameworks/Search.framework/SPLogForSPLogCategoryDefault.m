@implementation SPLogForSPLogCategoryDefault

void __SPLogForSPLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "default");
  v1 = (void *)SPLogForSPLogCategoryDefault_sDefaultLog;
  SPLogForSPLogCategoryDefault_sDefaultLog = (uint64_t)v0;

}

@end
