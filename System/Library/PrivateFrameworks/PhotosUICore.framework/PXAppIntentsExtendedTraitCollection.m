@implementation PXAppIntentsExtendedTraitCollection

- (PXAppIntentsExtendedTraitCollection)initWithUserInterfaceStyle:(int64_t)a3 displayScale:(double)a4
{
  PXAppIntentsExtendedTraitCollection *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXAppIntentsExtendedTraitCollection;
  result = -[PXExtendedTraitCollection initWithViewController:](&v7, sel_initWithViewController_, 0);
  if (result)
  {
    result->_userInterfaceStyle = a3;
    result->_displayScale = a4;
  }
  return result;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[PXAppIntentsExtendedTraitCollection signalChange:](self, "signalChange:", 1024);
  }
}

- (int64_t)layoutSizeClass
{
  return 1;
}

- (int64_t)layoutSizeSubclass
{
  return 2;
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    -[PXAppIntentsExtendedTraitCollection signalChange:](self, "signalChange:", 32);
  }
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (double)displayScale
{
  return self->_displayScale;
}

@end
