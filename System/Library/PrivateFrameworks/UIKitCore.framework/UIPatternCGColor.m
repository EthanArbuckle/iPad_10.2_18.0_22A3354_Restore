@implementation UIPatternCGColor

- (UIPatternCGColor)initWithCGColor:(CGColor *)a3
{
  CGColorSpace *ColorSpace;
  void *v8;
  objc_super v9;

  ColorSpace = CGColorGetColorSpace(a3);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelPattern)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIColor.m"), 1031, CFSTR("Parameter to -[UIPatternCGColor initWithCGColor:] must be a pattern color."));

  }
  v9.receiver = self;
  v9.super_class = (Class)UIPatternCGColor;
  return -[UICGColor initWithCGColor:](&v9, sel_initWithCGColor_, a3);
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_cachedUnflippedColor);
  self->_cachedUnflippedColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPatternCGColor;
  -[UICGColor dealloc](&v3, sel_dealloc);
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  return 0;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (id)description
{
  UIPatternCGColor *v2;
  CGPatternRef Pattern;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_retainAutorelease(self);
  Pattern = CGColorGetPattern(-[UICGColor CGColor](v2, "CGColor"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[UIPatternCGColor colorSpaceName](v2, "colorSpaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, Pattern);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)colorSpaceName
{
  return CFSTR("kCGColorSpaceModelPattern");
}

- (BOOL)isPatternColor
{
  return 1;
}

@end
