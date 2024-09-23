@implementation PRSLogCategoryDefault

void __PRSLogCategoryDefault_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "spotlight-services");
  v1 = (void *)PRSLogCategoryDefault_defaultLog;
  PRSLogCategoryDefault_defaultLog = (uint64_t)v0;

}

@end
