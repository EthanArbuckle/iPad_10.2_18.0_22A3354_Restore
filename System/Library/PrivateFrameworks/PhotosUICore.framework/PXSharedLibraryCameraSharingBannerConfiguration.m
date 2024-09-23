@implementation PXSharedLibraryCameraSharingBannerConfiguration

void __PXSharedLibraryCameraSharingBannerConfiguration_block_invoke_2()
{
  PXPreferencesSetCameraSharingPreferencesState(2);
}

void __PXSharedLibraryCameraSharingBannerConfiguration_block_invoke(uint64_t a1, void *a2)
{
  PXPresentCameraSharingSetup(a2);
}

@end
