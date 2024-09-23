@implementation PIParallaxColorAnalysisRequest

- (PIParallaxColorAnalysisRequest)initWithComposition:(id)a3
{
  PIParallaxColorAnalysisRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PIParallaxColorAnalysisRequest;
  v3 = -[NURenderRequest initWithComposition:](&v5, sel_initWithComposition_, a3);
  -[PIParallaxColorAnalysisRequest setMaxDominantColors:](v3, "setMaxDominantColors:", 3);
  -[PIParallaxColorAnalysisRequest setDominanceThreshold:](v3, "setDominanceThreshold:", 0.01);
  -[PIParallaxColorAnalysisRequest setChromaThreshold:](v3, "setChromaThreshold:", 0.0375000015);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PIParallaxColorAnalysisRequest;
  v4 = -[NURenderRequest copyWithZone:](&v14, sel_copyWithZone_, a3);
  if (v4)
  {
    -[PIParallaxColorAnalysisRequest segmentationMatte](self, "segmentationMatte");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[20];
    v4[20] = v5;

    *((_BYTE *)v4 + 152) = -[PIParallaxColorAnalysisRequest analyzeBackground](self, "analyzeBackground");
    -[PIParallaxColorAnalysisRequest normalizedClipRect](self, "normalizedClipRect");
    v4[24] = v7;
    v4[25] = v8;
    v4[26] = v9;
    v4[27] = v10;
    v4[21] = -[PIParallaxColorAnalysisRequest maxDominantColors](self, "maxDominantColors");
    -[PIParallaxColorAnalysisRequest dominanceThreshold](self, "dominanceThreshold");
    v4[22] = v11;
    -[PIParallaxColorAnalysisRequest chromaThreshold](self, "chromaThreshold");
    v4[23] = v12;
  }
  return v4;
}

- (id)newRenderJob
{
  return -[_PIParallaxColorAnalysisJob initWithParallaxColorAnalysisRequest:]([_PIParallaxColorAnalysisJob alloc], "initWithParallaxColorAnalysisRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (NUImageBuffer)segmentationMatte
{
  return self->_segmentationMatte;
}

- (void)setSegmentationMatte:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationMatte, a3);
}

- (BOOL)analyzeBackground
{
  return self->_analyzeBackground;
}

- (void)setAnalyzeBackground:(BOOL)a3
{
  self->_analyzeBackground = a3;
}

- (CGRect)normalizedClipRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedClipRect.origin.x;
  y = self->_normalizedClipRect.origin.y;
  width = self->_normalizedClipRect.size.width;
  height = self->_normalizedClipRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedClipRect:(CGRect)a3
{
  self->_normalizedClipRect = a3;
}

- (int64_t)maxDominantColors
{
  return self->_maxDominantColors;
}

- (void)setMaxDominantColors:(int64_t)a3
{
  self->_maxDominantColors = a3;
}

- (double)dominanceThreshold
{
  return self->_dominanceThreshold;
}

- (void)setDominanceThreshold:(double)a3
{
  self->_dominanceThreshold = a3;
}

- (double)chromaThreshold
{
  return self->_chromaThreshold;
}

- (void)setChromaThreshold:(double)a3
{
  self->_chromaThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationMatte, 0);
}

@end
