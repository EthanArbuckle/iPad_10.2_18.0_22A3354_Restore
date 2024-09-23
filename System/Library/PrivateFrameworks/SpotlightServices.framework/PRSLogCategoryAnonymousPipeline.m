@implementation PRSLogCategoryAnonymousPipeline

void __PRSLogCategoryAnonymousPipeline_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.spotlight", "anonymous-pipeline");
  v1 = (void *)PRSLogCategoryAnonymousPipeline_anonymousPipelineLog;
  PRSLogCategoryAnonymousPipeline_anonymousPipelineLog = (uint64_t)v0;

}

@end
