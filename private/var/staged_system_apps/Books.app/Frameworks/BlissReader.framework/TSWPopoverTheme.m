@implementation TSWPopoverTheme

- (TSWPopoverTheme)init
{
  TSWPopoverTheme *v2;
  id v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPopoverTheme;
  v2 = -[TSWPopoverTheme init](&v6, "init");
  if (v2)
  {
    -[TSWPopoverTheme setPopoverBackgroundColor:](v2, "setPopoverBackgroundColor:", +[TSUColor lightGrayColor](TSUColor, "lightGrayColor"));
    -[TSWPopoverTheme setPopoverHasGradientBackground:](v2, "setPopoverHasGradientBackground:", 0);
    -[TSWPopoverTheme setPopoverStroke:](v2, "setPopoverStroke:", +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", +[TSUColor grayColor](TSUColor, "grayColor"), 1.0));
    -[TSWPopoverTheme setPopoverCornerRadius:](v2, "setPopoverCornerRadius:", 8.0);
    -[TSWPopoverTheme setPopoverContentInsets:](v2, "setPopoverContentInsets:", 8.0, 12.0, 8.0, 12.0);
    -[TSWPopoverTheme setPopoverFadeInsets:](v2, "setPopoverFadeInsets:", TSDEdgeInsetsZero[0].f64[0], TSDEdgeInsetsZero[0].f64[1], TSDEdgeInsetsZero[1].f64[0], TSDEdgeInsetsZero[1].f64[1]);
    -[TSWPopoverTheme setPopoverFadeSizes:](v2, "setPopoverFadeSizes:", 4.0, 0.0, 4.0, 0.0);
    -[TSWPopoverTheme setPopoverShadowColor:](v2, "setPopoverShadowColor:", +[TSUColor blackColor](TSUColor, "blackColor"));
    -[TSWPopoverTheme setPopoverShadowOffset:](v2, "setPopoverShadowOffset:", 0.0, 10.0);
    -[TSWPopoverTheme setPopoverShadowRadius:](v2, "setPopoverShadowRadius:", 25.0);
    v3 = -[TSWPopoverTheme setPopoverShadowOpacity:](v2, "setPopoverShadowOpacity:", 0.5);
    -[TSWPopoverTheme setPresentationMode:](v2, "setPresentationMode:", TSUPhoneUI(v3, v4));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPopoverTheme setPopoverBackgroundColor:](self, "setPopoverBackgroundColor:", 0);
  -[TSWPopoverTheme setPopoverStroke:](self, "setPopoverStroke:", 0);
  -[TSWPopoverTheme setPopoverShadowColor:](self, "setPopoverShadowColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPopoverTheme;
  -[TSWPopoverTheme dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSWPopoverTheme *v5;

  v5 = objc_alloc_init(TSWPopoverTheme);
  -[TSWPopoverTheme setPopoverHasGradientBackground:](v5, "setPopoverHasGradientBackground:", -[TSWPopoverTheme popoverHasGradientBackground](self, "popoverHasGradientBackground"));
  -[TSWPopoverTheme popoverCornerRadius](self, "popoverCornerRadius");
  -[TSWPopoverTheme setPopoverCornerRadius:](v5, "setPopoverCornerRadius:");
  -[TSWPopoverTheme popoverContentInsets](self, "popoverContentInsets");
  -[TSWPopoverTheme setPopoverContentInsets:](v5, "setPopoverContentInsets:");
  -[TSWPopoverTheme popoverFadeInsets](self, "popoverFadeInsets");
  -[TSWPopoverTheme setPopoverFadeInsets:](v5, "setPopoverFadeInsets:");
  -[TSWPopoverTheme popoverFadeSizes](self, "popoverFadeSizes");
  -[TSWPopoverTheme setPopoverFadeSizes:](v5, "setPopoverFadeSizes:");
  -[TSWPopoverTheme popoverShadowOffset](self, "popoverShadowOffset");
  -[TSWPopoverTheme setPopoverShadowOffset:](v5, "setPopoverShadowOffset:");
  -[TSWPopoverTheme popoverShadowRadius](self, "popoverShadowRadius");
  -[TSWPopoverTheme setPopoverShadowRadius:](v5, "setPopoverShadowRadius:");
  -[TSWPopoverTheme popoverShadowOpacity](self, "popoverShadowOpacity");
  -[TSWPopoverTheme setPopoverShadowOpacity:](v5, "setPopoverShadowOpacity:");
  -[TSWPopoverTheme setPresentationMode:](v5, "setPresentationMode:", -[TSWPopoverTheme presentationMode](self, "presentationMode"));
  -[TSWPopoverTheme setPopoverBackgroundColor:](v5, "setPopoverBackgroundColor:", -[TSUColor copy](-[TSWPopoverTheme popoverBackgroundColor](self, "popoverBackgroundColor"), "copy"));
  -[TSWPopoverTheme setPopoverStroke:](v5, "setPopoverStroke:", -[TSDStroke mutableCopyWithZone:](-[TSWPopoverTheme popoverStroke](self, "popoverStroke"), "mutableCopyWithZone:", a3));
  -[TSWPopoverTheme setPopoverShadowColor:](v5, "setPopoverShadowColor:", -[TSUColor copy](-[TSWPopoverTheme popoverShadowColor](self, "popoverShadowColor"), "copy"));
  return v5;
}

- (void)scaleWithFactor:(double)a3
{
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  id v7;
  double v8;
  double v9;

  self->_popoverCornerRadius = self->_popoverCornerRadius * a3;
  v4 = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeInsets.top, a3);
  *(float64x2_t *)&self->_popoverContentInsets.bottom = vmulq_n_f64(*(float64x2_t *)&self->_popoverContentInsets.bottom, a3);
  *(float64x2_t *)&self->_popoverFadeInsets.top = v4;
  v5 = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeSizes.top, a3);
  *(float64x2_t *)&self->_popoverFadeInsets.bottom = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeInsets.bottom, a3);
  *(float64x2_t *)&self->_popoverFadeSizes.top = v5;
  *(float64x2_t *)&self->_popoverFadeSizes.bottom = vmulq_n_f64(*(float64x2_t *)&self->_popoverFadeSizes.bottom, a3);
  v6 = vmulq_n_f64(*(float64x2_t *)&self->_popoverContentInsets.top, a3);
  self->_popoverShadowOffset = (CGSize)vmulq_n_f64((float64x2_t)self->_popoverShadowOffset, a3);
  *(float64x2_t *)&self->_popoverContentInsets.top = v6;
  self->_popoverShadowRadius = self->_popoverShadowRadius * a3;
  v7 = -[TSDStroke mutableCopy](-[TSWPopoverTheme popoverStroke](self, "popoverStroke"), "mutableCopy");
  objc_msgSend(v7, "width");
  objc_msgSend(v7, "setWidth:", v8 * a3);
  objc_msgSend(v7, "miterLimit");
  objc_msgSend(v7, "setMiterLimit:", v9 * a3);
  -[TSWPopoverTheme setPopoverStroke:](self, "setPopoverStroke:", v7);
}

