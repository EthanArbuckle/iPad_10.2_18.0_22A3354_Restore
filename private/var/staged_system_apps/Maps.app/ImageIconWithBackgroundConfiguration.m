@implementation ImageIconWithBackgroundConfiguration

- (ImageIconWithBackgroundConfiguration)init
{
  ImageIconWithBackgroundConfiguration *v2;
  ImageIconWithBackgroundConfiguration *v3;
  uint64_t v4;
  UIColor *tintColor;
  uint64_t v6;
  UIColor *backgroundColor;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ImageIconWithBackgroundConfiguration;
  v2 = -[ImageIconWithBackgroundConfiguration init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_iconSize = CGSizeZero;
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    tintColor = v3->_tintColor;
    v3->_tintColor = (UIColor *)v4;

    v3->_cornerRadius = 0.0;
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    backgroundColor = v3->_backgroundColor;
    v3->_backgroundColor = (UIColor *)v6;

  }
  return v3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

+ (id)offlineIconConfigurationWithBackgroundColor:(id)a3
{
  id v3;
  ImageIconWithBackgroundConfiguration *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(ImageIconWithBackgroundConfiguration);
  -[ImageIconWithBackgroundConfiguration setBackgroundColor:](v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[ImageIconWithBackgroundConfiguration setTintColor:](v4, "setTintColor:", v5);

  -[ImageIconWithBackgroundConfiguration setCornerRadius:](v4, "setCornerRadius:", 6.0);
  -[ImageIconWithBackgroundConfiguration setIconSize:](v4, "setIconSize:", 30.0, 30.0);
  return v4;
}

@end
