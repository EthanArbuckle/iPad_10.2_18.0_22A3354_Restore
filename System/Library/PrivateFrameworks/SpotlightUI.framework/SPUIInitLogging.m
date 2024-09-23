@implementation SPUIInitLogging

void __SPUIInitLogging_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 7; ++i)
  {
    v1 = os_log_create("com.apple.spotlight.ui", SPUILogSubsystem_block_invoke_categories[i]);
    v2 = (void *)spuiLogHandles[i];
    spuiLogHandles[i] = (uint64_t)v1;

  }
}

@end
