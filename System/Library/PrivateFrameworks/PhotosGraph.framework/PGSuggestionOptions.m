@implementation PGSuggestionOptions

- (PGSuggestionOptions)init
{
  PGSuggestionOptions *v2;
  uint64_t v3;
  NSDate *localToday;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGSuggestionOptions;
  v2 = -[PGSuggestionOptions init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v3 = objc_claimAutoreleasedReturnValue();
    localToday = v2->_localToday;
    v2->_localToday = (NSDate *)v3;

    v2->_maximumNumberOfSuggestions = -1;
    v2->_shouldProcessExistingSuggestions = 1;
  }
  return v2;
}

- (PGSuggestionOptions)initWithOptionsDictionary:(id)a3
{
  id v4;
  PGSuggestionOptions *v5;
  void *v6;
  uint64_t v7;
  NSDate *universalStartDate;
  uint64_t v9;
  uint64_t v10;
  NSDate *universalEndDate;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *universalEndDateForWholeLibrarySuggestions;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int16 v24;
  void *v25;
  unsigned __int16 v26;
  uint64_t v27;
  NSIndexSet *suggestionTypeWhitelist;
  uint64_t v29;
  NSIndexSet *suggestionSubtypeWhitelist;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSDictionary *additionalOptions;
  void *v35;

  v4 = a3;
  v5 = -[PGSuggestionOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&v5->_localToday, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722B8]);
    v7 = objc_claimAutoreleasedReturnValue();
    universalStartDate = v5->_universalStartDate;
    v5->_universalStartDate = (NSDate *)v7;

    v9 = *MEMORY[0x1E0D72280];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72280]);
    v10 = objc_claimAutoreleasedReturnValue();
    universalEndDate = v5->_universalEndDate;
    v5->_universalEndDate = (NSDate *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72278]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v9);
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    universalEndDateForWholeLibrarySuggestions = v5->_universalEndDateForWholeLibrarySuggestions;
    v5->_universalEndDateForWholeLibrarySuggestions = v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72260]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v5->_allowNotification = objc_msgSend(v16, "BOOLValue");
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72290]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ignoreCollisionsWithExistingSuggestions = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72298]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ignoreCollisionsWithSameBatchSuggestions = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72268]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_computeReasons = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722B0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldProcessExistingSuggestions = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72270]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_discardGeneratedSuggestions = objc_msgSend(v22, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722D0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722C0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "integerValue");

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v24);
      v27 = objc_claimAutoreleasedReturnValue();
      suggestionTypeWhitelist = v5->_suggestionTypeWhitelist;
      v5->_suggestionTypeWhitelist = (NSIndexSet *)v27;

    }
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v26);
      v29 = objc_claimAutoreleasedReturnValue();
      suggestionSubtypeWhitelist = v5->_suggestionSubtypeWhitelist;
      v5->_suggestionSubtypeWhitelist = (NSIndexSet *)v29;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722A8]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedIntegerValue");

    if (v32)
      v5->_maximumNumberOfSuggestions = v32;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72258]);
    v33 = objc_claimAutoreleasedReturnValue();
    additionalOptions = v5->_additionalOptions;
    v5->_additionalOptions = (NSDictionary *)v33;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722A0]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_noLimitPerFeature = objc_msgSend(v35, "BOOLValue");

  }
  return v5;
}

- (void)setDefaultStartAndEndDatesIfNeeded
{
  -[PGSuggestionOptions setDefaultStartAndEndDatesIfNeededWithNumberOfDays:](self, "setDefaultStartAndEndDatesIfNeededWithNumberOfDays:", 30);
}

- (void)setDefaultStartAndEndDatesIfNeededWithNumberOfDays:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PGSuggestionOptions universalStartDate](self, "universalStartDate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PGSuggestionOptions universalEndDate](self, "universalEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v13)
      goto LABEL_4;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D4B130];
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", a3, v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PGSuggestionOptions localToday](self, "localToday");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startOfDayForDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0D4B130];
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "universalDateFromLocalDate:inTimeZone:", v10, v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PGSuggestionOptions setUniversalEndDate:](self, "setUniversalEndDate:", v5);
    if (v13)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -a3, v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PGSuggestionOptions setUniversalStartDate:](self, "setUniversalStartDate:");
LABEL_4:
  -[PGSuggestionOptions universalEndDateForWholeLibrarySuggestions](self, "universalEndDateForWholeLibrarySuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PGSuggestionOptions universalStartDate](self, "universalStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSuggestionOptions setUniversalEndDateForWholeLibrarySuggestions:](self, "setUniversalEndDateForWholeLibrarySuggestions:", v7);

  }
}

