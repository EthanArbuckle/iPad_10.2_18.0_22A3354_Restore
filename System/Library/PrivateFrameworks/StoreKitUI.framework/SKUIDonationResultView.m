@implementation SKUIDonationResultView

- (UIImage)image
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
        -[SKUIDonationResultView image].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UIImageView image](self->_imageView, "image");
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)message
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
        -[SKUIDonationResultView message].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_messageLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setImage:(id)a3
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
  id v13;
  UIImageView *imageView;
  UIImageView *v15;
  UIImageView *v16;
  UIImageView *v17;
  void *v18;
  UIImageView *v19;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDonationResultView setImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[UIImageView image](self->_imageView, "image");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v4)
  {
    imageView = self->_imageView;
    if (v4)
    {
      if (!imageView)
      {
        v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
        v16 = self->_imageView;
        self->_imageView = v15;

        v17 = self->_imageView;
        -[SKUIDonationResultView backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v17, "setBackgroundColor:", v18);

        -[SKUIDonationResultView addSubview:](self, "addSubview:", self->_imageView);
        imageView = self->_imageView;
      }
      -[UIImageView setImage:](imageView, "setImage:", v4);
      -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    }
    else
    {
      -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
      v19 = self->_imageView;
      self->_imageView = 0;

    }
    -[SKUIDonationResultView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMessage:(id)a3
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
  id v13;
  UILabel *messageLabel;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDonationResultView setMessage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIDonationResultView message](self, "message");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v4 && (objc_msgSend(v4, "isEqualToString:", v13) & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v4)
    {
      if (!messageLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v16 = self->_messageLabel;
        self->_messageLabel = v15;

        v17 = self->_messageLabel;
        -[SKUIDonationResultView backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

        v19 = self->_messageLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v19, "setFont:", v20);

        -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
        v21 = self->_messageLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "_secondaryLabelColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v21, "setTextColor:", v22);

        -[SKUIDonationResultView addSubview:](self, "addSubview:", self->_messageLabel);
        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:", v4);
    }
    else
    {
      -[UILabel removeFromSuperview](messageLabel, "removeFromSuperview");
      v23 = self->_messageLabel;
      self->_messageLabel = 0;

    }
    -[SKUIDonationResultView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitle:(id)a3
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
  id v13;
  UILabel *titleLabel;
  UILabel *v15;
  UILabel *v16;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UILabel *v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIDonationResultView setTitle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIDonationResultView title](self, "title");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 != v4 && (objc_msgSend(v4, "isEqualToString:", v13) & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v4)
    {
      if (!titleLabel)
      {
        v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        v16 = self->_titleLabel;
        self->_titleLabel = v15;

        v17 = self->_titleLabel;
        -[SKUIDonationResultView backgroundColor](self, "backgroundColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v17, "setBackgroundColor:", v18);

        v19 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v19, "setFont:", v20);

        -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
        -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
        v21 = self->_titleLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v21, "setTextColor:", v22);

        -[SKUIDonationResultView addSubview:](self, "addSubview:", self->_titleLabel);
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:", v4);
    }
    else
    {
      -[UILabel removeFromSuperview](titleLabel, "removeFromSuperview");
      v23 = self->_titleLabel;
      self->_titleLabel = 0;

    }
    -[SKUIDonationResultView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
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
        -[SKUIDonationResultView title].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  -[UILabel text](self->_titleLabel, "text");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)image
{
  OUTLINED_FUNCTION_1();
}

- (void)message
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setMessage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)title
{
  OUTLINED_FUNCTION_1();
}

@end
