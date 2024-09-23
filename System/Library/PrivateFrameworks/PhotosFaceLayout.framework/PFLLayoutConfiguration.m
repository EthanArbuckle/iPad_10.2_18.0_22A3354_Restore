@implementation PFLLayoutConfiguration

- (PFLLayoutConfiguration)initWithAsset:(id)a3 timePosition:(unint64_t)a4 segmentationData:(id)a5 coreLayout:(id)a6
{
  id v10;
  id v11;
  id v12;
  PFLLayoutConfiguration *v13;
  uint64_t v14;
  NSString *assetId;
  __CVBuffer *v16;
  CGFloat v17;
  unint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  PIParallaxColorAnalysis *colorAnalysis;
  double v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *faceRects;
  void *v35;
  uint64_t v36;
  NSArray *petRects;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  objc_super v56;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v56.receiver = self;
  v56.super_class = (Class)PFLLayoutConfiguration;
  v13 = -[PFLLayoutConfiguration init](&v56, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "localIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    assetId = v13->_assetId;
    v13->_assetId = (NSString *)v14;

    v16 = (__CVBuffer *)objc_msgSend(v11, "segmentationBuffer");
    v13->_foregroundMask = v16;
    CVPixelBufferRetain(v16);
    v13->_maskIsInverted = (unint64_t)(objc_msgSend(v11, "classification") - 3) < 2;
    v17 = (double)(unint64_t)objc_msgSend(v10, "pixelWidth");
    v18 = objc_msgSend(v10, "pixelHeight");
    v13->_assetSize.width = v17;
    v13->_assetSize.height = (double)v18;
    objc_msgSend(v12, "visibleRect");
    v13->_visibleRect.origin.x = v19;
    v13->_visibleRect.origin.y = v20;
    v13->_visibleRect.size.width = v21;
    v13->_visibleRect.size.height = v22;
    v13->_timePosition = a4;
    PFCRectForTimePosition();
    v13->_timeRect.origin.x = v23;
    v13->_timeRect.origin.y = v24;
    v13->_timeRect.size.width = v25;
    v13->_timeRect.size.height = v26;
    objc_msgSend(v11, "colorAnalysis");
    v27 = objc_claimAutoreleasedReturnValue();
    colorAnalysis = v13->_colorAnalysis;
    v13->_colorAnalysis = (PIParallaxColorAnalysis *)v27;

    objc_msgSend(v12, "cropScore");
    v13->_cropScore = v29;
    objc_msgSend(v12, "layoutScore");
    v13->_layoutScore = v30;
    v13->_usesMask = objc_msgSend(v12, "usesMask");
    objc_msgSend(v11, "regions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "faceRegions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    flipYNormalizedRects(v32);
    v33 = objc_claimAutoreleasedReturnValue();
    faceRects = v13->_faceRects;
    v13->_faceRects = (NSArray *)v33;

    objc_msgSend(v31, "petRegions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    flipYNormalizedRects(v35);
    v36 = objc_claimAutoreleasedReturnValue();
    petRects = v13->_petRects;
    v13->_petRects = (NSArray *)v36;

    objc_msgSend(v31, "acceptableCropRect");
    v13->_acceptableCropRect.origin.x = flipYNormalizedRect(v38, v39, v40, v41);
    v13->_acceptableCropRect.origin.y = v42;
    v13->_acceptableCropRect.size.width = v43;
    v13->_acceptableCropRect.size.height = v44;
    objc_msgSend(v31, "preferredCropRect");
    v13->_preferredCropRect.origin.x = flipYNormalizedRect(v45, v46, v47, v48);
    v13->_preferredCropRect.origin.y = v49;
    v13->_preferredCropRect.size.width = v50;
    v13->_preferredCropRect.size.height = v51;
    v13->_timeRectInAsset.origin.x = renormalizeRect(v13->_timeRect.origin.x, v13->_timeRect.origin.y, v13->_timeRect.size.width, v13->_timeRect.size.height, v13->_visibleRect.origin.x, v13->_visibleRect.origin.y, v13->_visibleRect.size.width, v13->_visibleRect.size.height);
    v13->_timeRectInAsset.origin.y = v52;
    v13->_timeRectInAsset.size.width = v53;
    v13->_timeRectInAsset.size.height = v54;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_foregroundMask);
  v3.receiver = self;
  v3.super_class = (Class)PFLLayoutConfiguration;
  -[PFLLayoutConfiguration dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  NSString *assetId;
  uint64_t width;
  uint64_t height;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  assetId = self->_assetId;
  width = (uint64_t)self->_assetSize.width;
  height = (uint64_t)self->_assetSize.height;
  _rectAsString(self->_visibleRect.origin.x, self->_visibleRect.origin.y, self->_visibleRect.size.width, self->_visibleRect.size.height);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (self->_usesMask)
    v9 = "YES";
  else
    v9 = "NO";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[PFLLayoutConfiguration asset:%@, assetSize:%ldx%ld, visbleRect:%@, timePosition:%ld, score:%.3f, usesMask:%s]"), assetId, width, height, v7, self->_timePosition, *(_QWORD *)&self->_cropScore, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (__CVBuffer)foregroundMask
{
  return self->_foregroundMask;
}

- (BOOL)maskIsInverted
{
  return self->_maskIsInverted;
}

- (CGSize)assetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_assetSize.width;
  height = self->_assetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)timeRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeRect.origin.x;
  y = self->_timeRect.origin.y;
  width = self->_timeRect.size.width;
  height = self->_timeRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)timePosition
{
  return self->_timePosition;
}

- (PIParallaxColorAnalysis)colorAnalysis
{
  return self->_colorAnalysis;
}

- (BOOL)usesMask
{
  return self->_usesMask;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (NSArray)faceRects
{
  return self->_faceRects;
}

- (NSArray)petRects
{
  return self->_petRects;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_acceptableCropRect.origin.x;
  y = self->_acceptableCropRect.origin.y;
  width = self->_acceptableCropRect.size.width;
  height = self->_acceptableCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredCropRect.origin.x;
  y = self->_preferredCropRect.origin.y;
  width = self->_preferredCropRect.size.width;
  height = self->_preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)timeRectInAsset
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timeRectInAsset.origin.x;
  y = self->_timeRectInAsset.origin.y;
  width = self->_timeRectInAsset.size.width;
  height = self->_timeRectInAsset.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_petRects, 0);
  objc_storeStrong((id *)&self->_faceRects, 0);
  objc_storeStrong((id *)&self->_colorAnalysis, 0);
}

@end
