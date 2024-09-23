@implementation PXStoryExportVideoOptions

- (PXStoryExportVideoOptions)init
{
  PXStoryExportVideoOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryExportVideoOptions;
  result = -[PXStoryExportVideoOptions init](&v3, sel_init);
  if (result)
  {
    result->_resolution = (CGSize)xmmword_1A7C0C430;
    result->_scale = 1.0;
    *(_OWORD *)&result->_frameRate = xmmword_1A7C0C440;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;

  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)v4 + 5) = self->_frameRate;
  *(CGSize *)(v4 + 56) = self->_resolution;
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_scale;
  *((_QWORD *)v4 + 6) = self->_codec;
  v4[8] = self->_prefersExportLayoutMatchesPlayback;
  objc_storeStrong((id *)v4 + 2, self->_fullSizePlayerExtendedTraitCollectionSnapshot);
  v5 = -[NSNumber copy](self->_averageBitratePerSecond, "copy");
  v6 = (void *)*((_QWORD *)v4 + 4);
  *((_QWORD *)v4 + 4) = v5;

  return v4;
}

- (CGSize)resolutionInPixels
{
  double v3;
  double v4;
  CGSize result;

  -[PXStoryExportVideoOptions scale](self, "scale");
  -[PXStoryExportVideoOptions resolution](self, "resolution");
  PXSizeScale();
  PXSizeRoundToPixel();
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)resolution
{
  double width;
  double height;
  CGSize result;

  width = self->_resolution.width;
  height = self->_resolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setResolution:(CGSize)a3
{
  self->_resolution = a3;
}

- (BOOL)prefersExportLayoutMatchesPlayback
{
  return self->_prefersExportLayoutMatchesPlayback;
}

- (void)setPrefersExportLayoutMatchesPlayback:(BOOL)a3
{
  self->_prefersExportLayoutMatchesPlayback = a3;
}

- (PXExtendedTraitCollectionSnapshot)fullSizePlayerExtendedTraitCollectionSnapshot
{
  return self->_fullSizePlayerExtendedTraitCollectionSnapshot;
}

- (void)setFullSizePlayerExtendedTraitCollectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_fullSizePlayerExtendedTraitCollectionSnapshot, a3);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (NSNumber)averageBitratePerSecond
{
  return self->_averageBitratePerSecond;
}

- (void)setAverageBitratePerSecond:(id)a3
{
  objc_storeStrong((id *)&self->_averageBitratePerSecond, a3);
}

- (unint64_t)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(unint64_t)a3
{
  self->_frameRate = a3;
}

- (unint64_t)codec
{
  return self->_codec;
}

- (void)setCodec:(unint64_t)a3
{
  self->_codec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageBitratePerSecond, 0);
  objc_storeStrong((id *)&self->_fullSizePlayerExtendedTraitCollectionSnapshot, 0);
}

@end
