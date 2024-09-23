@implementation PBUIGradientWallpaperView

+ (Class)layerClass
{
  return (Class)objc_opt_self();
}

- (PBUIGradientWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  PBUIGradientWallpaperView *v18;
  uint64_t v19;
  PBUIWallpaperGradient *wallpaperGradient;
  void *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PBUIGradientWallpaperView;
  v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v23, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  if (v18)
  {
    objc_msgSend(v17, "wallpaperGradient");
    v19 = objc_claimAutoreleasedReturnValue();
    wallpaperGradient = v18->_wallpaperGradient;
    v18->_wallpaperGradient = (PBUIWallpaperGradient *)v19;

    -[PBUIGradientWallpaperView layer](v18, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperGradient configureLayer:](v18->_wallpaperGradient, "configureLayer:", v21);

  }
  return v18;
}

- (int64_t)wallpaperType
{
  return 5;
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  if (objc_msgSend(v5, "wallpaperType") == 5)
  {
    objc_msgSend(v5, "wallpaperGradient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUIGradientWallpaperView wallpaperGradient](self, "wallpaperGradient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_computeAverageColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PBUIGradientWallpaperView wallpaperGradient](self, "wallpaperGradient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v16 = 0.0;
        v17 = 0.0;
        v15 = 0.0;
        if (objc_msgSend(v12, "getRed:green:blue:alpha:", &v17, &v16, &v15, 0))
        {
          v10 = v10 + v17 * 255.0 * (v17 * 255.0);
          v9 = v9 + v16 * 255.0 * (v16 * 255.0);
          v8 = v8 + v15 * 255.0 * (v15 * 255.0);
          ++v6;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", sqrt(v10 / (double)v6) / 255.0, sqrt(v9 / (double)v6) / 255.0, sqrt(v8 / (double)v6) / 255.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  if (a4)
    *a4 = 0.0;
  if (a5)
    *a5 = 0.0;
  return 0.0;
}

- (PBUIWallpaperGradient)wallpaperGradient
{
  return self->_wallpaperGradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperGradient, 0);
}

@end
