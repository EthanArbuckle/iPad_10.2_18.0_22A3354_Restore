@implementation TSUColor

+ (id)blackColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 1.0);
}

- (TSUColor)initWithWhite:(double)a3 alpha:(double)a4
{
  CGColorSpace *DeviceGray;
  CGColor *v8;
  TSUColor *v9;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  DeviceGray = CGColorSpaceCreateDeviceGray();
  components[0] = a3;
  components[1] = a4;
  v8 = CGColorCreate(DeviceGray, components);
  v9 = -[TSUColor initWithCGColor:](self, "initWithCGColor:", v8);
  CGColorRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  return v9;
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

- (TSUColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  CGColorSpace *DeviceRGB;
  CGColor *v12;
  TSUColor *v13;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  v12 = CGColorCreate(DeviceRGB, components);
  v13 = -[TSUColor initWithCGColor:](self, "initWithCGColor:", v12);
  CGColorRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  return v13;
}

+ (id)colorWithPlatformColor:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPlatformColor:", a3);
}

- (TSUColor)initWithCGColor:(CGColor *)a3
{
  id v5;
  uint64_t v6;
  TSUColor *v7;
  objc_super v9;

  if (!a3)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUColor initWithCGColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 153, CFSTR("invalid nil value for '%s'"), "CGColor");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSUColor;
  v7 = -[TSUColor init](&v9, sel_init);
  if (v7)
    v7->mCGColor = CGColorCreateCopy(a3);
  return v7;
}

