@implementation TSDColorFill

+ (id)colorWithColor:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithColor:", a3);
}

+ (id)colorWithCGColor:(CGColor *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", a3);
}

+ (id)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", a3, a4, a5, a6);
}

+ (id)colorWithWhite:(double)a3 alpha:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", a3, a4);
}

+ (id)colorWithUIColor:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUIColor:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithColor:", -[TSDColorFill color](self, "color"));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TSDColorFill initWithColor:]([TSDMutableColorFill alloc], "initWithColor:", -[TSDColorFill color](self, "color"));
}

+ (id)randomColor
{
  CGColor *RandomRGB;
  id v3;

  RandomRGB = (CGColor *)TSUCGColorCreateRandomRGB();
  v3 = +[TSDColorFill colorWithCGColor:](TSDColorFill, "colorWithCGColor:", RandomRGB);
  CGColorRelease(RandomRGB);
  return v3;
}

+ (id)clearColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 0.0);
}

+ (id)blackColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.0, 1.0);
}

+ (id)whiteColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 1.0, 1.0);
}

+ (id)grayColor
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithWhite:alpha:", 0.5, 1.0);
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

- (TSDColorFill)initWithColor:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDColorFill *v7;
  objc_super v9;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDColorFill initWithColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 138, CFSTR("invalid nil value for '%s'"), "color");
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDColorFill;
  v7 = -[TSDColorFill init](&v9, sel_init);
  if (v7)
    v7->mColor = (TSUColor *)objc_msgSend(a3, "copy");
  return v7;
}

- (TSDColorFill)initWithCGColor:(CGColor *)a3
{
  return -[TSDColorFill initWithColor:](self, "initWithColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithCGColor:", a3));
}

- (TSDColorFill)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  return -[TSDColorFill initWithColor:](self, "initWithColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", a3, a4, a5, a6));
}

- (TSDColorFill)initWithWhite:(double)a3 alpha:(double)a4
{
  return -[TSDColorFill initWithColor:](self, "initWithColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithWhite:alpha:", a3, a4));
}

- (TSDColorFill)initWithUIColor:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDColorFill initWithUIColor:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 167, CFSTR("invalid nil value for '%s'"), "uiColor");
  }
  return -[TSDColorFill initWithColor:](self, "initWithColor:", objc_msgSend(MEMORY[0x24BEB3C40], "colorWithUIColor:", a3));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDColorFill;
  -[TSDColorFill dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[TSUColor hash](self->mColor, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v4;

  if (self == a3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_opt_class();
    v4 = (void *)TSUDynamicCast();
    if (v4)
      LOBYTE(v4) = -[TSUColor isEqual:](-[TSDColorFill color](self, "color"), "isEqual:", objc_msgSend(v4, "color"));
  }
  return (char)v4;
}

- (id)UIColor
{
  return (id)-[TSUColor UIColor](-[TSDColorFill color](self, "color"), "UIColor");
}

- (id)grayscaleColor
{
  return (id)objc_msgSend((id)objc_opt_class(), "colorWithColor:", -[TSUColor grayscaleColor](-[TSDColorFill color](self, "color"), "grayscaleColor"));
}

- (id)invertedColor
{
  return (id)objc_msgSend((id)objc_opt_class(), "colorWithColor:", -[TSUColor invertedColor](-[TSDColorFill color](self, "color"), "invertedColor"));
}

- (BOOL)isOpaque
{
  double v2;

  -[TSDColorFill opacity](self, "opacity");
  return v2 == 1.0;
}

- (BOOL)isClear
{
  double v2;

  -[TSDColorFill opacity](self, "opacity");
  return v2 == 0.0;
}

- (BOOL)isNearlyWhite
{
  return -[TSUColor isNearlyWhite](-[TSDColorFill color](self, "color"), "isNearlyWhite");
}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  -[TSUColor paintRect:inContext:](-[TSDColorFill color](self, "color"), "paintRect:inContext:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  -[TSUColor paintPath:inContext:](-[TSDColorFill color](self, "color"), "paintPath:inContext:", a3, a4);
}

- (BOOL)canApplyToCALayer
{
  return 1;
}

- (void)applyToCALayer:(id)a3 withScale:(double)a4
{
  void *v6;
  uint64_t v7;
  BOOL v8;
  CGColor *v9;

  if (!-[TSDColorFill canApplyToCALayer](self, "canApplyToCALayer", a4))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDColorFill applyToCALayer:withScale:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 253, CFSTR("Applying color fill with unsupported properties to CALayer"));
  }
  objc_msgSend(a3, "setContents:", 0);
  v8 = -[TSDColorFill isClear](self, "isClear");
  v9 = 0;
  if (!v8)
    v9 = -[TSDColorFill CGColor](self, "CGColor", 0);
  objc_msgSend(a3, "setBackgroundColor:", v9);
}

