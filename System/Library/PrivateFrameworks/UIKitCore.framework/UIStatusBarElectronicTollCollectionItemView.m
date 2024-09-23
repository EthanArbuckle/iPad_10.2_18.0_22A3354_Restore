@implementation UIStatusBarElectronicTollCollectionItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  _BOOL4 v5;

  v5 = *(_BYTE *)(objc_msgSend(a3, "rawData") + 3149) & 1;
  if (v5 != self->_available)
  {
    self->_available = v5;
    -[UIStatusBarElectronicTollCollectionItemView setVisible:](self, "setVisible:", -[UIStatusBarItemView isVisible](self, "isVisible"));
  }
  return 0;
}

- (id)contentsImage
{
  return -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", CFSTR("JapanETC"));
}

- (void)setVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;

  v3 = a3;
  -[UIStatusBarItemView setVisible:settingAlpha:](self, "setVisible:settingAlpha:", a3, 0);
  v5 = 0.0;
  if (v3)
    -[UIStatusBarElectronicTollCollectionItemView alphaForAvailable:](self, "alphaForAvailable:", self->_available, 0.0);
  -[UIView setAlpha:](self, "setAlpha:", v5);
}

- (double)alphaForAvailable:(BOOL)a3
{
  double result;

  result = 0.4;
  if (a3)
    return 1.0;
  return result;
}

@end
