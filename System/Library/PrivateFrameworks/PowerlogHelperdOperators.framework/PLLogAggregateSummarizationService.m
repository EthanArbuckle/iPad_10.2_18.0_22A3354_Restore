@implementation PLLogAggregateSummarizationService

void __PLLogAggregateSummarizationService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "aggregateSummarizationService");
  v1 = (void *)PLLogAggregateSummarizationService___logObj;
  PLLogAggregateSummarizationService___logObj = (uint64_t)v0;

}

@end
