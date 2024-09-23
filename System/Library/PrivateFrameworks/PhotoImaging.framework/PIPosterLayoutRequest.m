@implementation PIPosterLayoutRequest

- (PIPosterLayoutRequest)initWithComposition:(id)a3
{
  PIPosterLayoutRequest *result;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PIPosterLayoutRequest;
  result = -[NURenderRequest initWithComposition:](&v5, sel_initWithComposition_, a3);
  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  result->_normalizedLayoutBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  result->_normalizedLayoutBounds.size = v4;
  result->_shouldComputeAllScores = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PIPosterLayoutRequest;
  v4 = -[NURenderRequest copyWithZone:](&v20, sel_copyWithZone_, a3);
  if (v4)
  {
    -[PIPosterLayoutRequest layoutConfiguration](self, "layoutConfiguration");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[20];
    v4[20] = v5;

    -[PIPosterLayoutRequest layoutRegions](self, "layoutRegions");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[21];
    v4[21] = v7;

    -[PIPosterLayoutRequest segmentationMatte](self, "segmentationMatte");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v4[22];
    v4[22] = v9;

    -[PIPosterLayoutRequest segmentationConfidenceMap](self, "segmentationConfidenceMap");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v4[23];
    v4[23] = v11;

    v4[24] = -[PIPosterLayoutRequest segmentationClassification](self, "segmentationClassification");
    *((_BYTE *)v4 + 152) = -[PIPosterLayoutRequest shouldConstrainLayoutToBounds](self, "shouldConstrainLayoutToBounds");
    -[PIPosterLayoutRequest normalizedLayoutBounds](self, "normalizedLayoutBounds");
    v4[26] = v13;
    v4[27] = v14;
    v4[28] = v15;
    v4[29] = v16;
    *((_BYTE *)v4 + 153) = -[PIPosterLayoutRequest shouldComputeAllScores](self, "shouldComputeAllScores");
    *((_BYTE *)v4 + 154) = -[PIPosterLayoutRequest shouldConsiderHeadroom](self, "shouldConsiderHeadroom");
    -[PIPosterLayoutRequest layoutProvider](self, "layoutProvider");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v4[25];
    v4[25] = v17;

  }
  return v4;
}

- (id)newRenderJob
{
  return -[_PIPosterLayoutJob initWithPosterLayoutRequest:]([_PIPosterLayoutJob alloc], "initWithPosterLayoutRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setLayoutConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConfiguration, a3);
}

- (PFParallaxAssetRegions)layoutRegions
{
  return self->_layoutRegions;
}

- (void)setLayoutRegions:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRegions, a3);
}

- (BOOL)shouldConstrainLayoutToBounds
{
  return self->_shouldConstrainLayoutToBounds;
}

- (void)setShouldConstrainLayoutToBounds:(BOOL)a3
{
  self->_shouldConstrainLayoutToBounds = a3;
}

- (CGRect)normalizedLayoutBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedLayoutBounds.origin.x;
  y = self->_normalizedLayoutBounds.origin.y;
  width = self->_normalizedLayoutBounds.size.width;
  height = self->_normalizedLayoutBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedLayoutBounds:(CGRect)a3
{
  self->_normalizedLayoutBounds = a3;
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (void)setSegmentationMatte:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationMatte, a3);
}

- (NUImageBuffer)segmentationConfidenceMap
{
  return self->_segmentationConfidenceMap;
}

- (void)setSegmentationConfidenceMap:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationConfidenceMap, a3);
}

- (unint64_t)segmentationClassification
{
  return self->_segmentationClassification;
}

- (void)setSegmentationClassification:(unint64_t)a3
{
  self->_segmentationClassification = a3;
}

- (BOOL)shouldComputeAllScores
{
  return self->_shouldComputeAllScores;
}

- (void)setShouldComputeAllScores:(BOOL)a3
{
  self->_shouldComputeAllScores = a3;
}

- (BOOL)shouldConsiderHeadroom
{
  return self->_shouldConsiderHeadroom;
}

- (void)setShouldConsiderHeadroom:(BOOL)a3
{
  self->_shouldConsiderHeadroom = a3;
}

- (PIPosterLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (void)setLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_layoutProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_segmentationConfidenceMap, 0);
  objc_storeStrong((id *)&self->_segmentationMatte, 0);
  objc_storeStrong((id *)&self->_layoutRegions, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
}

@end
