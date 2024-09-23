@implementation _UIStatusBarFocusableImageView

- (BOOL)isUserInteractionEnabled
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *unfocusedTintColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarFocusableImageView;
  v4 = a3;
  -[_UIStatusBarImageView applyStyleAttributes:](&v7, sel_applyStyleAttributes_, v4);
  objc_msgSend(v4, "imageTintColor", v7.receiver, v7.super_class);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

  unfocusedTintColor = self->_unfocusedTintColor;
  self->_unfocusedTintColor = v5;

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  _UIStatusBarFocusableImageView *v6;

  objc_msgSend(a3, "nextFocusedItem");
  v6 = (_UIStatusBarFocusableImageView *)objc_claimAutoreleasedReturnValue();
  if (v6 == self)
  {
    -[_UIStatusBarFocusableImageView focusedImageTintColor](self, "focusedImageTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self, "setTintColor:", v5);

  }
  else
  {
    -[UIView setTintColor:](self, "setTintColor:", self->_unfocusedTintColor);
  }

}

- (UIColor)focusedImageTintColor
{
  return self->_focusedImageTintColor;
}

- (void)setFocusedImageTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_focusedImageTintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedImageTintColor, 0);
  objc_storeStrong((id *)&self->_unfocusedTintColor, 0);
}

@end
