@implementation UIGraphicsImageRendererFormat

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_overrideColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)UIGraphicsImageRendererFormat;
  -[UIGraphicsImageRendererFormat dealloc](&v3, sel_dealloc);
}

- (UIGraphicsImageRendererFormatRange)preferredRange
{
  return self->_preferredRange;
}

+ (id)defaultFormat
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___UIGraphicsImageRendererFormat;
  objc_msgSendSuper2(&v7, sel_defaultFormat);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOpaque:", 0);
  objc_msgSend(v2, "_setOverrideColorSpace:", 0);
  objc_msgSend(v2, "_setOverrideBitsPerComponent:", 0);
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    objc_msgSend(v2, "setPreferredRange:", 0);
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "_supportsDeepColor"))
      v4 = 1;
    else
      v4 = 2;
    objc_msgSend(v2, "setPreferredRange:", v4);

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_maximumSupportedScale");
    objc_msgSend(v2, "setScale:");

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIGraphicsImageRendererFormat;
  v4 = -[UIGraphicsRendererFormat copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOpaque:", -[UIGraphicsImageRendererFormat opaque](self, "opaque"));
  -[UIGraphicsImageRendererFormat scale](self, "scale");
  objc_msgSend(v4, "setScale:");
  v4[9] = self->_preferredRange;
  objc_msgSend(v4, "_setOverrideColorSpace:", -[UIGraphicsImageRendererFormat _overrideColorSpace](self, "_overrideColorSpace"));
  objc_msgSend(v4, "_setOverrideBitsPerComponent:", -[UIGraphicsImageRendererFormat _overrideBitsPerComponent](self, "_overrideBitsPerComponent"));
  return v4;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (void)_setOverrideColorSpace:(CGColorSpace *)a3
{
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    if (a3)
      self->_preferredRange = -1;
    CGColorSpaceRetain(a3);
    CGColorSpaceRelease(self->_overrideColorSpace);
    self->_overrideColorSpace = a3;
  }
}

- (void)_setOverrideBitsPerComponent:(int64_t)a3
{
  self->_overrideBitsPerComponent = a3;
}

- (void)setOpaque:(BOOL)opaque
{
  self->_opaque = opaque;
}

- (void)setScale:(CGFloat)scale
{
  self->_scale = scale;
}

- (double)_contextScale
{
  double result;
  void *v3;
  double v4;
  double v5;

  -[UIGraphicsImageRendererFormat scale](self, "scale");
  if (result == 0.0)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    v5 = v4;

    return v5;
  }
  return result;
}

- (CGFloat)scale
{
  return self->_scale;
}

- (CGColorSpace)_overrideColorSpace
{
  return self->_overrideColorSpace;
}

- (int64_t)_overrideBitsPerComponent
{
  return self->_overrideBitsPerComponent;
}

- (UIGraphicsImageRendererFormat)init
{
  UIGraphicsImageRendererFormat *v2;
  UIGraphicsImageRendererFormat *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsImageRendererFormat;
  v2 = -[UIGraphicsImageRendererFormat init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_overrideColorSpace = 0;
    v2->_scale = _UIScreenForcedMainScreenScale(1);
  }
  return v3;
}

- (void)setPreferredRange:(UIGraphicsImageRendererFormatRange)preferredRange
{
  UIGraphicsImageRendererFormat *v5;

  if (self->_preferredRange != preferredRange)
  {
    v5 = self;
    -[UIGraphicsImageRendererFormat _setOverrideColorSpace:](v5, "_setOverrideColorSpace:", 0);
    -[UIGraphicsImageRendererFormat _setOverrideBitsPerComponent:](v5, "_setOverrideBitsPerComponent:", 0);

    self->_preferredRange = preferredRange;
  }
}

+ (UIGraphicsImageRendererFormat)formatForTraitCollection:(UITraitCollection *)traitCollection
{
  UITraitCollection *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v10;

  v5 = traitCollection;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIGraphicsImageRenderer.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("traitCollection"));

  }
  objc_msgSend(a1, "preferredFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITraitCollection displayScale](v5, "displayScale");
  if (fabs(v7) >= 2.22044605e-16)
    objc_msgSend(v6, "setScale:");
  v8 = -[UITraitCollection displayGamut](v5, "displayGamut");
  if (v8 != -1)
    objc_msgSend(v6, "setPrefersExtendedRange:", v8 != 0);

  return (UIGraphicsImageRendererFormat *)v6;
}

- (void)setPrefersExtendedRange:(BOOL)prefersExtendedRange
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = prefersExtendedRange;
  if (-[UIGraphicsImageRendererFormat prefersExtendedRange](self, "prefersExtendedRange") != prefersExtendedRange
    || v3
    && -[UIGraphicsImageRendererFormat preferredRange](self, "preferredRange") == UIGraphicsImageRendererFormatRangeAutomatic)
  {
    if (v3)
      v5 = 1;
    else
      v5 = 2;
    -[UIGraphicsImageRendererFormat setPreferredRange:](self, "setPreferredRange:", v5);
  }
}

- (BOOL)prefersExtendedRange
{
  UIGraphicsImageRendererFormatRange v2;
  BOOL result;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v2 = -[UIGraphicsImageRendererFormat preferredRange](self, "preferredRange");
  result = 1;
  switch(v2)
  {
    case UIGraphicsImageRendererFormatRangeUnspecified:
    case UIGraphicsImageRendererFormatRangeStandard:
      goto LABEL_5;
    case UIGraphicsImageRendererFormatRangeAutomatic:
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "displayGamut");

      if (v6 == -1)
      {
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "_supportsDeepColor");

        result = v8;
      }
      else
      {
        result = v6 != 0;
      }
      break;
    case UIGraphicsImageRendererFormatRangeExtended:
      return result;
    default:
      if ((unint64_t)(v2 - 100) >= 2)
LABEL_5:
        result = 0;
      break;
  }
  return result;
}

- (BOOL)supportsHighDynamicRange
{
  return (self->_preferredRange & 0xFFFFFFFFFFFFFFFELL) == 100;
}

- (BOOL)_wantsAlphaMask
{
  return -[UIGraphicsImageRendererFormat preferredRange](self, "preferredRange") == 0x7FFF;
}

- (void)_setWantsAlphaMask:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (-[UIGraphicsImageRendererFormat _wantsAlphaMask](self, "_wantsAlphaMask") != a3)
  {
    if (v3)
      v5 = 0x7FFFLL;
    else
      v5 = 0;
    -[UIGraphicsImageRendererFormat setPreferredRange:](self, "setPreferredRange:", v5);
  }
}

- (BOOL)_grayscale
{
  return -[UIGraphicsImageRendererFormat preferredRange](self, "preferredRange") == 32766;
}

- (void)_setGrayscale:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  if (-[UIGraphicsImageRendererFormat _grayscale](self, "_grayscale") != a3)
  {
    if (v3)
      v5 = 32766;
    else
      v5 = 0;
    -[UIGraphicsImageRendererFormat setPreferredRange:](self, "setPreferredRange:", v5);
  }
}

@end
