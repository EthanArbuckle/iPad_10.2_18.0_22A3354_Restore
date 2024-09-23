@implementation PGSinglePersonWallpaperAssetSuggesterFilteringContext

- (id)initForTopPeopleInOrientation:(int64_t)a3
{
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v4;
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGSinglePersonWallpaperAssetSuggesterFilteringContext;
  v4 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PGSinglePersonWallpaperAssetSuggesterFilteringContext _commonInitInOrientation:](v4, "_commonInitInOrientation:", a3);
    v5->_bypassCropScoreCheck = 1;
  }
  return v5;
}

- (id)initForPeopleInOrientation:(int64_t)a3
{
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v4;
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGSinglePersonWallpaperAssetSuggesterFilteringContext;
  v4 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[PGSinglePersonWallpaperAssetSuggesterFilteringContext _commonInitInOrientation:](v4, "_commonInitInOrientation:", a3);
  return v5;
}

- (id)initForAmbient
{
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v2;
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGSinglePersonWallpaperAssetSuggesterFilteringContext;
  v2 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PGSinglePersonWallpaperAssetSuggesterFilteringContext _commonInitInOrientation:](v2, "_commonInitInOrientation:", 2);
    v3->_bypassCropScoreCheck = 1;
  }
  return v3;
}

- (void)_commonInitInOrientation:(int64_t)a3
{
  self->_orientation = a3;
  *(_WORD *)&self->_requiresSmile = 257;
  *(_OWORD *)&self->_timeIntervalForCandidateDeduping = xmmword_1CA8ED8B0;
  *(_OWORD *)&self->_minimumFaceSize = xmmword_1CA8ED8C0;
  *(_OWORD *)&self->_maximumFaceRoll = xmmword_1CA8ED8D0;
  *(_OWORD *)&self->_absoluteMinimumWallpaperScore = xmmword_1CA8ED8E0;
  *(_OWORD *)&self->_maximumLowLightScore = xmmword_1CA8ED8F0;
  self->_bypassCropScoreCheck = 0;
}

- (void)updateFilteringContextWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  id v38;

  v38 = a3;
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    self->_timeIntervalForCandidateDeduping = v6;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_requiresSmile = objc_msgSend(v8, "BOOLValue");

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_requiresNoBlink = objc_msgSend(v10, "BOOLValue");

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    self->_minimumFaceQuality = v13;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    self->_minimumFaceSize = v16;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    self->_maximumFaceSize = v19;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    self->_maximumFaceRoll = v22;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    self->_minimumWallpaperScore = v25;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextAbsoluteMinimumWallpaperScore"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextAbsoluteMinimumWallpaperScore"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    self->_absoluteMinimumWallpaperScore = v28;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "doubleValue");
    self->_minimumCropScore = v31;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumLowLightScore"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumLowLightScore"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    self->_maximumLowLightScore = v34;

  }
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumCropZoomRatio"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumCropZoomRatio"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    self->_maximumCropZoomRatio = v37;

  }
}

- (id)initForTopPeople:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;

  v6 = a3;
  v8 = a4;
  if (v6)
    v9 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForTopPeopleInOrientation:](self, "initForTopPeopleInOrientation:", a5);
  else
    v9 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForPeopleInOrientation:](self, "initForPeopleInOrientation:", a5);
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "updateFilteringContextWithDictionary:", v8);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = +[PGSinglePersonWallpaperAssetSuggesterFilteringContext allocWithZone:](PGSinglePersonWallpaperAssetSuggesterFilteringContext, "allocWithZone:", a3);
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_timeIntervalForCandidateDeduping;
  *((_BYTE *)result + 8) = self->_requiresSmile;
  *((_BYTE *)result + 9) = self->_requiresNoBlink;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_minimumFaceQuality;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_minimumFaceSize;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_maximumFaceSize;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_maximumFaceRoll;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_minimumWallpaperScore;
  *((_QWORD *)result + 9) = *(_QWORD *)&self->_absoluteMinimumWallpaperScore;
  *((_QWORD *)result + 10) = *(_QWORD *)&self->_minimumCropScore;
  *((_QWORD *)result + 11) = *(_QWORD *)&self->_maximumLowLightScore;
  *((_QWORD *)result + 12) = *(_QWORD *)&self->_maximumCropZoomRatio;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v4;
  uint64_t v5;
  BOOL v6;
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v7;

  v4 = (PGSinglePersonWallpaperAssetSuggesterFilteringContext *)a3;
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
      v6 = v7->_timeIntervalForCandidateDeduping == self->_timeIntervalForCandidateDeduping
        && v7->_requiresSmile == self->_requiresSmile
        && v7->_requiresNoBlink == self->_requiresNoBlink
        && v7->_minimumFaceQuality == self->_minimumFaceQuality
        && v7->_minimumFaceSize == self->_minimumFaceSize
        && v7->_maximumFaceSize == self->_maximumFaceSize
        && v7->_maximumFaceRoll == self->_maximumFaceRoll
        && v7->_minimumWallpaperScore == self->_minimumWallpaperScore
        && v7->_absoluteMinimumWallpaperScore == self->_absoluteMinimumWallpaperScore
        && v7->_minimumCropScore == self->_minimumCropScore
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

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[12];
  _QWORD v18[14];

  v18[12] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeIntervalForCandidateDeduping);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v16;
  v17[1] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresSmile);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v15;
  v17[2] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresNoBlink);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  v17[3] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumFaceQuality);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v3;
  v17[4] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumFaceSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v4;
  v17[5] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumFaceSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v5;
  v17[6] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumFaceRoll);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v6;
  v17[7] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumWallpaperScore);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[7] = v7;
  v17[8] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextAbsoluteMinimumWallpaperScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteMinimumWallpaperScore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[8] = v8;
  v17[9] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumCropScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[9] = v9;
  v17[10] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumLowLightScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumLowLightScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[10] = v10;
  v17[11] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumCropZoomRatio");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumCropZoomRatio);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[11] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)timeIntervalForCandidateDeduping
{
  return self->_timeIntervalForCandidateDeduping;
}

- (void)setTimeIntervalForCandidateDeduping:(double)a3
{
  self->_timeIntervalForCandidateDeduping = a3;
}

- (BOOL)requiresSmile
{
  return self->_requiresSmile;
}

- (void)setRequiresSmile:(BOOL)a3
{
  self->_requiresSmile = a3;
}

- (BOOL)requiresNoBlink
{
  return self->_requiresNoBlink;
}

- (void)setRequiresNoBlink:(BOOL)a3
{
  self->_requiresNoBlink = a3;
}

- (double)minimumFaceQuality
{
  return self->_minimumFaceQuality;
}

- (void)setMinimumFaceQuality:(double)a3
{
  self->_minimumFaceQuality = a3;
}

- (double)minimumFaceSize
{
  return self->_minimumFaceSize;
}

- (void)setMinimumFaceSize:(double)a3
{
  self->_minimumFaceSize = a3;
}

- (double)maximumFaceSize
{
  return self->_maximumFaceSize;
}

- (void)setMaximumFaceSize:(double)a3
{
  self->_maximumFaceSize = a3;
}

- (double)maximumFaceRoll
{
  return self->_maximumFaceRoll;
}

- (void)setMaximumFaceRoll:(double)a3
{
  self->_maximumFaceRoll = a3;
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
