@implementation VUITextBadgeLayout

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void)setTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_textLayout, a3);
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setLayerCornerRadius:(double)a3
{
  self->_layerCornerRadius = a3;
}

- (void)setIsUppercased:(BOOL)a3
{
  self->_isUppercased = a3;
}

- (void)setGradientBgColors:(id)a3
{
  objc_storeStrong((id *)&self->_gradientBgColors, a3);
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (void)setBadgeKind:(unint64_t)a3
{
  self->_badgeKind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_gradientBgColors, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

- (unint64_t)badgeKind
{
  return self->_badgeKind;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isUppercased
{
  return self->_isUppercased;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)layerCornerRadius
{
  return self->_layerCornerRadius;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)gradientBgColors
{
  return self->_gradientBgColors;
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

@end
