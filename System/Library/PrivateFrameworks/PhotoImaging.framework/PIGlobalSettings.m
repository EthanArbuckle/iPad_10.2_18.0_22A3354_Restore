@implementation PIGlobalSettings

- (BOOL)falseColorHDR
{
  return 0;
}

- (BOOL)portraitDisableFuzzball
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_PORTRAIT_DISABLE_FUZZBALL"));

  return v3;
}

- (void)setPortraitDisableFuzzball:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_PORTRAIT_DISABLE_FUZZBALL"));

}

- (BOOL)portraitForceLightMapLinear
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PI_PORTRAIT_FORCE_LIGHT_MAP_LINEAR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setPortraitForceLightMapLinear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_PORTRAIT_FORCE_LIGHT_MAP_LINEAR"));

}

- (BOOL)segmentationDebugRoundTripProxyImage
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEGMENT_ROUND_TRIP_PROXY"));

  return v3;
}

- (void)setSegmentationDebugRoundTripProxyImage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEGMENT_ROUND_TRIP_PROXY"));

}

- (BOOL)disableSegmentation
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEGMENT_DISABLE_SEGMENTATION"));

  return v3;
}

- (void)setDisableSegmentation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEGMENT_DISABLE_SEGMENTATION"));

}

- (BOOL)forceEnableSegmentation
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEGMENT_FORCE_ENABLE_SEGMENTATION"));

  return v3;
}

- (void)setForceEnableSegmentation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEGMENT_FORCE_ENABLE_SEGMENTATION"));

}

- (BOOL)disableHeadroom
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PI_DISABLE_HEADROOM"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setDisableHeadroom:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_DISABLE_HEADROOM"));

}

- (int64_t)segmentationInfillAlgorithm
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PI_SEGMENT_INFILL_ALGO"));

  return v3;
}

- (void)setSegmentationInfillAlgorithm:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("PI_SEGMENT_INFILL_ALGO"));

}

- (BOOL)segmentationDebugTintLayers
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEGMENT_TINT_LAYERS"));

  return v3;
}

- (void)setSegmentationDebugTintLayers:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEGMENT_TINT_LAYERS"));

}

- (BOOL)segmentationDisableCaching
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEGMENT_DISABLE_CACHE"));

  return v3;
}

- (void)setSegmentationDisableCaching:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEGMENT_DISABLE_CACHE"));

}

- (BOOL)segmentationDebugPreviewDisableClock
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEGMENT_PREVIEW_DISABLE_CLOCK"));

  return v3;
}

- (void)setSegmentationDebugPreviewDisableClock:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEGMENT_PREVIEW_DISABLE_CLOCK"));

}

- (BOOL)segmentationDebugPreviewHighQuality
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEGMENT_PREVIEW_HIGH_QUALITY"));

  return v3;
}

- (void)setSegmentationDebugPreviewHighQuality:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEGMENT_PREVIEW_HIGH_QUALITY"));

}

- (double)segmentationManualGatingLenience
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("PI_SEGMENT_MANUAL_GATING_LENIENCE"));
  v4 = v3;

  return v4;
}

- (void)setSegmentationManualGatingLenience:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("PI_SEGMENT_MANUAL_GATING_LENIENCE"), a3);

}

- (NSString)styleRecipeConfigDirectoryPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PI_STYLE_RECIPE_DIR_PATH"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setStyleRecipeConfigDirectoryPath:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("PI_STYLE_RECIPE_DIR_PATH"));

}

- (BOOL)useStyleRecipeConfigDirectory
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_USE_STYLE_RECIPE_CONFIG"));

  return v3;
}

- (void)setUseStyleRecipeConfigDirectory:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_USE_STYLE_RECIPE_CONFIG"));

}

- (BOOL)parallaxStyleEnableGreenScreen
{
  char v2;
  void *v3;
  char v4;

  v2 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PI_PARALLAX_STYLE_ENABLE_GREEN_SCREEN"));

  return v2 | v4;
}

- (void)setParallaxStyleEnableGreenScreen:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_PARALLAX_STYLE_ENABLE_GREEN_SCREEN"));

}

- (NSString)parallaxLayoutConfigurationOverride
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("PI_PARALLAX_LAYOUT_CONFIG"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setParallaxLayoutConfigurationOverride:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("PI_PARALLAX_LAYOUT_CONFIG"));

}

- (BOOL)parallaxWallpaperDisableUpgrade
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_PARALLAX_DISABLE_UPGRADE"));

  return v3;
}

- (void)setParallaxWallpaperDisableUpgrade:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_PARALLAX_DISABLE_UPGRADE"));

}

