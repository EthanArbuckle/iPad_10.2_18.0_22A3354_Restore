@implementation PXPasteboardAssetSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPasteboardAssetSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXPasteboardAssetSettings setFileURLEnabled:](self, "setFileURLEnabled:", 1);
  -[PXPasteboardAssetSettings setImageDataEnabled:](self, "setImageDataEnabled:", 1);
  -[PXPasteboardAssetSettings setSynchronousFullSizePreviewEnabled:](self, "setSynchronousFullSizePreviewEnabled:", 0);
  -[PXPasteboardAssetSettings setAlwaysUseDataProviderForObjectReference:](self, "setAlwaysUseDataProviderForObjectReference:", 0);
}

- (void)setSynchronousFullSizePreviewEnabled:(BOOL)a3
{
  self->_synchronousFullSizePreviewEnabled = a3;
}

- (void)setImageDataEnabled:(BOOL)a3
{
  self->_imageDataEnabled = a3;
}

- (void)setFileURLEnabled:(BOOL)a3
{
  self->_fileURLEnabled = a3;
}

- (void)setAlwaysUseDataProviderForObjectReference:(BOOL)a3
{
  self->_alwaysUseDataProviderForObjectReference = a3;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (BOOL)fileURLEnabled
{
  return self->_fileURLEnabled;
}

- (BOOL)imageDataEnabled
{
  return self->_imageDataEnabled;
}

- (BOOL)alwaysUseDataProviderForObjectReference
{
  return self->_alwaysUseDataProviderForObjectReference;
}

- (BOOL)synchronousFullSizePreviewEnabled
{
  return self->_synchronousFullSizePreviewEnabled;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_57993 != -1)
    dispatch_once(&sharedInstance_onceToken_57993, &__block_literal_global_57994);
  return (id)sharedInstance_sharedInstance_57995;
}

void __43__PXPasteboardAssetSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragDropSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_57995;
  sharedInstance_sharedInstance_57995 = v0;

}

@end
