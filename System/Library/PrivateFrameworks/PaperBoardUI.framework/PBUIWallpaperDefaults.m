@implementation PBUIWallpaperDefaults

+ (id)defaults
{
  if (defaults___once != -1)
    dispatch_once(&defaults___once, &__block_literal_global_23);
  return (id)defaults___defaults;
}

void __33__PBUIWallpaperDefaults_defaults__block_invoke()
{
  PBUIWallpaperDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(PBUIWallpaperDefaults);
  v1 = (void *)defaults___defaults;
  defaults___defaults = (uint64_t)v0;

}

- (PBUIWallpaperDefaults)initWithdefaultsDomain:(id)a3
{
  id v5;
  PBUIWallpaperDefaults *v6;
  PBUIWallpaperDefaults *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIWallpaperDefaults;
  v6 = -[PBUIWallpaperDefaults init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_defaultsDomain, a3);

  return v7;
}

- (PBUIWallpaperDefaults)init
{
  PBUIWallpaperDefaultsDomain *v3;
  PBUIWallpaperDefaults *v4;

  v3 = objc_alloc_init(PBUIWallpaperDefaultsDomain);
  v4 = -[PBUIWallpaperDefaults initWithdefaultsDomain:](self, "initWithdefaultsDomain:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  NSRect v18;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = 1;
  do
  {
    v9 = v8;
    if ((v8 & 1) != 0)
      v10 = CFSTR("\tLock Screen\n");
    else
      v10 = CFSTR("\tHome Screen\n");
    objc_msgSend(v6, "appendFormat:", v10);
    -[PBUIWallpaperDefaults parallaxFactorForVariant:wallpaperMode:](self, "parallaxFactorForVariant:wallpaperMode:", v7, 0);
    v12 = v11;
    -[PBUIWallpaperDefaults zoomScaleForVariant:wallpaperMode:](self, "zoomScaleForVariant:wallpaperMode:", v7, 0);
    v14 = v13;
    -[PBUIWallpaperDefaults cropRectForVariant:wallpaperMode:](self, "cropRectForVariant:wallpaperMode:", v7, 0);
    NSStringFromRect(v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PBUIWallpaperDefaults supportsCroppingForVariant:wallpaperMode:](self, "supportsCroppingForVariant:wallpaperMode:", v7, 0))
    {
      v16 = CFSTR("YES");
    }
    else
    {
      v16 = CFSTR("NO");
    }
    objc_msgSend(v6, "appendFormat:", CFSTR("\t\tParallax Factor: %g, Zoom Scale: %g Crop Rect: %@ Supports Cropping: %@\n"), v12, v14, v15, v16);

    v8 = 0;
    v7 = 1;
  }
  while (v9);
  return v6;
}

- (void)resetDefaults
{
  -[PBUIWallpaperDefaults resetParallaxFactorDefaults](self, "resetParallaxFactorDefaults");
  -[PBUIWallpaperDefaults resetZoomScaleDefaults](self, "resetZoomScaleDefaults");
  -[PBUIWallpaperDefaults resetCroppingDefaults](self, "resetCroppingDefaults");
  -[PBUIWallpaperDefaults resetMagnifyDefaults](self, "resetMagnifyDefaults");
  -[PBUIWallpaperDefaults resetPortraitDefaults](self, "resetPortraitDefaults");
  -[PBUIWallpaperDefaults resetHasVideoDefaults](self, "resetHasVideoDefaults");
  -[PBUIWallpaperDefaults resetStillTimeInVideoDefaults](self, "resetStillTimeInVideoDefaults");
  -[PBUIWallpaperDefaults resetNameDefaults](self, "resetNameDefaults");
  -[PBUIWallpaperDefaults resetImageHashDefaults](self, "resetImageHashDefaults");
  -[PBUIWallpaperDefaults resetWallpaperKitDataDefaults](self, "resetWallpaperKitDataDefaults");
}

