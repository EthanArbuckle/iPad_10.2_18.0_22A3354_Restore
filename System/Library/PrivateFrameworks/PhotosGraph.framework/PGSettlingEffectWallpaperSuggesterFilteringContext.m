@implementation PGSettlingEffectWallpaperSuggesterFilteringContext

- (id)initInOrientation:(int64_t)a3
{
  PGSettlingEffectWallpaperSuggesterFilteringContext *v4;
  PGSettlingEffectWallpaperSuggesterFilteringContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGSettlingEffectWallpaperSuggesterFilteringContext;
  v4 = -[PGSettlingEffectWallpaperSuggesterFilteringContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[PGSettlingEffectWallpaperSuggesterFilteringContext _commonInitInOrientation:](v4, "_commonInitInOrientation:", a3);
  return v5;
}

- (void)_commonInitInOrientation:(int64_t)a3
{
  self->_orientation = a3;
  *(_OWORD *)&self->_minimumWallpaperScore = xmmword_1CA8ED910;
  self->_ignoreClockOverlap = 1;
  *(_OWORD *)&self->_timeIntervalForCandidateDeduping = xmmword_1CA8ED920;
  self->_maximumCropZoomRatio = 999.0;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)minimumWallpaperScore
{
  return self->_minimumWallpaperScore;
}

- (void)setMinimumWallpaperScore:(double)a3
{
  self->_minimumWallpaperScore = a3;
}

- (double)minimumCropScore
{
  return self->_minimumCropScore;
}

- (void)setMinimumCropScore:(double)a3
{
  self->_minimumCropScore = a3;
}

- (BOOL)ignoreClockOverlap
{
  return self->_ignoreClockOverlap;
}

- (void)setIgnoreClockOverlap:(BOOL)a3
{
  self->_ignoreClockOverlap = a3;
}

- (double)timeIntervalForCandidateDeduping
{
  return self->_timeIntervalForCandidateDeduping;
}

- (void)setTimeIntervalForCandidateDeduping:(double)a3
{
  self->_timeIntervalForCandidateDeduping = a3;
}

- (double)maximumLowLightScore
{
  return self->_maximumLowLightScore;
}

- (void)setMaximumLowLightScore:(double)a3
{
  self->_maximumLowLightScore = a3;
}

- (double)maximumCropZoomRatio
{
  return self->_maximumCropZoomRatio;
}

- (void)setMaximumCropZoomRatio:(double)a3
{
  self->_maximumCropZoomRatio = a3;
}

+ (double)minimumSettlingEffectScoreForSuggestionSubtype:(unsigned __int16)a3 mediaAnalysisVersion:(unint64_t)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78218]), "initWithMediaAnalysisVersion:", a4);
  objc_msgSend(v4, "settlingEffectScoreNode");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0D78218]);
    v8 = (void *)objc_msgSend(v7, "initWithMediaAnalysisVersion:", objc_msgSend(MEMORY[0x1E0D78218], "latestVersion"));

    objc_msgSend(v8, "settlingEffectScoreNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
  }
  objc_msgSend(v6, "operatingPoint");
  v10 = v9;

  return v10;
}

+ (BOOL)shouldRunSettlingEffectForAsset:(id)a3 subtype:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  float v7;
  float v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  int v18;
  void *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PGSettlingEffectScoreHelper analyzedSettlingEffectScoreForAsset:requestedOnDemand:](PGSettlingEffectScoreHelper, "analyzedSettlingEffectScoreForAsset:requestedOnDemand:", v6, 0);
  v8 = v7;
  objc_msgSend(v6, "mediaAnalysisProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "minimumSettlingEffectScoreForSuggestionSubtype:mediaAnalysisVersion:", v4, objc_msgSend(v9, "mediaAnalysisVersion"));
  v11 = v10;

  v12 = v8;
  v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
  if (v11 > v12)
  {
    if (v13)
    {
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v14;
      v20 = 2048;
      v21 = v12;
      v22 = 2048;
      v23 = v11;
      v15 = MEMORY[0x1E0C81028];
      v16 = "[PGSettlingEffectWallpaperContexts] Asset: %@, Skip running FRC (%.2f < %.2f)";
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    objc_msgSend(v6, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = v14;
    v20 = 2048;
    v21 = v12;
    v22 = 2048;
    v23 = v11;
    v15 = MEMORY[0x1E0C81028];
    v16 = "[PGSettlingEffectWallpaperContexts] Asset: %@, Should run FRC (%.2f >= %.2f)";
LABEL_6:
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v18, 0x20u);

  }
  return v11 <= v12;
}

@end
