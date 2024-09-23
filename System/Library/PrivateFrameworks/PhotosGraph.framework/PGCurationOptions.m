@implementation PGCurationOptions

- (PGCurationOptions)initWithDuration:(unint64_t)a3
{
  PGCurationOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGCurationOptions;
  result = -[PGCurationOptions init](&v5, sel_init);
  if (result)
  {
    result->_duration = a3;
    result->_identicalDedupingEnabled = 1;
    result->_semanticalDedupingUsesAdaptiveSimilarStacking = 1;
    result->_lastPassMovieAdditionEnabled = 1;
    *(_WORD *)&result->_useDurationBasedCuration = 0;
    result->_skipCurationIfEligibleItemsFitTargetDuration = 0;
    *(_OWORD *)&result->_defaultDurationOfStillPhoto = xmmword_1CA8ED930;
    *(_OWORD *)&result->_defaultDurationOfVideo = xmmword_1CA8ED940;
    result->_targetDuration = 60.0;
    result->_sharingFilter = 2;
    *(_OWORD *)&result->_minimumNumberOfItems = xmmword_1CA8ED950;
  }
  return result;
}

- (PGCurationOptions)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  PGCurationOptions *v5;
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
  uint64_t v16;
  NSSet *uuidsOfRequiredAssets;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *uuidsOfEligibleAssets;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSSet *personLocalIdentifiersToFocus;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PGCurationOptions;
  v5 = -[PGCurationOptions init](&v48, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_duration = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("includesAllFaces"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includesAllFaces = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalDedupingEnabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identicalDedupingEnabled = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_semanticalDedupingEnabled = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticalDedupingUsesAdaptiveSimilarStacking"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_semanticalDedupingUsesAdaptiveSimilarStacking = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("movieDedupingEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_movieDedupingEnabled = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastPassMovieAdditionEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lastPassMovieAdditionEnabled = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldSkipClustering"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldSkipClustering = objc_msgSend(v13, "BOOLValue");

    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuidsOfRequiredAssets"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    uuidsOfRequiredAssets = v5->_uuidsOfRequiredAssets;
    v5->_uuidsOfRequiredAssets = (NSSet *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uuidsOfEligibleAssets"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    uuidsOfEligibleAssets = v5->_uuidsOfEligibleAssets;
    v5->_uuidsOfEligibleAssets = (NSSet *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("focusOnPeople"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_focusOnPeople = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("focusOnInterestingItems"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_focusOnInterestingItems = objc_msgSend(v23, "BOOLValue");

    v24 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personLocalIdentifiersToFocus"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setWithArray:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    personLocalIdentifiersToFocus = v5->_personLocalIdentifiersToFocus;
    v5->_personLocalIdentifiersToFocus = (NSSet *)v26;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useDurationBasedCuration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useDurationBasedCuration = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("failIfMinimumDurationNotReached"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_failIfMinimumDurationNotReached = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("skipCurationIfEligibleItemsFitTargetDuration"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_skipCurationIfEligibleItemsFitTargetDuration = objc_msgSend(v30, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultDurationOfStillPhoto"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "doubleValue");
      v5->_defaultDurationOfStillPhoto = v33;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultDurationOfPhoto"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v5->_defaultDurationOfStillPhoto = v35;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultDurationOfLivePhoto"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    v5->_defaultDurationOfLivePhoto = v37;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("defaultDurationOfVideo"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v5->_defaultDurationOfVideo = v39;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumDuration"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleValue");
    v5->_minimumDuration = v41;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetDuration"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    v5->_targetDuration = v43;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minimumNumberOfItems"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minimumNumberOfItems = objc_msgSend(v44, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sharingFilter"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sharingFilter = objc_msgSend(v45, "unsignedShortValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetNumberOfItems"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetNumberOfItems = objc_msgSend(v46, "unsignedIntegerValue");

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PGCurationOptions;
  -[PGCurationOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 24) = self->_duration;
  *(_BYTE *)(v4 + 15) = self->_focusOnPeople;
  *(_BYTE *)(v4 + 16) = self->_focusOnInterestingItems;
  *(_BYTE *)(v4 + 8) = self->_includesAllFaces;
  *(_BYTE *)(v4 + 9) = self->_identicalDedupingEnabled;
  *(_BYTE *)(v4 + 10) = self->_semanticalDedupingEnabled;
  *(_BYTE *)(v4 + 11) = self->_semanticalDedupingUsesAdaptiveSimilarStacking;
  *(_BYTE *)(v4 + 12) = self->_movieDedupingEnabled;
  *(_BYTE *)(v4 + 13) = self->_lastPassMovieAdditionEnabled;
  *(_BYTE *)(v4 + 14) = self->_shouldSkipClustering;
  v5 = -[NSSet copy](self->_uuidsOfRequiredAssets, "copy");
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v5;

  v7 = -[NSSet copy](self->_uuidsOfEligibleAssets, "copy");
  v8 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v7;

  v9 = -[NSSet copy](self->_personLocalIdentifiersToFocus, "copy");
  v10 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v9;

  *(_BYTE *)(v4 + 17) = self->_useDurationBasedCuration;
  *(_BYTE *)(v4 + 18) = self->_failIfMinimumDurationNotReached;
  *(_BYTE *)(v4 + 19) = self->_skipCurationIfEligibleItemsFitTargetDuration;
  *(double *)(v4 + 56) = self->_defaultDurationOfStillPhoto;
  *(double *)(v4 + 64) = self->_defaultDurationOfLivePhoto;
  *(double *)(v4 + 72) = self->_defaultDurationOfVideo;
  *(double *)(v4 + 80) = self->_minimumDuration;
  *(double *)(v4 + 88) = self->_targetDuration;
  *(_QWORD *)(v4 + 96) = self->_minimumNumberOfItems;
  *(_WORD *)(v4 + 20) = self->_sharingFilter;
  *(_QWORD *)(v4 + 104) = self->_targetNumberOfItems;
  return (id)v4;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_duration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("duration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_includesAllFaces);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("includesAllFaces"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_identicalDedupingEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identicalDedupingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_semanticalDedupingEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("semanticalDedupingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_semanticalDedupingUsesAdaptiveSimilarStacking);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("semanticalDedupingUsesAdaptiveSimilarStacking"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_movieDedupingEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("movieDedupingEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastPassMovieAdditionEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("lastPassMovieAdditionEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSkipClustering);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("shouldSkipClustering"));

  -[NSSet allObjects](self->_uuidsOfRequiredAssets, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("uuidsOfRequiredAssets"));

  -[NSSet allObjects](self->_uuidsOfEligibleAssets, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("uuidsOfEligibleAssets"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_focusOnPeople);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("focusOnPeople"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_focusOnInterestingItems);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("focusOnInterestingItems"));

  -[NSSet allObjects](self->_personLocalIdentifiersToFocus, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("personLocalIdentifiersToFocus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useDurationBasedCuration);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("useDurationBasedCuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_failIfMinimumDurationNotReached);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("failIfMinimumDurationNotReached"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_skipCurationIfEligibleItemsFitTargetDuration);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("skipCurationIfEligibleItemsFitTargetDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultDurationOfStillPhoto);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("defaultDurationOfStillPhoto"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultDurationOfLivePhoto);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("defaultDurationOfLivePhoto"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_defaultDurationOfVideo);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("defaultDurationOfVideo"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumDuration);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("minimumDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_targetDuration);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("targetDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumNumberOfItems);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("minimumNumberOfItems"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_sharingFilter);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("sharingFilter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_targetNumberOfItems);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("targetNumberOfItems"));

  return v3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (BOOL)includesAllFaces
{
  return self->_includesAllFaces;
}

- (void)setIncludesAllFaces:(BOOL)a3
{
  self->_includesAllFaces = a3;
}

- (BOOL)identicalDedupingIsEnabled
{
  return self->_identicalDedupingEnabled;
}

- (void)setIdenticalDedupingEnabled:(BOOL)a3
{
  self->_identicalDedupingEnabled = a3;
}

- (BOOL)semanticalDedupingIsEnabled
{
  return self->_semanticalDedupingEnabled;
}

- (void)setSemanticalDedupingEnabled:(BOOL)a3
{
  self->_semanticalDedupingEnabled = a3;
}

- (BOOL)semanticalDedupingUsesAdaptiveSimilarStacking
{
  return self->_semanticalDedupingUsesAdaptiveSimilarStacking;
}

- (void)setSemanticalDedupingUsesAdaptiveSimilarStacking:(BOOL)a3
{
  self->_semanticalDedupingUsesAdaptiveSimilarStacking = a3;
}

- (BOOL)movieDedupingIsEnabled
{
  return self->_movieDedupingEnabled;
}

- (void)setMovieDedupingEnabled:(BOOL)a3
{
  self->_movieDedupingEnabled = a3;
}

- (BOOL)lastPassMovieAdditionIsEnabled
{
  return self->_lastPassMovieAdditionEnabled;
}

- (void)setLastPassMovieAdditionEnabled:(BOOL)a3
{
  self->_lastPassMovieAdditionEnabled = a3;
}

- (BOOL)shouldSkipClustering
{
  return self->_shouldSkipClustering;
}

- (void)setShouldSkipClustering:(BOOL)a3
{
  self->_shouldSkipClustering = a3;
}

- (NSSet)uuidsOfRequiredAssets
{
  return self->_uuidsOfRequiredAssets;
}

- (void)setUuidsOfRequiredAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)uuidsOfEligibleAssets
{
  return self->_uuidsOfEligibleAssets;
}

- (void)setUuidsOfEligibleAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)focusOnPeople
{
  return self->_focusOnPeople;
}

- (void)setFocusOnPeople:(BOOL)a3
{
  self->_focusOnPeople = a3;
}

- (BOOL)focusOnInterestingItems
{
  return self->_focusOnInterestingItems;
}

- (void)setFocusOnInterestingItems:(BOOL)a3
{
  self->_focusOnInterestingItems = a3;
}

- (NSSet)personLocalIdentifiersToFocus
{
  return self->_personLocalIdentifiersToFocus;
}

- (void)setPersonLocalIdentifiersToFocus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)useDurationBasedCuration
{
  return self->_useDurationBasedCuration;
}

- (void)setUseDurationBasedCuration:(BOOL)a3
{
  self->_useDurationBasedCuration = a3;
}

- (BOOL)failIfMinimumDurationNotReached
{
  return self->_failIfMinimumDurationNotReached;
}

- (void)setFailIfMinimumDurationNotReached:(BOOL)a3
{
  self->_failIfMinimumDurationNotReached = a3;
}

- (BOOL)skipCurationIfEligibleItemsFitTargetDuration
{
  return self->_skipCurationIfEligibleItemsFitTargetDuration;
}

- (void)setSkipCurationIfEligibleItemsFitTargetDuration:(BOOL)a3
{
  self->_skipCurationIfEligibleItemsFitTargetDuration = a3;
}

- (double)defaultDurationOfStillPhoto
{
  return self->_defaultDurationOfStillPhoto;
}

- (void)setDefaultDurationOfStillPhoto:(double)a3
{
  self->_defaultDurationOfStillPhoto = a3;
}

- (double)defaultDurationOfLivePhoto
{
  return self->_defaultDurationOfLivePhoto;
}

- (void)setDefaultDurationOfLivePhoto:(double)a3
{
  self->_defaultDurationOfLivePhoto = a3;
}

- (double)defaultDurationOfVideo
{
  return self->_defaultDurationOfVideo;
}

- (void)setDefaultDurationOfVideo:(double)a3
{
  self->_defaultDurationOfVideo = a3;
}

- (double)minimumDuration
{
  return self->_minimumDuration;
}

- (void)setMinimumDuration:(double)a3
{
  self->_minimumDuration = a3;
}

- (double)targetDuration
{
  return self->_targetDuration;
}

- (void)setTargetDuration:(double)a3
{
  self->_targetDuration = a3;
}

- (unint64_t)minimumNumberOfItems
{
  return self->_minimumNumberOfItems;
}

- (void)setMinimumNumberOfItems:(unint64_t)a3
{
  self->_minimumNumberOfItems = a3;
}

- (unsigned)sharingFilter
{
  return self->_sharingFilter;
}

- (void)setSharingFilter:(unsigned __int16)a3
{
  self->_sharingFilter = a3;
}

- (unint64_t)targetNumberOfItems
{
  return self->_targetNumberOfItems;
}

- (void)setTargetNumberOfItems:(unint64_t)a3
{
  self->_targetNumberOfItems = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiersToFocus, 0);
  objc_storeStrong((id *)&self->_uuidsOfEligibleAssets, 0);
  objc_storeStrong((id *)&self->_uuidsOfRequiredAssets, 0);
}

+ (id)defaultOptions
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDuration:", 2);
}

@end
