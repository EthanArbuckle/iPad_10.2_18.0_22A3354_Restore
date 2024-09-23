@implementation PXCMMAssetPreparationOptions

- (PXCMMAssetPreparationOptions)init
{
  PXCMMAssetPreparationOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCMMAssetPreparationOptions;
  result = -[PXCMMAssetPreparationOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_publishAsOriginal = 0;
    result->_removeLocationData = 0;
  }
  return result;
}

- (BOOL)publishAsOriginal
{
  return self->_publishAsOriginal;
}

- (void)setPublishAsOriginal:(BOOL)a3
{
  self->_publishAsOriginal = a3;
}

- (BOOL)publishLivePhotoAsStill
{
  return self->_publishLivePhotoAsStill;
}

- (void)setPublishLivePhotoAsStill:(BOOL)a3
{
  self->_publishLivePhotoAsStill = a3;
}

- (BOOL)removeLocationData
{
  return self->_removeLocationData;
}

- (void)setRemoveLocationData:(BOOL)a3
{
  self->_removeLocationData = a3;
}

@end
