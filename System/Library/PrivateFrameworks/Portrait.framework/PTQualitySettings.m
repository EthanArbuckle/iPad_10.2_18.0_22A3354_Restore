@implementation PTQualitySettings

- (void)setRenderDownscale:(float)a3
{
  self->_renderDownscale = a3;
}

- (void)setRayMarch:(BOOL)a3
{
  self->_rayMarch = a3;
}

- (void)setDoMacroApertureLimit:(BOOL)a3
{
  self->_doMacroApertureLimit = a3;
}

- (void)setDoIntermediate2XUpscale:(BOOL)a3
{
  self->_doIntermediate2XUpscale = a3;
}

- (void)setDoFocusEdgeMask:(BOOL)a3
{
  self->_doFocusEdgeMask = a3;
}

- (void)setDisparityUpsampleFactor:(float)a3
{
  self->_disparityUpsampleFactor = a3;
}

- (float)renderDownscale
{
  return self->_renderDownscale;
}

- (BOOL)rayMarch
{
  return self->_rayMarch;
}

- (unint64_t)intermediatePixelFormat
{
  return self->_intermediatePixelFormat;
}

- (BOOL)doFocusEdgeMask
{
  return self->_doFocusEdgeMask;
}

- (BOOL)doDisparityUpsampling
{
  return self->_disparityUpsampleFactor > 1.0;
}

- (BOOL)doCenterDisparity
{
  return self->_doCenterDisparity;
}

- (BOOL)useExportQualityNoise
{
  return self->_useExportQualityNoise;
}

- (void)updateDescription
{
  const __CFString *v3;
  const __CFString *v4;
  NSString *v5;
  NSString *description;

  if (self->_rayMarch)
    v3 = CFSTR("Raymarch adaptive");
  else
    v3 = CFSTR("1-step");
  v4 = CFSTR("FirstLevelGaussianDownsample");
  if (!self->_doFirstLevelGaussianDownsample)
    v4 = &stru_1E822B200;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Circles: %i. upscale-disp:%f %@"), v3, self->_numberOfPatternCircles, self->_disparityUpsampleFactor, v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  description = self->_description;
  self->_description = v5;

}

- (void)setUseExportQualityNoise:(BOOL)a3
{
  self->_useExportQualityNoise = a3;
}

- (void)setQuality:(int)a3
{
  self->_quality = a3;
}

- (void)setNumberOfPatternCircles:(int)a3
{
  self->_numberOfPatternCircles = a3;
}

- (void)setIntermediatePixelFormat:(unint64_t)a3
{
  self->_intermediatePixelFormat = a3;
}

- (void)setDoFirstLevelGaussianDownsample:(BOOL)a3
{
  self->_doFirstLevelGaussianDownsample = a3;
}

- (void)setDoCenterDisparity:(BOOL)a3
{
  self->_doCenterDisparity = a3;
}

- (void)setDisparityGuidedFilterEpsilon:(float)a3
{
  self->_disparityGuidedFilterEpsilon = a3;
}

- (void)setCircleOfConfusionLimitForeground:(float)a3
{
  self->_circleOfConfusionLimitForeground = a3;
}

- (void)setCircleOfConfusionLimitBackground:(float)a3
{
  self->_circleOfConfusionLimitBackground = a3;
}

- (int)quality
{
  return self->_quality;
}

- (int)numberOfPatternCircles
{
  return self->_numberOfPatternCircles;
}

- (BOOL)doMacroApertureLimit
{
  return self->_doMacroApertureLimit;
}

- (BOOL)doIntermediate2XUpscale
{
  return self->_doIntermediate2XUpscale;
}

- (BOOL)doFirstLevelGaussianDownsample
{
  return self->_doFirstLevelGaussianDownsample;
}

