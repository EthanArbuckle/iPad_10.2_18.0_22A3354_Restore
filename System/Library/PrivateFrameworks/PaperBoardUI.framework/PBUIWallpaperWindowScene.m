@implementation PBUIWallpaperWindowScene

- (int64_t)wallpaperVariant
{
  void *v2;
  int64_t v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wallpaperVariant");

  return v3;
}

- (CGRect)lockscreenWallpaperContentsRect
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenWallpaperContentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)lockscreenWallpaperAlpha
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenWallpaperAlpha");
  v4 = v3;

  return v4;
}

- (double)homescreenWallpaperAlpha
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenWallpaperAlpha");
  v4 = v3;

  return v4;
}

- (double)lockscreenOnlyWallpaperAlpha
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenOnlyWallpaperAlpha");
  v4 = v3;

  return v4;
}

- (BOOL)disallowHomescreenRasterization
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disallowHomescreenRasterization");

  return v3;
}

- (BOOL)disallowLockscreenRasterization
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disallowLockscreenRasterization");

  return v3;
}

- (BOOL)wallpaperAnimationSuspended
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wallpaperAnimationSuspended");

  return v3;
}

- (BOOL)wallpaperRequired
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wallpaperRequired");

  return v3;
}

- (BOOL)homescreenStyleChangesDelayed
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "homescreenStyleChangesDelayed");

  return v3;
}

- (NSString)cachingIdentifier
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)homescreenStyleTransitionState
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenStyleTransitionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)lockscreenStyleTransitionState
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenStyleTransitionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (BOOL)liveWallpaperTouchActive
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "liveWallpaperTouchActive");

  return v3;
}

- (BOOL)liveWallpaperInteractive
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneSettings](self, "_wallpaperSceneSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "liveWallpaperInteractive");

  return v3;
}

- (double)homescreenMinimumWallpaperScale
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenMinimumWallpaperScale");
  v4 = v3;

  return v4;
}

- (void)setHomescreenMinimumWallpaperScale:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PBUIWallpaperWindowScene_setHomescreenMinimumWallpaperScale___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __63__PBUIWallpaperWindowScene_setHomescreenMinimumWallpaperScale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenMinimumWallpaperScale:", *(double *)(a1 + 32));
}

- (double)lockscreenMinimumWallpaperScale
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenMinimumWallpaperScale");
  v4 = v3;

  return v4;
}

- (void)setLockscreenMinimumWallpaperScale:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__PBUIWallpaperWindowScene_setLockscreenMinimumWallpaperScale___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __63__PBUIWallpaperWindowScene_setLockscreenMinimumWallpaperScale___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenMinimumWallpaperScale:", *(double *)(a1 + 32));
}

- (_UILegibilitySettings)homescreenLegibilitySettings
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenLegibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v3;
}

- (void)setHomescreenLegibilitySettings:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PBUIWallpaperWindowScene_setHomescreenLegibilitySettings___block_invoke;
  v6[3] = &unk_1E6B95088;
  v7 = v4;
  v5 = v4;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v6);

}

uint64_t __60__PBUIWallpaperWindowScene_setHomescreenLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenLegibilitySettings:", *(_QWORD *)(a1 + 32));
}

- (_UILegibilitySettings)lockscreenLegibilitySettings
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenLegibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v3;
}

- (void)setLockscreenLegibilitySettings:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PBUIWallpaperWindowScene_setLockscreenLegibilitySettings___block_invoke;
  v6[3] = &unk_1E6B95088;
  v7 = v4;
  v5 = v4;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v6);

}

uint64_t __60__PBUIWallpaperWindowScene_setLockscreenLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenLegibilitySettings:", *(_QWORD *)(a1 + 32));
}

- (UIColor)homescreenAverageColor
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenAverageColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setHomescreenAverageColor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PBUIWallpaperWindowScene_setHomescreenAverageColor___block_invoke;
  v6[3] = &unk_1E6B95088;
  v7 = v4;
  v5 = v4;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v6);

}

uint64_t __54__PBUIWallpaperWindowScene_setHomescreenAverageColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenAverageColor:", *(_QWORD *)(a1 + 32));
}

