@implementation BCToolbar

- (void)setSeparatorsVisible:(BOOL)a3
{
  -[BCToolbar _setHidesShadow:](self, "_setHidesShadow:", !a3);
}

- (void)setBackgroundHidden:(BOOL)a3
{
  UIImage *v4;

  if (a3)
  {
    v4 = objc_opt_new(UIImage);
    -[BCToolbar setBackgroundImage:forToolbarPosition:barMetrics:](self, "setBackgroundImage:forToolbarPosition:barMetrics:", v4, 0, 0);

  }
  else
  {
    -[BCToolbar setBackgroundImage:forToolbarPosition:barMetrics:](self, "setBackgroundImage:forToolbarPosition:barMetrics:", 0, 0, 0);
  }
}

- (double)_imageButtonMargin
{
  double v3;
  double result;
  objc_super v5;

  -[BCToolbar imageButtonMarginOverride](self, "imageButtonMarginOverride");
  if (v3 <= 0.0)
  {
    v5.receiver = self;
    v5.super_class = (Class)BCToolbar;
    -[BCToolbar _imageButtonMargin](&v5, "_imageButtonMargin");
  }
  else
  {
    -[BCToolbar imageButtonMarginOverride](self, "imageButtonMarginOverride");
  }
  return result;
}

- (double)imageButtonMarginOverride
{
  return self->_imageButtonMarginOverride;
}

- (void)setImageButtonMarginOverride:(double)a3
{
  self->_imageButtonMarginOverride = a3;
}

@end
