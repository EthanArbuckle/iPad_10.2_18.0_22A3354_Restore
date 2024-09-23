@implementation PXCuratedLibraryGridLayoutMetrics

- (PXCuratedLibraryGridLayoutMetrics)init
{
  PXCuratedLibraryGridLayoutMetrics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryGridLayoutMetrics;
  result = -[PXCuratedLibraryGridLayoutMetrics init](&v3, sel_init);
  if (result)
  {
    result->_numberOfColumns = 4;
    result->_itemAspectRatio = 1.0;
    result->_screenScale = 1.0;
    result->_interitemSpacing = 1.0;
    result->_headerAspectRatio = 1.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCuratedLibraryGridLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = self->_numberOfColumns;
  v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)result + 5) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)result + 6) = v5;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_itemAspectRatio;
  *((_QWORD *)result + 9) = self->_numberOfPrecedingAssets;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_headerAspectRatio;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_screenScale;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_interitemSpacing;
  *((_QWORD *)result + 8) = self->_style;
  return result;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  self->_numberOfColumns = a3;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (void)setItemAspectRatio:(double)a3
{
  self->_itemAspectRatio = a3;
}

- (double)headerAspectRatio
{
  return self->_headerAspectRatio;
}

- (void)setHeaderAspectRatio:(double)a3
{
  self->_headerAspectRatio = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)numberOfPrecedingAssets
{
  return self->_numberOfPrecedingAssets;
}

- (void)setNumberOfPrecedingAssets:(int64_t)a3
{
  self->_numberOfPrecedingAssets = a3;
}

@end
