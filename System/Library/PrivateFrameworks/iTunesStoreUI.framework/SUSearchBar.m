@implementation SUSearchBar

- (void)removeFromSuperview
{
  void *v3;
  SUSearchBar *v4;
  objc_super v5;

  v3 = (void *)-[SUSearchBar delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = self;
    objc_msgSend(v3, "searchBarWillRemoveFromSuperview:", self);
  }
  v5.receiver = self;
  v5.super_class = (Class)SUSearchBar;
  -[SUSearchBar removeFromSuperview](&v5, sel_removeFromSuperview);
}

- (void)_setupCancelButtonWithAppearance:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSearchBar;
  -[SUSearchBar _setupCancelButtonWithAppearance:](&v3, sel__setupCancelButtonWithAppearance_, 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUSearchBar;
  -[SUSearchBar sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 >= width)
    v4 = width;
  result.height = v5;
  result.width = v4;
  return result;
}

@end
