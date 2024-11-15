@implementation RCPDiscreteGestureSpec

+ (id)rotationZ:(double)a3
{
  double *v4;

  v4 = (double *)objc_alloc_init((Class)a1);
  *((_BYTE *)v4 + 8) = 1;
  v4[4] = a3;
  return v4;
}

+ (id)scaleZ:(double)a3
{
  double *v4;

  v4 = (double *)objc_alloc_init((Class)a1);
  *((_BYTE *)v4 + 9) = 1;
  v4[4] = a3;
  return v4;
}

+ (id)translation:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat *v5;

  y = a3.y;
  x = a3.x;
  v5 = (CGFloat *)objc_alloc_init((Class)a1);
  *((_BYTE *)v5 + 10) = 1;
  v5[2] = x;
  v5[3] = y;
  return v5;
}

- (unint64_t)hash
{
  unint64_t isTranslation;

  isTranslation = self->_isTranslation;
  if (self->_isRotation)
    isTranslation |= 2uLL;
  if (self->_isScale)
    return isTranslation | 4;
  else
    return isTranslation;
}

- (BOOL)isEqual:(id)a3
{
  RCPDiscreteGestureSpec *v4;
  RCPDiscreteGestureSpec *v5;
  BOOL v6;
  objc_super v8;

  v4 = (RCPDiscreteGestureSpec *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RCPDiscreteGestureSpec;
    if (-[RCPDiscreteGestureSpec isEqual:](&v8, sel_isEqual_, v4))
    {
      v5 = v4;
      v6 = v5->_isRotation == self->_isRotation
        && v5->_isTranslation == self->_isTranslation
        && v5->_isScale == self->_isScale
        && v5->_x == self->_x
        && v5->_y == self->_y
        && v5->_z == self->_z;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isRotation
{
  return self->_isRotation;
}

- (void)setIsRotation:(BOOL)a3
{
  self->_isRotation = a3;
}

- (BOOL)isScale
{
  return self->_isScale;
}

- (void)setIsScale:(BOOL)a3
{
  self->_isScale = a3;
}

- (BOOL)isTranslation
{
  return self->_isTranslation;
}

- (void)setIsTranslation:(BOOL)a3
{
  self->_isTranslation = a3;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end
