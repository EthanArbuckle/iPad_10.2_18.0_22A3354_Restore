@implementation SKUICategoryTableViewCell

- (SKUICategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUICategoryTableViewCell *v7;
  SKUICategoryTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *separatorView;
  UIView *v15;
  void *v16;
  objc_super v18;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICategoryTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICategoryTableViewCell;
  v7 = -[SKUICategoryTableViewCell initWithStyle:reuseIdentifier:](&v18, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[SKUICategoryTableViewCell textLabel](v7, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v12);

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v8->_separatorView;
    v8->_separatorView = v13;

    v15 = v8->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[SKUICategoryTableViewCell addSubview:](v8, "addSubview:", v8->_separatorView);
    v8->_layoutNeedsLayout = 1;

  }
  return v8;
}

- (void)setExpectedImageSize:(CGSize)a3
{
  if (self->_expectedImageSize.width != a3.width || self->_expectedImageSize.height != a3.height)
  {
    self->_expectedImageSize = a3;
    -[SKUICategoryTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUICategoryTableViewCell bounds](self, "bounds");
  if (v9 != width || v8 != height)
    self->_layoutNeedsLayout = 1;
  v11.receiver = self;
  v11.super_class = (Class)SKUICategoryTableViewCell;
  -[SKUICategoryTableViewCell setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUICategoryTableViewCell frame](self, "frame");
  if (v9 != width || v8 != height)
    self->_layoutNeedsLayout = 1;
  v11.receiver = self;
  v11.super_class = (Class)SKUICategoryTableViewCell;
  -[SKUICategoryTableViewCell setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double width;
  void *v14;
  void *v15;
  double v16;
  UIView *separatorView;
  void *v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SKUICategoryTableViewCell;
  -[SKUICategoryTableViewCell layoutSubviews](&v21, sel_layoutSubviews);
  if (self->_layoutNeedsLayout)
  {
    -[SKUICategoryTableViewCell bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[SKUICategoryTableViewCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "frame");
      v10 = v9;
      objc_msgSend(v7, "setFrame:", 15.0, (v6 - v11) * 0.5);
      v12 = v10 + 15.0 + 15.0;
    }
    else
    {
      width = self->_expectedImageSize.width;
      v12 = 15.0;
      if (width > 0.0)
        v12 = width + 15.0 + 15.0;
    }
    -[SKUICategoryTableViewCell textLabel](self, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "sizeToFit");
      objc_msgSend(v15, "frame");
      objc_msgSend(v15, "setFrame:", v12, (v6 - v16) * 0.5, v4 - v12 + -15.0);
    }
    separatorView = self->_separatorView;
    if (separatorView)
    {
      -[UIView frame](separatorView, "frame");
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      v20 = 1.0 / v19;

      -[UIView setFrame:](self->_separatorView, "setFrame:", 15.0, v6 - v20, v4 + -15.0, v20);
    }

  }
  self->_layoutNeedsLayout = 0;
}

- (CGSize)expectedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expectedImageSize.width;
  height = self->_expectedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICategoryTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
