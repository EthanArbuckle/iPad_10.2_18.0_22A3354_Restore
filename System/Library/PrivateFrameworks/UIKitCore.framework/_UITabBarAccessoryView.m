@implementation _UITabBarAccessoryView

- (_UITabBarAccessoryView)init
{
  _UITabBarAccessoryView *v2;
  _UITabBarAccessoryView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITabBarAccessoryView;
  v2 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 200.0, 68.0);
  v3 = v2;
  if (v2)
    -[_UITabBarAccessoryView commonInit](v2, "commonInit");
  return v3;
}

- (_UITabBarAccessoryView)initWithFrame:(CGRect)a3
{
  _UITabBarAccessoryView *v3;
  _UITabBarAccessoryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITabBarAccessoryView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UITabBarAccessoryView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  UIView *v3;
  UIView *contentView;

  v3 = objc_alloc_init(UIView);
  contentView = self->_contentView;
  self->_contentView = v3;

  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self, "addSubview:", self->_contentView);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITabBarAccessoryView;
  if (-[UIView shouldUpdateFocusInContext:](&v9, sel_shouldUpdateFocusInContext_, v4))
  {
    objc_msgSend(v4, "nextFocusedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isDescendantOfView:", self))
    {
      if (objc_msgSend(v4, "focusHeading") == 4)
      {

      }
      else
      {
        v7 = objc_msgSend(v4, "focusHeading");

        if (v7 != 8)
        {
          v6 = 1;
          goto LABEL_10;
        }
      }
      objc_msgSend(v4, "_focusMovement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_isInitialMovement");
    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
