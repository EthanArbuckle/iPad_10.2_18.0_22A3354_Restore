@implementation PUReviewAdjustmentInput

- (UIImage)currentPreviewImage
{
  return self->_currentPreviewImage;
}

- (void)_setCurrentPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreviewImage, a3);
}

- (NSData)knownAdjustmentData
{
  return self->_knownAdjustmentData;
}

- (void)_setKnownAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_knownAdjustmentData, a3);
}

- (int64_t)adjustmentBaseVersion
{
  return self->_adjustmentBaseVersion;
}

- (void)_setBaseImageVersion:(int64_t)a3
{
  self->_adjustmentBaseVersion = a3;
}

- (NSURL)baseImageFileURL
{
  return self->_baseImageFileURL;
}

- (void)_setBaseImageFileURL:(id)a3
{
  self->_baseImageFileURL = (NSURL *)a3;
}

- (NSURL)baseVideoFileURL
{
  return self->_baseVideoFileURL;
}

- (void)_setBaseVideoFileURL:(id)a3
{
  self->_baseVideoFileURL = (NSURL *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownAdjustmentData, 0);
  objc_storeStrong((id *)&self->_currentPreviewImage, 0);
}

@end
