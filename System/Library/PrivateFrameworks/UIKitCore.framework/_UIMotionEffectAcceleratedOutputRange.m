@implementation _UIMotionEffectAcceleratedOutputRange

- (UIOffset)acceleratedOutputForViewerOffset:(UIOffset)a3 accelerationBoostFactor:(CGPoint)a4
{
  float64x2_t v5;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  int8x16_t v18;
  double v19;
  CGFloat y;
  CGFloat x;
  CGFloat horizontal;
  CGFloat vertical;
  UIOffset result;

  y = a4.y;
  x = a4.x;
  vertical = a3.vertical;
  horizontal = a3.horizontal;
  _AssertPointComponentsArePositive(a4.x, a4.y);
  v5.f64[0] = x;
  v5.f64[1] = y;
  __asm { FMOV            V0.2D, #1.0 }
  v11 = vaddq_f64(v5, _Q0);
  v12 = vnegq_f64(v11);
  v13 = vaddq_f64(vmulq_f64(v5, (float64x2_t)self->_referenceAcceleration), _Q0);
  v14 = vaddq_f64(vmulq_f64(v5, (float64x2_t)self->_acceleration), _Q0);
  v15.f64[0] = horizontal;
  v15.f64[1] = vertical;
  v16 = vaddq_f64(vmulq_f64(v15, v14), vmulq_f64((float64x2_t)self->_referenceOffset, vsubq_f64(v13, v14)));
  v17 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v16, v11), (int8x16_t)v11, (int8x16_t)v16);
  v18 = vbslq_s8((int8x16_t)vcgtq_f64(v17, v12), (int8x16_t)v17, (int8x16_t)v12);
  v19 = *(double *)&v18.i64[1];
  result.horizontal = *(double *)v18.i64;
  result.vertical = v19;
  return result;
}

- (void)setAcceleration:(CGPoint)a3 fixingOutputForViewerOffset:(UIOffset)a4
{
  double vertical;
  double horizontal;
  double y;
  double x;
  double v9;
  double v10;

  vertical = a4.vertical;
  horizontal = a4.horizontal;
  y = a3.y;
  x = a3.x;
  _AssertPointComponentsArePositive(a3.x, a3.y);
  v9 = self->_acceleration.x;
  if (vabdd_f64(x, v9) >= 2.22044605e-16)
  {
    self->_referenceOffset.horizontal = horizontal - self->_referenceOffset.horizontal;
    self->_referenceAcceleration.x = v9;
  }
  v10 = self->_acceleration.y;
  if (vabdd_f64(y, v10) >= 2.22044605e-16)
  {
    self->_referenceOffset.vertical = vertical - self->_referenceOffset.vertical;
    self->_referenceAcceleration.y = v10;
  }
  self->_acceleration.x = x;
  self->_acceleration.y = y;
}

- (_UIMotionEffectAcceleratedOutputRange)init
{
  _UIMotionEffectAcceleratedOutputRange *v2;
  _UIMotionEffectAcceleratedOutputRange *v3;
  _UIMotionEffectAcceleratedOutputRange *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIMotionEffectAcceleratedOutputRange;
  v2 = -[_UIMotionEffectAcceleratedOutputRange init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIMotionEffectAcceleratedOutputRange reset](v2, "reset");
    v4 = v3;
  }

  return v3;
}

- (void)reset
{
  CGPoint v2;

  v2 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_referenceAcceleration = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_acceleration = v2;
  self->_referenceOffset.horizontal = 0.0;
  self->_referenceOffset.vertical = 0.0;
}

- (_UIMotionEffectAcceleratedOutputRange)initWithCoder:(id)a3
{
  id v4;
  _UIMotionEffectAcceleratedOutputRange *v5;
  _UIMotionEffectAcceleratedOutputRange *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  _UIMotionEffectAcceleratedOutputRange *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIMotionEffectAcceleratedOutputRange;
  v5 = -[_UIMotionEffectAcceleratedOutputRange init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIMotionEffectAcceleratedOutputRange reset](v5, "reset");
    objc_msgSend(v4, "decodeUIOffsetForKey:", CFSTR("UIReferenceOffset"));
    v6->_referenceOffset.horizontal = v7;
    v6->_referenceOffset.vertical = v8;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("UIReferenceAcceleration"));
    v6->_referenceAcceleration.x = v9;
    v6->_referenceAcceleration.y = v10;
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("UIAcceleration"));
    v6->_acceleration.x = v11;
    v6->_acceleration.y = v12;
    v13 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double horizontal;
  double vertical;
  id v6;

  horizontal = self->_referenceOffset.horizontal;
  vertical = self->_referenceOffset.vertical;
  v6 = a3;
  objc_msgSend(v6, "encodeUIOffset:forKey:", CFSTR("UIReferenceOffset"), horizontal, vertical);
  objc_msgSend(v6, "encodeCGPoint:forKey:", CFSTR("UIReferenceAcceleration"), self->_referenceAcceleration.x, self->_referenceAcceleration.y);
  objc_msgSend(v6, "encodeCGPoint:forKey:", CFSTR("UIAcceleration"), self->_acceleration.x, self->_acceleration.y);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromUIOffset(self->_referenceOffset);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_referenceAcceleration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_acceleration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p referenceOffset=%@ lastAcceleration=%@ acceleration=%@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    v6 = self->_referenceAcceleration.x == v5[3] && self->_referenceAcceleration.y == v5[4];
    v8 = v6
      && (self->_referenceOffset.horizontal == v5[1] ? (v7 = self->_referenceOffset.vertical == v5[2]) : (v7 = 0), v7)
      && self->_acceleration.y == v5[6]
      && self->_acceleration.x == v5[5];

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)(floor(self->_acceleration.y * 100.0)
                          + (double)(31
                                   * (unint64_t)(floor(self->_acceleration.x * 100.0)
                                                      + (double)(31
                                                               * (unint64_t)(floor(self->_referenceOffset.vertical* 100.0)+ (double)(31* (unint64_t)(floor(self->_referenceOffset.horizontal * 100.0) + (double)(31 * (unint64_t)(floor(self->_referenceAcceleration.y * 100.0) + (double)(31 * (unint64_t)(floor(self->_referenceAcceleration.x * 100.0) + 31.0)))))))))));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(_UIMotionEffectAcceleratedOutputRange);
  *(UIOffset *)((char *)result + 8) = self->_referenceOffset;
  *(CGPoint *)((char *)result + 24) = self->_referenceAcceleration;
  *(CGPoint *)((char *)result + 40) = self->_acceleration;
  return result;
}

- (CGPoint)acceleration
{
  double x;
  double y;
  CGPoint result;

  x = self->_acceleration.x;
  y = self->_acceleration.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
