@implementation WAAQIGradientStop

+ (id)gradientStopWithColor:(id)a3 location:(float)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  *(float *)&v8 = a4;
  v9 = (void *)objc_msgSend(v7, "initWithColor:location:", v6, v8);

  return v9;
}

- (WAAQIGradientStop)initWithColor:(id)a3 location:(float)a4
{
  id v6;
  WAAQIGradientStop *v7;
  uint64_t v8;
  UIColor *color;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WAAQIGradientStop;
  v7 = -[WAAQIGradientStop init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    color = v7->_color;
    v7->_color = (UIColor *)v8;

    v7->_location = a4;
  }

  return v7;
}

- (UIColor)color
{
  return self->_color;
}

- (float)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