- (id)wallpaperOptionsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  PBUIWallpaperOptions *v7;
  void *v8;
  void *v9;

  v7 = objc_alloc_init(PBUIWallpaperOptions);
  -[PBUIWallpaperOptions setSupportsCropping:](v7, "setSupportsCropping:", -[PBUIWallpaperDefaults supportsCroppingForVariant:wallpaperMode:](self, "supportsCroppingForVariant:wallpaperMode:", a3, a4));
  -[PBUIWallpaperDefaults cropRectForVariant:wallpaperMode:](self, "cropRectForVariant:wallpaperMode:", a3, a4);
  -[PBUIWallpaperOptions setCropRect:](v7, "setCropRect:");
  -[PBUIWallpaperDefaults parallaxFactorForVariant:wallpaperMode:](self, "parallaxFactorForVariant:wallpaperMode:", a3, a4);
  -[PBUIWallpaperOptions setParallaxFactor:](v7, "setParallaxFactor:");
  -[PBUIWallpaperOptions setMagnifyEnabled:](v7, "setMagnifyEnabled:", -[PBUIWallpaperDefaults magnifyEnabledForVariant:wallpaperMode:](self, "magnifyEnabledForVariant:wallpaperMode:", a3, a4));
  -[PBUIWallpaperDefaults zoomScaleForVariant:wallpaperMode:](self, "zoomScaleForVariant:wallpaperMode:", a3, a4);
  -[PBUIWallpaperOptions setZoomScale:](v7, "setZoomScale:");
  -[PBUIWallpaperOptions setPortrait:](v7, "setPortrait:", -[PBUIWallpaperDefaults isPortraitForVariant:wallpaperMode:](self, "isPortraitForVariant:wallpaperMode:", a3, a4));
  -[PBUIWallpaperDefaults nameForVariant:wallpaperMode:](self, "nameForVariant:wallpaperMode:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperOptions setName:](v7, "setName:", v8);

  -[PBUIWallpaperOptions setWallpaperMode:](v7, "setWallpaperMode:", a4);
  -[PBUIWallpaperOptions setHasVideo:](v7, "setHasVideo:", -[PBUIWallpaperDefaults hasVideoForVariant:](self, "hasVideoForVariant:", a3));
  -[PBUIWallpaperDefaults stillTimeInVideoForVariant:](self, "stillTimeInVideoForVariant:", a3);
  -[PBUIWallpaperOptions setStillTimeInVideo:](v7, "setStillTimeInVideo:");
  -[PBUIWallpaperDefaults wallpaperKitDataForVariant:wallpaperMode:](self, "wallpaperKitDataForVariant:wallpaperMode:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperOptions setWallpaperKitData:](v7, "setWallpaperKitData:", v9);

  return v7;
}

- (void)setWallpaperOptions:(id)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  -[PBUIWallpaperDefaults setSupportsCropping:forLocations:wallpaperMode:](self, "setSupportsCropping:forLocations:wallpaperMode:", objc_msgSend(v8, "supportsCropping"), a4, a5);
  objc_msgSend(v8, "cropRect");
  -[PBUIWallpaperDefaults setCropRect:forLocations:wallpaperMode:](self, "setCropRect:forLocations:wallpaperMode:", a4, a5);
  objc_msgSend(v8, "parallaxFactor");
  -[PBUIWallpaperDefaults setParallaxFactor:forLocations:wallpaperMode:](self, "setParallaxFactor:forLocations:wallpaperMode:", a4, a5);
  -[PBUIWallpaperDefaults setMagnifyEnabled:forLocations:wallpaperMode:](self, "setMagnifyEnabled:forLocations:wallpaperMode:", objc_msgSend(v8, "isMagnifyEnabled"), a4, a5);
  objc_msgSend(v8, "zoomScale");
  -[PBUIWallpaperDefaults setZoomScale:forLocations:wallpaperMode:](self, "setZoomScale:forLocations:wallpaperMode:", a4, a5);
  -[PBUIWallpaperDefaults setPortrait:forLocations:wallpaperMode:](self, "setPortrait:forLocations:wallpaperMode:", objc_msgSend(v8, "isPortrait"), a4, a5);
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaults setName:forLocations:wallpaperMode:](self, "setName:forLocations:wallpaperMode:", v9, a4, a5);

  -[PBUIWallpaperDefaults setHasVideo:](self, "setHasVideo:", objc_msgSend(v8, "hasVideo"));
  objc_msgSend(v8, "stillTimeInVideo");
  -[PBUIWallpaperDefaults setStillTimeInVideo:](self, "setStillTimeInVideo:");
  objc_msgSend(v8, "wallpaperKitData");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PBUIWallpaperDefaults setWallpaperKitData:forLocations:wallpaperMode:](self, "setWallpaperKitData:forLocations:wallpaperMode:", v10, a4, a5);
}

