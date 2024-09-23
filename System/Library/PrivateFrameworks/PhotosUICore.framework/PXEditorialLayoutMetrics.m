@implementation PXEditorialLayoutMetrics

- (PXEditorialLayoutMetrics)init
{
  PXEditorialLayoutMetrics *result;
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXEditorialLayoutMetrics;
  result = -[PXEditorialLayoutMetrics init](&v4, sel_init);
  if (result)
  {
    result->_numberOfColumns = 3;
    result->_interTileSpacing = 2.0;
    result->_headerHeight = 0.0;
    v3 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&result->_padding.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&result->_padding.bottom = v3;
    result->_lowerItemCountThreshold = 6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXEditorialLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_numberOfColumns;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_interTileSpacing;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_headerHeight;
  v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)result + 4) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)result + 5) = v5;
  *((_QWORD *)result + 7) = self->_lowerItemCountThreshold;
  *((_BYTE *)result + 24) = self->_useSaliency;
  *((_BYTE *)result + 25) = self->_useNewImplementation;
  return result;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (double)interTileSpacing
{
  return self->_interTileSpacing;
}

- (void)setInterTileSpacing:(double)a3
{
  self->_interTileSpacing = a3;
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

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (unint64_t)lowerItemCountThreshold
{
  return self->_lowerItemCountThreshold;
}

- (void)setLowerItemCountThreshold:(unint64_t)a3
{
  self->_lowerItemCountThreshold = a3;
}

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (void)setUseSaliency:(BOOL)a3
{
  self->_useSaliency = a3;
}

- (BOOL)useNewImplementation
{
  return self->_useNewImplementation;
}

- (void)setUseNewImplementation:(BOOL)a3
{
  self->_useNewImplementation = a3;
}

@end
