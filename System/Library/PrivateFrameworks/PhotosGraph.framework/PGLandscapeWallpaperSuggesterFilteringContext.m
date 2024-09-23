@implementation PGLandscapeWallpaperSuggesterFilteringContext

- (id)initForTopLandscapesInOrientation:(int64_t)a3
{
  PGLandscapeWallpaperSuggesterFilteringContext *v4;
  PGLandscapeWallpaperSuggesterFilteringContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGLandscapeWallpaperSuggesterFilteringContext;
  v4 = -[PGLandscapeWallpaperSuggesterFilteringContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PGLandscapeWallpaperSuggesterFilteringContext _commonInitInOrientation:](v4, "_commonInitInOrientation:", a3);
    v5->_bypassCropScoreCheck = 1;
  }
  return v5;
}

- (id)initForLandscapesInOrientation:(int64_t)a3
{
  PGLandscapeWallpaperSuggesterFilteringContext *v4;
  PGLandscapeWallpaperSuggesterFilteringContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGLandscapeWallpaperSuggesterFilteringContext;
  v4 = -[PGLandscapeWallpaperSuggesterFilteringContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PGLandscapeWallpaperSuggesterFilteringContext _commonInitInOrientation:](v4, "_commonInitInOrientation:", a3);
    v5->_ignoreClockOverlap = 1;
  }
  return v5;
}

- (id)initForAmbient
{
  PGLandscapeWallpaperSuggesterFilteringContext *v2;
  PGLandscapeWallpaperSuggesterFilteringContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGLandscapeWallpaperSuggesterFilteringContext;
  v2 = -[PGLandscapeWallpaperSuggesterFilteringContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PGLandscapeWallpaperSuggesterFilteringContext _commonInitInOrientation:](v2, "_commonInitInOrientation:", 2);
    v3->_bypassCropScoreCheck = 1;
  }
  return v3;
}

- (void)_commonInitInOrientation:(int64_t)a3
{
  self->_orientation = a3;
  *(_OWORD *)&self->_minimumWallpaperScore = xmmword_1CA8ED990;
  *(_WORD *)&self->_ignoreClockOverlap = 0;
  *(_OWORD *)&self->_timeIntervalForCandidateDeduping = xmmword_1CA8ED8B0;
  self->_maximumCropZoomRatio = 1.45;
}

- (id)initForTopLandscapes:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v6 = a3;
  v8 = a4;
  if (v6)
    v9 = -[PGLandscapeWallpaperSuggesterFilteringContext initForTopLandscapesInOrientation:](self, "initForTopLandscapesInOrientation:", a5);
  else
    v9 = -[PGLandscapeWallpaperSuggesterFilteringContext initForLandscapesInOrientation:](self, "initForLandscapesInOrientation:", a5);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumWallpaperScore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumWallpaperScore"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v10[3] = v13;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumCropScore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumCropScore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v10[4] = v16;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ignoreClockOverlap"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ignoreClockOverlap"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v10 + 8) = objc_msgSend(v18, "BOOLValue");

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeIntervalForCandidateDeduping"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeIntervalForCandidateDeduping"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v10[5] = v21;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumLowLightScore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumLowLightScore"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v10[6] = v24;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumCropZoomRatio"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumCropZoomRatio"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v10[7] = v27;

    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = +[PGLandscapeWallpaperSuggesterFilteringContext allocWithZone:](PGLandscapeWallpaperSuggesterFilteringContext, "allocWithZone:", a3);
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_minimumWallpaperScore;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_minimumCropScore;
  *((_BYTE *)result + 8) = self->_ignoreClockOverlap;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_timeIntervalForCandidateDeduping;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_maximumLowLightScore;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_maximumCropZoomRatio;
  return result;
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

- (BOOL)bypassCropScoreCheck
{
  return self->_bypassCropScoreCheck;
}

- (void)setBypassCropScoreCheck:(BOOL)a3
{
  self->_bypassCropScoreCheck = a3;
}

@end