- (float)disparityUpsampleFactor
{
  return self->_disparityUpsampleFactor;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (float)circleOfConfusionLimitForeground
{
  return self->_circleOfConfusionLimitForeground;
}

- (float)circleOfConfusionLimitBackground
{
  return self->_circleOfConfusionLimitBackground;
}

+ (id)createWithQuality:(int)a3 options:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8251FE0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_40;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setQuality:", v4);
  objc_msgSend(v6, "setDoFirstLevelGaussianDownsample:", (int)v4 > 26);
  objc_msgSend(v6, "setUseExportQualityNoise:", (int)v4 > 26);
  LODWORD(v7) = 2.0;
  objc_msgSend(v6, "setRenderDownscale:", v7);
  objc_msgSend(v6, "setDoMacroApertureLimit:", 1);
  objc_msgSend(v6, "setDoCenterDisparity:", 1);
  objc_msgSend(v6, "setIntermediatePixelFormat:", 115);
  objc_msgSend(v6, "setRayMarch:", 1);
  if ((int)v4 <= 25)
    v9 = 1;
  else
    v9 = 2;
  *(float *)&v8 = (float)v9;
  objc_msgSend(v6, "setDisparityUpsampleFactor:", v8);
  LODWORD(v10) = 1028443341;
  objc_msgSend(v6, "setDisparityGuidedFilterEpsilon:", v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8251FF8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8251FF8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v6, "setDisparityUpsampleFactor:");

  }
  objc_msgSend(v6, "setDoFocusEdgeMask:", (int)v4 > 25);
  if ((int)v4 > 25)
  {
    if ((int)v4 > 74)
    {
      if ((_DWORD)v4 == 75)
      {
        v13 = v6;
        v14 = 4;
        goto LABEL_25;
      }
      if ((_DWORD)v4 == 100)
        goto LABEL_21;
    }
    else
    {
      if ((_DWORD)v4 == 26)
      {
        v13 = v6;
        v14 = 2;
        goto LABEL_25;
      }
      if ((_DWORD)v4 == 51)
      {
        v13 = v6;
        v14 = 3;
LABEL_25:
        objc_msgSend(v13, "setNumberOfPatternCircles:", v14);
        goto LABEL_26;
      }
    }
LABEL_18:
    _PTLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[PTQualitySettings createWithQuality:options:].cold.1(v4, v15);

LABEL_21:
    v13 = v6;
    v14 = 5;
    goto LABEL_25;
  }
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 != 24 && (_DWORD)v4 != 25)
      goto LABEL_18;
    objc_msgSend(v6, "setNumberOfPatternCircles:", 2);
    objc_msgSend(v6, "setRayMarch:", 0);
  }
  else
  {
    objc_msgSend(v6, "setNumberOfPatternCircles:", 2);
    LODWORD(v16) = 4.0;
    objc_msgSend(v6, "setRenderDownscale:", v16);
  }
LABEL_26:
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252010);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252010);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v6, "setRenderDownscale:");

  }
  objc_msgSend(v6, "renderDownscale");
  objc_msgSend(v6, "setDoIntermediate2XUpscale:", v19 > 3.0);
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252028);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252028);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDoMacroApertureLimit:", objc_msgSend(v22, "BOOLValue"));

  }
  LODWORD(v21) = 2143289344;
  objc_msgSend(v6, "setCircleOfConfusionLimitBackground:", v21);
  LODWORD(v23) = 2143289344;
  objc_msgSend(v6, "setCircleOfConfusionLimitForeground:", v23);
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252040);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252040);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    objc_msgSend(v6, "setCircleOfConfusionLimitBackground:");

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252058);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252058);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    objc_msgSend(v6, "setCircleOfConfusionLimitForeground:");

  }
  objc_msgSend(v6, "setPortraitPreviewDeadzone:", 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252070);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", &unk_1E8252070);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPortraitPreviewDeadzone:", objc_msgSend(v29, "BOOLValue"));

  }
  objc_msgSend(v6, "setRayMarch:", objc_msgSend(v6, "rayMarch"));
  objc_msgSend(v6, "disparityUpsampleFactor");
  objc_msgSend(v6, "setDisparityUpsampleFactor:");
  objc_msgSend(v6, "setDoFocusEdgeMask:", objc_msgSend(v6, "doFocusEdgeMask"));
  objc_msgSend(v6, "renderDownscale");
  objc_msgSend(v6, "setRenderDownscale:");
  objc_msgSend(v6, "setDoMacroApertureLimit:", objc_msgSend(v6, "doMacroApertureLimit"));
  objc_msgSend(v6, "setDoIntermediate2XUpscale:", objc_msgSend(v6, "doIntermediate2XUpscale"));
  if (objc_msgSend(v6, "doFocusEdgeMask"))
    v30 = objc_msgSend(v6, "rayMarch");
  else
    v30 = 0;
  objc_msgSend(v6, "setDoFocusEdgeMask:", v30);
  objc_msgSend(v6, "updateDescription");
LABEL_40:
  v31 = v6;

  return v31;
}

- (float)disparityGuidedFilterEpsilon
{
  return self->_disparityGuidedFilterEpsilon;
}

- (BOOL)portraitPreviewDeadzone
{
  return self->_portraitPreviewDeadzone;
}

- (void)setPortraitPreviewDeadzone:(BOOL)a3
{
  self->_portraitPreviewDeadzone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

+ (void)createWithQuality:(int)a1 options:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Unknow quality level, got: %i, assuming maximum quality: 100", (uint8_t *)v2, 8u);
}

@end
