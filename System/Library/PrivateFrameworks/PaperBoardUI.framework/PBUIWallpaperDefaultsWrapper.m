@implementation PBUIWallpaperDefaultsWrapper

- (PBUIWallpaperDefaultsWrapper)initWithWallpaperDefaultsDict:(id)a3
{
  id v4;
  PBUIWallpaperDefaultsWrapper *v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;
  CGRect v45;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)PBUIWallpaperDefaultsWrapper;
  v5 = -[PBUIWallpaperDefaultsWrapper init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperParallaxFactorKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperParallaxFactorKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      -[PBUIWallpaperDefaultsWrapper setParallaxFactor:](v5, "setParallaxFactor:", v8);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperZoomScaleKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperZoomScaleKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      -[PBUIWallpaperDefaultsWrapper setZoomScale:](v5, "setZoomScale:", v11);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperCropRectStringKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperCropRectStringKey"));
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v45 = CGRectFromString(v13);
      -[PBUIWallpaperDefaultsWrapper setCropRect:](v5, "setCropRect:", v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperSupportsCroppingKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperSupportsCroppingKey"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setSupportsCropping:](v5, "setSupportsCropping:", objc_msgSend(v15, "BOOLValue"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperMagnifyEnabledKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperMagnifyEnabledKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setMagnifyEnabled:](v5, "setMagnifyEnabled:", objc_msgSend(v17, "BOOLValue"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperPortraitKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperPortraitKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setPortrait:](v5, "setPortrait:", objc_msgSend(v19, "BOOLValue"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperNameKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperNameKey"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setWallpaperName:](v5, "setWallpaperName:", v21);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperImageHashDataKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperImageHashDataKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setImageHashData:](v5, "setImageHashData:", v23);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperHasVideoKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperHasVideoKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setHasVideo:](v5, "setHasVideo:", objc_msgSend(v25, "BOOLValue"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperStillTimeInVideoKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperStillTimeInVideoKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      -[PBUIWallpaperDefaultsWrapper setStillTimeInVideo:](v5, "setStillTimeInVideo:", v28);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperColorDataKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperColorDataKey"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setColorData:](v5, "setColorData:", v30);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperColorNameKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperColorNameKey"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setColorName:](v5, "setColorName:", v32);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperGradientDataKey"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperGradientDataKey"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setGradientData:](v5, "setGradientData:", v34);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("kSBProceduralWallpaperHomeDefaultKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("kSBProceduralWallpaperHomeDefaultKey"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setWallpaperIdentifier:](v5, "setWallpaperIdentifier:", v36);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("kSBProceduralWallpaperHomeOptionsKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("kSBProceduralWallpaperHomeOptionsKey"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setWallpaperOptions:](v5, "setWallpaperOptions:", v38);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("kSBProceduralWallpaperHomeUserSetKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("kSBProceduralWallpaperHomeUserSetKey"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setWallpaperWasUserSet:](v5, "setWallpaperWasUserSet:", objc_msgSend(v40, "BOOLValue"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperWallpaperKitDataKey"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SBWallpaperWallpaperKitDataKey"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBUIWallpaperDefaultsWrapper setWallpaperKitData:](v5, "setWallpaperKitData:", v42);

    }
  }

  return v5;
}

