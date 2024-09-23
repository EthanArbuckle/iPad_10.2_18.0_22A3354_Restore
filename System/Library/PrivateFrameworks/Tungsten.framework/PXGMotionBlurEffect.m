@implementation PXGMotionBlurEffect

- (PXGMotionBlurEffect)initWithEntityManager:(id)a3
{
  PXGMotionBlurEffect *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGMotionBlurEffect;
  result = -[PXGEffect initWithEntityManager:](&v4, sel_initWithEntityManager_, a3);
  if (result)
    result->_intensity = 0.1;
  return result;
}

- (double)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

@end
