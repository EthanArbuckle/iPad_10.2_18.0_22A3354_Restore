@implementation _UIContextMenuReusableSeparatorView

- (_UIContextMenuReusableSeparatorView)initWithFrame:(CGRect)a3
{
  _UIContextMenuReusableSeparatorView *v3;
  _UIContextMenuReusableSeparatorView *v4;
  uint64_t v5;
  UIView *separatorView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuReusableSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    _UIContextMenuConfigureSeparatorView(v3);
    v5 = objc_claimAutoreleasedReturnValue();
    separatorView = v4->_separatorView;
    v4->_separatorView = (UIView *)v5;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
