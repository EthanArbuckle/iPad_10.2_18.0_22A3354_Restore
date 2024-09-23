@implementation _VUIBlurEffect

- (id)effectSettings
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_VUIBlurEffect;
  -[UIBlurEffect effectSettings](&v8, sel_effectSettings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isProgressBar)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setColorTint:", v4);

    v5 = 10.0;
    v6 = 0.7;
  }
  else
  {
    v5 = 5.0;
    v6 = 0.94;
  }
  objc_msgSend(v3, "setSaturationDeltaFactor:", v6);
  objc_msgSend(v3, "setBlurRadius:", v5);
  return v3;
}

- (BOOL)isProgressBar
{
  return self->_isProgressBar;
}

- (void)setIsProgressBar:(BOOL)a3
{
  self->_isProgressBar = a3;
}

@end
