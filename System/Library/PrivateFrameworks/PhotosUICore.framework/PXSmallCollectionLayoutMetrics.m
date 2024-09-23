@implementation PXSmallCollectionLayoutMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSmallCollectionLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v7, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 3) = self->_style;
    *((_QWORD *)result + 4) = *(_QWORD *)&self->_interitemSpacing;
    v5 = *(_OWORD *)&self->_safeAreaInsets.bottom;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_safeAreaInsets.top;
    *(_OWORD *)((char *)result + 72) = v5;
    *((_QWORD *)result + 5) = self->_edgesForExtendedLayout;
    v6 = *(_OWORD *)&self->_padding.bottom;
    *(_OWORD *)((char *)result + 88) = *(_OWORD *)&self->_padding.top;
    *(_OWORD *)((char *)result + 104) = v6;
    *((_QWORD *)result + 6) = *(_QWORD *)&self->_headerAspectRatio;
  }
  return result;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (unint64_t)edgesForExtendedLayout
{
  return self->_edgesForExtendedLayout;
}

- (void)setEdgesForExtendedLayout:(unint64_t)a3
{
  self->_edgesForExtendedLayout = a3;
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

- (double)headerAspectRatio
{
  return self->_headerAspectRatio;
}

- (void)setHeaderAspectRatio:(double)a3
{
  self->_headerAspectRatio = a3;
}

@end
