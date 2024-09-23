@implementation _UIViewAnimationAttributes

- (double)_delay
{
  return self->_delay;
}

- (int64_t)_curve
{
  return (self->_options >> 16) & 7;
}

- (double)_duration
{
  return self->_duration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_UIViewAnimationAttributes)initWithCoder:(id)a3
{
  id v4;
  _UIViewAnimationAttributes *v5;
  float v6;
  float v7;
  int v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  _UIViewAnimationAttributes *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UIViewAnimationAttributes;
  v5 = -[_UIViewAnimationAttributes init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("duration"));
    v5->_duration = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("delay"));
    v5->_delay = v7;
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSpringAttributes"));
    v5->_hasSpringAttributes = v8;
    if (v8)
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("springDamping"));
      v5->_springDamping = v9;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("springVelocity"));
      v5->_springVelocity = v10;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("springMass"));
      v5->_springMass = v11;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("springStiffness"));
      v5->_springStiffness = v12;
    }
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    objc_msgSend(v4, "_ui_decodeCAFrameRateRangeForKey:", CFSTR("preferredFrameRateRange"));
    v5->_preferredFrameRateRange.minimum = v13;
    v5->_preferredFrameRateRange.maximum = v14;
    v5->_preferredFrameRateRange.preferred = v15;
    v5->_updateReason = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("updateReason"));
    v16 = v5;
  }

  return v5;
}

- (_UIViewAnimationAttributes)initWithBSXPCCoder:(id)a3
{
  id v4;
  _UIViewAnimationAttributes *v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewAnimationAttributes;
  v5 = -[_UIViewAnimationAttributes init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("delay"));
    v5->_delay = v7;
    v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSpringAttributes"));
    v5->_hasSpringAttributes = v8;
    if (v8)
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("springDamping"));
      v5->_springDamping = v9;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("springVelocity"));
      v5->_springVelocity = v10;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("springMass"));
      v5->_springMass = v11;
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("springStiffness"));
      v5->_springStiffness = v12;
    }
    v5->_options = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("options"));
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("preferredFrameRateRange"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preferredFrameRateRange.minimum = _CAFrameRateRangeFromString(v13);
    v5->_preferredFrameRateRange.maximum = v14;
    v5->_preferredFrameRateRange.preferred = v15;

    v5->_updateReason = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("updateReason"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double duration;
  double delay;
  unint64_t options;
  double v7;
  double v8;
  double v9;
  double springDamping;
  void *v11;
  double springVelocity;
  double springMass;
  double springStiffness;
  id v15;

  v15 = a3;
  duration = self->_duration;
  if (duration != 0.0)
  {
    *(float *)&duration = duration;
    objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("duration"), duration);
  }
  delay = self->_delay;
  if (delay != 0.0)
  {
    *(float *)&delay = delay;
    objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("delay"), delay);
  }
  options = self->_options;
  if (options)
    objc_msgSend(v15, "encodeInteger:forKey:", options, CFSTR("options"));
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E0CD23C0]))
  {
    *(float *)&v7 = self->_preferredFrameRateRange.minimum;
    *(float *)&v8 = self->_preferredFrameRateRange.maximum;
    *(float *)&v9 = self->_preferredFrameRateRange.preferred;
    objc_msgSend(v15, "_ui_encodeCAFrameRateRange:forKey:", CFSTR("preferredFrameRateRange"), v7, v8, v9);
    objc_msgSend(v15, "encodeInt32:forKey:", self->_updateReason, CFSTR("updateReason"));
  }
  if (self->_hasSpringAttributes)
    objc_msgSend(v15, "encodeBool:forKey:", 1, CFSTR("hasSpringAttributes"));
  springDamping = self->_springDamping;
  v11 = v15;
  if (springDamping != 0.0)
  {
    *(float *)&springDamping = springDamping;
    objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("springDamping"), springDamping);
    v11 = v15;
  }
  springVelocity = self->_springVelocity;
  if (springVelocity != 0.0)
  {
    *(float *)&springVelocity = springVelocity;
    objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("springVelocity"), springVelocity);
    v11 = v15;
  }
  springMass = self->_springMass;
  if (springMass != 0.0)
  {
    *(float *)&springMass = springMass;
    objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("springMass"), springMass);
    v11 = v15;
  }
  springStiffness = self->_springStiffness;
  if (springStiffness != 0.0)
  {
    *(float *)&springStiffness = springStiffness;
    objc_msgSend(v15, "encodeFloat:forKey:", CFSTR("springStiffness"), springStiffness);
    v11 = v15;
  }

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  unint64_t options;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (self->_duration != 0.0)
    objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("duration"));
  if (self->_delay != 0.0)
    objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("delay"));
  options = self->_options;
  if (options)
    objc_msgSend(v7, "encodeInt64:forKey:", options, CFSTR("options"));
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, *MEMORY[0x1E0CD23C0]))
  {
    _NSStringFromCAFrameRateRange(self->_preferredFrameRateRange.minimum, self->_preferredFrameRateRange.maximum, self->_preferredFrameRateRange.preferred);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("preferredFrameRateRange"));

    objc_msgSend(v7, "encodeInt64:forKey:", self->_updateReason, CFSTR("updateReason"));
  }
  if (self->_hasSpringAttributes)
    objc_msgSend(v7, "encodeBool:forKey:", 1, CFSTR("hasSpringAttributes"));
  v6 = v7;
  if (self->_springDamping != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("springDamping"));
    v6 = v7;
  }
  if (self->_springVelocity != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("springVelocity"));
    v6 = v7;
  }
  if (self->_springMass != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("springMass"));
    v6 = v7;
  }
  if (self->_springStiffness != 0.0)
  {
    objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("springStiffness"));
    v6 = v7;
  }

}

- (double)_frameInterval
{
  if ((self->_options & 0xF000000) != 0)
    return 1.0 / (240.0 / (double)((BYTE3(self->_options) & 0xF) + 1));
  else
    return 0.0;
}

- (CAFrameRateRange)_preferredFrameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_preferredFrameRateRange.minimum;
  maximum = self->_preferredFrameRateRange.maximum;
  preferred = self->_preferredFrameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (unsigned)_updateReason
{
  return self->_updateReason;
}

- (BOOL)_hasSpringAttributes
{
  return self->_hasSpringAttributes;
}

- (double)_springDamping
{
  return self->_springDamping;
}

- (double)_springVelocity
{
  return self->_springVelocity;
}

- (double)_springMass
{
  return self->_springMass;
}

- (double)_springStiffness
{
  return self->_springStiffness;
}

@end
