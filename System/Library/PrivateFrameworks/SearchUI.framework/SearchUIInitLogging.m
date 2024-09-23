@implementation SearchUIInitLogging

void __SearchUIInitLogging_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 8; ++i)
  {
    v1 = os_log_create("com.apple.searchui", SearchUILogSubsystem_block_invoke_categories[i]);
    v2 = (void *)searchUILogHandles[i];
    searchUILogHandles[i] = (uint64_t)v1;

  }
}

@end
