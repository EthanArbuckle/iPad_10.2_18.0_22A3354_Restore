@implementation AXLogDisplayFilters

void __AXLogDisplayFilters_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "AXDisplayFilters");
  v1 = (void *)AXLogDisplayFilters___logObj;
  AXLogDisplayFilters___logObj = (uint64_t)v0;

}

@end