- (NSDate)localToday
{
  return self->_localToday;
}

- (void)setLocalToday:(id)a3
{
  objc_storeStrong((id *)&self->_localToday, a3);
}

- (NSDate)universalStartDate
{
  return self->_universalStartDate;
}

- (void)setUniversalStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_universalStartDate, a3);
}

- (NSDate)universalEndDate
{
  return self->_universalEndDate;
}

- (void)setUniversalEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_universalEndDate, a3);
}

- (NSDate)universalEndDateForWholeLibrarySuggestions
{
  return self->_universalEndDateForWholeLibrarySuggestions;
}

- (void)setUniversalEndDateForWholeLibrarySuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_universalEndDateForWholeLibrarySuggestions, a3);
}

- (unint64_t)maximumNumberOfSuggestions
{
  return self->_maximumNumberOfSuggestions;
}

- (void)setMaximumNumberOfSuggestions:(unint64_t)a3
{
  self->_maximumNumberOfSuggestions = a3;
}

- (BOOL)allowNotification
{
  return self->_allowNotification;
}

- (void)setAllowNotification:(BOOL)a3
{
  self->_allowNotification = a3;
}

- (BOOL)shouldProcessExistingSuggestions
{
  return self->_shouldProcessExistingSuggestions;
}

- (void)setShouldProcessExistingSuggestions:(BOOL)a3
{
  self->_shouldProcessExistingSuggestions = a3;
}

- (BOOL)discardGeneratedSuggestions
{
  return self->_discardGeneratedSuggestions;
}

- (void)setDiscardGeneratedSuggestions:(BOOL)a3
{
  self->_discardGeneratedSuggestions = a3;
}

- (BOOL)ignoreCollisionsWithExistingSuggestions
{
  return self->_ignoreCollisionsWithExistingSuggestions;
}

- (void)setIgnoreCollisionsWithExistingSuggestions:(BOOL)a3
{
  self->_ignoreCollisionsWithExistingSuggestions = a3;
}

- (BOOL)ignoreCollisionsWithSameBatchSuggestions
{
  return self->_ignoreCollisionsWithSameBatchSuggestions;
}

- (void)setIgnoreCollisionsWithSameBatchSuggestions:(BOOL)a3
{
  self->_ignoreCollisionsWithSameBatchSuggestions = a3;
}

- (NSIndexSet)suggestionTypeWhitelist
{
  return self->_suggestionTypeWhitelist;
}

- (void)setSuggestionTypeWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionTypeWhitelist, a3);
}

- (NSIndexSet)suggestionSubtypeWhitelist
{
  return self->_suggestionSubtypeWhitelist;
}

- (void)setSuggestionSubtypeWhitelist:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionSubtypeWhitelist, a3);
}

- (NSIndexSet)suggestionTypeBlocklist
{
  return self->_suggestionTypeBlocklist;
}

- (void)setSuggestionTypeBlocklist:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionTypeBlocklist, a3);
}

- (NSIndexSet)suggestionSubtypeBlocklist
{
  return self->_suggestionSubtypeBlocklist;
}

- (void)setSuggestionSubtypeBlocklist:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionSubtypeBlocklist, a3);
}

- (BOOL)generateInvalidSuggestions
{
  return self->_generatesInvalidSuggestions;
}

- (void)setGenerateInvalidSuggestions:(BOOL)a3
{
  self->_generatesInvalidSuggestions = a3;
}

- (BOOL)computeReasons
{
  return self->_computeReasons;
}

- (void)setComputeReasons:(BOOL)a3
{
  self->_computeReasons = a3;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void)setAdditionalOptions:(id)a3
{
  objc_storeStrong((id *)&self->_additionalOptions, a3);
}

- (BOOL)clearFeaturedSuggestions
{
  return self->_clearFeaturedSuggestions;
}

- (void)setClearFeaturedSuggestions:(BOOL)a3
{
  self->_clearFeaturedSuggestions = a3;
}

- (BOOL)noLimitPerFeature
{
  return self->_noLimitPerFeature;
}

- (void)setNoLimitPerFeature:(BOOL)a3
{
  self->_noLimitPerFeature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);
  objc_storeStrong((id *)&self->_suggestionSubtypeBlocklist, 0);
  objc_storeStrong((id *)&self->_suggestionTypeBlocklist, 0);
  objc_storeStrong((id *)&self->_suggestionSubtypeWhitelist, 0);
  objc_storeStrong((id *)&self->_suggestionTypeWhitelist, 0);
  objc_storeStrong((id *)&self->_universalEndDateForWholeLibrarySuggestions, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_localToday, 0);
}

@end
