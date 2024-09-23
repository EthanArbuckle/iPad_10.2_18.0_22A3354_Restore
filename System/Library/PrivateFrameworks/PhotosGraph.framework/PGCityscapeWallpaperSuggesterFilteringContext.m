@implementation PGCityscapeWallpaperSuggesterFilteringContext

- (id)initForTopCityscapesInOrientation:(int64_t)a3
{
  PGCityscapeWallpaperSuggesterFilteringContext *v4;
  PGCityscapeWallpaperSuggesterFilteringContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGCityscapeWallpaperSuggesterFilteringContext;
  v4 = -[PGCityscapeWallpaperSuggesterFilteringContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PGCityscapeWallpaperSuggesterFilteringContext _commonInitInOrientation:](v4, "_commonInitInOrientation:", a3);
    v5->_bypassCropScoreCheck = 1;
  }
  return v5;
}

- (id)initForCityscapesInOrientation:(int64_t)a3
{
  PGCityscapeWallpaperSuggesterFilteringContext *v4;
  PGCityscapeWallpaperSuggesterFilteringContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGCityscapeWallpaperSuggesterFilteringContext;
  v4 = -[PGCityscapeWallpaperSuggesterFilteringContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PGCityscapeWallpaperSuggesterFilteringContext _commonInitInOrientation:](v4, "_commonInitInOrientation:", a3);
    v5->_ignoreClockOverlap = 1;
  }
  return v5;
}

- (id)initForAmbient
{
  PGCityscapeWallpaperSuggesterFilteringContext *v2;
  PGCityscapeWallpaperSuggesterFilteringContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGCityscapeWallpaperSuggesterFilteringContext;
  v2 = -[PGCityscapeWallpaperSuggesterFilteringContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PGCityscapeWallpaperSuggesterFilteringContext _commonInitInOrientation:](v2, "_commonInitInOrientation:", 2);
    v3->_bypassCropScoreCheck = 1;
  }
  return v3;
}

- (void)_commonInitInOrientation:(int64_t)a3
{
  self->_orientation = a3;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_minimumWallpaperScore = _Q0;
  *(_WORD *)&self->_ignoreClockOverlap = 0;
  *(_OWORD *)&self->_minimumCropScore = xmmword_1CA8ED9C0;
  *(_OWORD *)&self->_maximumLowLightScore = xmmword_1CA8ED8F0;
}

- (id)initForTopCityscapes:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v6 = a3;
  v8 = a4;
  if (v6)
    v9 = -[PGCityscapeWallpaperSuggesterFilteringContext initForTopCityscapesInOrientation:](self, "initForTopCityscapesInOrientation:", a5);
  else
    v9 = -[PGCityscapeWallpaperSuggesterFilteringContext initForCityscapesInOrientation:](self, "initForCityscapesInOrientation:", a5);
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
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("absoluteMinimumWallpaperScore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("absoluteMinimumWallpaperScore"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v10[4] = v16;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumCropScore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("minimumCropScore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v10[5] = v19;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ignoreClockOverlap"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ignoreClockOverlap"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v10 + 8) = objc_msgSend(v21, "BOOLValue");

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeIntervalForCandidateDeduping"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeIntervalForCandidateDeduping"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v10[6] = v24;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumLowLightScore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumLowLightScore"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v10[7] = v27;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumCropZoomRatio"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumCropZoomRatio"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v10[8] = v30;

    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = +[PGCityscapeWallpaperSuggesterFilteringContext allocWithZone:](PGCityscapeWallpaperSuggesterFilteringContext, "allocWithZone:", a3);
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_minimumWallpaperScore;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_absoluteMinimumWallpaperScore;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_minimumCropScore;
  *((_BYTE *)result + 8) = self->_ignoreClockOverlap;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_timeIntervalForCandidateDeduping;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_maximumLowLightScore;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_maximumCropZoomRatio;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PGCityscapeWallpaperSuggesterFilteringContext *v4;
  uint64_t v5;
  BOOL v6;
  PGCityscapeWallpaperSuggesterFilteringContext *v7;

  v4 = (PGCityscapeWallpaperSuggesterFilteringContext *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v6 = v7->_minimumWallpaperScore == self->_minimumWallpaperScore
        && v7->_absoluteMinimumWallpaperScore == self->_absoluteMinimumWallpaperScore
        && v7->_minimumCropScore == self->_minimumCropScore
        && v7->_ignoreClockOverlap == self->_ignoreClockOverlap
        && v7->_timeIntervalForCandidateDeduping == self->_timeIntervalForCandidateDeduping
        && v7->_maximumLowLightScore == self->_maximumLowLightScore
        && v7->_maximumCropZoomRatio == self->_maximumCropZoomRatio;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
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

- (double)absoluteMinimumWallpaperScore
{
  return self->_absoluteMinimumWallpaperScore;
}

- (void)setAbsoluteMinimumWallpaperScore:(double)a3
{
  self->_absoluteMinimumWallpaperScore = a3;
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
