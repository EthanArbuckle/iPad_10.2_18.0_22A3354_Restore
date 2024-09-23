@implementation PUIColorHSLValues

- (PUIColorHSLValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5
{
  PUIColorHSLValues *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUIColorHSLValues;
  result = -[PUIColorHSLValues init](&v9, sel_init);
  if (result)
  {
    result->_hue = a3;
    result->_saturation = a4;
    result->_luminance = a5;
  }
  return result;
}

- (id)hsbValues
{
  double luminance;
  double v3;
  double v4;
  double v5;

  luminance = self->_luminance;
  v3 = 1.0 - luminance;
  if (luminance < 1.0 - luminance)
    v3 = self->_luminance;
  v4 = luminance + self->_saturation * v3;
  v5 = 0.0;
  if (v4 > 0.0)
    v5 = 2.0 - (luminance + luminance) / v4;
  return -[PUIColorHSBValues initWithHue:saturation:brightness:]([PUIColorHSBValues alloc], "initWithHue:saturation:brightness:", self->_hue, v5, v4);
}

- (double)hue
{
  return self->_hue;
}

- (double)saturation
{
  return self->_saturation;
}

- (double)luminance
{
  return self->_luminance;
}

@end
