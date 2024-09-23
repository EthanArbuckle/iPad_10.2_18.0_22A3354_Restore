@implementation PXAspectFitLayoutMetrics

- (PXAspectFitLayoutMetrics)init
{
  PXAspectFitLayoutMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAspectFitLayoutMetrics;
  result = -[PXAspectFitLayoutMetrics init](&v3, sel_init);
  if (result)
  {
    result->_minTilesPerRow = 2;
    result->_maxTilesPerRow = 4;
    result->_minRowAspectRatio = 1.77777778;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAspectFitLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v6, sel_copyWithZone_, a3);
  v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)((char *)result + 72) = v5;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_interTileSpacing;
  *((_QWORD *)result + 4) = self->_minTilesPerRow;
  *((_QWORD *)result + 5) = self->_maxTilesPerRow;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_minRowAspectRatio;
  return result;
}

- (double)interTileSpacing
{
  return self->_interTileSpacing;
}

- (void)setInterTileSpacing:(double)a3
{
  self->_interTileSpacing = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (int64_t)minTilesPerRow
{
  return self->_minTilesPerRow;
}

- (void)setMinTilesPerRow:(int64_t)a3
{
  self->_minTilesPerRow = a3;
}

- (int64_t)maxTilesPerRow
{
  return self->_maxTilesPerRow;
}

- (void)setMaxTilesPerRow:(int64_t)a3
{
  self->_maxTilesPerRow = a3;
}

- (double)minRowAspectRatio
{
  return self->_minRowAspectRatio;
}

- (void)setMinRowAspectRatio:(double)a3
{
  self->_minRowAspectRatio = a3;
}

@end
