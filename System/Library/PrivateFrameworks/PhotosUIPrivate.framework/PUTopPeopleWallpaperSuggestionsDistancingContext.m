@implementation PUTopPeopleWallpaperSuggestionsDistancingContext

- (PUTopPeopleWallpaperSuggestionsDistancingContext)init
{
  PUTopPeopleWallpaperSuggestionsDistancingContext *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUTopPeopleWallpaperSuggestionsDistancingContext;
  result = -[PUTopPeopleWallpaperSuggestionsDistancingContext init](&v8, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_timePivot = xmmword_1AB0EF410;
    *(_OWORD *)&result->_peoplePivot = xmmword_1AB0EF420;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_timeFactor = _Q0;
    *(_OWORD *)&result->_peopleFactor = xmmword_1AB0EF430;
    *(int64x2_t *)&result->_maximumNumberOfSuggestionsWithPeople = vdupq_n_s64(7uLL);
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
  void *v14;
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("timePivot");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timePivot);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("locationPivot");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationPivot);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("peoplePivot");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_peoplePivot);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("sceneprintPivot");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sceneprintPivot);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("timeFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeFactor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("locationFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_locationFactor);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("peopleFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_peopleFactor);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("sceneprintFactor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_sceneprintFactor);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("maximumNumberOfSuggestionsWithPeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumNumberOfSuggestionsWithPeople);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  v15[9] = CFSTR("maximumNumberOfSuggestionsWithoutPeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maximumNumberOfSuggestionsWithoutPeople);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)timePivot
{
  return self->_timePivot;
}

- (void)setTimePivot:(double)a3
{
  self->_timePivot = a3;
}

- (double)locationPivot
{
  return self->_locationPivot;
}

- (void)setLocationPivot:(double)a3
{
  self->_locationPivot = a3;
}

- (double)peoplePivot
{
  return self->_peoplePivot;
}

- (void)setPeoplePivot:(double)a3
{
  self->_peoplePivot = a3;
}

- (double)sceneprintPivot
{
  return self->_sceneprintPivot;
}

- (void)setSceneprintPivot:(double)a3
{
  self->_sceneprintPivot = a3;
}

- (double)timeFactor
{
  return self->_timeFactor;
}

- (void)setTimeFactor:(double)a3
{
  self->_timeFactor = a3;
}

- (double)locationFactor
{
  return self->_locationFactor;
}

- (void)setLocationFactor:(double)a3
{
  self->_locationFactor = a3;
}

- (double)peopleFactor
{
  return self->_peopleFactor;
}

- (void)setPeopleFactor:(double)a3
{
  self->_peopleFactor = a3;
}

- (double)sceneprintFactor
{
  return self->_sceneprintFactor;
}

- (void)setSceneprintFactor:(double)a3
{
  self->_sceneprintFactor = a3;
}

- (unint64_t)maximumNumberOfSuggestionsWithPeople
{
  return self->_maximumNumberOfSuggestionsWithPeople;
}

- (void)setMaximumNumberOfSuggestionsWithPeople:(unint64_t)a3
{
  self->_maximumNumberOfSuggestionsWithPeople = a3;
}

- (unint64_t)maximumNumberOfSuggestionsWithoutPeople
{
  return self->_maximumNumberOfSuggestionsWithoutPeople;
}

- (void)setMaximumNumberOfSuggestionsWithoutPeople:(unint64_t)a3
{
  self->_maximumNumberOfSuggestionsWithoutPeople = a3;
}

@end
