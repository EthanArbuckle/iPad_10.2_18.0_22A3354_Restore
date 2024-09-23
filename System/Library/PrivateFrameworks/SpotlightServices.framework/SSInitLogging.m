@implementation SSInitLogging

void __SSInitLogging_block_invoke()
{
  uint64_t i;
  os_log_t v1;
  void *v2;

  for (i = 0; i != 3; ++i)
  {
    v1 = os_log_create("com.apple.SpotlightServices", SSLogSubsystem_block_invoke_categories[i]);
    v2 = (void *)SSLogHandles[i];
    SSLogHandles[i] = (uint64_t)v1;

  }
}

@end
