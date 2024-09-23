@implementation _UIContextMenuSeparatorView

- (_UIContextMenuSeparatorView)initWithFrame:(CGRect)a3
{
  _UIContextMenuSeparatorView *v3;
  _UIContextMenuSeparatorView *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuSeparatorView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    v5 = _UIContextMenuConfigureSeparatorView(v3);
  return v4;
}

@end