- (TSUColor)initWithUIColor:(id)a3
{
  id v5;
  uint64_t v6;

  if (!a3)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUColor initWithUIColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 224, CFSTR("invalid nil value for '%s'"), "uiColor");
  }
  return -[TSUColor initWithCGColor:](self, "initWithCGColor:", objc_msgSend(a3, "CGColor"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  CGColor *v8;
  uint64_t v9;
  CGColor *v10;
  CGColorSpaceRef ColorSpace;
  CGColor *v12;
  CGColor *v13;
  CGColorSpaceRef v14;
  CGColorSpaceRef v15;
  const void *v16;
  int v17;
  const void *v18;
  int v19;
  const void *v20;
  int v21;
  const void *v22;
  int v23;
  const void *v24;
  int v25;
  const void *v26;
  int v27;
  int v28;
  BOOL v29;
  int v30;
  BOOL v31;
  int v32;
  CGColor *v33;
  const CGFloat *v34;
  BOOL v35;
  BOOL v36;
  char v37;
  BOOL v38;
  BOOL v39;
  char v40;
  BOOL v41;
  BOOL v42;
  CGColor *v43;
  CGColor *DeviceRGB;
  CGColorSpace *v45;
  CGColor *v46;
  int v48;
  int v49;
  CGFloat components[6];

  components[5] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  v5 = objc_opt_class();
  v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
  if (!v6)
    return 0;
  v7 = v6;
  if (!objc_msgSend(v6, "CGColor"))
    return 0;
  v8 = -[TSUColor CGColor](self, "CGColor");
  v9 = objc_msgSend(v7, "CGColor");
  if (v8 != (CGColor *)v9)
  {
    v10 = (CGColor *)v9;
    ColorSpace = CGColorGetColorSpace(-[TSUColor CGColor](self, "CGColor"));
    v12 = v10;
    v13 = v8;
    v14 = ColorSpace;
    v15 = CGColorGetColorSpace((CGColorRef)objc_msgSend(v7, "CGColor"));
    v16 = (const void *)TSUDeviceGrayColorSpace();
    v17 = CFEqual(v14, v16);
    v18 = (const void *)TSUDeviceRGBColorSpace();
    v19 = CFEqual(v14, v18);
    v20 = (const void *)TSUDeviceCMYKColorSpace();
    v21 = CFEqual(v14, v20);
    v22 = (const void *)TSUDeviceGrayColorSpace();
    v23 = CFEqual(v15, v22);
    v24 = (const void *)TSUDeviceRGBColorSpace();
    v25 = CFEqual(v15, v24);
    v26 = (const void *)TSUDeviceCMYKColorSpace();
    v27 = CFEqual(v15, v26);
    v28 = v27;
    v48 = v21;
    v49 = v19;
    if (v19)
      v29 = v25 == 0;
    else
      v29 = 1;
    v30 = v29;
    if (v21)
      v31 = v27 == 0;
    else
      v31 = 1;
    v32 = v31;
    if (v17)
      v33 = v13;
    else
      v33 = v12;
    v34 = CGColorGetComponents(v33);
    if (v23)
      v35 = v17 == 0;
    else
      v35 = 1;
    if (v35 && v30 && v32 && v14 != v15)
    {
      if (v49)
        v36 = v23 == 0;
      else
        v36 = 1;
      v37 = v36;
      if (v25)
        v38 = v17 == 0;
      else
        v38 = 1;
      if (v38 && (v37 & 1) != 0)
      {
        if (v48)
          v39 = v23 == 0;
        else
          v39 = 1;
        v40 = v39;
        if (v28)
          v41 = v17 == 0;
        else
          v41 = 1;
        if (v41 && (v40 & 1) != 0)
        {
          v42 = 0;
LABEL_55:
          v43 = 0;
LABEL_62:
          CGColorRelease(v43);
          return v42;
        }
        memset(components, 0, 24);
        components[3] = 1.0 - *v34;
        components[4] = v34[1];
        v45 = (CGColorSpace *)TSUDeviceCMYKColorSpace();
        DeviceRGB = CGColorCreate(v45, components);
      }
      else
      {
        DeviceRGB = TSUCGColorCreateDeviceRGB(*v34, *v34, *v34, v34[1]);
      }
      v43 = DeviceRGB;
      if (v17)
        v46 = v12;
      else
        v46 = v13;
      v42 = __20__TSUColor_isEqual___block_invoke((int)DeviceRGB, DeviceRGB, v46);
      goto LABEL_62;
    }
    v42 = __20__TSUColor_isEqual___block_invoke((int)v34, v13, v12);
    goto LABEL_55;
  }
  return 1;
}

- (CGColor)CGColor
{
  return self->mCGColor;
}

BOOL __20__TSUColor_isEqual___block_invoke(int a1, CGColorRef color, CGColor *a3)
{
  double *Components;
  double *v6;
  size_t NumberOfComponents;
  id v8;
  uint64_t v9;
  _BOOL8 result;

  Components = (double *)CGColorGetComponents(color);
  v6 = (double *)CGColorGetComponents(a3);
  NumberOfComponents = CGColorGetNumberOfComponents(color);
  if (NumberOfComponents != CGColorGetNumberOfComponents(a3))
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUColor isEqual:]_block_invoke");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 320, CFSTR("Color space dimension mismatch"));
  }
  for (result = 1; NumberOfComponents; --NumberOfComponents)
    result = result && vabdd_f64(*Components++, *v6++) < 0.001953125;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->mCGColor);
  v3.receiver = self;
  v3.super_class = (Class)TSUColor;
  -[TSUColor dealloc](&v3, sel_dealloc);
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a3);
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", a3, a4);
}

+ (id)colorWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithHue:saturation:brightness:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithPatternImage:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPatternImage:", a3);
}

+ (id)colorWithRGBAComponents:(const double *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", *a3, a3[1], a3[2], a3[3]);
}

+ (id)colorWithUIColor:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUIColor:", a3);
}

+ (id)randomColor
{
  CGColor *RandomRGB;
  TSUColor *v3;

  RandomRGB = TSUCGColorCreateRandomRGB();
  v3 = +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", RandomRGB);
  CGColorRelease(RandomRGB);
  return v3;
}

+ (id)clearColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 0.0);
}

+ (id)whiteColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 1.0, 1.0);
}

+ (id)grayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.5, 1.0);
}

+ (id)lightGrayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.667, 1.0);
}

+ (id)redColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 1.0);
}

+ (id)greenColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 1.0);
}

+ (id)blueColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 1.0);
}

+ (id)cyanColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.0, 1.0, 1.0, 1.0);
}

+ (id)yellowColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 1.0);
}

+ (id)magentaColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.0, 1.0, 1.0);
}

