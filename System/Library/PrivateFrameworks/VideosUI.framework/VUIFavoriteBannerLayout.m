@implementation VUIFavoriteBannerLayout

- (unint64_t)bannerStyleForSizeClass:(int64_t)a3
{
  void *v4;
  _BOOL4 v5;

  if (self->_isPreModeBanner)
    return (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL;
  if ((unint64_t)(a3 - 1) < 2)
    return 0;
  if (a3 != 3)
    return 2;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") != 1;

  return 2 * v5;
}

- (BOOL)isPreModeBanner
{
  return self->_isPreModeBanner;
}

- (void)setIsPreModeBanner:(BOOL)a3
{
  self->_isPreModeBanner = a3;
}

- (_VUICornerRadii)borderRadii
{
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  _VUICornerRadii result;

  topLeft = self->_borderRadii.topLeft;
  topRight = self->_borderRadii.topRight;
  bottomLeft = self->_borderRadii.bottomLeft;
  bottomRight = self->_borderRadii.bottomRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topRight = topRight;
  result.topLeft = topLeft;
  return result;
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (UIEdgeInsets)margin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margin.top;
  left = self->_margin.left;
  bottom = self->_margin.bottom;
  right = self->_margin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
}

- (double)bannerMinHeight
{
  return self->_bannerMinHeight;
}

- (void)setBannerMinHeight:(double)a3
{
  self->_bannerMinHeight = a3;
}

- (double)maxTextWidth
{
  return self->_maxTextWidth;
}

- (void)setMaxTextWidth:(double)a3
{
  self->_maxTextWidth = a3;
}

- (double)subtitleBaseLine
{
  return self->_subtitleBaseLine;
}

- (void)setSubtitleBaseLine:(double)a3
{
  self->_subtitleBaseLine = a3;
}

- (VUITextLayout)titleLayout
{
  return self->_titleLayout;
}

- (VUITextLayout)subtitleLayout
{
  return self->_subtitleLayout;
}

- (TVImageLayout)imageLayout
{
  return self->_imageLayout;
}

- (unint64_t)bannerStyle
{
  return self->_bannerStyle;
}

- (void)setBannerStyle:(unint64_t)a3
{
  self->_bannerStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayout, 0);
  objc_storeStrong((id *)&self->_subtitleLayout, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
