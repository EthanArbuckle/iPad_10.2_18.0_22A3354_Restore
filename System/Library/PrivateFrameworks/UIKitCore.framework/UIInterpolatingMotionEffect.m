@implementation UIInterpolatingMotionEffect

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  id minimumRelativeValue;
  int64_t type;
  CGFloat v6;
  void *v7;
  void *v8;
  NSString *keyPath;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  minimumRelativeValue = self->_minimumRelativeValue;
  if (minimumRelativeValue && self->_maximumRelativeValue && self->_keyPath)
  {
    type = self->_type;
    if (type)
    {
      a3.horizontal = a3.vertical;
      if (type != 1)
        abort();
    }
    v6 = a3.horizontal * 0.5 + 0.5;
    *(float *)&v6 = v6;
    objc_msgSend(minimumRelativeValue, "CA_interpolateValue:byFraction:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    keyPath = self->_keyPath;
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &keyPath, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_keyPathsAndRelativeValuesForPose:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "viewerOffset");
  objc_msgSend(v4, "_acceleratedOutputForViewerOffset:accelerationBoostFactor:");
  v6 = v5;
  v8 = v7;

  return -[UIInterpolatingMotionEffect keyPathsAndRelativeValuesForViewerOffset:](self, "keyPathsAndRelativeValuesForViewerOffset:", v6, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maximumRelativeValue, 0);
  objc_storeStrong(&self->_minimumRelativeValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (UIInterpolatingMotionEffect)initWithKeyPath:(NSString *)keyPath type:(UIInterpolatingMotionEffectType)type
{
  NSString *v6;
  UIInterpolatingMotionEffect *v7;
  uint64_t v8;
  NSString *v9;
  UIInterpolatingMotionEffect *v10;
  objc_super v12;

  v6 = keyPath;
  v12.receiver = self;
  v12.super_class = (Class)UIInterpolatingMotionEffect;
  v7 = -[UIMotionEffect init](&v12, sel_init);
  if (v7)
  {
    v8 = -[NSString copy](v6, "copy");
    v9 = v7->_keyPath;
    v7->_keyPath = (NSString *)v8;

    v7->_type = type;
    v10 = v7;
  }

  return v7;
}

- (void)setMinimumRelativeValue:(id)minimumRelativeValue
{
  objc_storeStrong(&self->_minimumRelativeValue, minimumRelativeValue);
}

- (void)setMaximumRelativeValue:(id)maximumRelativeValue
{
  objc_storeStrong(&self->_maximumRelativeValue, maximumRelativeValue);
}

- (UIInterpolatingMotionEffect)init
{
  return -[UIInterpolatingMotionEffect initWithKeyPath:type:](self, "initWithKeyPath:type:", &stru_1E16EDF20, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIInterpolatingMotionEffect *v4;

  v4 = objc_alloc_init(UIInterpolatingMotionEffect);
  objc_storeStrong((id *)&v4->_keyPath, self->_keyPath);
  objc_storeStrong(&v4->_minimumRelativeValue, self->_minimumRelativeValue);
  objc_storeStrong(&v4->_maximumRelativeValue, self->_maximumRelativeValue);
  v4->_type = self->_type;
  v4->_horizontalAccelerationBoostFactor = self->_horizontalAccelerationBoostFactor;
  v4->_verticalAccelerationBoostFactor = self->_verticalAccelerationBoostFactor;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *keyPath;
  id v5;

  keyPath = self->_keyPath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", keyPath, CFSTR("_keyPath"));
  objc_msgSend(v5, "CA_encodeObject:forKey:conditional:", self->_minimumRelativeValue, CFSTR("_minimumRelativeValue"), 0);
  objc_msgSend(v5, "CA_encodeObject:forKey:conditional:", self->_maximumRelativeValue, CFSTR("_maximumRelativeValue"), 0);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_horizontalAccelerationBoostFactor"), self->_horizontalAccelerationBoostFactor);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_verticalAccelerationBoostFactor"), self->_verticalAccelerationBoostFactor);

}

- (UIInterpolatingMotionEffect)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIInterpolatingMotionEffect *v5;
  uint64_t v6;
  NSString *keyPath;
  uint64_t v8;
  id minimumRelativeValue;
  uint64_t v10;
  id maximumRelativeValue;
  double v12;
  double v13;
  UIInterpolatingMotionEffect *v14;
  objc_super v16;

  v4 = coder;
  v16.receiver = self;
  v16.super_class = (Class)UIInterpolatingMotionEffect;
  v5 = -[UIMotionEffect initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("_keyPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;

    -[NSCoder CA_decodeObjectForKey:](v4, "CA_decodeObjectForKey:", CFSTR("_minimumRelativeValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    minimumRelativeValue = v5->_minimumRelativeValue;
    v5->_minimumRelativeValue = (id)v8;

    -[NSCoder CA_decodeObjectForKey:](v4, "CA_decodeObjectForKey:", CFSTR("_maximumRelativeValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    maximumRelativeValue = v5->_maximumRelativeValue;
    v5->_maximumRelativeValue = (id)v10;

    v5->_type = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("_type"));
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("_horizontalAccelerationBoostFactor"));
    v5->_horizontalAccelerationBoostFactor = v12;
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("_verticalAccelerationBoostFactor"));
    v5->_verticalAccelerationBoostFactor = v13;
    v14 = v5;
  }

  return v5;
}

- (id)description
{
  unint64_t type;
  const __CFString *v4;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIMotionEffect.m"), 289, CFSTR("Unknown motion type"));

    v4 = CFSTR("unknown");
  }
  else
  {
    v4 = off_1E16D9508[type];
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p type=%@ key=%@ minimumRelativeValue=%@ maximumRelativeValue=%@)>"), v9, self, v4, self->_keyPath, self->_minimumRelativeValue, self->_maximumRelativeValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)_horizontalAccelerationBoostFactor
{
  return self->_horizontalAccelerationBoostFactor;
}

- (void)_setHorizontalAccelerationBoostFactor:(double)a3
{
  self->_horizontalAccelerationBoostFactor = a3;
}

- (double)_verticalAccelerationBoostFactor
{
  return self->_verticalAccelerationBoostFactor;
}

- (void)_setVerticalAccelerationBoostFactor:(double)a3
{
  self->_verticalAccelerationBoostFactor = a3;
}

- (void)_setKeyPath:(id)a3
{
  NSString *v4;
  NSString *keyPath;

  if (self->_keyPath != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    keyPath = self->_keyPath;
    self->_keyPath = v4;

  }
}

- (void)_setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (UIInterpolatingMotionEffectType)type
{
  return self->_type;
}

- (id)minimumRelativeValue
{
  return self->_minimumRelativeValue;
}

- (id)maximumRelativeValue
{
  return self->_maximumRelativeValue;
}

@end
