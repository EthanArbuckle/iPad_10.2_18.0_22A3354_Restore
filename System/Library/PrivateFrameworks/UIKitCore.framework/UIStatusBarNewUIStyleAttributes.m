@implementation UIStatusBarNewUIStyleAttributes

- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5 hasBusyBackground:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  UIStatusBarNewUIStyleAttributes *v13;
  UIColor *v14;
  void *v15;
  UIColor *foregroundColor;
  UIColor *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarNewUIStyleAttributes;
  v13 = -[UIStatusBarStyleAttributes initWithRequest:](&v19, sel_initWithRequest_, v10);
  if (v13)
  {
    if (v11
      || (objc_msgSend(v10, "foregroundColor"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      v14 = (UIColor *)v12;
    }
    else
    {
      objc_msgSend(v10, "foregroundColor");
      v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    foregroundColor = v13->_foregroundColor;
    v13->_foregroundColor = v14;
    v17 = v14;

    objc_storeStrong((id *)&v13->_backgroundColor, a4);
    v13->_hasBusyBackground = a6;
  }

  return v13;
}

- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3 backgroundColor:(id)a4 foregroundColor:(id)a5
{
  return -[UIStatusBarNewUIStyleAttributes initWithRequest:backgroundColor:foregroundColor:hasBusyBackground:](self, "initWithRequest:backgroundColor:foregroundColor:hasBusyBackground:", a3, a4, a5, a4 != 0);
}

- (UIStatusBarNewUIStyleAttributes)initWithRequest:(id)a3
{
  return -[UIStatusBarNewUIStyleAttributes initWithRequest:backgroundColor:foregroundColor:](self, "initWithRequest:backgroundColor:foregroundColor:", a3, 0, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarNewUIStyleAttributes;
  v4 = -[UIStatusBarStyleAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_backgroundColor);
  objc_storeStrong(v4 + 5, self->_foregroundColor);
  *((_BYTE *)v4 + 48) = self->_hasBusyBackground;
  return v4;
}

- (int64_t)legibilityStyle
{
  objc_super v3;

  if (self->_backgroundColor)
    return 0;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarNewUIStyleAttributes;
  return -[UIStatusBarStyleAttributes legibilityStyle](&v3, sel_legibilityStyle);
}

- (BOOL)isTranslucent
{
  UIColor *backgroundColor;
  double v3;

  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
    return 1;
  -[UIColor alphaComponent](backgroundColor, "alphaComponent");
  return v3 < 1.0;
}

- (BOOL)isTransparent
{
  return self->_backgroundColor == 0;
}

- (BOOL)shouldUseVisualAltitude
{
  return 1;
}

- (id)foregroundColor
{
  return self->_foregroundColor;
}

- (id)backgroundColorWithTintColor:(id)a3
{
  return self->_backgroundColor;
}

- (Class)foregroundStyleClass
{
  return (Class)objc_opt_class();
}

- (id)newForegroundStyleWithHeight:(double)a3
{
  return (id)objc_msgSend(objc_alloc(-[UIStatusBarNewUIStyleAttributes foregroundStyleClass](self, "foregroundStyleClass")), "initWithHeight:legibilityStyle:tintColor:hasBusyBackground:idiom:", -[UIStatusBarNewUIStyleAttributes legibilityStyle](self, "legibilityStyle"), self->_foregroundColor, self->_hasBusyBackground, -[UIStatusBarStyleAttributes idiom](self, "idiom"), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
