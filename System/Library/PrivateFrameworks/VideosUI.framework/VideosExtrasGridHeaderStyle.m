@implementation VideosExtrasGridHeaderStyle

- (BOOL)showsImage
{
  return self->_showsImage;
}

- (void)setShowsImage:(BOOL)a3
{
  self->_showsImage = a3;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextStyle, a3);
}

- (double)titleLineHeight
{
  return self->_titleLineHeight;
}

- (void)setTitleLineHeight:(double)a3
{
  self->_titleLineHeight = a3;
}

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleTextStyle, a3);
}

- (double)subtitleLineHeight
{
  return self->_subtitleLineHeight;
}

- (void)setSubtitleLineHeight:(double)a3
{
  self->_subtitleLineHeight = a3;
}

- (double)bottomLabelDescender
{
  return self->_bottomLabelDescender;
}

- (void)setBottomLabelDescender:(double)a3
{
  self->_bottomLabelDescender = a3;
}

- (NSDictionary)titleDefaultFontAttributes
{
  return self->_titleDefaultFontAttributes;
}

- (void)setTitleDefaultFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_titleDefaultFontAttributes, a3);
}

- (NSDictionary)subtitleDefaultFontAttributes
{
  return self->_subtitleDefaultFontAttributes;
}

- (void)setSubtitleDefaultFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleDefaultFontAttributes, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void)setSubtitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_subtitleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
}

@end