+ (id)orangeColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 1.0, 0.5, 0.0, 1.0);
}

+ (id)purpleColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.5, 0.0, 0.5, 1.0);
}

+ (id)brownColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", 0.6, 0.4, 0.2, 1.0);
}

- (TSUColor)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5 alpha:(double)a6
{
  CGColor *v7;
  TSUColor *v8;

  v7 = TSUCreateCGColorFromHSB(a3, a4, a5, a6);
  v8 = -[TSUColor initWithCGColor:](self, "initWithCGColor:", v7);
  CGColorRelease(v7);
  return v8;
}

- (TSUColor)initWithPatternImage:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGColor *PatternWithImageAndTransform;
  id v9;
  uint64_t v10;
  CGAffineTransform v12;

  if (a3)
  {
    memset(&v12, 0, sizeof(v12));
    objc_msgSend(a3, "scale");
    v6 = 1.0 / v5;
    objc_msgSend(a3, "scale");
    CGAffineTransformMakeScale(&v12, v6, 1.0 / v7);
    objc_msgSend(a3, "scale");
    PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform((CGImage *)objc_msgSend(a3, "CGImageForContentsScale:"), (__int128 *)&v12);
    self = -[TSUColor initWithCGColor:](self, "initWithCGColor:", PatternWithImageAndTransform);
    CGColorRelease(PatternWithImageAndTransform);
  }
  else
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUColor initWithPatternImage:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 207, CFSTR("invalid nil value for '%s'"), "patternImage");
    NSDeallocateObject(self);
  }
  return self;
}

- (unint64_t)hash
{
  return CFHash(-[TSUColor CGColor](self, "CGColor"));
}

- (BOOL)isAlmostEqualToColor:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  -[TSUColor redComponent](self, "redComponent");
  v6 = v5;
  objc_msgSend(a3, "redComponent");
  if (vabdd_f64(v6, v7) >= 0.00999999978)
    return 0;
  -[TSUColor greenComponent](self, "greenComponent");
  v9 = v8;
  objc_msgSend(a3, "greenComponent");
  if (vabdd_f64(v9, v10) >= 0.00999999978)
    return 0;
  -[TSUColor blueComponent](self, "blueComponent");
  v12 = v11;
  objc_msgSend(a3, "blueComponent");
  if (vabdd_f64(v12, v13) >= 0.00999999978)
    return 0;
  -[TSUColor alphaComponent](self, "alphaComponent");
  v15 = v14;
  objc_msgSend(a3, "alphaComponent");
  return vabdd_f64(v15, v16) < 0.00999999978;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSUColor initWithCGColor:](+[TSUColor allocWithZone:](TSUColor, "allocWithZone:", a3), "initWithCGColor:", self->mCGColor);
}

- (double)p_rgbComponentWithIndex:(unsigned __int8)a3
{
  int v3;
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  double result;

  v3 = a3;
  Components = CGColorGetComponents(-[TSUColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[TSUColor CGColor](self, "CGColor"));
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelMonochrome)
    return *Components;
  if (Model == kCGColorSpaceModelCMYK)
    return 1.0 - fmin(Components[3] + Components[v3] * (1.0 - Components[3]), 1.0);
  result = 0.0;
  if (Model == kCGColorSpaceModelRGB)
    return Components[v3];
  return result;
}

- (double)redComponent
{
  double result;

  -[TSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 0);
  return result;
}

- (double)greenComponent
{
  double result;

  -[TSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 1);
  return result;
}

- (double)blueComponent
{
  double result;

  -[TSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 2);
  return result;
}

- (double)alphaComponent
{
  return CGColorGetAlpha(-[TSUColor CGColor](self, "CGColor"));
}

- (void)getRGBAComponents:(double *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUColor getRGBAComponents:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 423, CFSTR("rgbaComponents is NULL!"));
  }
  -[TSUColor redComponent](self, "redComponent");
  *(_QWORD *)a3 = v7;
  -[TSUColor greenComponent](self, "greenComponent");
  *((_QWORD *)a3 + 1) = v8;
  -[TSUColor blueComponent](self, "blueComponent");
  *((_QWORD *)a3 + 2) = v9;
  -[TSUColor alphaComponent](self, "alphaComponent");
  *((_QWORD *)a3 + 3) = v10;
}

