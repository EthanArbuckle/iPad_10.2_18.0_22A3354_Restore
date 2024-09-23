@implementation PSUSummarizationLogging

void __PSUSummarizationLogging_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x24952359C]();
  v1 = os_log_create("com.apple.suggestions", "summarization");
  v2 = (void *)PSUSummarizationLogging__pasExprOnceResult;
  PSUSummarizationLogging__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