- (UIColor)lockscreenAverageColor
{
  void *v2;
  void *v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenAverageColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setLockscreenAverageColor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PBUIWallpaperWindowScene_setLockscreenAverageColor___block_invoke;
  v6[3] = &unk_1E6B95088;
  v7 = v4;
  v5 = v4;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v6);

}

uint64_t __54__PBUIWallpaperWindowScene_setLockscreenAverageColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenAverageColor:", *(_QWORD *)(a1 + 32));
}

- (double)homescreenContrast
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenContrast");
  v4 = v3;

  return v4;
}

- (void)setHomescreenContrast:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PBUIWallpaperWindowScene_setHomescreenContrast___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __50__PBUIWallpaperWindowScene_setHomescreenContrast___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenContrast:", *(double *)(a1 + 32));
}

- (double)lockscreenContrast
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenContrast");
  v4 = v3;

  return v4;
}

- (void)setLockscreenContrast:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__PBUIWallpaperWindowScene_setLockscreenContrast___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __50__PBUIWallpaperWindowScene_setLockscreenContrast___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenContrast:", *(double *)(a1 + 32));
}

- (double)homescreenParallaxFactor
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenParallaxFactor");
  v4 = v3;

  return v4;
}

- (void)setHomescreenParallaxFactor:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PBUIWallpaperWindowScene_setHomescreenParallaxFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __56__PBUIWallpaperWindowScene_setHomescreenParallaxFactor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenParallaxFactor:", *(double *)(a1 + 32));
}

- (double)lockscreenParallaxFactor
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenParallaxFactor");
  v4 = v3;

  return v4;
}

- (void)setLockscreenParallaxFactor:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PBUIWallpaperWindowScene_setLockscreenParallaxFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __56__PBUIWallpaperWindowScene_setLockscreenParallaxFactor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenParallaxFactor:", *(double *)(a1 + 32));
}

- (BOOL)homescreenParallaxEnabled
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "homescreenParallaxEnabled");

  return v3;
}

- (void)setHomescreenParallaxEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PBUIWallpaperWindowScene_setHomescreenParallaxEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  v4 = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __57__PBUIWallpaperWindowScene_setHomescreenParallaxEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenParallaxEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)lockscreenParallaxEnabled
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockscreenParallaxEnabled");

  return v3;
}

- (void)setLockscreenParallaxEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__PBUIWallpaperWindowScene_setLockscreenParallaxEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  v4 = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __57__PBUIWallpaperWindowScene_setLockscreenParallaxEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenParallaxEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (double)homescreenZoomFactor
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homescreenZoomFactor");
  v4 = v3;

  return v4;
}

- (void)setHomescreenZoomFactor:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PBUIWallpaperWindowScene_setHomescreenZoomFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __52__PBUIWallpaperWindowScene_setHomescreenZoomFactor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenZoomFactor:", *(double *)(a1 + 32));
}

- (double)lockscreenZoomFactor
{
  void *v2;
  double v3;
  double v4;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockscreenZoomFactor");
  v4 = v3;

  return v4;
}

- (void)setLockscreenZoomFactor:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__PBUIWallpaperWindowScene_setLockscreenZoomFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __52__PBUIWallpaperWindowScene_setLockscreenZoomFactor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenZoomFactor:", *(double *)(a1 + 32));
}

- (BOOL)isHomescreenContentStatic
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHomescreenContentStatic");

  return v3;
}

- (void)setHomescreenContentStatic:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PBUIWallpaperWindowScene_setHomescreenContentStatic___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  v4 = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __55__PBUIWallpaperWindowScene_setHomescreenContentStatic___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHomescreenContentStatic:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isLockscreenContentStatic
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLockscreenContentStatic");

  return v3;
}

- (void)setLockscreenContentStatic:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PBUIWallpaperWindowScene_setLockscreenContentStatic___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  v4 = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __55__PBUIWallpaperWindowScene_setLockscreenContentStatic___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenContentStatic:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isLockscreenContentLiveWallpaper
{
  void *v2;
  char v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLockscreenContentLiveWallpaper");

  return v3;
}

