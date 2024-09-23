@implementation _UIKeyShortcutHUDSeparatorView

- (_UIKeyShortcutHUDSeparatorView)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDSeparatorView *v3;
  _UIKeyShortcutHUDSeparatorView *v4;
  UIVisualEffectView *v5;
  uint64_t v6;
  UIVisualEffectView *separatorVisualEffectView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIKeyShortcutHUDSeparatorView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v5 = [UIVisualEffectView alloc];
    -[UIView bounds](v4, "bounds");
    v6 = -[UIVisualEffectView initWithFrame:](v5, "initWithFrame:");
    separatorVisualEffectView = v4->_separatorVisualEffectView;
    v4->_separatorVisualEffectView = (UIVisualEffectView *)v6;

    -[UIView addSubview:](v4, "addSubview:", v4->_separatorVisualEffectView);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDSeparatorView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  -[UIView setFrame:](self->_separatorVisualEffectView, "setFrame:");

}

- (BOOL)isSeparatorHidden
{
  return -[UIView isHidden](self->_separatorVisualEffectView, "isHidden");
}

- (void)setSeparatorHidden:(BOOL)a3
{
  -[UIView setHidden:](self->_separatorVisualEffectView, "setHidden:", a3);
}

- (UIColor)separatorColor
{
  void *v2;
  void *v3;

  -[UIVisualEffectView contentView](self->_separatorVisualEffectView, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setSeparatorColor:(id)a3
{
  UIVisualEffectView *separatorVisualEffectView;
  id v4;
  id v5;

  separatorVisualEffectView = self->_separatorVisualEffectView;
  v4 = a3;
  -[UIVisualEffectView contentView](separatorVisualEffectView, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (UIVisualEffect)visualEffect
{
  return -[UIVisualEffectView effect](self->_separatorVisualEffectView, "effect");
}

- (void)setVisualEffect:(id)a3
{
  -[UIVisualEffectView setEffect:](self->_separatorVisualEffectView, "setEffect:", a3);
}

- (UIVisualEffectView)separatorVisualEffectView
{
  return self->_separatorVisualEffectView;
}

- (void)setSeparatorVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorVisualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorVisualEffectView, 0);
}

@end