- (BOOL)canApplyToCAShapeLayer
{
  return 1;
}

- (void)applyToCAShapeLayer:(id)a3 withScale:(double)a4
{
  objc_msgSend(a3, "setFillColor:", -[TSDColorFill CGColor](self, "CGColor", a4));
}

- (int)fillType
{
  return 0;
}

- (SEL)mapThemeAssetSelector
{
  return sel_tsdMapColorFill_;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__TSDColorFill_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82BFD8;
  v4[4] = a3;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDColorFill_mixingTypeWithObject___block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_opt_class();
  if (!TSUDynamicCast())
  {
    v0 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDColorFill mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDColorFill.m"), 304, CFSTR("nil object after cast"));
  }
  return 4;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__TSDColorFill_mixedObjectWithFraction_ofObject___block_invoke;
  v5[3] = &unk_24D82B890;
  v5[4] = a4;
  v5[5] = self;
  *(double *)&v5[6] = a3;
  return (id)TSDMixingMixedObjectWithFraction(self, a4, (uint64_t)v5);
}

id __49__TSDColorFill_mixedObjectWithFraction_ofObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  return +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "color"), "blendedColorWithFraction:ofColor:", objc_msgSend((id)TSUDynamicCast(), "color"), *(double *)(a1 + 48)));
}

- (double)p_hsbComponentWithIndex:(unint64_t)a3
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)-[TSUColor UIColor](-[TSDColorFill color](self, "color", 0, 0, 0, 0), "UIColor"), "getHue:saturation:brightness:alpha:", &v5, (char *)&v5 + 8, &v6, (char *)&v6 + 8);
  return *((double *)&v5 + a3);
}

- (CGColor)CGColor
{
  return (CGColor *)-[TSUColor CGColor](-[TSDColorFill color](self, "color"), "CGColor");
}

- (double)opacity
{
  double result;

  -[TSUColor alphaComponent](-[TSDColorFill color](self, "color"), "alphaComponent");
  return result;
}

- (double)luminance
{
  const CGFloat *Components;
  double result;
  double v4;
  _BOOL4 v5;

  Components = CGColorGetComponents(-[TSDColorFill CGColor](self, "CGColor"));
  result = Components[1] * 0.715200007 + *Components * 0.212599993 + Components[2] * 0.0722000003 * Components[3];
  v4 = 1.0;
  v5 = result < 0.0 || result > 1.0;
  if (result <= 1.0 || result < 0.0)
    v4 = 0.0;
  if (v5)
    return v4;
  return result;
}

- (double)hue
{
  double result;

  -[TSDColorFill p_hsbComponentWithIndex:](self, "p_hsbComponentWithIndex:", 0);
  return result;
}

- (double)saturation
{
  double result;

  -[TSDColorFill p_hsbComponentWithIndex:](self, "p_hsbComponentWithIndex:", 1);
  return result;
}

- (double)brightness
{
  double result;

  -[TSDColorFill p_hsbComponentWithIndex:](self, "p_hsbComponentWithIndex:", 2);
  return result;
}

+ (id)keyPathsForValuesAffectingCGColor
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingOpacity
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingLuminance
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingHue
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingSaturation
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("color"));
}

+ (id)keyPathsForValuesAffectingBrightness
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("color"));
}

- (TSUColor)color
{
  return self->mColor;
}

@end
