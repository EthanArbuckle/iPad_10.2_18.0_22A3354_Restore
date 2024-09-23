@implementation SKUIShelfCollectionViewCell

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UICollectionView **p_collectionView;
  UICollectionView *v15;
  void *v16;
  UICollectionView *v17;
  void *v18;

  v5 = (UICollectionView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIShelfCollectionViewCell setCollectionView:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_collectionView = &self->_collectionView;
  v15 = v5;
  if (self->_collectionView != v5)
  {
    if (-[UICollectionView isDescendantOfView:](self->_collectionView, "isDescendantOfView:", self))
      -[UICollectionView removeFromSuperview](*p_collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    -[UICollectionView setSemanticContentAttribute:](*p_collectionView, "setSemanticContentAttribute:", -[SKUIShelfCollectionViewCell semanticContentAttribute](self, "semanticContentAttribute"));
    -[SKUIShelfCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v15 = *p_collectionView;
  }
  if (v15 && (-[UICollectionView isDescendantOfView:](v15, "isDescendantOfView:", self) & 1) == 0)
  {
    -[SKUIShelfCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *p_collectionView;
    -[SKUIShelfCollectionViewCell backgroundColor](self, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    objc_msgSend(v16, "addSubview:", *p_collectionView);
    -[SKUIShelfCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShelfCollectionViewCell setSemanticContentAttribute:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIShelfCollectionViewCell;
  -[SKUIShelfCollectionViewCell setSemanticContentAttribute:](&v13, sel_setSemanticContentAttribute_, a3);
  -[UICollectionView setSemanticContentAttribute:](self->_collectionView, "setSemanticContentAttribute:", a3);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIShelfCollectionViewCell setContentInset:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = self->_contentInset.top;
  if (self->_contentInset.left != left
    || v16 != top
    || self->_contentInset.right != right
    || self->_contentInset.bottom != bottom)
  {
    self->_contentInset.top = top;
    self->_contentInset.left = left;
    self->_contentInset.bottom = bottom;
    self->_contentInset.right = right;
    -[SKUIShelfCollectionViewCell setNeedsLayout](self, "setNeedsLayout", v16);
  }
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShelfCollectionViewCell setRendersWithPerspective:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_rendersWithPerspective != v3)
  {
    self->_rendersWithPerspective = v3;
    -[SKUIShelfCollectionViewCell updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (void)setRendersWithParallax:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShelfCollectionViewCell setRendersWithParallax:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (self->_rendersWithParallax != v3)
  {
    self->_rendersWithParallax = v3;
    -[SKUIShelfCollectionViewCell updateForChangedDistanceFromVanishingPoint](self, "updateForChangedDistanceFromVanishingPoint");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShelfCollectionViewCell applyLayoutAttributes:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShelfCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v13);

  v14.receiver = self;
  v14.super_class = (Class)SKUIShelfCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v14, sel_applyLayoutAttributes_, v4);

}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIShelfCollectionViewCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIShelfCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        +[SKUIShelfCollectionViewCell maximumPerspectiveHeightForSize:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0.0;
}

- (void)setPerspectiveTargetView:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v3)
      -[SKUIShelfCollectionViewCell setPerspectiveTargetView:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)setVanishingPoint:(CGPoint)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v3)
      -[SKUIShelfCollectionViewCell setVanishingPoint:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  OUTLINED_FUNCTION_1();
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

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

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

- (void)setCollectionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setSemanticContentAttribute:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setRendersWithPerspective:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setRendersWithParallax:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)applyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)maximumPerspectiveHeightForSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPerspectiveTargetView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setVanishingPoint:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
