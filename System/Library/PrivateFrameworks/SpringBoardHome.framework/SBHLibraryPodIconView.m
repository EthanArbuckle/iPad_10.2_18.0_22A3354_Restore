@implementation SBHLibraryPodIconView

void __55___SBHLibraryPodIconView_createNewIconLabelViewFactory__block_invoke()
{
  SBIconLabelViewDefaultFactory *v0;
  void *v1;

  v0 = -[SBIconLabelViewDefaultFactory initWithFactoryIdentifier:]([SBIconLabelViewDefaultFactory alloc], "initWithFactoryIdentifier:", CFSTR("App Library Factory"));
  v1 = (void *)createNewIconLabelViewFactory_appLibraryFactory;
  createNewIconLabelViewFactory_appLibraryFactory = (uint64_t)v0;

}

@end
