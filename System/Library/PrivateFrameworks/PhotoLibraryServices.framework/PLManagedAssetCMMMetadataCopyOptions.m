@implementation PLManagedAssetCMMMetadataCopyOptions

- (BOOL)shouldCopyTitleDescriptionAndKeywords
{
  return self->_shouldCopyTitleDescriptionAndKeywords;
}

- (void)setShouldCopyTitleDescriptionAndKeywords:(BOOL)a3
{
  self->_shouldCopyTitleDescriptionAndKeywords = a3;
}

- (BOOL)shouldCopySpatialOverCaptureResources
{
  return self->_shouldCopySpatialOverCaptureResources;
}

- (void)setShouldCopySpatialOverCaptureResources:(BOOL)a3
{
  self->_shouldCopySpatialOverCaptureResources = a3;
}

- (BOOL)shouldCopyLocationData
{
  return self->_shouldCopyLocationData;
}

- (void)setShouldCopyLocationData:(BOOL)a3
{
  self->_shouldCopyLocationData = a3;
}

@end
