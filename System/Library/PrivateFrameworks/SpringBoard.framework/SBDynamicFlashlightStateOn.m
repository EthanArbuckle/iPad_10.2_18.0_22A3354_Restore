@implementation SBDynamicFlashlightStateOn

- (SBDynamicFlashlightStateOn)initWithInitialIntensity:(double)a3 width:(double)a4
{
  SBDynamicFlashlightStateOn *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDynamicFlashlightStateOn;
  result = -[SBDynamicFlashlightStateOn init](&v7, sel_init);
  if (result)
  {
    result->_initialIntensity = a3;
    result->_initialWidth = a4;
  }
  return result;
}

- (BOOL)isOn
{
  return 1;
}

- (BOOL)isUnavailable
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  SBDynamicFlashlightStateOn *v4;
  uint64_t v5;
  BOOL v6;
  SBDynamicFlashlightStateOn *v7;
  double initialIntensity;
  double v9;
  double initialWidth;
  double v11;

  v4 = (SBDynamicFlashlightStateOn *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      initialIntensity = self->_initialIntensity;
      -[SBDynamicFlashlightStateOn initialIntensity](v7, "initialIntensity");
      if (initialIntensity == v9)
      {
        initialWidth = self->_initialWidth;
        -[SBDynamicFlashlightStateOn initialWidth](v7, "initialWidth");
        v6 = initialWidth == v11;
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<state=ON, initialIntensity=%.3f, initialWidth=%.3f>"), *(_QWORD *)&self->_initialIntensity, *(_QWORD *)&self->_initialWidth);
}

- (double)initialIntensity
{
  return self->_initialIntensity;
}

- (double)initialWidth
{
  return self->_initialWidth;
}

@end
