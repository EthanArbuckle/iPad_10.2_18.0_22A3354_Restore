@implementation PBUIWallpaperLegibilityTreatment

- (BOOL)commitToRenderingTree:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  CALayer *v8;
  CALayer *dimmingLayer;
  CABackdropLayer *v10;
  CABackdropLayer *luminanceBackdropLayer;
  CABackdropLayer *v12;
  UIColor *averageColor;
  UIColor *v14;
  UIColor *v15;
  CALayer *v16;
  CALayer *dimmedColorLayer;
  void *v18;
  CALayer *v19;
  id v20;
  CALayer *v21;
  CAGradientLayer *v22;
  CAGradientLayer *gradientLayer;
  CAGradientLayer *v24;

  v6 = a3;
  v7 = v6;
  if (*(_WORD *)&self->_needsLuminanceTreatment)
  {
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);
    if (self->_needsDimmingTreatment)
    {
      -[PBUIWallpaperLegibilityTreatment makeDimmingLayer](self, "makeDimmingLayer");
      v8 = (CALayer *)objc_claimAutoreleasedReturnValue();
      dimmingLayer = self->_dimmingLayer;
      self->_dimmingLayer = v8;

      -[CALayer setDelegate:](self->_dimmingLayer, "setDelegate:", self);
      objc_msgSend(v7, "addSublayer:", self->_dimmingLayer);
    }
    if (self->_needsLuminanceTreatment)
    {
      -[PBUIWallpaperLegibilityTreatment makeLuminanceBackdropLayer](self, "makeLuminanceBackdropLayer");
      v10 = (CABackdropLayer *)objc_claimAutoreleasedReturnValue();
      luminanceBackdropLayer = self->_luminanceBackdropLayer;
      self->_luminanceBackdropLayer = v10;

      -[CABackdropLayer setDelegate:](self->_luminanceBackdropLayer, "setDelegate:", self);
      v12 = self->_luminanceBackdropLayer;
      objc_msgSend(v7, "bounds");
      -[CABackdropLayer setFrame:](v12, "setFrame:");
      objc_msgSend(v7, "addSublayer:", self->_luminanceBackdropLayer);
    }
    if (self->_needsDimmingTreatment)
    {
      averageColor = self->_averageColor;
      if (averageColor)
      {
        v14 = averageColor;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
        v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v16 = (CALayer *)objc_claimAutoreleasedReturnValue();
      dimmedColorLayer = self->_dimmedColorLayer;
      self->_dimmedColorLayer = v16;

      -[PBUIWallpaperLegibilityTreatment colorByDimmingColor:](self, "colorByDimmingColor:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_dimmedColorLayer;
      v20 = objc_retainAutorelease(v18);
      -[CALayer setBackgroundColor:](v19, "setBackgroundColor:", objc_msgSend(v20, "CGColor"));
      -[CALayer setCompositingFilter:](self->_dimmedColorLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2E58]);
      -[CALayer setDelegate:](self->_dimmedColorLayer, "setDelegate:", self);
      v21 = self->_dimmedColorLayer;
      objc_msgSend(v7, "bounds");
      -[CALayer setFrame:](v21, "setFrame:");
      objc_msgSend(v7, "addSublayer:", self->_dimmedColorLayer);

    }
    if (self->_needsLuminanceTreatment)
    {
      -[PBUIWallpaperLegibilityTreatment makeGradientLayer](self, "makeGradientLayer");
      v22 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
      gradientLayer = self->_gradientLayer;
      self->_gradientLayer = v22;

      -[CAGradientLayer setDelegate:](self->_gradientLayer, "setDelegate:", self);
      v24 = self->_gradientLayer;
      objc_msgSend(v7, "bounds");
      -[CAGradientLayer setFrame:](v24, "setFrame:");
      objc_msgSend(v7, "addSublayer:", self->_gradientLayer);
    }
    objc_msgSend(v7, "setShouldRasterize:", self->_needsDimmingTreatment);
  }

  return 1;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "bounds");
    objc_msgSend(v5, "setFrame:");
  }

}

- (id)luminanceTreatmentFilters
{
  void *v2;
  void *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  size_t PrimaryImageIndex;
  CGImageRef ImageAtIndex;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  PBUIWallpaperTreatmentBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    -[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters].cold.1();
  v3 = v2;
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("WallpaperLuminanceMap"), CFSTR("png"));
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    -[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters].cold.2();
  v5 = v4;
  v6 = CGImageSourceCreateWithURL(v4, 0);
  if (!v6)
