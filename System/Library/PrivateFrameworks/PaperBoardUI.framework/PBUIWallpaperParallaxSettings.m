@implementation PBUIWallpaperParallaxSettings

+ (int64_t)_currentDeviceType
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

+ (CGSize)_requiredOverhangSizeForCurrentDevice
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "_requiredOverhangSizeForDeviceType:", objc_msgSend(a1, "_currentDeviceType"));
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)_requiredOverhangSizeForDeviceType:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  if (a3)
  {
    if (a3 == 1)
    {
      v3 = 78.0;
      v4 = 119.0;
    }
    else
    {
      v3 = *MEMORY[0x1E0C9D820];
      v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  else
  {
    v3 = 26.0;
    v4 = 64.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setDefaultValues
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIWallpaperParallaxSettings;
  -[PBUIParallaxSettings setDefaultValues](&v5, sel_setDefaultValues);
  objc_msgSend((id)objc_opt_class(), "_requiredOverhangSizeForCurrentDevice");
  v4 = v3;
  -[PBUIWallpaperParallaxSettings setOverhangX:](self, "setOverhangX:");
  -[PBUIWallpaperParallaxSettings setOverhangY:](self, "setOverhangY:", v4);
  -[PBUIWallpaperParallaxSettings setPerspectiveTransform:](self, "setPerspectiveTransform:", 0.2);
}

+ (CGSize)bestWallpaperSizeForParallaxFactor:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "bestWallpaperSizeForParallaxFactor:portrait:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") != 0, a3);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)bestWallpaperSizeForParallaxFactor:(double)a3 portrait:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_referenceBounds");
  v9 = v8;
  v11 = v10;

  objc_msgSend(a1, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", objc_msgSend(a1, "_currentDeviceType"), v4, v9, v11, a3);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (CGSize)bestWallpaperSizeForWallpaperSize:(CGSize)a3 deviceType:(int64_t)a4 parallaxFactor:(double)a5 portrait:(BOOL)a6
{
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  if (a3.width >= a3.height)
    width = a3.width;
  else
    width = a3.height;
  objc_msgSend(a1, "_requiredOverhangSizeForDeviceType:", a4, a6);
  v9 = width + (v8 + v8) * a5;
  v11 = width + (v10 + v10) * a5;
  result.height = v11;
  result.width = v9;
  return result;
}

+ (CGSize)minimumWallpaperSizeForCurrentDevice
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_motionEffectsEnabled"))
  {
    objc_msgSend(a1, "_requiredOverhangSizeForCurrentDevice");
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = v5 + v8 * 2.0;
  v11 = v7 + v9 * 2.0;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)minimumWallpaperSizeForWallpaperSize:(CGSize)a3 deviceType:(int64_t)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_motionEffectsEnabled"))
  {
    objc_msgSend(a1, "_requiredOverhangSizeForDeviceType:", a4);
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v10 = width + v8 * 2.0;
  v11 = height + v9 * 2.0;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)overhangSizeForCurrentDevice
{
  double v3;
  double v4;
  CGSize result;

  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_motionEffectsEnabled"))
  {
    objc_msgSend(a1, "_requiredOverhangSizeForCurrentDevice");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
    v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)overhangSizeForDeviceType:(int64_t)a3
{
  double v5;
  double v6;
  CGSize result;

  if (objc_msgSend(MEMORY[0x1E0CEABB0], "_motionEffectsEnabled"))
  {
    objc_msgSend(a1, "_requiredOverhangSizeForDeviceType:", a3);
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

+ (double)minimumZoomScaleForWallpaperSize:(CGSize)a3 parallaxFactor:(double)a4 deviceType:(int64_t)a5
{
  double width;
  double result;
  double v7;

  width = a3.width;
  result = 1.0;
  if (a4 != 0.0)
  {
    objc_msgSend(a1, "overhangSizeForDeviceType:", a5, 1.0, a3.height);
    return 1.0 / ((width - v7 - v7) / width);
  }
  return result;
}

+ (double)minimumZoomScaleForCurrentDeviceForWallpaperSize:(CGSize)a3 parallaxFactor:(double)a4
{
  double result;

  objc_msgSend(a1, "minimumZoomScaleForWallpaperSize:parallaxFactor:deviceType:", objc_msgSend(a1, "_currentDeviceType"), a3.width, a3.height, a4);
  return result;
}

+ (id)settingsControllerModule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal overhang (pts)"), CFSTR("overhangX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "precision:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical overhang (pts)"), CFSTR("overhangY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Perspective transform"), CFSTR("perspectiveTransform"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D83078];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___PBUIWallpaperParallaxSettings;
  objc_msgSendSuper2(&v17, sel_settingsControllerModule);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submoduleWithModule:childSettingsKeyPath:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v9;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Wallpaper"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)overhangX
{
  return self->_overhangX;
}

- (void)setOverhangX:(double)a3
{
  self->_overhangX = a3;
}

- (double)overhangY
{
  return self->_overhangY;
}

- (void)setOverhangY:(double)a3
{
  self->_overhangY = a3;
}

- (double)perspectiveTransform
{
  return self->_perspectiveTransform;
}

- (void)setPerspectiveTransform:(double)a3
{
  self->_perspectiveTransform = a3;
}

@end
