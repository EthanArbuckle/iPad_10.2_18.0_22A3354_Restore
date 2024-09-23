@implementation PLMutableAssetAdjustmentOptions

- (void)setSubstandardRender:(BOOL)a3
{
  self->super._substandardRender = a3;
}

- (void)setDeferred:(BOOL)a3
{
  self->super._deferred = a3;
}

- (void)setShouldUpdateAttributes:(BOOL)a3
{
  self->super._shouldUpdateAttributes = a3;
}

- (void)setShouldGenerateThumbnails:(BOOL)a3
{
  self->super._shouldGenerateThumbnails = a3;
}

- (void)setShouldCheckForLegacyCameraAutoAdjustment:(BOOL)a3
{
  self->super._shouldCheckForLegacyCameraAutoAdjustment = a3;
}

- (void)setSkipCheckCameraAutoAdjustment:(BOOL)a3
{
  self->super._skipCheckCameraAutoAdjustment = a3;
}

- (void)setFileIngestionType:(int64_t)a3
{
  self->super._fileIngestionType = a3;
}

- (void)setFullSizeRenderSize:(CGSize)a3
{
  self->super._fullSizeRenderSize = a3;
}

- (void)setFullSizeRenderDuration:(double)a3
{
  self->super._fullSizeRenderDuration = a3;
}

- (void)setMainFileMetadata:(id)a3
{
  objc_storeStrong((id *)&self->super._mainFileMetadata, a3);
}

- (void)setRenderedContentURL:(id)a3
{
  objc_storeStrong((id *)&self->super._renderedContentURL, a3);
}

- (void)setPenultimateRenderedJPEGData:(id)a3
{
  objc_storeStrong((id *)&self->super._penultimateRenderedJPEGData, a3);
}

- (void)setPenultimateRenderedVideoContentURL:(id)a3
{
  objc_storeStrong((id *)&self->super._penultimateRenderedVideoContentURL, a3);
}

- (void)setRenderedVideoComplementContentURL:(id)a3
{
  objc_storeStrong((id *)&self->super._renderedVideoComplementContentURL, a3);
}

- (void)setPenultimateRenderedVideoComplementContentURL:(id)a3
{
  objc_storeStrong((id *)&self->super._penultimateRenderedVideoComplementContentURL, a3);
}

- (void)setRenderedVideoPosterContentURL:(id)a3
{
  objc_storeStrong((id *)&self->super._renderedVideoPosterContentURL, a3);
}

- (void)setAdjustmentSecondaryDataURL:(id)a3
{
  objc_storeStrong((id *)&self->super._adjustmentSecondaryDataURL, a3);
}

+ (id)assetAdjustmentOptionsForFileSystemImport
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setShouldUpdateAttributes:", 1);
  objc_msgSend(v2, "setShouldGenerateThumbnails:", 1);
  objc_msgSend(v2, "setFileIngestionType:", 0);
  return v2;
}

@end