- (double)hueComponent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  uint64_t v10;
  double v11;

  v10 = 0;
  v11 = 0.0;
  v9 = 0;
  -[TSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[TSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[TSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB(&v11, (double *)&v10, (double *)&v9, v4, v6, v7);
  return v11;
}

- (double)saturationComponent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  double v10;
  uint64_t v11;

  v10 = 0.0;
  v11 = 0;
  v9 = 0;
  -[TSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[TSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[TSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB((double *)&v11, &v10, (double *)&v9, v4, v6, v7);
  return v10;
}

- (double)brightnessComponent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0.0;
  -[TSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[TSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[TSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB((double *)&v11, (double *)&v10, &v9, v4, v6, v7);
  return v9;
}

- (id)UIColor
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", -[TSUColor CGColor](self, "CGColor"));
}

- (id)grayscaleColor
{
  TSUColor *v2;
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;

  v2 = self;
  Components = CGColorGetComponents(-[TSUColor CGColor](self, "CGColor"));
  ColorSpace = CGColorGetColorSpace(-[TSUColor CGColor](v2, "CGColor"));
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model)
  {
    if (Model == kCGColorSpaceModelRGB)
      return +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", Components[1] * 0.59 + *Components * 0.3 + Components[2] * 0.11, Components[3]);
    return 0;
  }
  return v2;
}

- (id)invertedColor
{
  id v3;
  uint64_t v4;
  const CGFloat *Components;

  if (CGColorGetNumberOfComponents(-[TSUColor CGColor](self, "CGColor")) != 4)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUColor invertedColor]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 503, CFSTR("Wrong number of components while inverting color. %zi instead of 4"), CGColorGetNumberOfComponents(-[TSUColor CGColor](self, "CGColor")));
  }
  Components = CGColorGetComponents(-[TSUColor CGColor](self, "CGColor"));
  return +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 1.0 - *Components, 1.0 - Components[1], 1.0 - Components[2], Components[3]);
}

- (BOOL)isGrayscaleColor
{
  CGColorSpace *ColorSpace;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  ColorSpace = CGColorGetColorSpace(-[TSUColor CGColor](self, "CGColor"));
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelMonochrome)
    return 1;
  -[TSUColor getRGBAComponents:](self, "getRGBAComponents:", &v5);
  if (v5 != v6 && vabdd_f64(v5, v6) >= fabs(v6 * 0.000000999999997)
    || v5 != v7 && vabdd_f64(v5, v7) >= fabs(v7 * 0.000000999999997))
  {
    return 0;
  }
  if (v6 == v7)
    return 1;
  return vabdd_f64(v6, v7) < fabs(v7 * 0.000000999999997);
}

- (id)lightenedColorByFactor:(double)a3
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15[5];

  v15[4] = *(double *)MEMORY[0x24BDAC8D0];
  if (a3 < 0.0 || a3 > 1.0)
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUColor lightenedColorByFactor:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColor.m"), 535, CFSTR("Invalid factor: %f"), *(_QWORD *)&a3);
  }
  if (-[TSUColor isGrayscaleColor](self, "isGrayscaleColor"))
  {
    -[TSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 0);
    v9 = v8;
    -[TSUColor alphaComponent](self, "alphaComponent");
    return +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", v9 + (1.0 - v9) * a3, v10);
  }
  else
  {
    v13 = 0.0;
    v14 = 0.0;
    v12 = 0.0;
    -[TSUColor getRGBAComponents:](self, "getRGBAComponents:", v15);
    TSURGBToHSB(&v14, &v13, &v12, v15[0], v15[1], v15[2]);
    v12 = v12 + (1.0 - v12) * a3;
    v13 = (1.0 - a3) * v13;
    return +[TSUColor colorWithHue:saturation:brightness:alpha:](TSUColor, "colorWithHue:saturation:brightness:alpha:", v14);
  }
}

