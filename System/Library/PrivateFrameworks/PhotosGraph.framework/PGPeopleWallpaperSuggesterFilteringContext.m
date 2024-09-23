@implementation PGPeopleWallpaperSuggesterFilteringContext

- (id)initForTopPeopleInOrientation:(int64_t)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  result = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForTopPeopleInOrientation:](&v4, sel_initForTopPeopleInOrientation_, a3);
  if (result)
  {
    *((_QWORD *)result + 14) = 0x3FF0000000000000;
    *((_QWORD *)result + 15) = 0x3FE0000000000000;
    *((_BYTE *)result + 104) = 1;
    *((_QWORD *)result + 16) = 2;
    *((_QWORD *)result + 17) = 1;
  }
  return result;
}

- (id)initForPeopleInOrientation:(int64_t)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  v3 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForPeopleInOrientation:](&v6, sel_initForPeopleInOrientation_, a3);
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "_commonInitForPeople");
  return v4;
}

- (id)initForAmbient
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  v2 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForAmbient](&v5, sel_initForAmbient);
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_commonInitForPeople");
  return v3;
}

- (void)_commonInitForPeople
{
  self->_normalizedDeviationForVeryImportantPersons = 1.0;
  self->_normalizedDeviationForImportantPersons = 0.5;
  self->_favoritePersonsAreVIPs = 1;
  self->_minimumPersonImportance = -1;
  self->_minimumNumberOfCandidatesForEligiblePerson = 1;
}

- (void)updateFilteringContextWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  -[PGSinglePersonWallpaperAssetSuggesterFilteringContext updateFilteringContextWithDictionary:](&v17, sel_updateFilteringContextWithDictionary_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    self->_normalizedDeviationForVeryImportantPersons = v7;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    self->_normalizedDeviationForImportantPersons = v10;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_favoritePersonsAreVIPs = objc_msgSend(v12, "BOOLValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextMinimumPersonImportance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextMinimumPersonImportance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_minimumPersonImportance = objc_msgSend(v14, "unsignedIntegerValue");

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_minimumNumberOfCandidatesForEligiblePerson = objc_msgSend(v16, "unsignedIntegerValue");

  }
}

- (id)initForTopPeople:(BOOL)a3 withDictionary:(id)a4 orientation:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  v9 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForTopPeople:withDictionary:orientation:](&v12, sel_initForTopPeople_withDictionary_orientation_, v6, v8, a5);
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "updateFilteringContextWithDictionary:", v8);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  result = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 14) = *(_QWORD *)&self->_normalizedDeviationForVeryImportantPersons;
  *((_QWORD *)result + 15) = *(_QWORD *)&self->_normalizedDeviationForImportantPersons;
  *((_BYTE *)result + 104) = self->_favoritePersonsAreVIPs;
  *((_QWORD *)result + 16) = self->_minimumPersonImportance;
  *((_QWORD *)result + 17) = self->_minimumNumberOfCandidatesForEligiblePerson;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PGPeopleWallpaperSuggesterFilteringContext *v4;
  uint64_t v5;
  BOOL v6;
  PGPeopleWallpaperSuggesterFilteringContext *v7;
  objc_super v9;

  v4 = (PGPeopleWallpaperSuggesterFilteringContext *)a3;
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
      v9.receiver = self;
      v9.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
      v6 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext isEqual:](&v9, sel_isEqual_, v7)
        && v7->_normalizedDeviationForVeryImportantPersons == self->_normalizedDeviationForVeryImportantPersons
        && v7->_normalizedDeviationForImportantPersons == self->_normalizedDeviationForImportantPersons
        && v7->_favoritePersonsAreVIPs == self->_favoritePersonsAreVIPs
        && v7->_minimumPersonImportance == self->_minimumPersonImportance
        && v7->_minimumNumberOfCandidatesForEligiblePerson == self->_minimumNumberOfCandidatesForEligiblePerson;

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
  objc_super v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PGPeopleWallpaperSuggesterFilteringContext;
  -[PGSinglePersonWallpaperAssetSuggesterFilteringContext dictionaryRepresentation](&v12, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v13[0] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForVeryImportantPersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_normalizedDeviationForVeryImportantPersons);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextNormalizedDeviationForImportantPersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_normalizedDeviationForImportantPersons);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextFavoritePersonsAreVIPs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_favoritePersonsAreVIPs);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextMinimumPersonImportance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minimumPersonImportance);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v8;
  v13[4] = CFSTR("PGPeopleWallpaperSuggesterFilteringContextMinimumNumberOfCandidatesForEligiblePerson");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_minimumNumberOfCandidatesForEligiblePerson);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v10);

  return v4;
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

- (int64_t)minimumPersonImportance
{
  return self->_minimumPersonImportance;
}

- (void)setMinimumPersonImportance:(int64_t)a3
{
  self->_minimumPersonImportance = a3;
}

- (unint64_t)minimumNumberOfCandidatesForEligiblePerson
{
  return self->_minimumNumberOfCandidatesForEligiblePerson;
}

- (void)setMinimumNumberOfCandidatesForEligiblePerson:(unint64_t)a3
{
  self->_minimumNumberOfCandidatesForEligiblePerson = a3;
}

@end
