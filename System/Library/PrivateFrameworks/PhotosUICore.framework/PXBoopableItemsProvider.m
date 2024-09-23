@implementation PXBoopableItemsProvider

- (PXBoopableItemsProvider)init
{
  PXBoopableItemsProvider *v2;
  PXBoopableItemsProvider_Swift *v3;
  PXBoopableItemsProvider_Swift *boopableItemsProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXBoopableItemsProvider;
  v2 = -[PXBoopableItemsProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXBoopableItemsProvider_Swift);
    boopableItemsProvider = v2->_boopableItemsProvider;
    v2->_boopableItemsProvider = v3;

  }
  return v2;
}

- (PXSectionedSelectionManager)selectionManager
{
  return -[PXBoopableItemsProvider_Swift selectionManager](self->_boopableItemsProvider, "selectionManager");
}

- (void)setSelectionManager:(id)a3
{
  -[PXBoopableItemsProvider_Swift setSelectionManager:](self->_boopableItemsProvider, "setSelectionManager:", a3);
}

- (NSArray)assets
{
  return -[PXBoopableItemsProvider_Swift assets](self->_boopableItemsProvider, "assets");
}

- (void)setAssets:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[PXBoopableItemsProvider_Swift setAssets:](self->_boopableItemsProvider, "setAssets:", v4);

}

- (PXMediaProvider)imagePreviewMediaProvider
{
  return -[PXBoopableItemsProvider_Swift imagePreviewMediaProvider](self->_boopableItemsProvider, "imagePreviewMediaProvider");
}

- (void)setImagePreviewMediaProvider:(id)a3
{
  -[PXBoopableItemsProvider_Swift setImagePreviewMediaProvider:](self->_boopableItemsProvider, "setImagePreviewMediaProvider:", a3);
}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  return -[PXBoopableItemsProvider_Swift itemProvidersForActivityItemsConfiguration](self->_boopableItemsProvider, "itemProvidersForActivityItemsConfiguration");
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  return -[PXBoopableItemsProvider_Swift activityItemsConfigurationMetadataForKey:](self->_boopableItemsProvider, "activityItemsConfigurationMetadataForKey:", a3);
}

- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5
{
  return -[PXBoopableItemsProvider_Swift activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:](self->_boopableItemsProvider, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", a3, a4, a5.width, a5.height);
}

- (PXBoopableItemsProvider_Swift)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setBoopableItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
}

@end
