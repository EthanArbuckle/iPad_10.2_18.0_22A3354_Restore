@implementation _UIParallaxMotionEffect

- (id)_keyPathsAndRelativeValuesForPose:(id)a3
{
  return -[UIMotionEffectGroup _keyPathsAndRelativeValuesForPose:](self->_group, "_keyPathsAndRelativeValuesForPose:", a3);
}

- (void)setSlideMagnitude:(UIOffset)a3
{
  if (a3.horizontal != self->_slideMagnitude.horizontal || a3.vertical != self->_slideMagnitude.vertical)
  {
    self->_slideMagnitude = a3;
    -[_UIParallaxMotionEffect _updateSlideEffectsWithCurrentSlideMagnitude](self, "_updateSlideEffectsWithCurrentSlideMagnitude");
  }
}

- (UIOffset)slideMagnitude
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_slideMagnitude.horizontal;
  vertical = self->_slideMagnitude.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (_UIParallaxMotionEffect)init
{
  _UIParallaxMotionEffect *v2;
  UIInterpolatingMotionEffect *v3;
  UIInterpolatingMotionEffect *horizontalSlideEffect;
  UIInterpolatingMotionEffect *v5;
  UIInterpolatingMotionEffect *verticalSlideEffect;
  _UIParallaxMotionEffect *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIParallaxMotionEffect;
  v2 = -[UIMotionEffect init](&v9, sel_init);
  if (v2)
  {
    v3 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("center.x"), 0);
    horizontalSlideEffect = v2->_horizontalSlideEffect;
    v2->_horizontalSlideEffect = v3;

    v5 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("center.y"), 1);
    verticalSlideEffect = v2->_verticalSlideEffect;
    v2->_verticalSlideEffect = v5;

    _UIParallaxMotionEffectCommonInit(v2);
    v7 = v2;
  }

  return v2;
}

- (void)_updateGroupMotionEffect
{
  UIInterpolatingMotionEffect *horizontalSlideEffect;
  void *v4;
  _UITiltMotionEffect **p_tiltEffect;
  uint64_t v6;
  UIInterpolatingMotionEffect *v7;
  void *v8;
  UIInterpolatingMotionEffect *v9;
  UIInterpolatingMotionEffect *v10;
  _UITiltMotionEffect *tiltEffect;
  UIInterpolatingMotionEffect *v12;
  UIInterpolatingMotionEffect *verticalSlideEffect;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_tiltEffect)
  {
    horizontalSlideEffect = self->_horizontalSlideEffect;
    tiltEffect = self->_tiltEffect;
    v12 = horizontalSlideEffect;
    verticalSlideEffect = self->_verticalSlideEffect;
    v4 = (void *)MEMORY[0x1E0C99D20];
    p_tiltEffect = &tiltEffect;
    v6 = 3;
  }
  else
  {
    v7 = self->_verticalSlideEffect;
    v9 = self->_horizontalSlideEffect;
    v10 = v7;
    v4 = (void *)MEMORY[0x1E0C99D20];
    p_tiltEffect = (_UITiltMotionEffect **)&v9;
    v6 = 2;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", p_tiltEffect, v6, v9, v10, tiltEffect, v12, verticalSlideEffect, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIMotionEffectGroup setMotionEffects:](self->_group, "setMotionEffects:", v8);

}

