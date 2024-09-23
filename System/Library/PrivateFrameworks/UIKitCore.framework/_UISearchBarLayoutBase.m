@implementation _UISearchBarLayoutBase

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLayoutSize:(CGSize)a3
{
  if (a3.width != self->_layoutSize.width || a3.height != self->_layoutSize.height)
  {
    self->_layoutSize = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (int64_t)barMetrics
{
  return self->_barMetrics;
}

- (void)setLayoutRTL:(BOOL)a3
{
  if (self->_layoutRTL != a3)
  {
    self->_layoutRTL = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHostedByNavigationBar:(BOOL)a3
{
  if (self->_hostedByNavigationBar != a3)
  {
    self->_hostedByNavigationBar = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setBarMetrics:(int64_t)a3
{
  if (self->_barMetrics != a3)
  {
    self->_barMetrics = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (BOOL)isHostedByNavigationBar
{
  return self->_hostedByNavigationBar;
}

- (BOOL)isLayoutRTL
{
  return self->_layoutRTL;
}

- (void)invalidateLayout
{
  self->_isLayoutValid = 0;
}

- (void)updateLayoutIfNeeded
{
  if (!self->_isLayoutValid)
    -[_UISearchBarLayoutBase updateLayout](self, "updateLayout");
  self->_isLayoutValid = 1;
}

- (CGSize)layoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_QWORD *)result + 2) = self->_barMetrics;
    v5 = *(_OWORD *)&self->_contentInset.top;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_contentInset.bottom;
    *(_OWORD *)((char *)result + 40) = v5;
    *((_BYTE *)result + 9) = self->_layoutRTL;
    *((_BYTE *)result + 10) = self->_hostedByNavigationBar;
    *(CGSize *)((char *)result + 24) = self->_layoutSize;
    *((_BYTE *)result + 8) = self->_isLayoutValid;
  }
  return result;
}

- (BOOL)isLayoutValid
{
  return self->_isLayoutValid;
}

- (id)description
{
  void *v3;
  uint64_t v5;
  int64_t barMetrics;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double top;
  double left;
  double right;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_UISearchBarLayoutBase;
  -[_UISearchBarLayoutBase description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  if (!self->_isLayoutValid)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" STALE"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  barMetrics = self->_barMetrics;
  if (barMetrics)
  {
    _UIBarMetricsDebugDescription(barMetrics);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  if (self->_layoutRTL)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" RTL"));
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  v10 = v3;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" layoutSize={%g, %g}"), *(_QWORD *)&self->_layoutSize.width, *(_QWORD *)&self->_layoutSize.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  right = self->_contentInset.right;
  if (left == 0.0 && top == 0.0 && right == 0.0 && self->_contentInset.bottom == 0.0)
    return v3;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" contentInset={%g, %g, %g, %g}"), *(_QWORD *)&top, *(_QWORD *)&left, *(_QWORD *)&self->_contentInset.bottom, *(_QWORD *)&right);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