LABEL_10:
    -[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters].cold.3();
  v7 = v6;
  if (!CGImageSourceGetCount(v6))
  {
    CFRelease(v7);
    goto LABEL_10;
  }
  PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v7);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, PrimaryImageIndex, 0);
  CFRelease(v7);
  if (!ImageAtIndex)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", ImageAtIndex, CFSTR("inputColorMap"));

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", &unk_1E6BC3578, CFSTR("inputAmount"));
  v14[0] = v11;
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)makeDimmingLayer
{
  id v2;
  CGColor *SRGB;

  v2 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 0.1);
  objc_msgSend(v2, "setBackgroundColor:", SRGB);
  CGColorRelease(SRGB);
  objc_msgSend(v2, "setCompositingFilter:", *MEMORY[0x1E0CD2C30]);
  return v2;
}

- (id)makeLuminanceBackdropLayer
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD2708], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters](self, "luminanceTreatmentFilters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", v4);

  return v3;
}

- (id)colorByDimmingColor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v6 * -0.589999974 + v7 * -0.300000012 + v5 * -0.109999999 + v4 * 0.0 + 1.0, v6 * -0.589999974 + v7 * -0.300000012 + v5 * -0.109999999 + v4 * 0.0 + 1.0, v6 * -0.589999974 + v7 * -0.300000012 + v5 * -0.109999999 + v4 * 0.0 + 1.0, v6 * 0.0 + v7 * 0.0 + v5 * 0.0 + v4 * 0.5 + 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeGradientLayer
{
  void *v2;
  CFIndex v3;
  __CFArray *Mutable;
  CGColorSpace *v5;
  CGFloat *v6;
  CGColorRef v7;
  CGColorRef v8;
  void *v9;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(&unk_1E6BC3400, "count");
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, MEMORY[0x1E0C9B378]);
  v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  if (v3)
  {
    v6 = (CGFloat *)&qword_1B723FC10;
    do
    {
      components[0] = 0.0;
      components[1] = *v6;
      v7 = CGColorCreate(v5, components);
      if (v7)
      {
        v8 = v7;
        CFArrayAppendValue(Mutable, v7);
        CFRelease(v8);
      }
      ++v6;
      --v3;
    }
    while (v3);
  }
  objc_msgSend(v2, "setColors:", Mutable);
  CFRelease(Mutable);
  CGColorSpaceRelease(v5);
  objc_msgSend(v2, "setLocations:", &unk_1E6BC3400);
  objc_msgSend(v2, "setStartPoint:", 0.5, 0.0);
  objc_msgSend(v2, "setEndPoint:", 0.5, 1.0);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C30]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompositingFilter:", v9);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  UIColor *averageColor;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setNeedsDimmingTreatment:", self->_needsDimmingTreatment);
  objc_msgSend(v4, "setNeedsLuminanceTreatment:", self->_needsLuminanceTreatment);
  averageColor = self->_averageColor;
  if (averageColor)
  {
    v6 = (void *)-[UIColor copy](averageColor, "copy");
    objc_msgSend(v4, "setAverageColor:", v6);

  }
  else
  {
    objc_msgSend(v4, "setAverageColor:", 0);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUIWallpaperLegibilityTreatment)initWithCoder:(id)a3
{
  id v4;
  PBUIWallpaperLegibilityTreatment *v5;
  uint64_t v6;
  UIColor *averageColor;

  v4 = a3;
  v5 = -[PBUIWallpaperLegibilityTreatment init](self, "init");
  if (v5)
  {
    v5->_needsDimmingTreatment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NeedsDimmingTreatment"));
    v5->_needsLuminanceTreatment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NeedsLuminanceTreatment"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AverageColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    averageColor = v5->_averageColor;
    v5->_averageColor = (UIColor *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 needsDimmingTreatment;
  id v5;

  needsDimmingTreatment = self->_needsDimmingTreatment;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", needsDimmingTreatment, CFSTR("NeedsDimmingTreatment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_needsLuminanceTreatment, CFSTR("NeedsLuminanceTreatment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_averageColor, CFSTR("AverageColor"));

}

- (BOOL)needsLuminanceTreatment
{
  return self->_needsLuminanceTreatment;
}

- (void)setNeedsLuminanceTreatment:(BOOL)a3
{
  self->_needsLuminanceTreatment = a3;
}

- (BOOL)needsDimmingTreatment
{
  return self->_needsDimmingTreatment;
}

- (void)setNeedsDimmingTreatment:(BOOL)a3
{
  self->_needsDimmingTreatment = a3;
}

- (UIColor)averageColor
{
  return self->_averageColor;
}

- (void)setAverageColor:(id)a3
{
  objc_storeStrong((id *)&self->_averageColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageColor, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_luminanceBackdropLayer, 0);
  objc_storeStrong((id *)&self->_dimmedColorLayer, 0);
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
}

- (void)luminanceTreatmentFilters
{
  __assert_rtn("-[PBUIWallpaperLegibilityTreatment luminanceTreatmentFilters]", "PBUIWallpaperLegibilityTreatment.m", 107, "imageRef");
}

@end