- (TSUColor)popoverBackgroundColor
{
  return self->_popoverBackgroundColor;
}

- (void)setPopoverBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)popoverHasGradientBackground
{
  return self->_popoverHasGradientBackground;
}

- (void)setPopoverHasGradientBackground:(BOOL)a3
{
  self->_popoverHasGradientBackground = a3;
}

- (TSDStroke)popoverStroke
{
  return self->_popoverStroke;
}

- (void)setPopoverStroke:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (double)popoverCornerRadius
{
  return self->_popoverCornerRadius;
}

- (void)setPopoverCornerRadius:(double)a3
{
  self->_popoverCornerRadius = a3;
}

- (UIEdgeInsets)popoverContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_popoverContentInsets.top;
  left = self->_popoverContentInsets.left;
  bottom = self->_popoverContentInsets.bottom;
  right = self->_popoverContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPopoverContentInsets:(UIEdgeInsets)a3
{
  self->_popoverContentInsets = a3;
}

- (UIEdgeInsets)popoverFadeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_popoverFadeInsets.top;
  left = self->_popoverFadeInsets.left;
  bottom = self->_popoverFadeInsets.bottom;
  right = self->_popoverFadeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPopoverFadeInsets:(UIEdgeInsets)a3
{
  self->_popoverFadeInsets = a3;
}

- (UIEdgeInsets)popoverFadeSizes
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_popoverFadeSizes.top;
  left = self->_popoverFadeSizes.left;
  bottom = self->_popoverFadeSizes.bottom;
  right = self->_popoverFadeSizes.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPopoverFadeSizes:(UIEdgeInsets)a3
{
  self->_popoverFadeSizes = a3;
}

- (TSUColor)popoverShadowColor
{
  return self->_popoverShadowColor;
}

- (void)setPopoverShadowColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CGSize)popoverShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_popoverShadowOffset.width;
  height = self->_popoverShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPopoverShadowOffset:(CGSize)a3
{
  self->_popoverShadowOffset = a3;
}

- (double)popoverShadowRadius
{
  return self->_popoverShadowRadius;
}

- (void)setPopoverShadowRadius:(double)a3
{
  self->_popoverShadowRadius = a3;
}

- (double)popoverShadowOpacity
{
  return self->_popoverShadowOpacity;
}

- (void)setPopoverShadowOpacity:(double)a3
{
  self->_popoverShadowOpacity = a3;
}

- (int)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int)a3
{
  self->_presentationMode = a3;
}

@end
