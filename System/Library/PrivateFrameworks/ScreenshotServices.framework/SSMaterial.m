@implementation SSMaterial

- (id)_initWithFilterType:(id)a3 color:(id)a4
{
  UIColor *v6;
  id v7;
  SSMaterial *v8;
  uint64_t v9;
  CAFilter *filter;
  UIColor *color;
  objc_super v13;

  v6 = (UIColor *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SSMaterial;
  v7 = a3;
  v8 = -[SSMaterial init](&v13, sel_init);
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v7, v13.receiver, v13.super_class);
  v9 = objc_claimAutoreleasedReturnValue();

  filter = v8->_filter;
  v8->_filter = (CAFilter *)v9;

  color = v8->_color;
  v8->_color = v6;

  return v8;
}

- (CAFilter)filter
{
  return self->_filter;
}

- (UIColor)color
{
  return self->_color;
}

- (double)colorAlpha
{
  void *v2;
  double v4;

  v4 = 0.0;
  -[SSMaterial color](self, "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getRed:green:blue:alpha:", 0, 0, 0, &v4);

  return v4;
}

+ (id)vellumOpacitySliderValueImage
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "_initWithFilterType:color:", *MEMORY[0x24BDE5B68], 0);
}

+ (id)vellumOpacitySliderTrack
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  v3 = *MEMORY[0x24BDE5BD8];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "_initWithFilterType:color:", v3, v4);

  return v5;
}

+ (id)cropHandle
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  v3 = *MEMORY[0x24BDE5BD8];
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.82);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "_initWithFilterType:color:", v3, v4);

  return v5;
}

- (void)applyToView:(id)a3
{
  id v4;
  char isKindOfClass;
  UIColor *color;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_color)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    color = self->_color;
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v4, "setTintColor:", color);
    else
      objc_msgSend(v4, "setBackgroundColor:", color);
  }
  objc_msgSend(v4, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = self->_filter;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCompositingFilter:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
