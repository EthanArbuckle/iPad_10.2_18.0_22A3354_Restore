@implementation FxColor

+ (id)colorWithCGColor:(CGColor *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a3);
}

+ (id)colorWithCIColor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a3, "red");
  v5 = v4;
  objc_msgSend(a3, "green");
  v7 = v6;
  objc_msgSend(a3, "blue");
  v9 = v8;
  objc_msgSend(a3, "alpha");
  return +[FxColor colorWithRed:green:blue:alpha:](FxColor, "colorWithRed:green:blue:alpha:", v5, v7, v9, v10);
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  return (id)objc_msgSend(a1, "colorWithRed:green:blue:alpha:", a3, a4, a5, 1.0);
}

+ (id)colorWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", a3);
}

- (FxColor)initWithString:(id)a3
{
  char *v4;
  char *v5;
  int v6;
  uint64_t v7;
  __int128 v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (char *)objc_msgSend(a3, "UTF8String");
  if (!v4)
    return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v5 = v4;
  v10 = 0;
  v6 = *v4;
  if (v6 == 91 || v6 == 40)
    v5 = v4 + 1;
  v7 = 0;
  while (1)
  {
    *((double *)&v11 + v7) = strtod(v5, &v10);
    if (v10 == v5)
      break;
    ++v7;
    v5 = v10;
    if (v7 == 4)
      return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
  }
  switch((int)v7)
  {
    case 0:
      *(_QWORD *)&v12 = 0;
      *((_QWORD *)&v12 + 1) = 0x3FF0000000000000;
      v11 = 0uLL;
      break;
    case 1:
      *((_QWORD *)&v12 + 1) = 0x3FF0000000000000;
      *((_QWORD *)&v11 + 1) = v11;
      *(_QWORD *)&v12 = v11;
      break;
    case 2:
      v9 = v11;
      *((_QWORD *)&v11 + 1) = v11;
      v12 = v9;
      break;
    case 3:
      *((_QWORD *)&v12 + 1) = 0x3FF0000000000000;
      break;
    default:
      return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
  }
  return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
}

- (FxColor)initWithCGColor:(CGColor *)a3
{
  FxColor *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FxColor;
    v4 = -[FxColor init](&v6, sel_init);
    if (v4)
      v4->_priv = CGColorRetain(a3);
  }
  else
  {

    return 0;
  }
  return v4;
}

- (FxColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorSpace *DeviceRGB;
  CGColor *v12;
  FxColor *v13;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  DeviceRGB = (CGColorSpace *)initWithRed_green_blue_alpha__cs;
  if (!initWithRed_green_blue_alpha__cs)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    initWithRed_green_blue_alpha__cs = (uint64_t)DeviceRGB;
  }
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  v12 = CGColorCreate(DeviceRGB, components);
  v13 = -[FxColor initWithCGColor:](self, "initWithCGColor:", v12);
  CGColorRelease(v12);
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease((CGColorRef)self->_priv);
  v3.receiver = self;
  v3.super_class = (Class)FxColor;
  -[FxColor dealloc](&v3, sel_dealloc);
}

- (unint64_t)numberOfComponents
{
  return CGColorGetNumberOfComponents((CGColorRef)self->_priv);
}

- (const)components
{
  return CGColorGetComponents((CGColorRef)self->_priv);
}

- (double)alpha
{
  return CGColorGetAlpha((CGColorRef)self->_priv);
}

- (double)red
{
  unint64_t v3;
  const double *v4;
  double result;

  v3 = -[FxColor numberOfComponents](self, "numberOfComponents");
  v4 = -[FxColor components](self, "components");
  result = 0.0;
  if (v3 >= 2)
    return *v4;
  return result;
}

- (double)green
{
  unint64_t v3;
  const double *v4;
  double result;

  v3 = -[FxColor numberOfComponents](self, "numberOfComponents");
  v4 = -[FxColor components](self, "components");
  result = 0.0;
  if (v3 >= 3)
    return v4[1];
  return result;
}

- (double)blue
{
  unint64_t v3;
  const double *v4;
  double result;

  v3 = -[FxColor numberOfComponents](self, "numberOfComponents");
  v4 = -[FxColor components](self, "components");
  result = 0.0;
  if (v3 >= 4)
    return v4[2];
  return result;
}

- (id)stringRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FxColor red](self, "red");
  v5 = v4;
  -[FxColor green](self, "green");
  v7 = v6;
  -[FxColor blue](self, "blue");
  v9 = v8;
  -[FxColor alpha](self, "alpha");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%g %g %g %g"), v5, v7, v9, v10);
}

- (CGColorSpace)colorSpace
{
  return CGColorGetColorSpace((CGColorRef)self->_priv);
}

- (void)convertToRGBA:(double *)a3
{
  unint64_t v5;
  const double *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = -[FxColor numberOfComponents](self, "numberOfComponents");
  v6 = -[FxColor components](self, "components");
  if (v5)
  {
    v7 = 1.0;
    if (v5 != 1)
      v7 = *v6;
    *a3 = v7;
    v8 = v6[v5 > 2];
    a3[1] = v8;
    v9 = v6[2 * (v5 > 3)];
    a3[2] = v9;
    v10 = v6[v5 - 1];
    *a3 = v7 * v10;
    a3[1] = v8 * v10;
    a3[2] = v9 * v10;
    a3[3] = v10;
  }
}

- (CGColor)_cgColor
{
  return (CGColor *)self->_priv;
}

- (id)ciColor
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  -[FxColor convertToRGBA:](self, "convertToRGBA:", &v8);
  v4 = *(double *)&v8 / *((double *)&v9 + 1);
  *(float *)&v4 = *(double *)&v8 / *((double *)&v9 + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("red"), v4);
  v5 = *((double *)&v8 + 1) / *((double *)&v9 + 1);
  *(float *)&v5 = *((double *)&v8 + 1) / *((double *)&v9 + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("green"), v5);
  v6 = *(double *)&v9 / *((double *)&v9 + 1);
  *(float *)&v6 = *(double *)&v9 / *((double *)&v9 + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("blue"), v6);
  HIDWORD(v7) = HIDWORD(v9);
  *(float *)&v7 = *((double *)&v9 + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("alpha"), v7);
}

- (FxColor)initWithCoder:(id)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;

  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("red"));
  v6 = v5;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("green"));
  v8 = v7;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("blue"));
  v10 = v9;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("alpha"));
  return -[FxColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v6, v8, v10, v11);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FxColor red](self, "red");
  v5 = v4;
  -[FxColor green](self, "green");
  v7 = v6;
  -[FxColor blue](self, "blue");
  v9 = v8;
  -[FxColor alpha](self, "alpha");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%g %g %g %g)"), v5, v7, v9, v10);
}

@end
