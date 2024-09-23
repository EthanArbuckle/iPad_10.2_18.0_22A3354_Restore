@implementation _UIFloatingMotionConfiguration

+ (id)configurationWithRotationOnAxis:(unint64_t)a3
{
  double v3;
  double v4;
  id v5;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v3 = 0.04;
  else
    v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v4 = 0.04;
  else
    v4 = 0.0;
  v5 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v5, "_initWithTranslation:rotation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v3, v4);
}

+ (id)configurationWithTranslationOnAxis:(unint64_t)a3
{
  double v3;
  double v4;
  id v5;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v3 = 4.0;
  else
    v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v4 = 4.0;
  else
    v4 = 0.0;
  v5 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v5, "_initWithTranslation:rotation:", v3, v4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

+ (id)configurationWithLargeTranslationOnAxis:(unint64_t)a3
{
  double v3;
  double v4;
  id v5;

  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    v3 = 8.0;
  else
    v3 = 0.0;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v4 = 8.0;
  else
    v4 = 0.0;
  v5 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v5, "_initWithTranslation:rotation:", v3, v4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

+ (id)configurationWithRotation:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v5, "_initWithTranslation:rotation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), x, y);
}

+ (id)configurationWithTranslation:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v5, "_initWithTranslation:rotation:", x, y, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)_initWithTranslation:(CGPoint)a3 rotation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  id result;
  objc_super v9;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIFloatingMotionConfiguration;
  result = -[_UIFloatingMotionConfiguration init](&v9, sel_init);
  if (result)
  {
    *((CGFloat *)result + 3) = v7;
    *((CGFloat *)result + 4) = v6;
    *((CGFloat *)result + 1) = x;
    *((CGFloat *)result + 2) = y;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _UIFloatingMotionConfiguration *v4;
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;
  double v9;
  double v10;

  v4 = (_UIFloatingMotionConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((-[_UIFloatingMotionConfiguration translation](v4, "translation"), self->_translation.x == v6)
        ? (v7 = self->_translation.y == v5)
        : (v7 = 0),
          v7))
    {
      -[_UIFloatingMotionConfiguration rotation](v4, "rotation");
      v8 = self->_rotation.y == v10 && self->_rotation.x == v9;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int8x16_t v2;

  v2 = veorq_s8((int8x16_t)vcvtq_u64_f64(vmulq_f64((float64x2_t)self->_rotation, (float64x2_t)xmmword_1866791F0)), (int8x16_t)vcvtq_u64_f64(vmulq_f64((float64x2_t)self->_translation, (float64x2_t)xmmword_186679200)));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (CGPoint)rotation
{
  double x;
  double y;
  CGPoint result;

  x = self->_rotation.x;
  y = self->_rotation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)translation
{
  double x;
  double y;
  CGPoint result;

  x = self->_translation.x;
  y = self->_translation.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
