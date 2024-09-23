@implementation SKUILoadingView

- (SKUILoadingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUILoadingView *v16;
  uint64_t v17;
  UIActivityIndicatorView *spinner;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUILoadingView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUILoadingView;
  v16 = -[SKUILoadingView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    spinner = v16->_spinner;
    v16->_spinner = (UIActivityIndicatorView *)v17;

    -[UIActivityIndicatorView sizeToFit](v16->_spinner, "sizeToFit");
    -[SKUILoadingView addSubview:](v16, "addSubview:", v16->_spinner);
  }
  return v16;
}

+ (id)defaultLoadingTextWithClientContext:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
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
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
      {
        +[SKUILoadingView defaultLoadingTextWithClientContext:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
        if (v3)
          goto LABEL_5;
LABEL_7:
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("DEFAULT_LOADING_TEXT"), 0);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }
  if (!v3)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(v3, "localizedStringForKey:", CFSTR("DEFAULT_LOADING_TEXT"));
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v13 = (void *)v12;

  return v13;
}

- (NSString)loadingText
{
  return -[UILabel text](self->_label, "text");
}

- (void)setColorScheme:(id)a3
{
  SKUIColorScheme *v4;
  SKUIColorScheme *colorScheme;
  uint64_t v6;
  id v7;

  if (self->_colorScheme != a3)
  {
    v4 = (SKUIColorScheme *)objc_msgSend(a3, "copy");
    colorScheme = self->_colorScheme;
    self->_colorScheme = v4;

    -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (id)v6;
    -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v6);
    -[UILabel setTextColor:](self->_label, "setTextColor:", v7);

  }
}

- (void)setLoadingText:(id)a3
{
  id v4;
  UILabel *label;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v4 = a3;
  label = self->_label;
  v16 = v4;
  if (v4)
  {
    if (!label)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      v7 = self->_label;
      self->_label = v6;

      v8 = self->_label;
      -[SKUILoadingView backgroundColor](self, "backgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

      v10 = self->_label;
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 11.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v10, "setFont:", v11);

      -[SKUIColorScheme primaryTextColor](self->_colorScheme, "primaryTextColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_label;
      if (v12)
      {
        -[UILabel setTextColor:](self->_label, "setTextColor:", v12);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v13, "setTextColor:", v15);

      }
      -[SKUILoadingView addSubview:](self, "addSubview:", self->_label);

      label = self->_label;
    }
    -[UILabel setText:](label, "setText:", v16);
    -[UILabel sizeToFit](self->_label, "sizeToFit");
    -[SKUILoadingView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel removeFromSuperview](label, "removeFromSuperview");
    v14 = self->_label;
    self->_label = 0;

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIActivityIndicatorView *spinner;
  double v8;
  float v9;
  UILabel *label;
  double v11;
  float v12;
  double v13;

  -[SKUILoadingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  spinner = self->_spinner;
  if (spinner)
  {
    -[UIActivityIndicatorView frame](spinner, "frame");
    v9 = (v4 - v8) * 0.5;
    -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", floorf(v9), 0.0);
  }
  label = self->_label;
  if (label)
  {
    -[UILabel frame](label, "frame");
    v12 = (v4 - v11) * 0.5;
    -[UILabel setFrame:](self->_label, "setFrame:", floorf(v12), v6 - v13);
  }
}

- (void)setBackgroundColor:(id)a3
{
  UILabel *label;
  id v5;
  objc_super v6;

  label = self->_label;
  v5 = a3;
  -[UILabel setBackgroundColor:](label, "setBackgroundColor:", v5);
  -[UIActivityIndicatorView setBackgroundColor:](self->_spinner, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUILoadingView;
  -[SKUILoadingView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIActivityIndicatorView *spinner;
  double v5;
  double width;
  double v7;
  double v8;
  UILabel *label;
  double v10;
  double v11;
  double v12;
  CGSize result;

  spinner = self->_spinner;
  if (spinner)
  {
    -[UIActivityIndicatorView frame](spinner, "frame", a3.width, a3.height);
    width = v5;
    -[UIActivityIndicatorView frame](self->_spinner, "frame");
    v8 = v7 + 0.0;
  }
  else
  {
    width = a3.width;
    v8 = 0.0;
  }
  label = self->_label;
  if (label)
  {
    -[UILabel sizeThatFits:](label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    if (width < v10)
      width = v10;
    v8 = v8 + 18.0;
  }
  v11 = width;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v6;

  v4 = a3;
  v5 = -[UIActivityIndicatorView isAnimating](self->_spinner, "isAnimating");
  if (v4)
  {
    if (!v5)
      -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  }
  else if (v5)
  {
    -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUILoadingView;
  -[SKUILoadingView willMoveToSuperview:](&v6, sel_willMoveToSuperview_, v4);

}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)defaultLoadingTextWithClientContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
