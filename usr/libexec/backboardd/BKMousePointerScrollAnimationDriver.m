@implementation BKMousePointerScrollAnimationDriver

- (BKMousePointerScrollAnimationDriver)initWithRelativeTranslation:(CGPoint)a3 initialVelocity:(CGPoint)a4 decelerationRate:(double)a5
{
  CGFloat v5;
  CGFloat v6;
  BKMousePointerScrollAnimationDriver *result;
  float64x2_t v8;
  float64_t y;
  float64_t x;
  objc_super v12;

  x = a4.x;
  y = a4.y;
  v5 = a3.y;
  v6 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)BKMousePointerScrollAnimationDriver;
  result = -[BKMousePointerAnimationDriver initWithRelativeTranslation:](&v12, "initWithRelativeTranslation:");
  if (result)
  {
    v8.f64[0] = x;
    result->_initialVelocity.x = x;
    result->_initialVelocity.y = y;
    v8.f64[1] = y;
    result->_intermediate = (CGPoint)vaddq_f64(vdivq_f64(vmulq_n_f64(vdivq_f64(v8, (float64x2_t)vdupq_n_s64(0x408F400000000000uLL)), a5), (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - a5), 0)), (float64x2_t)0);
    result->_target.x = v6;
    result->_target.y = v5;
    result->_decelerationRate = a5;
  }
  return result;
}

- (void)applyForTime:(double)a3
{
  double v4;
  double v5;
  CGPoint v6;

  v4 = (a3 - self->_elapsedTime) * 1000.0;
  self->_elapsedTime = a3;
  if ((BSFloatIsZero(v4) & 1) == 0)
  {
    v5 = 1.0 - pow(self->_decelerationRate, v4);
    v6 = (CGPoint)vmlaq_n_f64((float64x2_t)self->_intermediate, vsubq_f64((float64x2_t)self->_target, (float64x2_t)self->_intermediate), v5);
    self->_currentTranslation = (CGPoint)vmlaq_n_f64((float64x2_t)self->_currentTranslation, vsubq_f64((float64x2_t)v6, (float64x2_t)self->_currentTranslation), v5);
    self->_intermediate = v6;
  }
}

- (BOOL)isComplete
{
  CGPoint *p_currentTranslation;
  CGPoint *p_target;
  int v4;

  p_currentTranslation = &self->_currentTranslation;
  p_target = &self->_target;
  v4 = BSFloatApproximatelyEqualToFloat(self->_currentTranslation.x, self->_target.x, 0.00100000005);
  if (v4)
    LOBYTE(v4) = BSFloatApproximatelyEqualToFloat(p_currentTranslation->y, p_target->y, 0.00100000005);
  return v4;
}

- (CGPoint)currentTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTranslation.x;
  y = self->_currentTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
