@implementation SKUIEmptyContentPlaceholderView

- (void)maskPlaceholdersInBackdropView:(id)a3
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
  UILabel *label;
  void *v14;
  UILabel *v15;
  void *v16;
  UIImageView *imageView;
  void *v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        -[SKUIEmptyContentPlaceholderView maskPlaceholdersInBackdropView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
        if (!v4)
          goto LABEL_6;
        goto LABEL_5;
      }
    }
  }
  if (v4)
  {
LABEL_5:
    objc_msgSend(v4, "removeMaskViews");
    label = self->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](label, "setBackgroundColor:", v14);

    -[UILabel setOpaque:](self->_label, "setOpaque:", 0);
    v15 = self->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    -[UILabel _setBackdropMaskViewFlags:](self->_label, "_setBackdropMaskViewFlags:", 2);
    objc_msgSend(v4, "updateMaskViewsForView:", self->_label);
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.2);
    imageView = self->_imageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v18);

    -[UIImageView setOpaque:](self->_imageView, "setOpaque:", 0);
    -[UIImageView _setBackdropMaskViewFlags:](self->_imageView, "_setBackdropMaskViewFlags:", 2);
    objc_msgSend(v4, "updateMaskViewsForView:", self->_imageView);
  }
LABEL_6:

}

- (UIImage)placeholderImage
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
        -[SKUIEmptyContentPlaceholderView placeholderImage].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UIImageView image](self->_imageView, "image");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)placeholderMessage
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
        -[SKUIEmptyContentPlaceholderView placeholderMessage].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_label, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (UILabel)placeholderMessageLabel
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UILabel *label;
  UILabel *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
  void *v17;
  UILabel *v18;
  void *v19;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEmptyContentPlaceholderView placeholderMessageLabel].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  label = self->_label;
  if (!label)
  {
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v13 = self->_label;
    self->_label = v12;

    v14 = self->_label;
    -[SKUIEmptyContentPlaceholderView backgroundColor](self, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v14, "setBackgroundColor:", v15);

    v16 = self->_label;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v16, "setFont:", v17);

    -[UILabel setHidden:](self->_label, "setHidden:", 1);
    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    v18 = self->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v18, "setTextColor:", v19);

    -[SKUIEmptyContentPlaceholderView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (void)setPlaceholderImage:(id)a3
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
  UIImageView *imageView;
  UIImageView *v14;
  UIImageView *v15;
  UIImageView *v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmptyContentPlaceholderView setPlaceholderImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  imageView = self->_imageView;
  if (v4)
  {
    if (!imageView)
    {
      v14 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v15 = self->_imageView;
      self->_imageView = v14;

      -[SKUIEmptyContentPlaceholderView addSubview:](self, "addSubview:", self->_imageView);
      imageView = self->_imageView;
    }
    -[UIImageView setImage:](imageView, "setImage:", v4);
    -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    -[SKUIEmptyContentPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
    v16 = self->_imageView;
    self->_imageView = 0;

  }
}

- (void)setPlaceholderImageInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

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
        -[SKUIEmptyContentPlaceholderView setPlaceholderImageInsets:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  self->_imageInsets.top = top;
  self->_imageInsets.left = left;
  self->_imageInsets.bottom = bottom;
  self->_imageInsets.right = right;
  -[SKUIEmptyContentPlaceholderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPlaceholderMessage:(id)a3
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

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
      {
        -[SKUIEmptyContentPlaceholderView setPlaceholderMessage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
        if (v4)
          goto LABEL_5;
LABEL_7:
        -[UILabel setHidden:](self->_label, "setHidden:", 1);
        -[UILabel setText:](self->_label, "setText:", 0);
        goto LABEL_8;
      }
    }
  }
  if (!v4)
    goto LABEL_7;
LABEL_5:
  -[SKUIEmptyContentPlaceholderView placeholderMessageLabel](self, "placeholderMessageLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", 0);
  objc_msgSend(v13, "setText:", v4);
  -[SKUIEmptyContentPlaceholderView setNeedsLayout](self, "setNeedsLayout");

LABEL_8:
}

- (void)setShowsSignInButton:(BOOL)a3
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
  void *v13;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmptyContentPlaceholderView setShowsSignInButton:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIEmptyContentPlaceholderView signInButton](self, "signInButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHidden:", !v3);

}

- (UIButton)signInButton
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIButton *signInButton;
  UIButton *v12;
  UIButton *v13;
  void *v14;
  void *v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEmptyContentPlaceholderView signInButton].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  signInButton = self->_signInButton;
  if (!signInButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v12 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v13 = self->_signInButton;
    self->_signInButton = v12;

    -[UIButton setHidden:](self->_signInButton, "setHidden:", 1);
    -[UIButton titleLabel](self->_signInButton, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v15);

    -[SKUIEmptyContentPlaceholderView addSubview:](self, "addSubview:", self->_signInButton);
    signInButton = self->_signInButton;
  }
  return signInButton;
}

- (BOOL)showsSignInButton
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIButton *signInButton;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIEmptyContentPlaceholderView showsSignInButton].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  signInButton = self->_signInButton;
  if (signInButton)
    LOBYTE(signInButton) = -[UIButton isHidden](signInButton, "isHidden") ^ 1;
  return (char)signInButton;
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
        -[SKUIEmptyContentPlaceholderView setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", v4);
  -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUIEmptyContentPlaceholderView;
  -[SKUIEmptyContentPlaceholderView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  width = a3.width;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIEmptyContentPlaceholderView sizeThatFits:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIImageView frame](self->_imageView, "frame");
  v14 = v13;
  v16 = v15;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width + -30.0, 1.79769313e308);
  v18 = v17;
  v20 = v19;
  if ((-[UIButton isHidden](self->_signInButton, "isHidden") & 1) != 0)
  {
    v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    -[UIButton sizeToFit](self->_signInButton, "sizeToFit");
    -[UIButton frame](self->_signInButton, "frame");
  }
  v22 = v21 + 20.0;
  if (v21 <= 0.00000011920929)
    v22 = -0.0;
  v23 = v22 + v20 + v16 + self->_imageInsets.bottom + self->_imageInsets.top;
  if (v14 >= v18)
    v24 = v14;
  else
    v24 = v18;
  v25 = v24 + 30.0;
  result.height = v23;
  result.width = v25;
  return result;
}

- (UIEdgeInsets)placeholderImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageInsets.top;
  left = self->_imageInsets.left;
  bottom = self->_imageInsets.bottom;
  right = self->_imageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)maskPlaceholdersInBackdropView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)placeholderImage
{
  OUTLINED_FUNCTION_1();
}

- (void)placeholderMessage
{
  OUTLINED_FUNCTION_1();
}

- (void)placeholderMessageLabel
{
  OUTLINED_FUNCTION_1();
}

- (void)setPlaceholderImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPlaceholderImageInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setPlaceholderMessage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setShowsSignInButton:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)signInButton
{
  OUTLINED_FUNCTION_1();
}

- (void)showsSignInButton
{
  OUTLINED_FUNCTION_1();
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)sizeThatFits:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