- (void)updateDefaultsForLocations:(int64_t)a3 updater:(id)a4
{
  char v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PBUIWallpaperDefaults_updateDefaultsForLocations_updater___block_invoke;
  v8[3] = &unk_1E6B96BF0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v8);

}

uint64_t __60__PBUIWallpaperDefaults_updateDefaultsForLocations_updater___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  uint64_t result;

  for (i = 0; i != 4; ++i)
    result = objc_msgSend(*(id *)(a1 + 32), "_updateDefaultsForVariant:wallpaperMode:updater:", a2, i, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_updateDefaultsForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4 updater:(id)a5
{
  void (**v8)(id, id);
  void *v9;
  id v10;

  v8 = (void (**)(id, id))a5;
  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

  objc_msgSend(v10, "wallpaperDefaultsDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaults _setDefaultsWithDictionary:variant:wallpaperMode:](self, "_setDefaultsWithDictionary:variant:wallpaperMode:", v9, a3, a4);

}

- (id)_defaultsWrapperForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PBUIWallpaperDefaultsWrapper *v12;

  -[PBUIWallpaperDefaults defaultsDomain](self, "defaultsDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaults _keyForWallpaperMode:](self, "_keyForWallpaperMode:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (a3 != 1)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v7, "homeScreenWallpapers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "lockScreenWallpapers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v12 = -[PBUIWallpaperDefaultsWrapper initWithWallpaperDefaultsDict:]([PBUIWallpaperDefaultsWrapper alloc], "initWithWallpaperDefaultsDict:", v11);

  return v12;
}

- (void)_setDefaultsWithDictionary:(id)a3 variant:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  -[PBUIWallpaperDefaults defaultsDomain](self, "defaultsDomain");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaults _keyForWallpaperMode:](self, "_keyForWallpaperMode:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    objc_msgSend(v14, "homeScreenWallpapers");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v14, "lockScreenWallpapers");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v8, v9);

  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHomeScreenWallpapers:", v13);
LABEL_11:

    goto LABEL_12;
  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLockScreenWallpapers:", v13);
    goto LABEL_11;
  }
LABEL_12:

}

- (id)_keyForWallpaperMode:(int64_t)a3
{
  unint64_t v3;

  if ((unint64_t)a3 >= 2)
    v3 = a3;
  else
    v3 = 0;
  PBUIStringForWallpaperMode(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)resetWallpaperKitDataDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_20_0);
}

uint64_t __54__PBUIWallpaperDefaults_resetWallpaperKitDataDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperKitData:", 0);
}

- (void)setWallpaperKitData:(id)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  char v6;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PBUIWallpaperDefaults_setWallpaperKitData_forLocations_wallpaperMode___block_invoke;
  v10[3] = &unk_1E6B94FF0;
  v11 = v8;
  v12 = a5;
  v10[4] = self;
  v9 = v8;
  PBUIWallpaperEnumerateVariantsForLocations(v6, v10);

}

