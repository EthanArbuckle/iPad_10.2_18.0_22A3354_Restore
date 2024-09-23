@implementation IMInitializeLogCategories

void __IMInitializeLogCategories_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.podcasts", "iTunesMobile");
  v1 = (void *)IMLogCategoryDefault;
  IMLogCategoryDefault = (uint64_t)v0;

}

@end
