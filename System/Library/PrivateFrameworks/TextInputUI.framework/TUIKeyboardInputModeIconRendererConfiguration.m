@implementation TUIKeyboardInputModeIconRendererConfiguration

- (TUIKeyboardInputModeIconRendererConfiguration)init
{
  TUIKeyboardInputModeIconRendererConfiguration *v2;
  TUIKeyboardInputModeIconRendererConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUIKeyboardInputModeIconRendererConfiguration;
  v2 = -[TUIKeyboardInputModeIconRendererConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TUIKeyboardInputModeIconRendererConfiguration setBaseFontSize:](v2, "setBaseFontSize:", 1.0);
    -[TUIKeyboardInputModeIconRendererConfiguration setDetailLabelAlpha:](v3, "setDetailLabelAlpha:", 0.8);
    -[TUIKeyboardInputModeIconRendererConfiguration setBackgroundCornerRadius:](v3, "setBackgroundCornerRadius:", 4.0);
  }
  return v3;
}

- (UIColor)backgroundColor
{
  UIColor *backgroundColor;
  UIColor *v4;
  UIColor *v5;

  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_backgroundColor;
    self->_backgroundColor = v4;

    backgroundColor = self->_backgroundColor;
  }
  return backgroundColor;
}

- (UIColor)tintColor
{
  UIColor *tintColor;
  UIColor *v4;
  UIColor *v5;

  tintColor = self->_tintColor;
  if (!tintColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }
  return tintColor;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)baseFontSize
{
  return self->_baseFontSize;
}

- (void)setBaseFontSize:(double)a3
{
  self->_baseFontSize = a3;
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (void)setFontFamily:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)backgroundCornerRadius
{
  return self->_backgroundCornerRadius;
}

- (void)setBackgroundCornerRadius:(double)a3
{
  self->_backgroundCornerRadius = a3;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)detailLabelAlpha
{
  return self->_detailLabelAlpha;
}

- (void)setDetailLabelAlpha:(double)a3
{
  self->_detailLabelAlpha = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_fontFamily, 0);
}

@end