void __72__PBUIWallpaperDefaults_setWallpaperKitData_forLocations_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PBUIWallpaperDefaults_setWallpaperKitData_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v4, v5);

}

uint64_t __72__PBUIWallpaperDefaults_setWallpaperKitData_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperKitData:", *(_QWORD *)(a1 + 32));
}

- (id)wallpaperKitDataForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  void *v5;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wallpaperKitData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)resetParallaxFactorDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_21_0);
}

uint64_t __52__PBUIWallpaperDefaults_resetParallaxFactorDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setParallaxFactor:", 1.0);
}

- (void)setParallaxFactor:(double)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PBUIWallpaperDefaults_setParallaxFactor_forLocations_wallpaperMode___block_invoke;
  v5[3] = &unk_1E6B96C80;
  v5[4] = self;
  v5[5] = a5;
  *(double *)&v5[6] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a4, v5);
}

uint64_t __70__PBUIWallpaperDefaults_setParallaxFactor_forLocations_wallpaperMode___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v3 = (void *)a1[4];
  v2 = a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PBUIWallpaperDefaults_setParallaxFactor_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &__block_descriptor_40_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v5[4] = a1[6];
  return objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v2, v5);
}

uint64_t __70__PBUIWallpaperDefaults_setParallaxFactor_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setParallaxFactor:", *(double *)(a1 + 32));
}

- (double)parallaxFactorForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parallaxFactor");
  v6 = v5;

  return v6;
}

- (void)resetZoomScaleDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_22_0);
}

uint64_t __47__PBUIWallpaperDefaults_resetZoomScaleDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomScale:", 1.0);
}

- (void)setZoomScale:(double)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PBUIWallpaperDefaults_setZoomScale_forLocations_wallpaperMode___block_invoke;
  v5[3] = &unk_1E6B96C80;
  v5[4] = self;
  v5[5] = a5;
  *(double *)&v5[6] = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a4, v5);
}

uint64_t __65__PBUIWallpaperDefaults_setZoomScale_forLocations_wallpaperMode___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v3 = (void *)a1[4];
  v2 = a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PBUIWallpaperDefaults_setZoomScale_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &__block_descriptor_40_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v5[4] = a1[6];
  return objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v2, v5);
}

uint64_t __65__PBUIWallpaperDefaults_setZoomScale_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomScale:", *(double *)(a1 + 32));
}

- (double)zoomScaleForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoomScale");
  v6 = v5;

  return v6;
}

- (void)resetCroppingDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_23_0);
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_24_0);
}

uint64_t __46__PBUIWallpaperDefaults_resetCroppingDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

uint64_t __46__PBUIWallpaperDefaults_resetCroppingDefaults__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportsCropping:", 0);
}

- (void)setCropRect:(CGRect)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  _QWORD v5[6];
  CGRect v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PBUIWallpaperDefaults_setCropRect_forLocations_wallpaperMode___block_invoke;
  v5[3] = &unk_1E6B96CC8;
  v5[4] = self;
  v5[5] = a5;
  v6 = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a4, v5);
}

uint64_t __64__PBUIWallpaperDefaults_setCropRect_forLocations_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  _QWORD v6[4];
  __int128 v7;
  __int128 v8;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PBUIWallpaperDefaults_setCropRect_forLocations_wallpaperMode___block_invoke_2;
  v6[3] = &__block_descriptor_64_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v4 = *(_OWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v4;
  return objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v2, v6);
}

uint64_t __64__PBUIWallpaperDefaults_setCropRect_forLocations_wallpaperMode___block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (CGRect)cropRectForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
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
  CGRect result;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cropRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setSupportsCropping:(BOOL)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  _BOOL4 v7;
  _QWORD v9[6];
  BOOL v10;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PBUIWallpaperDefaults_setSupportsCropping_forLocations_wallpaperMode___block_invoke;
  v9[3] = &unk_1E6B96D10;
  v9[4] = self;
  v9[5] = a5;
  v10 = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a4, v9);
  if (v7)
    -[PBUIWallpaperDefaults setMagnifyEnabled:forLocations:wallpaperMode:](self, "setMagnifyEnabled:forLocations:wallpaperMode:", 0, a4, a5);
}

