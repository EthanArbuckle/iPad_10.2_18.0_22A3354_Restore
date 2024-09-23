@implementation PTScanlineMask_FocusBlurMap

- (PTScanlineMask_FocusBlurMap)initWithFocusBlurMap:(id)a3 region:(id)a4
{
  id v7;
  id v8;
  PTScanlineMask_FocusBlurMap *v9;
  PTScanlineMask_FocusBlurMap *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PTScanlineMask_FocusBlurMap;
  v9 = -[PTScanlineMask_FocusBlurMap init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_map, a3);
    objc_storeStrong((id *)&v10->_region, a4);
  }

  return v10;
}

- (id)scanlineIter
{
  return -[PTScanlineIter_FocusBlurMap initWithMask:]([PTScanlineIter_FocusBlurMap alloc], "initWithMask:", self);
}

- (void)setPlacement:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PTScanlineMask_FocusBlurMap;
  -[PTScanlineMask setPlacement:](&v4, sel_setPlacement_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PTScanlineMask_FocusBlurMap _recalculatePlacementTileSize](self, "_recalculatePlacementTileSize");
}

- (void)_recalculatePlacementTileSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PTScanlineMask placement](self, "placement");
  v4 = v3;
  v5 = (double)-[PTFocusBlurMap tileWidth](self->_map, "tileWidth");
  self->_placementTileSize.width = v4 * (v5 / (double)-[PTFocusBlurMap inputWidth](self->_map, "inputWidth"));
  -[PTScanlineMask placement](self, "placement");
  v7 = v6;
  v8 = (double)-[PTFocusBlurMap tileHeight](self->_map, "tileHeight");
  self->_placementTileSize.height = v7 * (v8 / (double)-[PTFocusBlurMap inputHeight](self->_map, "inputHeight"));
}

- (_NSRange)pixelRangeForTileRangeX:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double width;
  double MinX;
  double MaxX;
  double v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;
  CGRect v13;
  CGRect v14;

  length = a3.length;
  location = a3.location;
  width = self->_placementTileSize.width;
  -[PTScanlineMask placement](self, "placement");
  MinX = CGRectGetMinX(v13);
  -[PTScanlineMask placement](self, "placement");
  MaxX = CGRectGetMaxX(v14);
  v9 = MinX + (double)location * width;
  if (MaxX < v9)
    v9 = MaxX;
  v10 = (unint64_t)v9;
  if (MaxX >= v9 + (double)length * width)
    MaxX = v9 + (double)length * width;
  v11 = (unint64_t)(MaxX - v9);
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)pixelRangeForTileRangeY:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double height;
  double MinY;
  double MaxY;
  double v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;
  CGRect v13;
  CGRect v14;

  length = a3.length;
  location = a3.location;
  height = self->_placementTileSize.height;
  -[PTScanlineMask placement](self, "placement");
  MinY = CGRectGetMinY(v13);
  -[PTScanlineMask placement](self, "placement");
  MaxY = CGRectGetMaxY(v14);
  v9 = MinY + (double)location * height;
  if (MaxY < v9)
    v9 = MaxY;
  v10 = (unint64_t)v9;
  if (MaxY >= v9 + (double)length * height)
    MaxY = v9 + (double)length * height;
  v11 = (unint64_t)(MaxY - v9);
  result.length = v11;
  result.location = v10;
  return result;
}

- (PTFocusBlurMap)map
{
  return (PTFocusBlurMap *)objc_getProperty(self, a2, 40, 1);
}

- (NSIndexSet)region
{
  return (NSIndexSet *)objc_getProperty(self, a2, 48, 1);
}

- (CGSize)normalizedTileSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_normalizedTileSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNormalizedTileSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_normalizedTileSize, &v3, 16, 1, 0);
}

- (CGSize)placementTileSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_placementTileSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPlacementTileSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_placementTileSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_map, 0);
}

@end