- (id)darkenedColorByFactor:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12[5];

  v12[4] = *(double *)MEMORY[0x24BDAC8D0];
  if (-[TSUColor isGrayscaleColor](self, "isGrayscaleColor"))
  {
    -[TSUColor p_rgbComponentWithIndex:](self, "p_rgbComponentWithIndex:", 0);
    v6 = v5;
    -[TSUColor alphaComponent](self, "alphaComponent");
    return +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", (1.0 - a3) * v6, v7);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
    -[TSUColor getRGBAComponents:](self, "getRGBAComponents:", v12);
    TSURGBToHSB(&v11, &v10, &v9, v12[0], v12[1], v12[2]);
    return +[TSUColor colorWithHue:saturation:brightness:alpha:](TSUColor, "colorWithHue:saturation:brightness:alpha:", v11, (1.0 - a3) * v9, v10 + (1.0 - v10) * a3);
  }
}

- (TSUColor)colorWithAlphaComponent:(double)a3
{
  CGColor *CopyWithAlpha;
  TSUColor *v4;

  CopyWithAlpha = CGColorCreateCopyWithAlpha(self->mCGColor, a3);
  v4 = +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", CopyWithAlpha);
  CGColorRelease(CopyWithAlpha);
  return v4;
}

- (double)luminance
{
  const CGFloat *Components;
  size_t NumberOfComponents;
  double v5;
  double v6;
  double result;
  double v8;
  _BOOL4 v9;

  Components = CGColorGetComponents(-[TSUColor CGColor](self, "CGColor"));
  NumberOfComponents = CGColorGetNumberOfComponents(-[TSUColor CGColor](self, "CGColor"));
  v5 = *Components;
  v6 = Components[1];
  if (NumberOfComponents == 2)
    return v5 * v6;
  result = v6 * 0.715200007 + v5 * 0.212599993 + Components[2] * 0.0722000003 * Components[3];
  v8 = 1.0;
  v9 = result < 0.0 || result > 1.0;
  if (result <= 1.0 || result < 0.0)
    v8 = 0.0;
  if (v9)
    return v8;
  return result;
}

- (BOOL)isOpaque
{
  return CGColorGetAlpha(-[TSUColor CGColor](self, "CGColor")) == 1.0;
}

- (BOOL)isNearlyWhite
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  uint64_t v11;

  v10 = 0.0;
  v11 = 0;
  v9 = 0.0;
  -[TSUColor redComponent](self, "redComponent");
  v4 = v3;
  -[TSUColor greenComponent](self, "greenComponent");
  v6 = v5;
  -[TSUColor blueComponent](self, "blueComponent");
  TSURGBToHSB((double *)&v11, &v9, &v10, v4, v6, v7);
  return v9 < 0.05 && v10 > 0.9;
}

- (id)blendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  return -[TSUColor newBlendedColorWithFraction:ofColor:](self, "newBlendedColorWithFraction:ofColor:", a4, a3);
}

- (id)newBlendedColorWithFraction:(double)a3 ofColor:(id)a4
{
  TSUColor *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v7 = [TSUColor alloc];
  -[TSUColor redComponent](self, "redComponent");
  v9 = v8;
  objc_msgSend(a4, "redComponent");
  v11 = TSUMix(v9, v10, a3);
  -[TSUColor greenComponent](self, "greenComponent");
  v13 = v12;
  objc_msgSend(a4, "greenComponent");
  v15 = TSUMix(v13, v14, a3);
  -[TSUColor blueComponent](self, "blueComponent");
  v17 = v16;
  objc_msgSend(a4, "blueComponent");
  v19 = TSUMix(v17, v18, a3);
  -[TSUColor alphaComponent](self, "alphaComponent");
  v21 = v20;
  objc_msgSend(a4, "alphaComponent");
  return -[TSUColor initWithRed:green:blue:alpha:](v7, "initWithRed:green:blue:alpha:", v11, v15, v19, TSUMix(v21, v22, a3));
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, self->mCGColor);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  CGContextFillRect(a4, v10);
  CGContextRestoreGState(a4);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, self->mCGColor);
  CGContextAddPath(a4, a3);
  CGContextFillPath(a4);
  CGContextRestoreGState(a4);
}

@end
