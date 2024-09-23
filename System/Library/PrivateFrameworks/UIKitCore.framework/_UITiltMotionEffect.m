@implementation _UITiltMotionEffect

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  CGFloat v4;
  CGFloat v5;
  __double2 v6;
  double rotatingSphereRadius;
  void *v8;
  void *v9;
  CATransform3D v11;
  CATransform3D v12;
  CATransform3D v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3.horizontal * self->_maximumHorizontalTiltAngle;
  v5 = -(a3.vertical * self->_maximumVerticalTiltAngle);
  memset(&v13, 0, sizeof(v13));
  CATransform3DMakeTranslation(&v13, 0.0, 0.0, self->_rotatingSphereRadius);
  v11 = v13;
  CATransform3DRotate(&v12, &v11, v4, 0.0, 1.0, 0.0);
  *(_OWORD *)&v13.m31 = *(_OWORD *)&v12.m31;
  *(_OWORD *)&v13.m33 = *(_OWORD *)&v12.m33;
  *(_OWORD *)&v13.m41 = *(_OWORD *)&v12.m41;
  *(_OWORD *)&v13.m43 = *(_OWORD *)&v12.m43;
  *(_OWORD *)&v13.m11 = *(_OWORD *)&v12.m11;
  *(_OWORD *)&v13.m13 = *(_OWORD *)&v12.m13;
  *(_OWORD *)&v13.m21 = *(_OWORD *)&v12.m21;
  *(_OWORD *)&v13.m23 = *(_OWORD *)&v12.m23;
  v6 = __sincos_stret(v4);
  v11 = v13;
  CATransform3DRotate(&v12, &v11, v5, v6.__cosval, 0.0, v6.__sinval);
  *(_OWORD *)&v13.m31 = *(_OWORD *)&v12.m31;
  *(_OWORD *)&v13.m33 = *(_OWORD *)&v12.m33;
  *(_OWORD *)&v13.m41 = *(_OWORD *)&v12.m41;
  *(_OWORD *)&v13.m43 = *(_OWORD *)&v12.m43;
  *(_OWORD *)&v13.m11 = *(_OWORD *)&v12.m11;
  *(_OWORD *)&v13.m13 = *(_OWORD *)&v12.m13;
  rotatingSphereRadius = self->_rotatingSphereRadius;
  *(_OWORD *)&v13.m21 = *(_OWORD *)&v12.m21;
  *(_OWORD *)&v13.m23 = *(_OWORD *)&v12.m23;
  v11 = v12;
  CATransform3DTranslate(&v12, &v11, 0.0, 0.0, -rotatingSphereRadius);
  v13 = v12;
  v14 = CFSTR("layer.transform");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_UITiltMotionEffect)initWithCoder:(id)a3
{
  id v4;
  _UITiltMotionEffect *v5;
  float v6;
  float v7;
  float v8;
  _UITiltMotionEffect *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UITiltMotionEffect;
  v5 = -[UIMotionEffect initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_maximumHorizontalTiltAngle"));
    v5->_maximumHorizontalTiltAngle = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_maximumVerticalTiltAngle"));
    v5->_maximumVerticalTiltAngle = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("_rotatingSphereRadius"));
    v5->_rotatingSphereRadius = v8;
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double maximumHorizontalTiltAngle;
  double maximumVerticalTiltAngle;
  double rotatingSphereRadius;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UITiltMotionEffect;
  v4 = a3;
  -[UIMotionEffect encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  maximumHorizontalTiltAngle = self->_maximumHorizontalTiltAngle;
  *(float *)&maximumHorizontalTiltAngle = maximumHorizontalTiltAngle;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_maximumHorizontalTiltAngle"), maximumHorizontalTiltAngle, v8.receiver, v8.super_class);
  maximumVerticalTiltAngle = self->_maximumVerticalTiltAngle;
  *(float *)&maximumVerticalTiltAngle = maximumVerticalTiltAngle;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_maximumVerticalTiltAngle"), maximumVerticalTiltAngle);
  rotatingSphereRadius = self->_rotatingSphereRadius;
  *(float *)&rotatingSphereRadius = rotatingSphereRadius;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("_rotatingSphereRadius"), rotatingSphereRadius);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITiltMotionEffect;
  result = -[UIMotionEffect copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_maximumHorizontalTiltAngle;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_maximumVerticalTiltAngle;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_rotatingSphereRadius;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p maximumTiltAngle=(%f, %f) rotatingSphereRadius=%f>"), v5, self, *(_QWORD *)&self->_maximumHorizontalTiltAngle, *(_QWORD *)&self->_maximumVerticalTiltAngle, *(_QWORD *)&self->_rotatingSphereRadius);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setRotatingSphereRadius:(double)a3
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  if (a3 < 0.0)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "raise:format:", v6, CFSTR("-[%@ rotatingSphereRadius] must be non-negative (%f provided)"), v8, *(_QWORD *)&a3);

  }
  self->_rotatingSphereRadius = a3;
}

- (double)maximumHorizontalTiltAngle
{
  return self->_maximumHorizontalTiltAngle;
}

- (void)setMaximumHorizontalTiltAngle:(double)a3
{
  self->_maximumHorizontalTiltAngle = a3;
}

- (double)maximumVerticalTiltAngle
{
  return self->_maximumVerticalTiltAngle;
}

- (void)setMaximumVerticalTiltAngle:(double)a3
{
  self->_maximumVerticalTiltAngle = a3;
}

- (double)rotatingSphereRadius
{
  return self->_rotatingSphereRadius;
}

@end