uint64_t __72__PBUIWallpaperDefaults_setSupportsCropping_forLocations_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[4];
  char v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__PBUIWallpaperDefaults_setSupportsCropping_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &__block_descriptor_33_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v6 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v2, v5);
}

uint64_t __72__PBUIWallpaperDefaults_setSupportsCropping_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportsCropping:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)supportsCroppingForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  char v5;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsCropping");

  return v5;
}

- (void)resetMagnifyDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_27_0);
}

uint64_t __45__PBUIWallpaperDefaults_resetMagnifyDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMagnifyEnabled:", 0);
}

- (void)setMagnifyEnabled:(BOOL)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  _BOOL4 v7;
  _QWORD v9[6];
  BOOL v10;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__PBUIWallpaperDefaults_setMagnifyEnabled_forLocations_wallpaperMode___block_invoke;
  v9[3] = &unk_1E6B96D10;
  v9[4] = self;
  v9[5] = a5;
  v10 = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a4, v9);
  if (v7)
    -[PBUIWallpaperDefaults setSupportsCropping:forLocations:wallpaperMode:](self, "setSupportsCropping:forLocations:wallpaperMode:", 0, a4, a5);
}

uint64_t __70__PBUIWallpaperDefaults_setMagnifyEnabled_forLocations_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[4];
  char v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PBUIWallpaperDefaults_setMagnifyEnabled_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &__block_descriptor_33_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v6 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v2, v5);
}

uint64_t __70__PBUIWallpaperDefaults_setMagnifyEnabled_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMagnifyEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)magnifyEnabledForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  char v5;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "magnifyEnabled");

  return v5;
}

- (void)resetPortraitDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_28);
}

uint64_t __46__PBUIWallpaperDefaults_resetPortraitDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPortrait:", 1);
}

- (void)setPortrait:(BOOL)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PBUIWallpaperDefaults_setPortrait_forLocations_wallpaperMode___block_invoke;
  v5[3] = &unk_1E6B96D10;
  v5[4] = self;
  v5[5] = a5;
  v6 = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a4, v5);
}

uint64_t __64__PBUIWallpaperDefaults_setPortrait_forLocations_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[4];
  char v6;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PBUIWallpaperDefaults_setPortrait_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &__block_descriptor_33_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v6 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v2, v5);
}

uint64_t __64__PBUIWallpaperDefaults_setPortrait_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPortrait:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)isPortraitForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  char v5;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "portrait");

  return v5;
}

- (void)resetNameDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_29);
}

uint64_t __42__PBUIWallpaperDefaults_resetNameDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperName:", 0);
}

- (void)setName:(id)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  char v6;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__PBUIWallpaperDefaults_setName_forLocations_wallpaperMode___block_invoke;
  v10[3] = &unk_1E6B94FF0;
  v11 = v8;
  v12 = a5;
  v10[4] = self;
  v9 = v8;
  PBUIWallpaperEnumerateVariantsForLocations(v6, v10);

}

void __60__PBUIWallpaperDefaults_setName_forLocations_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PBUIWallpaperDefaults_setName_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v4, v5);

}

uint64_t __60__PBUIWallpaperDefaults_setName_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperName:", *(_QWORD *)(a1 + 32));
}

- (id)nameForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a3 == -1)
  {
    v5 = 0;
  }
  else
  {
    -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wallpaperName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)resetImageHashDefaults
{
  -[PBUIWallpaperDefaults updateDefaultsForLocations:updater:](self, "updateDefaultsForLocations:updater:", 3, &__block_literal_global_30);
}

