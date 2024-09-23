@implementation PXContentSyndicationLocalizedSocialLayerTitle

void __PXContentSyndicationLocalizedSocialLayerTitle_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DA8880]);
  objc_msgSend(v2, "displayName");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PXContentSyndicationLocalizedSocialLayerTitle_title;
  PXContentSyndicationLocalizedSocialLayerTitle_title = v0;

}

@end
