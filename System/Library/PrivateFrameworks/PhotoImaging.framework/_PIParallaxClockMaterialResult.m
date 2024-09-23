@implementation _PIParallaxClockMaterialResult

- (_PIParallaxClockMaterialResult)initWithClockAreaLuminance:(double)a3
{
  _PIParallaxClockMaterialResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PIParallaxClockMaterialResult;
  result = -[_PIParallaxClockMaterialResult init](&v5, sel_init);
  if (result)
    result->_clockAreaLuminance = a3;
  return result;
}

- (double)clockAreaLuminance
{
  return self->_clockAreaLuminance;
}

@end