uint64_t __47__PBUIWallpaperDefaults_resetImageHashDefaults__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageHashData:", 0);
}

- (void)setImageHash:(id)a3 forLocations:(int64_t)a4 wallpaperMode:(int64_t)a5
{
  char v6;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  v8 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PBUIWallpaperDefaults_setImageHash_forLocations_wallpaperMode___block_invoke;
  v10[3] = &unk_1E6B94FF0;
  v11 = v8;
  v12 = a5;
  v10[4] = self;
  v9 = v8;
  PBUIWallpaperEnumerateVariantsForLocations(v6, v10);

}

void __65__PBUIWallpaperDefaults_setImageHash_forLocations_wallpaperMode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__PBUIWallpaperDefaults_setImageHash_forLocations_wallpaperMode___block_invoke_2;
  v5[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, v4, v5);

}

uint64_t __65__PBUIWallpaperDefaults_setImageHash_forLocations_wallpaperMode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageHashData:", *(_QWORD *)(a1 + 32));
}

- (id)imageHashForVariant:(int64_t)a3 wallpaperMode:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a3 == -1)
  {
    v5 = 0;
  }
  else
  {
    -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageHashData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)resetHasVideoDefaults
{
  -[PBUIWallpaperDefaults setHasVideo:](self, "setHasVideo:", 0);
}

- (void)setHasVideo:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PBUIWallpaperDefaults_setHasVideo___block_invoke;
  v3[3] = &__block_descriptor_33_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v4 = a3;
  -[PBUIWallpaperDefaults _updateDefaultsForVariant:wallpaperMode:updater:](self, "_updateDefaultsForVariant:wallpaperMode:updater:", 0, 0, v3);
}

uint64_t __37__PBUIWallpaperDefaults_setHasVideo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHasVideo:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)hasVideo
{
  return -[PBUIWallpaperDefaults hasVideoForVariant:](self, "hasVideoForVariant:", 0);
}

- (BOOL)hasVideoForVariant:(int64_t)a3
{
  void *v3;
  char v4;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasVideo");

  return v4;
}

- (void)resetStillTimeInVideoDefaults
{
  -[PBUIWallpaperDefaults setStillTimeInVideo:](self, "setStillTimeInVideo:", 0.0);
}

- (void)setStillTimeInVideo:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PBUIWallpaperDefaults_setStillTimeInVideo___block_invoke;
  v3[3] = &__block_descriptor_40_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  *(double *)&v3[4] = a3;
  -[PBUIWallpaperDefaults _updateDefaultsForVariant:wallpaperMode:updater:](self, "_updateDefaultsForVariant:wallpaperMode:updater:", 0, 0, v3);
}

uint64_t __45__PBUIWallpaperDefaults_setStillTimeInVideo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStillTimeInVideo:", *(double *)(a1 + 32));
}

- (double)stillTimeInVideo
{
  double result;

  -[PBUIWallpaperDefaults stillTimeInVideoForVariant:](self, "stillTimeInVideoForVariant:", 0);
  return result;
}

- (double)stillTimeInVideoForVariant:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stillTimeInVideo");
  v5 = v4;

  return v5;
}

- (void)setColorData:(id)a3 forLocations:(int64_t)a4
{
  char v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PBUIWallpaperDefaults_setColorData_forLocations___block_invoke;
  v8[3] = &unk_1E6B94C18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v8);

}

void __51__PBUIWallpaperDefaults_setColorData_forLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PBUIWallpaperDefaults_setColorData_forLocations___block_invoke_2;
  v4[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, 0, v4);

}

uint64_t __51__PBUIWallpaperDefaults_setColorData_forLocations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColorData:", *(_QWORD *)(a1 + 32));
}

- (id)wallpaperColorDataForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setColorName:(id)a3 forLocations:(int64_t)a4
{
  char v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PBUIWallpaperDefaults_setColorName_forLocations___block_invoke;
  v8[3] = &unk_1E6B94C18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v8);

}

