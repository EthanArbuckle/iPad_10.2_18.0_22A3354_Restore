@implementation PXAnalyticsPrepare

void __PXAnalyticsPrepare_block_invoke()
{
  void *v0;
  PXAnalyticsFeatureUsageCountDestination *v1;
  void *v2;
  PXAnalyticsMemoriesUsageDestination *v3;
  void *v4;
  PXAnalyticsSlideshowUsageDestination *v5;
  void *v6;
  PXViewCountAnalyticsDestination *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v0 = (void *)MEMORY[0x1E0D09910];
  v1 = objc_alloc_init(PXAnalyticsFeatureUsageCountDestination);
  objc_msgSend(v0, "addDestination:", v1);

  v2 = (void *)MEMORY[0x1E0D09910];
  v3 = objc_alloc_init(PXAnalyticsMemoriesUsageDestination);
  objc_msgSend(v2, "addDestination:", v3);

  v4 = (void *)MEMORY[0x1E0D09910];
  v5 = objc_alloc_init(PXAnalyticsSlideshowUsageDestination);
  objc_msgSend(v4, "addDestination:", v5);

  v6 = (void *)MEMORY[0x1E0D09910];
  v7 = objc_alloc_init(PXViewCountAnalyticsDestination);
  objc_msgSend(v6, "addDestination:", v7);

  v8 = (void *)MEMORY[0x1E0D09910];
  objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-PhotosUICore"), v9);

  v10 = (void *)MEMORY[0x1E0D09910];
  objc_msgSend(MEMORY[0x1E0CB34D0], "px_bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-Lemonade"), v11);

  objc_msgSend(MEMORY[0x1E0D09910], "updateWithConfiguration:", &unk_1E53F0D40);
  if (PXStoryAnalyticsPrepare_onceToken != -1)
    dispatch_once(&PXStoryAnalyticsPrepare_onceToken, &__block_literal_global_84241);
}

@end
