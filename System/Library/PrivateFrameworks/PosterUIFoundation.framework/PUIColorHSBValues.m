@implementation PUIColorHSBValues

- (PUIColorHSBValues)initWithColor:(id)a3
{
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v5 = 1.0;
  objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, 0);
  return -[PUIColorHSBValues initWithHue:saturation:brightness:](self, "initWithHue:saturation:brightness:", v7, v6, v5);
}

- (PUIColorHSBValues)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5
{
  PUIColorHSBValues *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUIColorHSBValues;
  result = -[PUIColorHSBValues init](&v9, sel_init);
  if (result)
  {
    result->_hue = a3;
    result->_saturation = a4;
    result->_brightness = a5;
  }
  return result;
}

- (id)hslValues
{
  double brightness;
  double v3;
  double v4;
  double v5;

  brightness = self->_brightness;
  v3 = brightness + brightness * self->_saturation * -0.5;
  v4 = 1.0 - v3;
  if (v3 < 1.0 - v3)
    v4 = brightness + brightness * self->_saturation * -0.5;
  v5 = 0.0;
  if (v4 > 0.0)
    v5 = (brightness - v3) / v4;
  return -[PUIColorHSLValues initWithHue:saturation:luminance:]([PUIColorHSLValues alloc], "initWithHue:saturation:luminance:", self->_hue, v5, v3);
}

- (id)colorWithAlpha:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (void *)MEMORY[0x24BDF6950];
  -[PUIColorHSBValues hue](self, "hue");
  v7 = v6;
  -[PUIColorHSBValues saturation](self, "saturation");
  v9 = v8;
  -[PUIColorHSBValues brightness](self, "brightness");
  return (id)objc_msgSend(v5, "colorWithHue:saturation:brightness:alpha:", v7, v9, v10, a3);
}

- (double)hue
{
  return self->_hue;
}

- (double)saturation
{
  return self->_saturation;
}

- (double)brightness
{
  return self->_brightness;
}

@end
