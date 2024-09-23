@implementation PXOverlayFeedLayoutMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXOverlayFeedLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v6, sel_copyWithZone_, a3);
  v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)((char *)result + 88) = v5;
  *(CGSize *)((char *)result + 56) = self->_interItemSpacing;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_firstRowTopMargin;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_regularItemAspectRatio;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_largeItemAspectRatio;
  *((_BYTE *)result + 24) = self->_useSimpleLayout;
  return result;
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

- (CGSize)interItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interItemSpacing.width;
  height = self->_interItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  self->_interItemSpacing = a3;
}

- (double)firstRowTopMargin
{
  return self->_firstRowTopMargin;
}

- (void)setFirstRowTopMargin:(double)a3
{
  self->_firstRowTopMargin = a3;
}

- (double)regularItemAspectRatio
{
  return self->_regularItemAspectRatio;
}

- (void)setRegularItemAspectRatio:(double)a3
{
  self->_regularItemAspectRatio = a3;
}

- (double)largeItemAspectRatio
{
  return self->_largeItemAspectRatio;
}

- (void)setLargeItemAspectRatio:(double)a3
{
  self->_largeItemAspectRatio = a3;
}

- (BOOL)useSimpleLayout
{
  return self->_useSimpleLayout;
}

- (void)setUseSimpleLayout:(BOOL)a3
{
  self->_useSimpleLayout = a3;
}

@end
