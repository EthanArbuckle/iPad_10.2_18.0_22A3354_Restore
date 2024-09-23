@implementation VideosExtrasGridSectionHeaderStyle

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_textStyle, a3);
}

- (NSDictionary)defaultFontAttributes
{
  return self->_defaultFontAttributes;
}

- (void)setDefaultFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultFontAttributes, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
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

- (double)textBaselineHeight
{
  return self->_textBaselineHeight;
}

- (void)setTextBaselineHeight:(double)a3
{
  self->_textBaselineHeight = a3;
}

- (double)textBaselineDescender
{
  return self->_textBaselineDescender;
}

- (void)setTextBaselineDescender:(double)a3
{
  self->_textBaselineDescender = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_defaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
}

@end
