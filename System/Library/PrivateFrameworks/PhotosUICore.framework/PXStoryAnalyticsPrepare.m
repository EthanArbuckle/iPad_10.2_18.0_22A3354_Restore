@implementation PXStoryAnalyticsPrepare

void __PXStoryAnalyticsPrepare_block_invoke()
{
  void *v0;
  PXStoryAnalyticsUsageDestination *v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0D09910];
  v1 = objc_alloc_init(PXStoryAnalyticsUsageDestination);
  objc_msgSend(v0, "addDestination:", v1);

  v2 = (void *)MEMORY[0x1E0D09910];
  PXStoryBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-PXStory"), v3);

}

@end