- (void)setLockscreenContentIsLiveWallpaper:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PBUIWallpaperWindowScene_setLockscreenContentIsLiveWallpaper___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  v4 = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __64__PBUIWallpaperWindowScene_setLockscreenContentIsLiveWallpaper___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLockscreenContentLiveWallpaper:", *(unsigned __int8 *)(a1 + 32));
}

- (int64_t)liveWallpaperPlaybackState
{
  void *v2;
  int64_t v3;

  -[PBUIWallpaperWindowScene _wallpaperSceneClientSettings](self, "_wallpaperSceneClientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "liveWallpaperPlaybackState");

  return v3;
}

- (void)setLiveWallpaperPlaybackState:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PBUIWallpaperWindowScene_setLiveWallpaperPlaybackState___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  v3[4] = a3;
  -[PBUIWallpaperWindowScene _updateWallpaperSceneClientSettingsWithBlock:](self, "_updateWallpaperSceneClientSettingsWithBlock:", v3);
}

uint64_t __58__PBUIWallpaperWindowScene_setLiveWallpaperPlaybackState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLiveWallpaperPlaybackState:", *(_QWORD *)(a1 + 32));
}

- (void)noteWallpaperWillChangeForVariant:(int64_t)a3
{
  void *v4;
  PBUIWallpaperWillChangeAction *v5;
  void *v6;
  id v7;

  -[PBUIWallpaperWindowScene _FBSScene](self, "_FBSScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = -[PBUIWallpaperWillChangeAction initWithVariant:]([PBUIWallpaperWillChangeAction alloc], "initWithVariant:", a3);
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendActions:", v6);

}

- (void)noteWallpaperDidChangeForVariant:(int64_t)a3
{
  void *v4;
  PBUIWallpaperDidChangeAction *v5;
  void *v6;
  id v7;

  -[PBUIWallpaperWindowScene _FBSScene](self, "_FBSScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = -[PBUIWallpaperDidChangeAction initWithVariant:]([PBUIWallpaperDidChangeAction alloc], "initWithVariant:", a3);
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendActions:", v6);

}

- (void)noteWallpaperDidCompleteWallpaperChange
{
  void *v2;
  PBUIWallpaperDidCompleteWallpaperChangeAction *v3;
  void *v4;
  id v5;

  -[PBUIWallpaperWindowScene _FBSScene](self, "_FBSScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_alloc_init(PBUIWallpaperDidCompleteWallpaperChangeAction);
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendActions:", v4);

}

- (id)_wallpaperSceneSettings
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[PBUIWallpaperWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (id)_wallpaperSceneClientSettings
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[PBUIWallpaperWindowScene _FBSScene](self, "_FBSScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)_updateWallpaperSceneClientSettingsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PBUIWallpaperWindowScene _FBSScene](self, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PBUIWallpaperWindowScene__updateWallpaperSceneClientSettingsWithBlock___block_invoke;
  v7[3] = &unk_1E6B950D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateClientSettingsWithBlock:", v7);

}

void __73__PBUIWallpaperWindowScene__updateWallpaperSceneClientSettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_updateWallpaperVariant:(int64_t)a3 inAnimationSettings:(id)a4 outAnimationSettings:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "wallpaperWindowScene:didUpdateVariant:inAnimationSettings:outAnimationSettings:", self, a3, v10, v8);

}

- (void)_updateLockscreenWallpaperContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "wallpaperWindowScene:didUpdateLockscreenWallpaperContentsRect:", self, x, y, width, height);

}

- (void)_updateLockscreenWallpaperAlpha:(double)a3
{
  id v5;

  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateLockscreenWallpaperAlpha:", self, a3);

}

- (void)_updateHomescreenWallpaperAlpha:(double)a3
{
  id v5;

  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateHomescreenWallpaperAlpha:", self, a3);

}

- (void)_updateLockscreenOnlyWallpaperAlpha:(double)a3
{
  id v5;

  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateLockscreenOnlyWallpaperAlpha:", self, a3);

}

- (void)_updateDisallowRasterizationForHomescreen:(BOOL)a3 lockscreen:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "wallpaperWindowScene:didUpdateRasterizationDisallowedForHomescreen:lockscreen:", self, v5, v4);

}

