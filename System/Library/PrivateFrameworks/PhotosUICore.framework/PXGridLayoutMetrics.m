@implementation PXGridLayoutMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGridLayoutMetrics;
  result = -[PXLayoutMetrics copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_axis;
  *((_OWORD *)result + 3) = self->_itemSize;
  *((_OWORD *)result + 7) = self->_footerSize;
  *((_BYTE *)result + 24) = self->_displaysHeaderTile;
  *((_OWORD *)result + 5) = self->_headerSize;
  *((_OWORD *)result + 6) = self->_headerSpacing;
  v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *((_OWORD *)result + 8) = *(_OWORD *)&self->_contentInsets.top;
  *((_OWORD *)result + 9) = v5;
  *((_OWORD *)result + 4) = self->_interItemSpacing;
  *((_QWORD *)result + 5) = self->_additionalTileCount;
  return result;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(int64_t)a3
{
  self->_axis = a3;
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
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

- (BOOL)displaysHeaderTile
{
  return self->_displaysHeaderTile;
}

- (void)setDisplaysHeaderTile:(BOOL)a3
{
  self->_displaysHeaderTile = a3;
}

- (CGSize)headerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_headerSize.width;
  height = self->_headerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHeaderSize:(CGSize)a3
{
  self->_headerSize = a3;
}

- (CGSize)headerSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_headerSpacing.width;
  height = self->_headerSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHeaderSpacing:(CGSize)a3
{
  self->_headerSpacing = a3;
}

- (CGSize)footerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_footerSize.width;
  height = self->_footerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFooterSize:(CGSize)a3
{
  self->_footerSize = a3;
}

- (unint64_t)additionalTileCount
{
  return self->_additionalTileCount;
}

- (void)setAdditionalTileCount:(unint64_t)a3
{
  self->_additionalTileCount = a3;
}

@end