void __51__PBUIWallpaperDefaults_setColorName_forLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PBUIWallpaperDefaults_setColorName_forLocations___block_invoke_2;
  v4[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, 0, v4);

}

uint64_t __51__PBUIWallpaperDefaults_setColorName_forLocations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setColorName:", *(_QWORD *)(a1 + 32));
}

- (id)wallpaperColorNameForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setGradientData:(id)a3 forLocations:(int64_t)a4
{
  char v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PBUIWallpaperDefaults_setGradientData_forLocations___block_invoke;
  v8[3] = &unk_1E6B94C18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v8);

}

void __54__PBUIWallpaperDefaults_setGradientData_forLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PBUIWallpaperDefaults_setGradientData_forLocations___block_invoke_2;
  v4[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, 0, v4);

}

uint64_t __54__PBUIWallpaperDefaults_setGradientData_forLocations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGradientData:", *(_QWORD *)(a1 + 32));
}

- (id)wallpaperGradientDataForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gradientData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setProceduralIdentifier:(id)a3 forLocations:(int64_t)a4
{
  char v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PBUIWallpaperDefaults_setProceduralIdentifier_forLocations___block_invoke;
  v8[3] = &unk_1E6B94C18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v8);

}

void __62__PBUIWallpaperDefaults_setProceduralIdentifier_forLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PBUIWallpaperDefaults_setProceduralIdentifier_forLocations___block_invoke_2;
  v4[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, 0, v4);

}

uint64_t __62__PBUIWallpaperDefaults_setProceduralIdentifier_forLocations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperIdentifier:", *(_QWORD *)(a1 + 32));
}

- (id)proceduralIdentifierForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setProceduralOptions:(id)a3 forLocations:(int64_t)a4
{
  char v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a4;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PBUIWallpaperDefaults_setProceduralOptions_forLocations___block_invoke;
  v8[3] = &unk_1E6B94C18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  PBUIWallpaperEnumerateVariantsForLocations(v4, v8);

}

void __59__PBUIWallpaperDefaults_setProceduralOptions_forLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PBUIWallpaperDefaults_setProceduralOptions_forLocations___block_invoke_2;
  v4[3] = &unk_1E6B96C38;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, 0, v4);

}

uint64_t __59__PBUIWallpaperDefaults_setProceduralOptions_forLocations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperOptions:", *(_QWORD *)(a1 + 32));
}

- (id)proceduralOptionsForVariant:(int64_t)a3
{
  void *v3;
  void *v4;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wallpaperOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setProceduralUserSet:(BOOL)a3 forLocations:(int64_t)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PBUIWallpaperDefaults_setProceduralUserSet_forLocations___block_invoke;
  v4[3] = &unk_1E6B96D78;
  v4[4] = self;
  v5 = a3;
  PBUIWallpaperEnumerateVariantsForLocations(a4, v4);
}

uint64_t __59__PBUIWallpaperDefaults_setProceduralUserSet_forLocations___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[4];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PBUIWallpaperDefaults_setProceduralUserSet_forLocations___block_invoke_2;
  v4[3] = &__block_descriptor_33_e38_v16__0__PBUIWallpaperDefaultsWrapper_8l;
  v5 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v2, "_updateDefaultsForVariant:wallpaperMode:updater:", a2, 0, v4);
}

uint64_t __59__PBUIWallpaperDefaults_setProceduralUserSet_forLocations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWallpaperWasUserSet:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)proceduralUserSetForVariant:(int64_t)a3
{
  void *v3;
  char v4;

  -[PBUIWallpaperDefaults _defaultsWrapperForVariant:wallpaperMode:](self, "_defaultsWrapperForVariant:wallpaperMode:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wallpaperWasUserSet");

  return v4;
}

- (PBUIWallpaperDefaultsDomain)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
}

@end