- (void)_updateWallpaperHiddenForHomescreen:(BOOL)a3 lockscreen:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;

  v4 = a4;
  v5 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "wallpaperWindowScene:didUpdateHomescreenWallpaperHidden:lockscreenWallpaperHidden:", self, v5, v4);

}

- (void)_updateWallpaperAnimationSuspended:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateWallpaperAnimationSuspended:", self, v3);

}

- (void)_updateWallpaperRequired:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateWallpaperRequired:", self, v3);

}

- (void)_updateHomescreenStyleChangesDelayed:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateHomescreenStyleChangesDelayed:", self, v3);

}

- (void)_updateHomescreenStyleTransitionStateTo:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "wallpaperWindowScene:didUpdateHomescreenStyleTransitionStateTo:from:", self, v8, v6);

}

- (void)_updateLockscreenStyleTransitionStateTo:(id)a3 from:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "wallpaperWindowScene:didUpdateLockscreenStyleTransitionStateTo:from:", self, v8, v6);

}

- (void)_updateLiveWallpaperTouchActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateLiveWallpaperTouchActive:", self, v3);

}

- (void)_updateLiveWallpaperInteractive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "wallpaperWindowScene:didUpdateLiveWallpaperInteractive:", self, v3);

}

- (void)_handleImageSlotRequestAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PBUIImageSlotRepository *wallpaperEffectImageSlots;
  PBUIImageSlotRepository *v12;
  PBUIImageSlotRepository *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  id location;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v35 = objc_msgSend(v4, "desiredStyle");
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__2;
    v30 = __Block_byref_object_dispose__2;
    v31 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    v25 = 0;
    v6 = objc_msgSend(v4, "variant");
    v7 = v33[3];
    objc_msgSend(v4, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke;
    v19[3] = &unk_1E6B94BA0;
    v19[4] = &v26;
    v19[5] = &v20;
    v19[6] = &v32;
    objc_msgSend(v5, "wallpaperWindowScene:requestsWallpaperEffectImageForVariant:style:traitCollection:result:", self, v6, v7, v8, v19);

    if (v27[5])
    {
      objc_msgSend(v4, "slotIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      wallpaperEffectImageSlots = self->_wallpaperEffectImageSlots;
      if (!wallpaperEffectImageSlots)
      {
        v12 = -[PBUIImageSlotRepository initWithWindowScene:]([PBUIImageSlotRepository alloc], "initWithWindowScene:", self);
        v13 = self->_wallpaperEffectImageSlots;
        self->_wallpaperEffectImageSlots = v12;

        wallpaperEffectImageSlots = self->_wallpaperEffectImageSlots;
      }
      objc_msgSend((id)v27[5], "size");
      -[PBUIImageSlotRepository allocateImageSlotForIdentifier:size:actualStyle:url:lifetimeObject:](wallpaperEffectImageSlots, "allocateImageSlotForIdentifier:size:actualStyle:url:lifetimeObject:", v10, v33[3], v21[5], v4);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_2;
      v14[3] = &unk_1E6B950F8;
      objc_copyWeak(&v15, &location);
      objc_copyWeak(&v16, &from);
      objc_msgSend(v4, "setNullificationHandler:", v14);
      -[PBUIImageSlotRepository setImageSlot:forIdentifier:](self->_wallpaperEffectImageSlots, "setImageSlot:forIdentifier:", v27[5], v10);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v32, 8);
  }

}

void __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1[4] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(a1[5] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
}

void __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_3;
  v5[3] = &unk_1E6B94BC8;
  v5[4] = WeakRetained;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      v4 = *(void **)(v1 + 480);
      objc_msgSend(v3, "slotIdentifier");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "freeImageSlotWithIdentifier:lifetime:", v5, *(_QWORD *)(a1 + 40));

    }
  }
}