+ (id)lockScreenWrapperForLegacyDefaults:(id)a3
{
  id v3;
  PBUIWallpaperDefaultsWrapper *v4;
  NSString *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGRect v16;

  v3 = a3;
  v4 = objc_alloc_init(PBUIWallpaperDefaultsWrapper);
  objc_msgSend(v3, "lockScreenParallaxFactor");
  -[PBUIWallpaperDefaultsWrapper setParallaxFactor:](v4, "setParallaxFactor:");
  objc_msgSend(v3, "lockScreenZoomScale");
  -[PBUIWallpaperDefaultsWrapper setZoomScale:](v4, "setZoomScale:");
  objc_msgSend(v3, "lockScreenCropRectString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = CGRectFromString(v5);
  -[PBUIWallpaperDefaultsWrapper setCropRect:](v4, "setCropRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);

  -[PBUIWallpaperDefaultsWrapper setSupportsCropping:](v4, "setSupportsCropping:", objc_msgSend(v3, "lockScreenSupportsCropping"));
  -[PBUIWallpaperDefaultsWrapper setMagnifyEnabled:](v4, "setMagnifyEnabled:", objc_msgSend(v3, "lockScreenMagnifyEnabled"));
  -[PBUIWallpaperDefaultsWrapper setPortrait:](v4, "setPortrait:", objc_msgSend(v3, "lockScreenPortrait"));
  objc_msgSend(v3, "lockScreenWallpaperName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setWallpaperName:](v4, "setWallpaperName:", v6);

  objc_msgSend(v3, "lockScreenImageHashData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setImageHashData:](v4, "setImageHashData:", v7);

  objc_msgSend(v3, "lockScreenStillTimeInVideo");
  -[PBUIWallpaperDefaultsWrapper setHasVideo:](v4, "setHasVideo:", v8 != 0.0);
  objc_msgSend(v3, "lockScreenStillTimeInVideo");
  -[PBUIWallpaperDefaultsWrapper setStillTimeInVideo:](v4, "setStillTimeInVideo:");
  objc_msgSend(v3, "lockScreenColorData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setColorData:](v4, "setColorData:", v9);

  objc_msgSend(v3, "lockScreenColorName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setColorName:](v4, "setColorName:", v10);

  objc_msgSend(v3, "lockScreenGradientData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setGradientData:](v4, "setGradientData:", v11);

  objc_msgSend(v3, "lockScreenWallpaperIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setWallpaperIdentifier:](v4, "setWallpaperIdentifier:", v12);

  objc_msgSend(v3, "lockScreenWallpaperOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setWallpaperOptions:](v4, "setWallpaperOptions:", v13);

  -[PBUIWallpaperDefaultsWrapper setWallpaperWasUserSet:](v4, "setWallpaperWasUserSet:", objc_msgSend(v3, "lockScreenWallpaperWasUserSet"));
  objc_msgSend(v3, "lockScreenWallpaperKitData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBUIWallpaperDefaultsWrapper setWallpaperKitData:](v4, "setWallpaperKitData:", v14);
  return v4;
}

+ (id)homeScreenWrapperForLegacyDefaults:(id)a3
{
  id v3;
  PBUIWallpaperDefaultsWrapper *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGRect v15;

  v3 = a3;
  v4 = objc_alloc_init(PBUIWallpaperDefaultsWrapper);
  objc_msgSend(v3, "homeScreenParallaxFactor");
  -[PBUIWallpaperDefaultsWrapper setParallaxFactor:](v4, "setParallaxFactor:");
  objc_msgSend(v3, "homeScreenZoomScale");
  -[PBUIWallpaperDefaultsWrapper setZoomScale:](v4, "setZoomScale:");
  objc_msgSend(v3, "homeScreenCropRectString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = CGRectFromString(v5);
  -[PBUIWallpaperDefaultsWrapper setCropRect:](v4, "setCropRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);

  -[PBUIWallpaperDefaultsWrapper setSupportsCropping:](v4, "setSupportsCropping:", objc_msgSend(v3, "homeScreenSupportsCropping"));
  -[PBUIWallpaperDefaultsWrapper setMagnifyEnabled:](v4, "setMagnifyEnabled:", objc_msgSend(v3, "homeScreenMagnifyEnabled"));
  -[PBUIWallpaperDefaultsWrapper setPortrait:](v4, "setPortrait:", objc_msgSend(v3, "homeScreenPortrait"));
  objc_msgSend(v3, "homeScreenWallpaperName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setWallpaperName:](v4, "setWallpaperName:", v6);

  objc_msgSend(v3, "homeScreenImageHashData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setImageHashData:](v4, "setImageHashData:", v7);

  objc_msgSend(v3, "homeScreenColorData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setColorData:](v4, "setColorData:", v8);

  objc_msgSend(v3, "homeScreenColorName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setColorName:](v4, "setColorName:", v9);

  objc_msgSend(v3, "homeScreenGradientData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setGradientData:](v4, "setGradientData:", v10);

  objc_msgSend(v3, "homeScreenWallpaperIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setWallpaperIdentifier:](v4, "setWallpaperIdentifier:", v11);

  objc_msgSend(v3, "homeScreenWallpaperOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBUIWallpaperDefaultsWrapper setWallpaperOptions:](v4, "setWallpaperOptions:", v12);

  -[PBUIWallpaperDefaultsWrapper setWallpaperWasUserSet:](v4, "setWallpaperWasUserSet:", objc_msgSend(v3, "homeScreenWallpaperWasUserSet"));
  objc_msgSend(v3, "homeScreenWallpaperKitData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBUIWallpaperDefaultsWrapper setWallpaperKitData:](v4, "setWallpaperKitData:", v13);
  return v4;
}

- (id)wallpaperDefaultsDict
{
  void *v3;
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGRect v25;
  CGRect v26;

  -[PBUIWallpaperDefaultsWrapper cropRect](self, "cropRect");
  if (CGRectEqualToRect(v25, *MEMORY[0x1E0C9D648]))
  {
    v3 = 0;
  }
  else
  {
    -[PBUIWallpaperDefaultsWrapper cropRect](self, "cropRect");
    NSStringFromCGRect(v26);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PBUIWallpaperDefaultsWrapper parallaxFactor](self, "parallaxFactor");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SBWallpaperParallaxFactorKey"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PBUIWallpaperDefaultsWrapper zoomScale](self, "zoomScale");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("SBWallpaperZoomScaleKey"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("SBWallpaperCropRectStringKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperDefaultsWrapper supportsCropping](self, "supportsCropping"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("SBWallpaperSupportsCroppingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperDefaultsWrapper magnifyEnabled](self, "magnifyEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("SBWallpaperMagnifyEnabledKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperDefaultsWrapper portrait](self, "portrait"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("SBWallpaperPortraitKey"));

  -[PBUIWallpaperDefaultsWrapper wallpaperName](self, "wallpaperName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("SBWallpaperNameKey"));

  -[PBUIWallpaperDefaultsWrapper imageHashData](self, "imageHashData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("SBWallpaperImageHashDataKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperDefaultsWrapper hasVideo](self, "hasVideo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("SBWallpaperHasVideoKey"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[PBUIWallpaperDefaultsWrapper stillTimeInVideo](self, "stillTimeInVideo");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("SBWallpaperStillTimeInVideoKey"));

  -[PBUIWallpaperDefaultsWrapper colorData](self, "colorData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("SBWallpaperColorDataKey"));

  -[PBUIWallpaperDefaultsWrapper colorName](self, "colorName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("SBWallpaperColorNameKey"));

  -[PBUIWallpaperDefaultsWrapper gradientData](self, "gradientData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("SBWallpaperGradientDataKey"));

  -[PBUIWallpaperDefaultsWrapper wallpaperIdentifier](self, "wallpaperIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("kSBProceduralWallpaperHomeDefaultKey"));

  -[PBUIWallpaperDefaultsWrapper wallpaperOptions](self, "wallpaperOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("kSBProceduralWallpaperHomeOptionsKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PBUIWallpaperDefaultsWrapper wallpaperWasUserSet](self, "wallpaperWasUserSet"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("kSBProceduralWallpaperHomeUserSetKey"));

  -[PBUIWallpaperDefaultsWrapper wallpaperKitData](self, "wallpaperKitData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("SBWallpaperWallpaperKitDataKey"));

  return v4;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (BOOL)supportsCropping
{
  return self->_supportsCropping;
}

- (void)setSupportsCropping:(BOOL)a3
{
  self->_supportsCropping = a3;
}

- (BOOL)magnifyEnabled
{
  return self->_magnifyEnabled;
}

- (void)setMagnifyEnabled:(BOOL)a3
{
  self->_magnifyEnabled = a3;
}

- (BOOL)portrait
{
  return self->_portrait;
}

- (void)setPortrait:(BOOL)a3
{
  self->_portrait = a3;
}

- (NSString)wallpaperName
{
  return self->_wallpaperName;
}

- (void)setWallpaperName:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperName, a3);
}

- (NSData)imageHashData
{
  return self->_imageHashData;
}

- (void)setImageHashData:(id)a3
{
  objc_storeStrong((id *)&self->_imageHashData, a3);
}

- (int64_t)wallpaperMode
{
  return self->_wallpaperMode;
}

- (void)setWallpaperMode:(int64_t)a3
{
  self->_wallpaperMode = a3;
}

- (NSDictionary)wallpaperKitData
{
  return self->_wallpaperKitData;
}

- (void)setWallpaperKitData:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperKitData, a3);
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (double)stillTimeInVideo
{
  return self->_stillTimeInVideo;
}

- (void)setStillTimeInVideo:(double)a3
{
  self->_stillTimeInVideo = a3;
}

- (NSString)wallpaperIdentifier
{
  return self->_wallpaperIdentifier;
}

- (void)setWallpaperIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperIdentifier, a3);
}

- (NSDictionary)wallpaperOptions
{
  return self->_wallpaperOptions;
}

- (void)setWallpaperOptions:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperOptions, a3);
}

- (BOOL)wallpaperWasUserSet
{
  return self->_wallpaperWasUserSet;
}

- (void)setWallpaperWasUserSet:(BOOL)a3
{
  self->_wallpaperWasUserSet = a3;
}

- (NSData)colorData
{
  return self->_colorData;
}

- (void)setColorData:(id)a3
{
  objc_storeStrong((id *)&self->_colorData, a3);
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void)setColorName:(id)a3
{
  objc_storeStrong((id *)&self->_colorName, a3);
}

- (NSData)gradientData
{
  return self->_gradientData;
}

- (void)setGradientData:(id)a3
{
  objc_storeStrong((id *)&self->_gradientData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientData, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_colorData, 0);
  objc_storeStrong((id *)&self->_wallpaperOptions, 0);
  objc_storeStrong((id *)&self->_wallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_wallpaperKitData, 0);
  objc_storeStrong((id *)&self->_imageHashData, 0);
  objc_storeStrong((id *)&self->_wallpaperName, 0);
}

@end
