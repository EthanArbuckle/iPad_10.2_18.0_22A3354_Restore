@implementation _UIStatusBarImageView

- (_UIStatusBarImageView)initWithFrame:(CGRect)a3
{
  _UIStatusBarImageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarImageView;
  v3 = -[UIImageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3->_iconScale = 1.0;
  -[UIImageView _setAnimatesContents:](v3, "_setAnimatesContents:", 1);
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double iconScale;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBarImageView;
  -[UIView intrinsicContentSize](&v12, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[UIImageView image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFromStatusBarImageProvider");

  if (v8)
  {
    iconScale = self->_iconScale;
    v4 = v4 * iconScale;
    v6 = v6 * iconScale;
  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)prefersBaselineAlignment
{
  void *v2;
  char v3;

  -[UIImageView image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isSymbolImage");

  return v3;
}

- (void)setIconScale:(double)a3
{
  if (self->_iconScale != a3)
  {
    self->_iconScale = a3;
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "imageTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setTintColor:](self, "setTintColor:", v5);

  objc_msgSend(v4, "iconScale");
  -[_UIStatusBarImageView setIconScale:](self, "setIconScale:");
  objc_msgSend(v4, "fontForStyle:", self->_fontStyle);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "symbolScale");

  +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self, "setPreferredSymbolConfiguration:", v7);

}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  UIAccessibilityHUDItem *v7;

  -[_UIStatusBarImageView accessibilityHUDImage](self, "accessibilityHUDImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIImageView image](self, "image");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v6, 0.0, 0.0, 0.0, 0.0);
  -[UIAccessibilityHUDItem setScaleImage:](v7, "setScaleImage:", 1);
  -[UIAccessibilityHUDItem setDisabledAppearance:](v7, "setDisabledAppearance:", -[_UIStatusBarImageView useDisabledAppearanceForAccessibilityHUD](self, "useDisabledAppearanceForAccessibilityHUD"));

  return v7;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void)setFontStyle:(int64_t)a3
{
  self->_fontStyle = a3;
}

- (BOOL)useDisabledAppearanceForAccessibilityHUD
{
  return self->_useDisabledAppearanceForAccessibilityHUD;
}

- (void)setUseDisabledAppearanceForAccessibilityHUD:(BOOL)a3
{
  self->_useDisabledAppearanceForAccessibilityHUD = a3;
}

- (UIImage)accessibilityHUDImage
{
  return self->_accessibilityHUDImage;
}

- (void)setAccessibilityHUDImage:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityHUDImage, a3);
}

- (double)iconScale
{
  return self->_iconScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityHUDImage, 0);
}

@end