- (void)_handleWallpaperEffectImageRequestAction:(id)a3
{
  void *v4;
  _BOOL4 v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  void *v12;
  PBUIWallpaperEffectImageRequestActionImageURLResponse *v13;
  void *v14;
  PBUIWallpaperEffectImageRequestActionIOSurfaceResponse *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "slotIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PBUIImageSlotRepository hasSlotForIdentifier:](self->_wallpaperEffectImageSlots, "hasSlotForIdentifier:", v4);
  v6 = objc_msgSend(v20, "canSendResponse");
  if (v5)
  {
    if (v6)
    {
      -[PBUIImageSlotRepository sizeForIdentifier:](self->_wallpaperEffectImageSlots, "sizeForIdentifier:", v4);
      v8 = v7;
      v10 = v9;
      v11 = -[PBUIImageSlotRepository actualStyleForIdentifier:](self->_wallpaperEffectImageSlots, "actualStyleForIdentifier:", v4);
      -[PBUIImageSlotRepository urlForIdentifier:](self->_wallpaperEffectImageSlots, "urlForIdentifier:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        -[PBUIImageSlotRepository ioSurfaceForIdentifier:](self->_wallpaperEffectImageSlots, "ioSurfaceForIdentifier:", v4);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v15 = -[PBUIWallpaperEffectImageRequestActionIOSurfaceResponse initWithActualStyle:size:ioSurface:]([PBUIWallpaperEffectImageRequestActionIOSurfaceResponse alloc], "initWithActualStyle:size:ioSurface:", v11, v16, v8, v10);

        }
        else
        {
          v18 = (void *)MEMORY[0x1E0D016A8];
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PBUIErrorDomain"), 0, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "responseForError:", v19);
          v15 = (PBUIWallpaperEffectImageRequestActionIOSurfaceResponse *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_8;
      }
      v13 = -[PBUIWallpaperEffectImageRequestActionImageURLResponse initWithActualStyle:size:imageURL:]([PBUIWallpaperEffectImageRequestActionImageURLResponse alloc], "initWithActualStyle:size:imageURL:", v11, v12, v8, v10);
LABEL_7:
      v15 = (PBUIWallpaperEffectImageRequestActionIOSurfaceResponse *)v13;
LABEL_8:
      objc_msgSend(v20, "sendResponse:", v15);

    }
  }
  else if (v6)
  {
    v14 = (void *)MEMORY[0x1E0D016A8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "responseForError:", v12);
    v13 = (PBUIWallpaperEffectImageRequestActionImageURLResponse *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

}

- (void)_handlePreheatAction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "wallpaperWindowScene:didReceivePreheatRequestForVariant:", self, objc_msgSend(v5, "variant"));

}

- (void)_handleUpdateAndPrewarmAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Update and prewarm"), 0);

    objc_msgSend(v4, "wallpaperWindowSceneDidReceiveUpdateAndPrewarmRequest:", self);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endBackgroundTask:", v6);

  }
  if (objc_msgSend(v9, "canSendResponse"))
  {
    objc_msgSend(MEMORY[0x1E0D016A8], "response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendResponse:", v8);

  }
}

- (void)_handleUpdateLocationsAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PBUIWallpaperUpdateActionResponse *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PBUIWallpaperWindowScene delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "locations");
    v7 = objc_msgSend(v4, "wallpaperMode");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PBUIWallpaperWindowScene__handleUpdateLocationsAction___block_invoke;
    v9[3] = &unk_1E6B94728;
    v10 = v4;
    objc_msgSend(v5, "wallpaperWindowScene:didReceiveUpdateRequestForLocations:wallpaperMode:completion:", self, v6, v7, v9);

  }
  else if (objc_msgSend(v4, "canSendResponse"))
  {
    v8 = objc_alloc_init(PBUIWallpaperUpdateActionResponse);
    objc_msgSend(v4, "sendResponse:", v8);

  }
}

void __57__PBUIWallpaperWindowScene__handleUpdateLocationsAction___block_invoke(uint64_t a1)
{
  void *v2;
  PBUIWallpaperUpdateActionResponse *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = objc_alloc_init(PBUIWallpaperUpdateActionResponse);
    objc_msgSend(v2, "sendResponse:", v3);

  }
}

- (BOOL)homescreenWallpaperHidden
{
  return self->_homescreenWallpaperHidden;
}

- (BOOL)lockscreenWallpaperHidden
{
  return self->_lockscreenWallpaperHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectImageSlots, 0);
}

@end
