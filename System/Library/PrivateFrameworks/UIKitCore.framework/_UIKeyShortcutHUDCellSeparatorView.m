@implementation _UIKeyShortcutHUDCellSeparatorView

- (_UIKeyShortcutHUDCellSeparatorView)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDCellSeparatorView *v3;
  _UIKeyShortcutHUDCellSeparatorView *v4;
  uint64_t v5;
  _UIKeyShortcutHUDSeparatorView *separatorView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKeyShortcutHUDCellSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v5 = objc_opt_new();
    separatorView = v4->_separatorView;
    v4->_separatorView = (_UIKeyShortcutHUDSeparatorView *)v5;

    -[UIView addSubview:](v4, "addSubview:", v4->_separatorView);
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDCellSeparatorView;
  -[UIView layoutSubviews](&v4, sel_layoutSubviews);
  -[UIView layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  -[UIView setFrame:](self->_separatorView, "setFrame:");

}

- (_UIKeyShortcutHUDSeparatorView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
