@implementation UIStatusBarSystemNavigationItemView

- (BOOL)_shouldLayoutImageOnRight
{
  BOOL v3;

  v3 = +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection") == 1;
  return v3 ^ -[UIStatusBarSystemNavigationItemView layoutImageOnTrailingEdge](self, "layoutImageOnTrailingEdge");
}

- (UIButton)button
{
  UIButton *button;
  UIButton *v4;
  UIButton *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;

  button = self->_button;
  if (!button)
  {
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
    +[UIButton buttonWithType:](_UIStatusBarSystemNavigationItemButton, "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_button;
    self->_button = v4;

    -[UIControl addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, sel_userDidActivateButton_, 0x2000);
    if (-[UIStatusBarSystemNavigationItemView _shouldLayoutImageOnRight](self, "_shouldLayoutImageOnRight"))
      v6 = CFSTR("BreadcrumbArrowRight");
    else
      v6 = CFSTR("BreadcrumbArrowLeft");
    -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_imageThatSuppressesAccessibilityHairlineThickening");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIButton setImage:forState:](self->_button, "setImage:forState:", v9, 0);
    -[UIButton imageView](self->_button, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClipsToBounds:", 0);

    -[UIButton setContentHorizontalAlignment:](self->_button, "setContentHorizontalAlignment:", 1);
    -[UIView setAutoresizingMask:](self->_button, "setAutoresizingMask:", 36);
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textFontForStyle:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_button, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v12);

    LODWORD(v11) = -[UIStatusBarSystemNavigationItemView _shouldLayoutImageOnRight](self, "_shouldLayoutImageOnRight");
    -[UIButton titleLabel](self->_button, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((_DWORD)v11)
      v16 = 2;
    else
      v16 = 0;
    objc_msgSend(v14, "setTextAlignment:", v16);

    v17 = -[UIStatusBarSystemNavigationItemView labelLineBreakMode](self, "labelLineBreakMode");
    -[UIButton titleLabel](self->_button, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLineBreakMode:", v17);

    -[UIView _setTouchInsets:](self->_button, "_setTouchInsets:", -12.5, -12.5, -12.5, -12.5);
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](self->_button, "setTintColor:", v20);

    -[UIView addSubview:](self, "addSubview:", self->_button);
    -[UIView _setTouchInsets:](self, "_setTouchInsets:", 0.0, -12.5, 0.0, -12.5);

    button = self->_button;
  }
  return button;
}

- (CGSize)_buttonSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[UIStatusBarSystemNavigationItemView button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(v2, "sizeThatFits:", v3 + -4.0, v4);
  v6 = v5;
  v8 = v7 + 4.0;

  v9 = v8;
  v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)updateContentsAndWidth
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
  void *v12;
  double v13;
  double v14;

  -[UIStatusBarSystemNavigationItemView button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  -[UIStatusBarSystemNavigationItemView _buttonSize](self, "_buttonSize");
  v5 = v4;
  v7 = v6;
  UIRoundToViewScale(self);
  v9 = v8;
  -[UIStatusBarSystemNavigationItemView maxWidth](self, "maxWidth");
  if (v10 > 0.0)
  {
    -[UIStatusBarSystemNavigationItemView maxWidth](self, "maxWidth");
    if (v11 < v5)
      v5 = v11;
  }
  objc_msgSend(v3, "setFrame:", 0.0, v9, v5, v7);
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "usesVerticalLayout"))
    v5 = v7;

  -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:", v5);
  v14 = v13;

  return v14;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIStatusBarSystemNavigationItemView button](self, "button");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[UIStatusBarSystemNavigationItemView button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)resetContentOverlap
{
  double result;

  -[UIStatusBarSystemNavigationItemView setMaxWidth:](self, "setMaxWidth:", 0.0);
  -[UIStatusBarSystemNavigationItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  return result;
}

- (double)addContentOverlap:(double)a3
{
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double result;

  -[UIView bounds](self, "bounds");
  -[UIStatusBarSystemNavigationItemView setMaxWidth:](self, "setMaxWidth:", v5 - a3);
  -[UIView bounds](self, "bounds");
  v7 = v6;
  do
  {
    -[UIStatusBarSystemNavigationItemView shortenedTitleWithCompressionLevel:](self, "shortenedTitleWithCompressionLevel:", -[UIStatusBarSystemNavigationItemView currentLabelCompressionLevel](self, "currentLabelCompressionLevel")+ 1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      break;
    v9 = (void *)v8;
    -[UIStatusBarSystemNavigationItemView setTitle:](self, "setTitle:", v8);
    -[UIStatusBarSystemNavigationItemView _buttonSize](self, "_buttonSize");
    v11 = v10;
    -[UIStatusBarSystemNavigationItemView setCurrentLabelCompressionLevel:](self, "setCurrentLabelCompressionLevel:", -[UIStatusBarSystemNavigationItemView currentLabelCompressionLevel](self, "currentLabelCompressionLevel")+ 1);

  }
  while (v7 - v11 < a3);
  -[UIStatusBarSystemNavigationItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  return result;
}

- (id)accessibilityHUDRepresentation
{
  uint64_t v3;
  UIAccessibilityHUDItem *v4;
  void *v5;
  UIAccessibilityHUDItem *v6;
  void *v8;

  v8 = 0;
  if (-[UIStatusBarSystemNavigationItemView _shouldLayoutImageOnRight](self, "_shouldLayoutImageOnRight"))
    v3 = 106;
  else
    v3 = 105;
  BarButtonItemResolveSystemImage(v3, &v8, 0, 0);
  v4 = [UIAccessibilityHUDItem alloc];
  -[UIStatusBarSystemNavigationItemView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v4, "initWithTitle:image:imageInsets:", v5, v8, 0.0, 0.0, 0.0, 0.0);

  return v6;
}

- (BOOL)layoutImageOnTrailingEdge
{
  return 0;
}

- (int64_t)labelLineBreakMode
{
  return 5;
}

- (id)shortenedTitleWithCompressionLevel:(int)a3
{
  return 0;
}

- (double)extraLeftPadding
{
  double v2;

  -[UIStatusBarItemView standardPadding](self, "standardPadding");
  return 4.0 - v2;
}

- (double)extraRightPadding
{
  double v2;

  -[UIStatusBarItemView standardPadding](self, "standardPadding");
  return 4.0 - v2;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (int)currentLabelCompressionLevel
{
  return self->_currentLabelCompressionLevel;
}

- (void)setCurrentLabelCompressionLevel:(int)a3
{
  self->_currentLabelCompressionLevel = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
