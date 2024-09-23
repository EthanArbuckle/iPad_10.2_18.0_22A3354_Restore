@implementation UIScreenMode

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UIScreenMode _sizeWithLevel:](self, "_sizeWithLevel:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("; size = %f x %f"), v5, v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  objc_autoreleasePoolPop(v4);
  return v3;
}

+ (id)_screenModeForDisplayMode:(id)a3 mainScreen:(BOOL)a4 actualDisplayScale:(double)a5
{
  _BOOL8 v6;
  id v7;
  const __CFDictionary *Mutable;
  UIScreenMode *v9;
  UIScreenMode *v10;

  v6 = a4;
  v7 = a3;
  Mutable = (const __CFDictionary *)sScreenModes;
  if (!sScreenModes)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    sScreenModes = (uint64_t)Mutable;
  }
  CFDictionaryGetValue(Mutable, v7);
  v9 = (UIScreenMode *)(id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[UIScreenMode initWithDisplayMode:mainScreen:actualDisplayScale:]([UIScreenMode alloc], "initWithDisplayMode:mainScreen:actualDisplayScale:", v7, v6, a5);
    CFDictionarySetValue((CFMutableDictionaryRef)sScreenModes, v7, v9);
  }
  v10 = v9;

  return v10;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  -[UIScreenMode _sizeWithLevel:](self, "_sizeWithLevel:", 2, 0, 0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_sizeWithLevel:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[FBSDisplayMode pixelSize](self->_mode, "pixelSize");
  v6 = v5;
  v8 = v7;
  if (self->_isMainScreen)
    v9 = _UIScreenForcedMainScreenScale(a3) / self->_scale;
  else
    v9 = 1.0;
  v10 = v6 * v9;
  v11 = v8 * v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIScreenMode)initWithDisplayMode:(id)a3 mainScreen:(BOOL)a4 actualDisplayScale:(double)a5
{
  id v9;
  UIScreenMode *v10;
  UIScreenMode *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIScreenMode;
  v10 = -[UIScreenMode init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mode, a3);
    v11->_isMainScreen = a4;
    v11->_scale = a5;
  }

  return v11;
}

- (CGFloat)pixelAspectRatio
{
  return 1.0;
}

- (id)_displayMode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
