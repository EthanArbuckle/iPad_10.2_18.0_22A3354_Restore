@implementation SKUITextBoxTableViewCell

- (SKUITextBoxTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUITextBoxTableViewCell *v7;
  SKUITextBoxTableViewCell *v8;
  void *v9;
  __int128 v10;
  SKUITextBoxView *v11;
  uint64_t v12;
  SKUITextBoxView *textBoxView;
  objc_super v15;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUITextBoxTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUITextBoxTableViewCell;
  v7 = -[SKUITableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[SKUITextBoxTableViewCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&v8->_textBoxInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&v8->_textBoxInsets.bottom = v10;
    v11 = [SKUITextBoxView alloc];
    objc_msgSend(v9, "bounds");
    v12 = -[SKUITextBoxView initWithFrame:](v11, "initWithFrame:");
    textBoxView = v8->_textBoxView;
    v8->_textBoxView = (SKUITextBoxView *)v12;

    -[SKUITextBoxView setEnabled:](v8->_textBoxView, "setEnabled:", 0);
    objc_msgSend(v9, "addSubview:", v8->_textBoxView);

  }
  return v8;
}

- (void)prepareForReuse
{
  __int128 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUITextBoxTableViewCell;
  -[SKUITableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  v3 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
  *(_OWORD *)&self->_textBoxInsets.top = *MEMORY[0x1E0DC49E8];
  *(_OWORD *)&self->_textBoxInsets.bottom = v3;
}

- (void)setBackgroundColor:(id)a3
{
  SKUITextBoxView *textBoxView;
  id v5;
  objc_super v6;

  textBoxView = self->_textBoxView;
  v5 = a3;
  -[SKUITextBoxView setBackgroundColor:](textBoxView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUITextBoxTableViewCell;
  -[SKUITextBoxTableViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void)layoutSubviews
{
  SKUITextBoxView *textBoxView;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUITextBoxTableViewCell;
  -[SKUITableViewCell layoutSubviews](&v8, sel_layoutSubviews);
  textBoxView = self->_textBoxView;
  -[SKUITextBoxTableViewCell bounds](self, "bounds");
  -[SKUITextBoxView setFrame:](textBoxView, "setFrame:", v4 + self->_textBoxInsets.left, v5 + self->_textBoxInsets.top, v6 - (self->_textBoxInsets.left + self->_textBoxInsets.right), v7 - (self->_textBoxInsets.top + self->_textBoxInsets.bottom));
}

- (SKUITextBoxView)textBoxView
{
  return self->_textBoxView;
}

- (UIEdgeInsets)textBoxInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textBoxInsets.top;
  left = self->_textBoxInsets.left;
  bottom = self->_textBoxInsets.bottom;
  right = self->_textBoxInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextBoxInsets:(UIEdgeInsets)a3
{
  self->_textBoxInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textBoxView, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUITextBoxTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
