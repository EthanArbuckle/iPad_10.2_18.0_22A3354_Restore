@implementation PLManagedAssetCMMAdjustmentBakeInOptions

- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled
{
  return self->_shouldBakeInIfLivePhotoPlaybackDisabled;
}

- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoPlaybackDisabled = a3;
}

- (BOOL)shouldBakeInIfLivePhotoMuted
{
  return self->_shouldBakeInIfLivePhotoMuted;
}

- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoMuted = a3;
}

- (BOOL)shouldBakeInIfAdjustedByThirdParty
{
  return self->_shouldBakeInIfAdjustedByThirdParty;
}

- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3
{
  self->_shouldBakeInIfAdjustedByThirdParty = a3;
}

- (BOOL)shouldBakeInIfCropped
{
  return self->_shouldBakeInIfCropped;
}

- (void)setShouldBakeInIfCropped:(BOOL)a3
{
  self->_shouldBakeInIfCropped = a3;
}

- (BOOL)shouldBakeInIfTimelineTrimmed
{
  return self->_shouldBakeInIfTimelineTrimmed;
}

- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3
{
  self->_shouldBakeInIfTimelineTrimmed = a3;
}

- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled
{
  return self->_shouldBakeInIfPortraitDepthEffectEnabled;
}

- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3
{
  self->_shouldBakeInIfPortraitDepthEffectEnabled = a3;
}

- (BOOL)shouldBakeInIfContainsPenultimateResources
{
  return self->_shouldBakeInIfContainsPenultimateResources;
}

- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3
{
  self->_shouldBakeInIfContainsPenultimateResources = a3;
}

- (BOOL)flattenLivePhotoToStillIfNeeded
{
  return self->_flattenLivePhotoToStillIfNeeded;
}

- (void)setFlattenLivePhotoToStillIfNeeded:(BOOL)a3
{
  self->_flattenLivePhotoToStillIfNeeded = a3;
}

@end
