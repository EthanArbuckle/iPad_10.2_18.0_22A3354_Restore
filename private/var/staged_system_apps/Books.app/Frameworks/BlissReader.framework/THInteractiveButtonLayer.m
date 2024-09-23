@implementation THInteractiveButtonLayer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THInteractiveButtonLayer;
  -[THInteractiveButtonLayer dealloc](&v3, "dealloc");
}

- (void)setNormalBackgroundImage:(id)a3
{
  TSUImage *normalBackgroundImage;

  normalBackgroundImage = self->_normalBackgroundImage;
  if (normalBackgroundImage != a3)
  {

    self->_normalBackgroundImage = (TSUImage *)a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setPressedBackgroundImage:(id)a3
{
  TSUImage *pressedBackgroundImage;

  pressedBackgroundImage = self->_pressedBackgroundImage;
  if (pressedBackgroundImage != a3)
  {

    self->_pressedBackgroundImage = (TSUImage *)a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setTitle:(id)a3
{
  NSString *title;

  title = self->_title;
  if (title != a3)
  {

    self->_title = (NSString *)a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setTitleFont:(id)a3
{
  TSUFont *titleFont;

  titleFont = self->_titleFont;
  if (titleFont != a3)
  {

    self->_titleFont = (TSUFont *)a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setTitleColor:(id)a3
{
  TSUColor *titleColor;

  titleColor = self->_titleColor;
  if (titleColor != a3)
  {

    self->_titleColor = (TSUColor *)a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setTitleShadowColor:(id)a3
{
  TSUColor *titleShadowColor;

  titleShadowColor = self->_titleShadowColor;
  if (titleShadowColor != a3)
  {

    self->_titleShadowColor = (TSUColor *)a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setTitleShadowOffset:(CGSize)a3
{
  if (a3.width != self->_titleShadowOffset.width || a3.height != self->_titleShadowOffset.height)
  {
    self->_titleShadowOffset = a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setTitleShadowBlurRadius:(double)a3
{
  if (self->_titleShadowBlurRadius != a3)
  {
    self->_titleShadowBlurRadius = a3;
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_target = a3;
  self->_action = a4;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THInteractiveButtonLayer bounds](self, "bounds");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectEqualToRect(v13, v14))
    -[THInteractiveButtonLayer p_invalidateButtonImage](self, "p_invalidateButtonImage");
  v12.receiver = self;
  v12.super_class = (Class)THInteractiveButtonLayer;
  -[THInteractiveButtonLayer setBounds:](&v12, "setBounds:", x, y, width, height);
}

- (void)layoutSublayers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THInteractiveButtonLayer;
  -[THInteractiveButtonLayer layoutSublayers](&v3, "layoutSublayers");
  -[THInteractiveButtonLayer setContents:](self, "setContents:", -[TSUImage CGImage](-[THInteractiveButtonLayer p_normalImage](self, "p_normalImage"), "CGImage"));
}

- (id)swapIntoView:(id)a3
{
  UIButton *v4;

  v4 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
  -[THInteractiveButtonLayer frame](self, "frame");
  -[UIButton setFrame:](v4, "setFrame:");
  -[UIButton setImage:forState:](v4, "setImage:forState:", -[TSUImage UIImage](-[THInteractiveButtonLayer p_normalImage](self, "p_normalImage"), "UIImage"), 0);
  -[UIButton setImage:forState:](v4, "setImage:forState:", -[TSUImage UIImage](-[THInteractiveButtonLayer p_pressedImage](self, "p_pressedImage"), "UIImage"), 1);
  -[UIButton addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", self->_target, self->_action, 64);
  return v4;
}

- (TSUImage)p_normalImage
{
  TSUImage *result;

  result = self->_normalImage;
  if (!result)
  {
    result = (TSUImage *)-[THInteractiveButtonLayer p_buttonImageWithBackgroundImage:](self, "p_buttonImageWithBackgroundImage:", self->_normalBackgroundImage);
    self->_normalImage = result;
  }
  return result;
}

- (TSUImage)p_pressedImage
{
  return (TSUImage *)-[THInteractiveButtonLayer p_buttonImageWithBackgroundImage:](self, "p_buttonImageWithBackgroundImage:", self->_pressedBackgroundImage);
}

- (void)p_invalidateButtonImage
{

  self->_normalImage = 0;
  -[THInteractiveButtonLayer setNeedsLayout](self, "setNeedsLayout");
}

- (id)p_buttonImageWithBackgroundImage:(id)a3
{
  __n128 v5;
  double v6;
  __n128 v7;
  double v8;
  __n128 v9;
  __n128 v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[10];

  if (self->_title && self->_titleFont && self->_titleColor)
  {
    -[THInteractiveButtonLayer bounds](self, "bounds");
    v6 = v5.n128_f64[0];
    v8 = v7.n128_f64[0];
    v11 = TSDMultiplyRectScalar(v9, v10, v5, v7, 1.0 / self->_scale);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1B0CF4;
    v16[3] = &unk_42B088;
    v16[4] = self;
    v16[5] = a3;
    *(double *)&v16[6] = v11;
    v16[7] = v12;
    v16[8] = v13;
    v16[9] = v14;
    return +[TSUImage imageWithSize:drawnUsingBlock:](TSUImage, "imageWithSize:drawnUsingBlock:", v16, v6, v8);
  }
  return a3;
}

- (TSUImage)normalBackgroundImage
{
  return self->_normalBackgroundImage;
}

- (TSUImage)pressedBackgroundImage
{
  return self->_pressedBackgroundImage;
}

- (NSString)title
{
  return self->_title;
}

- (TSUFont)titleFont
{
  return self->_titleFont;
}

- (TSUColor)titleColor
{
  return self->_titleColor;
}

- (TSUColor)titleShadowColor
{
  return self->_titleShadowColor;
}

- (CGSize)titleShadowOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_titleShadowOffset.width;
  height = self->_titleShadowOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)titleShadowBlurRadius
{
  return self->_titleShadowBlurRadius;
}

- (double)scale
{
  return self->_scale;
}

@end
