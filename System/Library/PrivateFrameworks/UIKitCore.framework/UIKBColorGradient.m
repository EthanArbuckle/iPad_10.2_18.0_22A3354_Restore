@implementation UIKBColorGradient

+ (id)gradientWithUIColor:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUIColor:", v3);

  return v4;
}

- (UIKBColorGradient)initWithUIColor:(id)a3
{
  id v5;
  UIKBColorGradient *v6;
  UIKBColorGradient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBColorGradient;
  v6 = -[UIKBColorGradient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_color, a3);

  return v7;
}

- (CGGradient)CGGradient
{
  CGColor *v2;
  CGColorSpace *DeviceGray;
  const __CFArray *v4;
  CGGradient *v5;
  _QWORD v7[2];
  CGFloat locations[3];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[UIColor CGColor](self->_color, "CGColor");
  DeviceGray = CGColorSpaceCreateDeviceGray();
  *(_OWORD *)locations = xmmword_18666F250;
  v7[0] = v2;
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  v5 = CGGradientCreateWithColors(DeviceGray, v4, locations);

  CGColorSpaceRelease(DeviceGray);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
