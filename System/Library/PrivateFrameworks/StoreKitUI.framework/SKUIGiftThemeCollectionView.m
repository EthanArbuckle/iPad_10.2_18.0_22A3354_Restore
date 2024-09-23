@implementation SKUIGiftThemeCollectionView

- (CGRect)_visibleBounds
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double top;
  double left;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIGiftThemeCollectionView _visibleBounds].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIGiftThemeCollectionView;
  -[SKUIGiftThemeCollectionView _visibleBounds](&v21, sel__visibleBounds);
  top = self->_visibleBoundsInsets.top;
  left = self->_visibleBoundsInsets.left;
  v14 = v13 + left;
  v16 = v15 + top;
  v18 = v17 - (left + self->_visibleBoundsInsets.right);
  v20 = v19 - (top + self->_visibleBoundsInsets.bottom);
  result.size.height = v20;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIGiftThemeCollectionView pointInside:withEvent:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  -[SKUIGiftThemeCollectionView superview](self, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftThemeCollectionView convertPoint:toView:](self, "convertPoint:toView:", v15, x, y);
  v17 = v16;
  v19 = v18;

  -[SKUIGiftThemeCollectionView superview](self, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22.x = v17;
  v22.y = v19;
  LOBYTE(v15) = CGRectContainsPoint(v23, v22);

  return (char)v15;
}

- (UIEdgeInsets)visibleBoundsInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_visibleBoundsInsets.top;
  left = self->_visibleBoundsInsets.left;
  bottom = self->_visibleBoundsInsets.bottom;
  right = self->_visibleBoundsInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setVisibleBoundsInsets:(UIEdgeInsets)a3
{
  self->_visibleBoundsInsets = a3;
}

- (void)_visibleBounds
{
}

- (void)pointInside:(uint64_t)a3 withEvent:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
