@implementation PUTopPeopleWallpaperSuggestionsScoringContext

- (PUTopPeopleWallpaperSuggestionsScoringContext)init
{
  PUTopPeopleWallpaperSuggestionsScoringContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTopPeopleWallpaperSuggestionsScoringContext;
  result = -[PUTopPeopleWallpaperSuggestionsScoringContext init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_favoriteFactor = xmmword_1AB0EF3E0;
    *(_OWORD *)&result->_peopleFactor = xmmword_1AB0EF3A0;
    *(_OWORD *)&result->_meaningFactor = xmmword_1AB0EF3F0;
    *(_OWORD *)&result->_wallpaperFactor = xmmword_1AB0EF400;
    result->_maximumSizeAllowedForFaces = 0.35;
  }
  return result;
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
  _QWORD v14[9];
  _QWORD v15[11];

  v15[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_favoriteFactor, CFSTR("favoriteFactor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("aestheticFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_aestheticFactor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("peopleFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_peopleFactor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("interactionFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_interactionFactor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v6;
  v14[4] = CFSTR("meaningFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_meaningFactor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v7;
  v14[5] = CFSTR("atHomeOrWorkFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_atHomeOrWorkFactor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  v14[6] = CFSTR("wallpaperFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_wallpaperFactor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v9;
  v14[7] = CFSTR("croppingFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_croppingFactor);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[7] = v10;
  v14[8] = CFSTR("maximumSizeAllowedForFaces");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumSizeAllowedForFaces);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)favoriteFactor
{
  return self->_favoriteFactor;
}

- (void)setFavoriteFactor:(double)a3
{
  self->_favoriteFactor = a3;
}

- (double)aestheticFactor
{
  return self->_aestheticFactor;
}

- (void)setAestheticFactor:(double)a3
{
  self->_aestheticFactor = a3;
}

- (double)peopleFactor
{
  return self->_peopleFactor;
}

- (void)setPeopleFactor:(double)a3
{
  self->_peopleFactor = a3;
}

- (double)interactionFactor
{
  return self->_interactionFactor;
}

- (void)setInteractionFactor:(double)a3
{
  self->_interactionFactor = a3;
}

- (double)meaningFactor
{
  return self->_meaningFactor;
}

- (void)setMeaningFactor:(double)a3
{
  self->_meaningFactor = a3;
}

- (double)atHomeOrWorkFactor
{
  return self->_atHomeOrWorkFactor;
}

- (void)setAtHomeOrWorkFactor:(double)a3
{
  self->_atHomeOrWorkFactor = a3;
}

- (double)wallpaperFactor
{
  return self->_wallpaperFactor;
}

- (void)setWallpaperFactor:(double)a3
{
  self->_wallpaperFactor = a3;
}

- (double)croppingFactor
{
  return self->_croppingFactor;
}

- (void)setCroppingFactor:(double)a3
{
  self->_croppingFactor = a3;
}

- (double)maximumSizeAllowedForFaces
{
  return self->_maximumSizeAllowedForFaces;
}

- (void)setMaximumSizeAllowedForFaces:(double)a3
{
  self->_maximumSizeAllowedForFaces = a3;
}

@end
