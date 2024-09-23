@implementation SKUIProductPagePlaceholderView

- (SKUIProductPagePlaceholderView)initWithPlaceholderString:(id)a3 isPad:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SKUIProductPagePlaceholderView *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  UIImageView *imageView;
  UILabel *v13;
  UILabel *label;
  UILabel *v15;
  void *v16;
  UILabel *v17;
  double v18;
  void *v19;
  objc_super v21;

  v4 = a4;
  v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPagePlaceholderView initWithPlaceholderString:isPad:].cold.1();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIProductPagePlaceholderView;
  v7 = -[SKUIProductPagePlaceholderView init](&v21, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("RelatedProxyGraphicApp"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithImage:", v10);
    imageView = v7->_imageView;
    v7->_imageView = (UIImageView *)v11;

    -[SKUIProductPagePlaceholderView addSubview:](v7, "addSubview:", v7->_imageView);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v7->_label;
    v7->_label = v13;

    -[UILabel setText:](v7->_label, "setText:", v6);
    v15 = v7->_label;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.384313732, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    v17 = v7->_label;
    v18 = 12.0;
    if (v4)
      v18 = 18.0;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v19);

    -[UILabel sizeToFit](v7->_label, "sizeToFit");
    -[SKUIProductPagePlaceholderView addSubview:](v7, "addSubview:", v7->_label);

  }
  return v7;
}

- (void)setTextColor:(id)a3
{
  UILabel *label;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_textColor, a3);
  label = self->_label;
  if (self->_textColor)
  {
    -[UILabel setTextColor:](self->_label, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.384313732, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](label, "setTextColor:", v6);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  CGFloat v13;
  float v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  float v18;
  CGRect v19;

  -[SKUIProductPagePlaceholderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIImageView frame](self->_imageView, "frame");
  v8 = v7;
  v10 = v9;
  -[UILabel frame](self->_label, "frame");
  v12 = (v6 - (v10 + 7.0 + v11)) * 0.5;
  v13 = floorf(v12);
  v14 = (v4 - v8) * 0.5;
  v15 = floorf(v14);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15, v13, v8, v10);
  v19.origin.x = v15;
  v19.origin.y = v13;
  v19.size.width = v8;
  v19.size.height = v10;
  v16 = CGRectGetMaxY(v19) + 7.0;
  -[UILabel frame](self->_label, "frame");
  v18 = (v4 - v17) * 0.5;
  -[UILabel setFrame:](self->_label, "setFrame:", floorf(v18), v16);
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *imageView;
  id v5;
  objc_super v6;

  imageView = self->_imageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUIProductPagePlaceholderView;
  -[SKUIProductPagePlaceholderView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  -[UIImageView frame](self->_imageView, "frame", a3.width, a3.height);
  v6 = v5 + 7.0;
  -[UILabel frame](self->_label, "frame");
  v8 = v6 + v7;
  v9 = width;
  result.height = v8;
  result.width = v9;
  return result;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithPlaceholderString:isPad:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPagePlaceholderView initWithPlaceholderString:isPad:]";
}

@end
