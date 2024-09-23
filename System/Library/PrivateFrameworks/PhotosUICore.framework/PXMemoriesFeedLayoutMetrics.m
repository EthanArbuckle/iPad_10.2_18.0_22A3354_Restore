@implementation PXMemoriesFeedLayoutMetrics

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  __int128 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMemoriesFeedLayoutMetrics;
  v4 = -[PXLayoutMetrics copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_spec);
  v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *((_OWORD *)v4 + 2) = *(_OWORD *)&self->_contentInsets.top;
  *((_OWORD *)v4 + 3) = v5;
  return v4;
}

- (PXMemoriesSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
