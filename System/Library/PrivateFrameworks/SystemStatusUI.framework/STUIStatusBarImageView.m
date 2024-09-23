@implementation STUIStatusBarImageView

- (void)setUseDisabledAppearanceForAccessibilityHUD:(BOOL)a3
{
  self->_useDisabledAppearanceForAccessibilityHUD = a3;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "imageTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarImageView setTintColor:](self, "setTintColor:", v5);

  objc_msgSend(v4, "iconScale");
  -[STUIStatusBarImageView setIconScale:](self, "setIconScale:");
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(v4, "fontForStyle:", self->_fontStyle);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "symbolScale");

  objc_msgSend(v6, "configurationWithFont:scale:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarImageView setPreferredSymbolConfiguration:](self, "setPreferredSymbolConfiguration:", v8);

}

- (void)setIconScale:(double)a3
{
  if (self->_iconScale != a3)
  {
    self->_iconScale = a3;
    -[STUIStatusBarImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
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
  v12.super_class = (Class)STUIStatusBarImageView;
  -[STUIStatusBarImageView intrinsicContentSize](&v12, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[STUIStatusBarImageView image](self, "image");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityHUDImage, 0);
}

- (void)setFontStyle:(int64_t)a3
{
  self->_fontStyle = a3;
}

- (STUIStatusBarImageView)initWithFrame:(CGRect)a3
{
  STUIStatusBarImageView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarImageView;
  v3 = -[STUIStatusBarImageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3->_iconScale = 1.0;
  -[STUIStatusBarImageView _setAnimatesContents:](v3, "_setAnimatesContents:", 1);
  return v3;
}

- (BOOL)prefersBaselineAlignment
{
  void *v2;
  char v3;

  -[STUIStatusBarImageView image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isSymbolImage");

  return v3;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  -[STUIStatusBarImageView accessibilityHUDImage](self, "accessibilityHUDImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[STUIStatusBarImageView image](self, "image");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = objc_alloc(MEMORY[0x1E0DC3418]);
  v8 = (void *)objc_msgSend(v7, "initWithTitle:image:imageInsets:", 0, v6, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v8, "setScaleImage:", 1);
  objc_msgSend(v8, "setDisabledAppearance:", -[STUIStatusBarImageView useDisabledAppearanceForAccessibilityHUD](self, "useDisabledAppearanceForAccessibilityHUD"));

  return (UIAccessibilityHUDItem *)v8;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (BOOL)useDisabledAppearanceForAccessibilityHUD
{
  return self->_useDisabledAppearanceForAccessibilityHUD;
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

@end
