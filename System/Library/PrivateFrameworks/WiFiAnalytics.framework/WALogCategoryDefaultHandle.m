@implementation WALogCategoryDefaultHandle

void __WALogCategoryDefaultHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.wifi.analytics", "Default");
  v1 = (void *)WALogCategoryDefaultHandle_defaultHandle;
  WALogCategoryDefaultHandle_defaultHandle = (uint64_t)v0;

}

@end
