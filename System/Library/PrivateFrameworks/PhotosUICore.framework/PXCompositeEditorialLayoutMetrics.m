@implementation PXCompositeEditorialLayoutMetrics

- (PXCompositeEditorialLayoutMetrics)init
{
  PXCompositeEditorialLayoutMetrics *v2;
  PXCompositeEditorialLayoutMetrics *v3;
  __int128 v4;
  uint64_t v5;
  PXCompositeEditorialLayoutSpec *editorialLayoutSpec;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCompositeEditorialLayoutMetrics;
  v2 = -[PXCompositeEditorialLayoutMetrics init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_interTileSpacing = 2.0;
    v4 = *((_OWORD *)off_1E50B8020 + 1);
    *(_OWORD *)&v2->_padding.top = *(_OWORD *)off_1E50B8020;
    *(_OWORD *)&v2->_padding.bottom = v4;
    +[PXCompositeEditorialLayoutSpec defaultSpec](PXCompositeEditorialLayoutSpec, "defaultSpec");
    v5 = objc_claimAutoreleasedReturnValue();
    editorialLayoutSpec = v3->_editorialLayoutSpec;
    v3->_editorialLayoutSpec = (PXCompositeEditorialLayoutSpec *)v5;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  __int128 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCompositeEditorialLayoutMetrics;
  v4 = -[PXLayoutMetrics copyWithZone:](&v7, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_interTileSpacing;
  v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)v4 + 3) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)v4 + 4) = v5;
  *((_BYTE *)v4 + 24) = self->_useSaliency;
  objc_storeStrong((id *)v4 + 5, self->_editorialLayoutSpec);
  return v4;
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

- (BOOL)useSaliency
{
  return self->_useSaliency;
}

- (void)setUseSaliency:(BOOL)a3
{
  self->_useSaliency = a3;
}

- (PXCompositeEditorialLayoutSpec)editorialLayoutSpec
{
  return self->_editorialLayoutSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialLayoutSpec, 0);
}

@end
