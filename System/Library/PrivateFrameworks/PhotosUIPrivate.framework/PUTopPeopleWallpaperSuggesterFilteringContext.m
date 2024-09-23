@implementation PUTopPeopleWallpaperSuggesterFilteringContext

- (PUTopPeopleWallpaperSuggesterFilteringContext)init
{
  PUTopPeopleWallpaperSuggesterFilteringContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTopPeopleWallpaperSuggesterFilteringContext;
  result = -[PUTopPeopleWallpaperSuggesterFilteringContext init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_normalizedDeviationForVeryImportantPersons = xmmword_1AB0EF3A0;
    result->_favoritePersonsAreVIPs = 1;
    result->_minimumNumberOfCandidatesForEligiblePerson = 1;
    *(_WORD *)&result->_requiresSmile = 257;
    *(_OWORD *)&result->_timeIntervalForCandidateDeduping = xmmword_1AB0EF3B0;
    *(_OWORD *)&result->_minimumFaceSize = xmmword_1AB0EF3C0;
    *(_OWORD *)&result->_maximumFaceRoll = xmmword_1AB0EF3D0;
    result->_minimumCropScore = 0.6;
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[13];
  _QWORD v19[15];

  v19[13] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_normalizedDeviationForVeryImportantPersons);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v17;
  v18[1] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_normalizedDeviationForImportantPersons);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  v18[2] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_favoritePersonsAreVIPs);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  v18[3] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumNumberOfCandidatesForEligiblePerson);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v14;
  v18[4] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextTimeIntervalForCandidateDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeIntervalForCandidateDeduping);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v3;
  v18[5] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresSmile");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresSmile);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v4;
  v18[6] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextRequiresNoBlink");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresNoBlink);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v5;
  v18[7] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceQuality");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumFaceQuality);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v6;
  v18[8] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumFaceSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumFaceSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v7;
  v18[9] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumFaceSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v8;
  v18[10] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMaximumFaceRoll");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumFaceRoll);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v9;
  v18[11] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumWallpaperScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumWallpaperScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v10;
  v18[12] = CFSTR("PGSinglePersonWallpaperAssetSuggesterFilteringContextMinimumCropScore");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumCropScore);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)normalizedDeviationForVeryImportantPersons
{
  return self->_normalizedDeviationForVeryImportantPersons;
}

- (void)setNormalizedDeviationForVeryImportantPersons:(double)a3
{
  self->_normalizedDeviationForVeryImportantPersons = a3;
}

- (double)normalizedDeviationForImportantPersons
{
  return self->_normalizedDeviationForImportantPersons;
}

- (void)setNormalizedDeviationForImportantPersons:(double)a3
{
  self->_normalizedDeviationForImportantPersons = a3;
}

- (BOOL)favoritePersonsAreVIPs
{
  return self->_favoritePersonsAreVIPs;
}

- (void)setFavoritePersonsAreVIPs:(BOOL)a3
{
  self->_favoritePersonsAreVIPs = a3;
}

- (unint64_t)minimumNumberOfCandidatesForEligiblePerson
{
  return self->_minimumNumberOfCandidatesForEligiblePerson;
}

- (void)setMinimumNumberOfCandidatesForEligiblePerson:(unint64_t)a3
{
  self->_minimumNumberOfCandidatesForEligiblePerson = a3;
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

- (double)minimumCropScore
{
  return self->_minimumCropScore;
}

- (void)setMinimumCropScore:(double)a3
{
  self->_minimumCropScore = a3;
}

- (BOOL)requiresOutdoor
{
  return self->_requiresOutdoor;
}

- (void)setRequiresOutdoor:(BOOL)a3
{
  self->_requiresOutdoor = a3;
}

@end
