@implementation _UILabelLegacyImpl

- (_UILabelLegacyImpl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UILabelLegacyImpl;
  return -[_UILabelLegacyImpl init](&v3, sel_init);
}

- (void)setMinimumScaleFactor:(double)a3
{
  float v3;

  v3 = a3;
  self->_minimumScaleFactor = fmax(fminf(v3, 1.0), 0.0);
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

@end
