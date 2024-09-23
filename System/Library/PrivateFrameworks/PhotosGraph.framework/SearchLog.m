@implementation SearchLog

void __SearchLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PhotosGraph.ZeroKeyword", "SearchLogPerformance");
  v1 = (void *)SearchLog_log;
  SearchLog_log = (uint64_t)v0;

}

@end
