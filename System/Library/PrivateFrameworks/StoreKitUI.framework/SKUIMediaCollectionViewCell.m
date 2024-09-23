@implementation SKUIMediaCollectionViewCell

- (SKUIEmbeddedMediaView)mediaView
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUIEmbeddedMediaView *mediaView;
  void *v12;
  SKUIEmbeddedMediaView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SKUIEmbeddedMediaView *v18;
  SKUIEmbeddedMediaView *v19;
  SKUIEmbeddedMediaView *v20;
  void *v21;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIMediaCollectionViewCell mediaView].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  mediaView = self->_mediaView;
  if (!mediaView)
  {
    -[SKUIMediaCollectionViewCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [SKUIEmbeddedMediaView alloc];
    objc_msgSend(v12, "bounds");
    v18 = -[SKUIEmbeddedMediaView initWithFrame:](v13, "initWithFrame:", v14 + self->_contentInset.left, v15 + self->_contentInset.top, v16 - (self->_contentInset.left + self->_contentInset.right), v17 - (self->_contentInset.top + self->_contentInset.bottom));
    v19 = self->_mediaView;
    self->_mediaView = v18;

    v20 = self->_mediaView;
    -[SKUIMediaCollectionViewCell backgroundColor](self, "backgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIEmbeddedMediaView setBackgroundColor:](v20, "setBackgroundColor:", v21);

    objc_msgSend(v12, "addSubview:", self->_mediaView);
    mediaView = self->_mediaView;
  }
  return mediaView;
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
        -[SKUIMediaCollectionViewCell setContentInset:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
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
    -[SKUIMediaCollectionViewCell setNeedsLayout](self, "setNeedsLayout", v16);
  }
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
        -[SKUIMediaCollectionViewCell setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEmbeddedMediaView setBackgroundColor:](self->_mediaView, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIMediaCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaView, 0);
}

- (void)mediaView
{
  OUTLINED_FUNCTION_1();
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
