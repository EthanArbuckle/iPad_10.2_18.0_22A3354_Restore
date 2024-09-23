@implementation SUGradientColorStop

- (SUGradientColorStop)init
{
  return -[SUGradientColorStop initWithColor:offset:](self, "initWithColor:offset:", 0, 0.0);
}

- (SUGradientColorStop)initWithColor:(CGColor *)a3 offset:(double)a4
{
  SUGradientColorStop *v6;
  SUGradientColorStop *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUGradientColorStop;
  v6 = -[SUGradientColorStop init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_offset = a4;
    v6->_rawColor = CGColorRetain(a3);
    SUColorGetRGBA(a3, &v7->_r, &v7->_g, &v7->_b, &v7->_a);
  }
  return v7;
}

- (SUGradientColorStop)initWithCoder:(id)a3
{
  SUGradientColorStop *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUGradientColorStop;
  v4 = -[SUGradientColorStop init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("r"));
    v4->_r = v5;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("g"));
    v4->_g = v6;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("b"));
    v4->_b = v7;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("A"));
    v4->_a = v8;
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("offset"));
    v4->_offset = v9;
    v10 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawcolor"));
    if (v10)
      v4->_rawColor = CGColorRetain((CGColorRef)objc_msgSend(v10, "CGColor"));
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  CGColor *rawColor;
  objc_super v4;

  rawColor = self->_rawColor;
  if (rawColor)
    CGColorRelease(rawColor);
  v4.receiver = self;
  v4.super_class = (Class)SUGradientColorStop;
  -[SUGradientColorStop dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  double r;
  double g;
  double b;
  double a;
  double offset;

  r = self->_r;
  *(float *)&r = r;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("r"), r);
  g = self->_g;
  *(float *)&g = g;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("g"), g);
  b = self->_b;
  *(float *)&b = b;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("b"), b);
  a = self->_a;
  *(float *)&a = a;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("A"), a);
  offset = self->_offset;
  *(float *)&offset = offset;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("offset"), offset);
  if (self->_rawColor)
    objc_msgSend(a3, "safeEncodeUIColor:forKey:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:"), CFSTR("rawcolor"));
}

- (int64_t)compare:(id)a3
{
  double offset;
  double v4;

  offset = self->_offset;
  v4 = *((double *)a3 + 5);
  if (offset < v4)
    return -1;
  else
    return offset > v4;
}

- (CGColor)copyCGColor
{
  CGColor *rawColor;
  CGColorSpace *DeviceRGB;
  __int128 v6;
  CGColor *v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  rawColor = self->_rawColor;
  if (rawColor)
    return CGColorCreateCopy(rawColor);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v6 = *(_OWORD *)&self->_b;
  v8[0] = *(_OWORD *)&self->_r;
  v8[1] = v6;
  v7 = CGColorCreate(DeviceRGB, (const CGFloat *)v8);
  CGColorSpaceRelease(DeviceRGB);
  return v7;
}

- (double)offset
{
  return self->_offset;
}

- (id)description
{
  void *v3;
  id v4;
  const __CFString *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SUGradientColorStop;
  v4 = -[SUGradientColorStop description](&v7, sel_description);
  if (self->_rawColor)
    v5 = (const __CFString *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:");
  else
    v5 = CFSTR("nil");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Color: %@"), v4, v5);
}

@end