- (BOOL)cinematicAllowYUVSourceInput
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PI_CINEMATIC_ALLOW_YUV_SOURCE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setCinematicAllowYUVSourceInput:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_CINEMATIC_ALLOW_YUV_SOURCE"));

}

- (BOOL)cinematicAllowRGB10Packed
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PI_CINEMATIC_ALLOW_RGB10_PACKED"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setCinematicAllowRGB10Packed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_CINEMATIC_ALLOW_RGB10_PACKED"));

}

- (BOOL)rawApplyBoostFirst
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PI_RAW_APPLY_BOOST_FIRST"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setRawApplyBoostFirst:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_RAW_APPLY_BOOST_FIRST"));

}

- (BOOL)disableMADForSettlingEffect
{
  char v2;
  void *v3;
  void *v4;
  char v5;

  v2 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("PI_PARALLAX_DISABLE_MAD_SETTLING_EFFECT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = v2 ^ 1;

  return v5;
}

- (void)setDisableMADForSettlingEffect:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_PARALLAX_DISABLE_MAD_SETTLING_EFFECT"));

}

- (BOOL)forceEnableSettlingEffect
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_PARALLAX_FORCE_ENABLE_SETTLING_EFFECT"));

  return v3;
}

- (void)setForceEnableSettlingEffect:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_PARALLAX_FORCE_ENABLE_SETTLING_EFFECT"));

}

- (float)settlingEffectMinimumMotionScore
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PI_PARALLAX_MINIMUM_MOTION_SCORE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.7;
  }

  return v5;
}

- (void)setSettlingEffectMinimumMotionScore:(float)a3
{
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setFloat:forKey:", CFSTR("PI_PARALLAX_MINIMUM_MOTION_SCORE"), v4);

}

- (BOOL)posterDisableCropVariant
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_POSTER_DISABLE_CROP_VARIANT"));

  return v3;
}

- (void)setPosterDisableCropVariant:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_POSTER_DISABLE_CROP_VARIANT"));

}

- (BOOL)debugUseStyleEngine
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_DEBUG_USE_STYLE_ENGINE"));

  return v3;
}

- (void)setDebugUseStyleEngine:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_DEBUG_USE_STYLE_ENGINE"));

}

- (BOOL)semanticStyleDisableStyleEngine
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PI_SEMANTIC_STYLE_DISABLE_STYLE_ENGINE"));

  return v3;
}

- (void)setSemanticStyleDisableStyleEngine:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PI_SEMANTIC_STYLE_DISABLE_STYLE_ENGINE"));

}

- (int64_t)parallaxStyleKeyLevelOverride
{
  return self->parallaxStyleKeyLevelOverride;
}

- (void)setParallaxStyleKeyLevelOverride:(int64_t)a3
{
  self->parallaxStyleKeyLevelOverride = a3;
}

- (BOOL)parallaxStyleAvoidColorWashBrownOverride
{
  return self->parallaxStyleAvoidColorWashBrownOverride;
}

- (void)setParallaxStyleAvoidColorWashBrownOverride:(BOOL)a3
{
  self->parallaxStyleAvoidColorWashBrownOverride = a3;
}

- (BOOL)forceGlassesMatteOff
{
  return self->_forceGlassesMatteOff;
}

- (void)setForceGlassesMatteOff:(BOOL)a3
{
  self->_forceGlassesMatteOff = a3;
}

- (BOOL)forceSpillMatteOff
{
  return self->_forceSpillMatteOff;
}

- (void)setForceSpillMatteOff:(BOOL)a3
{
  self->_forceSpillMatteOff = a3;
}

- (BOOL)allowSpillMatteOnOlderPortraitV2Captures
{
  return self->_allowSpillMatteOnOlderPortraitV2Captures;
}

- (void)setAllowSpillMatteOnOlderPortraitV2Captures:(BOOL)a3
{
  self->_allowSpillMatteOnOlderPortraitV2Captures = a3;
}

+ (id)globalSettings
{
  if (globalSettings_onceToken != -1)
    dispatch_once(&globalSettings_onceToken, &__block_literal_global_13785);
  return (id)globalSettings_globalSettings;
}

+ (id)IPXEditSettings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("IPXRootSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("PXSettingsArchiveKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("editSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)PUEditSettings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PURootSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("PXSettingsArchiveKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("photoEditingSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __34__PIGlobalSettings_globalSettings__block_invoke()
{
  PIGlobalSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PIGlobalSettings);
  v1 = (void *)globalSettings_globalSettings;
  globalSettings_globalSettings = (uint64_t)v0;

}

@end
