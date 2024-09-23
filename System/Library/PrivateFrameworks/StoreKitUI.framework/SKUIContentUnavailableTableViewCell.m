@implementation SKUIContentUnavailableTableViewCell

- (SKUIContentUnavailableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUIContentUnavailableTableViewCell *v7;
  SKUIContentUnavailableTableViewCell *v8;
  id v9;
  uint64_t v10;
  _UIContentUnavailableView *view;
  void *v12;
  objc_super v14;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContentUnavailableTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIContentUnavailableTableViewCell;
  v7 = -[SKUITableViewCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[SKUIContentUnavailableTableViewCell setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
    v9 = objc_alloc(MEMORY[0x1E0DC40B8]);
    v10 = objc_msgSend(v9, "initWithFrame:title:style:", 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    view = v8->_view;
    v8->_view = (_UIContentUnavailableView *)v10;

    -[SKUIContentUnavailableTableViewCell contentView](v8, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v8->_view);

  }
  return v8;
}

- (NSString)title
{
  return (NSString *)-[_UIContentUnavailableView title](self->_view, "title");
}

- (void)setTitle:(id)a3
{
  -[_UIContentUnavailableView setTitle:](self->_view, "setTitle:", a3);
}

- (NSString)message
{
  return (NSString *)-[_UIContentUnavailableView message](self->_view, "message");
}

- (void)setMessage:(id)a3
{
  -[_UIContentUnavailableView setMessage:](self->_view, "setMessage:", a3);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKUIContentUnavailableTableViewCell;
  -[SKUITableViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[SKUIContentUnavailableTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[_UIContentUnavailableView setFrame:](self->_view, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIContentUnavailableTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
