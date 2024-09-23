@implementation _UIUCBKBSelectionBackground

- (_UIUCBKBSelectionBackground)initWithFrame:(CGRect)a3
{
  _UIUCBKBSelectionBackground *v3;
  _UIUCBKBSelectionBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIUCBKBSelectionBackground;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIUCBKBSelectionBackground _updateBackgroundProvidingView](v3, "_updateBackgroundProvidingView");
  return v4;
}

- (void)setShowButtonShape:(BOOL)a3
{
  if (self->_showButtonShape != a3)
  {
    self->_showButtonShape = a3;
    -[_UIUCBKBSelectionBackground _updateBackgroundProvidingView](self, "_updateBackgroundProvidingView");
  }
}

- (void)_updateBackgroundProvidingView
{
  _BOOL4 showButtonShape;
  UIView *backgroundProvidingView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;

  showButtonShape = self->_showButtonShape;
  backgroundProvidingView = self->_backgroundProvidingView;
  if (showButtonShape)
  {
    if (!backgroundProvidingView)
    {
      v6 = [UIView alloc];
      v7 = -[UIView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v8 = self->_backgroundProvidingView;
      self->_backgroundProvidingView = v7;

      -[UIView _setContinuousCornerRadius:](self->_backgroundProvidingView, "_setContinuousCornerRadius:", 4.0);
      -[UIView layer](self, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAllowsGroupBlending:", 0);

      -[UIView addSubview:](self, "addSubview:", self->_backgroundProvidingView);
    }
  }
  else
  {
    -[UIView removeFromSuperview](backgroundProvidingView, "removeFromSuperview");
    v5 = self->_backgroundProvidingView;
    self->_backgroundProvidingView = 0;

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundProvidingView, "setFrame:");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_inheritedRenderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lightKeyboard");

  if (v5)
  {
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorGray_Percent55")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_backgroundProvidingView, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BC0]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_backgroundProvidingView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v9);

  }
  else
  {
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorKeyGrayKeyDarkBackground")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_backgroundProvidingView, "setBackgroundColor:", v8);

    -[UIView layer](self->_backgroundProvidingView, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", 0);
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)showButtonShape
{
  return self->_showButtonShape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundProvidingView, 0);
}

@end
