@implementation SKUILoadMoreCell

- (SKUILoadMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUILoadMoreCell *v7;
  SKUILoadMoreCell *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UIActivityIndicatorView *indicator;
  double v16;
  float v17;
  double v18;
  float v19;
  objc_super v21;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadMoreCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUILoadMoreCell;
  v7 = -[SKUITableViewCell initWithStyle:reuseIdentifier:](&v21, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[SKUILoadMoreCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
    indicator = v8->_indicator;
    v8->_indicator = (UIActivityIndicatorView *)v14;

    -[UIActivityIndicatorView setAutoresizingMask:](v8->_indicator, "setAutoresizingMask:", 45);
    -[UIActivityIndicatorView sizeToFit](v8->_indicator, "sizeToFit");
    -[UIActivityIndicatorView frame](v8->_indicator, "frame");
    v17 = (v11 - v16) * 0.5;
    v19 = (v13 - v18) * 0.5;
    -[UIActivityIndicatorView setFrame:](v8->_indicator, "setFrame:", floorf(v17), floorf(v19));
    objc_msgSend(v9, "addSubview:", v8->_indicator);

  }
  return v8;
}

- (void)startAnimating
{
  -[UIActivityIndicatorView startAnimating](self->_indicator, "startAnimating");
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView stopAnimating](self->_indicator, "stopAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicator, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadMoreCell initWithStyle:reuseIdentifier:]";
}

@end