- (void)_updateSlideEffectsWithCurrentSlideMagnitude
{
  UIInterpolatingMotionEffect *horizontalSlideEffect;
  UIOffset *p_slideMagnitude;
  double v5;
  void *v6;
  void *v7;
  UIInterpolatingMotionEffect *v8;
  void *v9;
  void *v10;
  UIInterpolatingMotionEffect *verticalSlideEffect;
  void *v12;
  void *v13;
  UIInterpolatingMotionEffect *v14;
  void *v15;
  void *v16;
  void *v17;
  UIInterpolatingMotionEffect *v18;
  void *v19;
  UIInterpolatingMotionEffect *v20;
  void *v21;
  UIInterpolatingMotionEffect *v22;
  id v23;
  CATransform3D v24;
  CATransform3D v25;
  CATransform3D v26;
  CATransform3D v27;

  horizontalSlideEffect = self->_horizontalSlideEffect;
  p_slideMagnitude = &self->_slideMagnitude;
  v5 = -self->_slideMagnitude.horizontal;
  if (self->_tiltEffect)
  {
    v6 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeTranslation(&v27, v5, 0.0, 0.0);
    objc_msgSend(v6, "valueWithCATransform3D:", &v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](horizontalSlideEffect, "setMinimumRelativeValue:", v7);

    v8 = self->_horizontalSlideEffect;
    v9 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeTranslation(&v26, p_slideMagnitude->horizontal, 0.0, 0.0);
    objc_msgSend(v9, "valueWithCATransform3D:", &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v8, "setMaximumRelativeValue:", v10);

    verticalSlideEffect = self->_verticalSlideEffect;
    v12 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeTranslation(&v25, 0.0, -p_slideMagnitude->vertical, 0.0);
    objc_msgSend(v12, "valueWithCATransform3D:", &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](verticalSlideEffect, "setMinimumRelativeValue:", v13);

    v14 = self->_verticalSlideEffect;
    v15 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeTranslation(&v24, 0.0, p_slideMagnitude->vertical, 0.0);
    objc_msgSend(v15, "valueWithCATransform3D:", &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v14, "setMaximumRelativeValue:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](horizontalSlideEffect, "setMinimumRelativeValue:", v17);

    v18 = self->_horizontalSlideEffect;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_slideMagnitude->horizontal);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v18, "setMaximumRelativeValue:", v19);

    v20 = self->_verticalSlideEffect;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -p_slideMagnitude->vertical);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v20, "setMinimumRelativeValue:", v21);

    v22 = self->_verticalSlideEffect;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", p_slideMagnitude->vertical);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v22, "setMaximumRelativeValue:", v23);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiltEffect, 0);
  objc_storeStrong((id *)&self->_verticalSlideEffect, 0);
  objc_storeStrong((id *)&self->_horizontalSlideEffect, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIParallaxMotionEffect;
  v4 = -[UIMotionEffect copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[UIInterpolatingMotionEffect copy](self->_horizontalSlideEffect, "copy");
  v6 = (void *)v4[6];
  v4[6] = v5;

  v7 = -[UIInterpolatingMotionEffect copy](self->_verticalSlideEffect, "copy");
  v8 = (void *)v4[7];
  v4[7] = v7;

  v9 = -[_UITiltMotionEffect copy](self->_tiltEffect, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  _UIParallaxMotionEffectCommonInit(v4);
  objc_msgSend(v4, "setSlideMagnitude:", self->_slideMagnitude.horizontal, self->_slideMagnitude.vertical);
  return v4;
}

- (_UIParallaxMotionEffect)initWithCoder:(id)a3
{
  id v4;
  _UIParallaxMotionEffect *v5;
  uint64_t v6;
  UIInterpolatingMotionEffect *horizontalSlideEffect;
  uint64_t v8;
  UIInterpolatingMotionEffect *verticalSlideEffect;
  uint64_t v10;
  _UITiltMotionEffect *tiltEffect;
  _UIParallaxMotionEffect *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIParallaxMotionEffect;
  v5 = -[UIMotionEffect initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("horizontalSlideEffect"));
    v6 = objc_claimAutoreleasedReturnValue();
    horizontalSlideEffect = v5->_horizontalSlideEffect;
    v5->_horizontalSlideEffect = (UIInterpolatingMotionEffect *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("verticalSlideEffect"));
    v8 = objc_claimAutoreleasedReturnValue();
    verticalSlideEffect = v5->_verticalSlideEffect;
    v5->_verticalSlideEffect = (UIInterpolatingMotionEffect *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("tiltEffect"));
    v10 = objc_claimAutoreleasedReturnValue();
    tiltEffect = v5->_tiltEffect;
    v5->_tiltEffect = (_UITiltMotionEffect *)v10;

    objc_msgSend(v4, "decodeUIOffsetForKey:", CFSTR("slideMagnitude"));
    -[_UIParallaxMotionEffect setSlideMagnitude:](v5, "setSlideMagnitude:");
    _UIParallaxMotionEffectCommonInit(v5);
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _UITiltMotionEffect *tiltEffect;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIParallaxMotionEffect;
  -[UIMotionEffect encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_horizontalSlideEffect, CFSTR("horizontalSlideEffect"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verticalSlideEffect, CFSTR("verticalSlideEffect"));
  objc_msgSend(v4, "encodeUIOffset:forKey:", CFSTR("slideMagnitude"), self->_slideMagnitude.horizontal, self->_slideMagnitude.vertical);
  tiltEffect = self->_tiltEffect;
  if (tiltEffect)
    objc_msgSend(v4, "encodeObject:forKey:", tiltEffect, CFSTR("tiltEffect"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  UIOffset v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIParallaxMotionEffect slideMagnitude](self, "slideMagnitude");
  NSStringFromUIOffset(v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIParallaxMotionEffect horizontalSlideAccelerationBoostFactor](self, "horizontalSlideAccelerationBoostFactor");
  v8 = v7;
  -[_UIParallaxMotionEffect verticalSlideAccelerationBoostFactor](self, "verticalSlideAccelerationBoostFactor");
  v10 = v9;
  -[_UIParallaxMotionEffect maximumHorizontalTiltAngle](self, "maximumHorizontalTiltAngle");
  v12 = v11;
  -[_UIParallaxMotionEffect maximumVerticalTiltAngle](self, "maximumVerticalTiltAngle");
  v14 = v13;
  -[_UIParallaxMotionEffect rotatingSphereRadius](self, "rotatingSphereRadius");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p slideMagnitude=%@ accelerationBoostFactor=(%f, %f) maximumTiltAngle=(%f, %f) rotatingSphereRadius=%f>"), v5, self, v6, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setHorizontalSlideAccelerationBoostFactor:(double)a3
{
  -[UIInterpolatingMotionEffect _setHorizontalAccelerationBoostFactor:](self->_horizontalSlideEffect, "_setHorizontalAccelerationBoostFactor:", a3);
}

- (double)horizontalSlideAccelerationBoostFactor
{
  double result;

  -[UIInterpolatingMotionEffect _horizontalAccelerationBoostFactor](self->_horizontalSlideEffect, "_horizontalAccelerationBoostFactor");
  return result;
}

- (void)setVerticalSlideAccelerationBoostFactor:(double)a3
{
  -[UIInterpolatingMotionEffect _setVerticalAccelerationBoostFactor:](self->_verticalSlideEffect, "_setVerticalAccelerationBoostFactor:", a3);
}

- (double)verticalSlideAccelerationBoostFactor
{
  double result;

  -[UIInterpolatingMotionEffect _verticalAccelerationBoostFactor](self->_verticalSlideEffect, "_verticalAccelerationBoostFactor");
  return result;
}

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  return -[UIMotionEffectGroup keyPathsAndRelativeValuesForViewerOffset:](self->_group, "keyPathsAndRelativeValuesForViewerOffset:", a3.horizontal, a3.vertical);
}

- (void)_activateTiltEffectIfNecessary
{
  _UITiltMotionEffect *v3;
  _UITiltMotionEffect *tiltEffect;

  if (!self->_tiltEffect)
  {
    v3 = objc_alloc_init(_UITiltMotionEffect);
    tiltEffect = self->_tiltEffect;
    self->_tiltEffect = v3;

    -[_UIParallaxMotionEffect _updateGroupMotionEffect](self, "_updateGroupMotionEffect");
    -[UIInterpolatingMotionEffect _setKeyPath:](self->_horizontalSlideEffect, "_setKeyPath:", CFSTR("layer.transform"));
    -[UIInterpolatingMotionEffect _setKeyPath:](self->_verticalSlideEffect, "_setKeyPath:", CFSTR("layer.transform"));
    -[_UIParallaxMotionEffect _updateSlideEffectsWithCurrentSlideMagnitude](self, "_updateSlideEffectsWithCurrentSlideMagnitude");
  }
}

- (void)setMaximumHorizontalTiltAngle:(double)a3
{
  -[_UIParallaxMotionEffect _activateTiltEffectIfNecessary](self, "_activateTiltEffectIfNecessary");
  -[_UITiltMotionEffect setMaximumHorizontalTiltAngle:](self->_tiltEffect, "setMaximumHorizontalTiltAngle:", a3);
}

- (double)maximumHorizontalTiltAngle
{
  double result;

  -[_UITiltMotionEffect maximumHorizontalTiltAngle](self->_tiltEffect, "maximumHorizontalTiltAngle");
  return result;
}

- (void)setMaximumVerticalTiltAngle:(double)a3
{
  -[_UIParallaxMotionEffect _activateTiltEffectIfNecessary](self, "_activateTiltEffectIfNecessary");
  -[_UITiltMotionEffect setMaximumVerticalTiltAngle:](self->_tiltEffect, "setMaximumVerticalTiltAngle:", a3);
}

- (double)maximumVerticalTiltAngle
{
  double result;

  -[_UITiltMotionEffect maximumVerticalTiltAngle](self->_tiltEffect, "maximumVerticalTiltAngle");
  return result;
}

- (void)setRotatingSphereRadius:(double)a3
{
  -[_UIParallaxMotionEffect _activateTiltEffectIfNecessary](self, "_activateTiltEffectIfNecessary");
  -[_UITiltMotionEffect setRotatingSphereRadius:](self->_tiltEffect, "setRotatingSphereRadius:", a3);
}

- (double)rotatingSphereRadius
{
  double result;

  -[_UITiltMotionEffect rotatingSphereRadius](self->_tiltEffect, "rotatingSphereRadius");
  return result;
}

@end
