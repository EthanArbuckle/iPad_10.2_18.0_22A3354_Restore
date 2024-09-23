@implementation _SBSUIWallpaperGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_SBSUIWallpaperGradientView)initWithFrame:(CGRect)a3
{
  _SBSUIWallpaperGradientView *v3;
  _SBSUIWallpaperGradientView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_SBSUIWallpaperGradientView;
  v3 = -[_SBSUIWallpaperGradientView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SBSUIWallpaperGradientView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBSUIWallpaperGradientView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_retainAutorelease(v5);
    v13[0] = objc_msgSend(v8, "CGColor");
    v9 = objc_retainAutorelease(v6);
    v13[1] = objc_msgSend(v9, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setColors:", v10);

  }
  return v4;
}

@end
