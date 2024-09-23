@implementation SKUIDownloadsView

- (void)setContentView:(id)a3
{
  UIView *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIView *contentView;
  UIView *v14;

  v4 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDownloadsView setContentView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  contentView = self->_contentView;
  self->_contentView = v4;
  v14 = v4;

  -[SKUIDownloadsView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_contentView, 0);
  -[SKUIDownloadsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setOverlayView:(id)a3
{
  UIView *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIView *overlayView;
  UIView *v14;

  v4 = (UIView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDownloadsView setOverlayView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  v14 = v4;

  -[SKUIDownloadsView addSubview:](self, "addSubview:", self->_overlayView);
  -[SKUIDownloadsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setContentView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setOverlayView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
