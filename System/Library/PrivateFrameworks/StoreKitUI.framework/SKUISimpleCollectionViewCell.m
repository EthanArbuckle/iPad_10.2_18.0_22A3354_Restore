@implementation SKUISimpleCollectionViewCell

- (void)setContentChildView:(id)a3
{
  UIView *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIView **p_contentChildView;
  UIView *v15;
  void *v16;
  UIView *v17;
  void *v18;

  v5 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUISimpleCollectionViewCell setContentChildView:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  p_contentChildView = &self->_contentChildView;
  v15 = v5;
  if (self->_contentChildView != v5)
  {
    if (-[UIView isDescendantOfView:](self->_contentChildView, "isDescendantOfView:", self))
      -[UIView removeFromSuperview](*p_contentChildView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentChildView, a3);
    -[SKUISimpleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    v15 = *p_contentChildView;
  }
  if (v15 && !-[UIView isDescendantOfView:](v15, "isDescendantOfView:", self))
  {
    -[SKUISimpleCollectionViewCell contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *p_contentChildView;
    -[SKUISimpleCollectionViewCell backgroundColor](self, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    objc_msgSend(v16, "addSubview:", *p_contentChildView);
    -[SKUISimpleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
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
        -[SKUISimpleCollectionViewCell setContentInsets:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = self->_contentInsets.top;
  if (self->_contentInsets.left != left
    || v16 != top
    || self->_contentInsets.right != right
    || self->_contentInsets.bottom != bottom)
  {
    self->_contentInsets.top = top;
    self->_contentInsets.left = left;
    self->_contentInsets.bottom = bottom;
    self->_contentInsets.right = right;
    -[SKUISimpleCollectionViewCell setNeedsLayout](self, "setNeedsLayout", v16);
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
        -[SKUISimpleCollectionViewCell applyLayoutAttributes:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUISimpleCollectionViewCell setBackgroundColor:](self, "setBackgroundColor:", v13);

  v14.receiver = self;
  v14.super_class = (Class)SKUISimpleCollectionViewCell;
  -[SKUISimpleCollectionViewCell applyLayoutAttributes:](&v14, sel_applyLayoutAttributes_, v4);

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
        -[SKUISimpleCollectionViewCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIView setBackgroundColor:](self->_contentChildView, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUISimpleCollectionViewCell;
  -[SKUISimpleCollectionViewCell setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (UIView)contentChildView
{
  return self->_contentChildView;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentChildView, 0);
}

- (void)setContentChildView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

@end
