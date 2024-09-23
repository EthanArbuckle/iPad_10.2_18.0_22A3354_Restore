@implementation PUAssetSharedViewModelChange

- (BOOL)hasChanges
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUAssetSharedViewModelChange;
  return -[PUViewModelChange hasChanges](&v4, sel_hasChanges)
      || -[PUAssetSharedViewModelChange loadingStatusChanged](self, "loadingStatusChanged")
      || -[PUAssetSharedViewModelChange saveProgressChanged](self, "saveProgressChanged")
      || -[PUAssetSharedViewModelChange saveStateChanged](self, "saveStateChanged")
      || -[PUAssetSharedViewModelChange needsDeferredProcessingChanged](self, "needsDeferredProcessingChanged")
      || -[PUAssetSharedViewModelChange deferredProcessingNeededChanged](self, "deferredProcessingNeededChanged")
      || -[PUAssetSharedViewModelChange flippingFullSizeRenderStateChanged](self, "flippingFullSizeRenderStateChanged");
}

- (BOOL)loadingStatusChanged
{
  return *(&self->super._hasChanges + 1);
}

- (void)setLoadingStatusChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)saveProgressChanged
{
  return *(&self->super._hasChanges + 2);
}

- (void)setSaveProgressChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 2) = a3;
}

- (BOOL)saveStateChanged
{
  return *(&self->super._hasChanges + 3);
}

- (void)setSaveStateChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 3) = a3;
}

- (BOOL)needsDeferredProcessingChanged
{
  return *(&self->super._hasChanges + 4);
}

- (void)setNeedsDeferredProcessingChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 4) = a3;
}

- (BOOL)deferredProcessingNeededChanged
{
  return *(&self->super._hasChanges + 5);
}

- (void)setDeferredProcessingNeededChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 5) = a3;
}

- (BOOL)flippingFullSizeRenderStateChanged
{
  return *(&self->super._hasChanges + 6);
}

- (void)setFlippingFullSizeRenderStateChanged:(BOOL)a3
{
  *(&self->super._hasChanges + 6) = a3;
}

@end
