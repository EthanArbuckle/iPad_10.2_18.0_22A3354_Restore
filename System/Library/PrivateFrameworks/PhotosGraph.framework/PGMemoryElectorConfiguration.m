@implementation PGMemoryElectorConfiguration

+ (id)defaultConfigurationDictionarySource
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  PGDictionaryConfigurationSource *v8;
  _QWORD v10[21];
  _QWORD v11[22];

  v11[21] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("localDate");
  objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("timeZone");
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v11[2] = MEMORY[0x1E0C9AAB0];
  v10[2] = CFSTR("shouldPersist");
  v10[3] = CFSTR("pendingState");
  v11[3] = &unk_1E84E4910;
  v11[4] = &unk_1E84E4928;
  v10[4] = CFSTR("maximumTargetNumberOfMemories");
  v10[5] = CFSTR("minimumTargetNumberOfMemories");
  v4 = MEMORY[0x1E0C9AAA0];
  v11[5] = &unk_1E84E4940;
  v11[6] = MEMORY[0x1E0C9AAA0];
  v10[6] = CFSTR("useMaximumTargetNumberOfMemories");
  v10[7] = CFSTR("maximumNumberOfMemoriesWithGuestAssets");
  v11[7] = &unk_1E84E4958;
  v11[8] = &unk_1E84EB438;
  v10[8] = CFSTR("maximumRatioOfGuestAssets");
  v10[9] = CFSTR("numberOfDaysToLookInPast");
  v11[9] = &unk_1E84E4970;
  v11[10] = &unk_1E84E4988;
  v10[10] = CFSTR("numberOfDaysToLookInFuture");
  v10[11] = CFSTR("numberOfDaysToFocusOnNewMemoryTypes");
  v11[11] = &unk_1E84E49A0;
  v11[12] = &unk_1E84E49B8;
  v10[12] = CFSTR("minimumNumberOfDaysBeforeTimeDecay");
  v10[13] = CFSTR("minimumNumberOfCuratedAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[13] = v5;
  v11[14] = MEMORY[0x1E0C9AA60];
  v10[14] = CFSTR("collidableSuggestions");
  v10[15] = CFSTR("skipEnrichment");
  v10[16] = CFSTR("requestedMemoryCategory");
  v10[17] = CFSTR("requestedTriggerType");
  v11[15] = v4;
  v11[16] = &unk_1E84E49D0;
  v11[17] = &unk_1E84E49D0;
  v11[18] = &stru_1E8436F28;
  v10[18] = CFSTR("requestedUniqueMemoryIdentifier");
  v10[19] = CFSTR("moodHistory");
  v11[19] = MEMORY[0x1E0C9AA60];
  v10[20] = CFSTR("allowGuestAsset");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[20] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PGDictionaryConfigurationSource initWithDictionary:]([PGDictionaryConfigurationSource alloc], "initWithDictionary:", v7);
  return v8;
}

- (PGMemoryElectorConfiguration)init
{
  void *v3;
  void *v4;
  PGMemoryElectorConfiguration *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultConfigurationDictionarySource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGConfiguration initWithSources:version:](self, "initWithSources:version:", v4, 1.0);

  return v5;
}

- (id)pastMemoryCollisionUniversalDateInterval
{
  PGMemoryDate *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[PGMemoryDate initWithLocalDate:]([PGMemoryDate alloc], "initWithLocalDate:", self->_localDate);
  -[PGMemoryDate universalDateInTimeZone:](v3, "universalDateInTimeZone:", self->_timeZone);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -self->_numberOfDaysToLookInPast, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v4);

  return v6;
}

- (id)futureMemoryCollisionUniversalDateInterval
{
  PGMemoryDate *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[PGMemoryDate initWithLocalDate:]([PGMemoryDate alloc], "initWithLocalDate:", self->_localDate);
  -[PGMemoryDate universalDateInTimeZone:](v3, "universalDateInTimeZone:", self->_timeZone);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", self->_numberOfDaysToLookInFuture, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v6);

  return v7;
}

- (unint64_t)targetNumberOfMemoriesWithMemoryContext:(id)a3 totalNumberOfMemoryNodes:(unint64_t)a4 referenceNumberOfDays:(unint64_t)a5
{
  id v8;
  void *v9;
  unint64_t maximumTargetNumberOfMemories;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  PGMemoryDate *v14;
  void *v15;
  PGMemoryDate *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;

  v8 = a3;
  v9 = v8;
  maximumTargetNumberOfMemories = self->_maximumTargetNumberOfMemories;
  if (!self->_useMaximumTargetNumberOfMemories)
  {
    v11 = vcvtpd_u64_f64((double)a4 / (double)a5);
    if (maximumTargetNumberOfMemories >= v11)
      v12 = v11;
    else
      v12 = self->_maximumTargetNumberOfMemories;
    if (maximumTargetNumberOfMemories > v11)
    {
      objc_msgSend(v8, "creationDateOfLastMemory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = [PGMemoryDate alloc];
        objc_msgSend(v9, "localDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PGMemoryDate initWithLocalDate:](v14, "initWithLocalDate:", v15);

        objc_msgSend(v9, "timeZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGMemoryDate universalDateInTimeZone:](v16, "universalDateInTimeZone:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeIntervalSinceDate:", v13);
        v20 = v19;

        v21 = (uint64_t)(v20 / 86400.0);
        v22 = self->_maximumTargetNumberOfMemories;
        v23 = v22;
        if (v21 < 2 * v22)
        {
          v23 = v12;
          if (v22 <= v21)
            v23 = vcvtpd_u64_f64((double)(unint64_t)v22 * 0.5);
        }

      }
      else
      {
        v23 = self->_maximumTargetNumberOfMemories;
      }

      v12 = v23;
    }
    if (v12 <= self->_minimumTargetNumberOfMemories)
      maximumTargetNumberOfMemories = self->_minimumTargetNumberOfMemories;
    else
      maximumTargetNumberOfMemories = v12;
  }

  return maximumTargetNumberOfMemories;
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (void)setLocalDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (unsigned)pendingState
{
  return self->_pendingState;
}

- (void)setPendingState:(unsigned __int16)a3
{
  self->_pendingState = a3;
}

- (unint64_t)maximumTargetNumberOfMemories
{
  return self->_maximumTargetNumberOfMemories;
}

- (void)setMaximumTargetNumberOfMemories:(unint64_t)a3
{
  self->_maximumTargetNumberOfMemories = a3;
}

- (unint64_t)minimumTargetNumberOfMemories
{
  return self->_minimumTargetNumberOfMemories;
}

- (void)setMinimumTargetNumberOfMemories:(unint64_t)a3
{
  self->_minimumTargetNumberOfMemories = a3;
}

- (BOOL)useMaximumTargetNumberOfMemories
{
  return self->_useMaximumTargetNumberOfMemories;
}

- (void)setUseMaximumTargetNumberOfMemories:(BOOL)a3
{
  self->_useMaximumTargetNumberOfMemories = a3;
}

- (unint64_t)maximumNumberOfMemoriesWithGuestAssets
{
  return self->_maximumNumberOfMemoriesWithGuestAssets;
}

- (void)setMaximumNumberOfMemoriesWithGuestAssets:(unint64_t)a3
{
  self->_maximumNumberOfMemoriesWithGuestAssets = a3;
}

- (double)maximumRatioOfGuestAssets
{
  return self->_maximumRatioOfGuestAssets;
}

- (void)setMaximumRatioOfGuestAssets:(double)a3
{
  self->_maximumRatioOfGuestAssets = a3;
}

- (unint64_t)numberOfDaysToLookInPast
{
  return self->_numberOfDaysToLookInPast;
}

- (void)setNumberOfDaysToLookInPast:(unint64_t)a3
{
  self->_numberOfDaysToLookInPast = a3;
}

- (unint64_t)numberOfDaysToLookInFuture
{
  return self->_numberOfDaysToLookInFuture;
}

- (void)setNumberOfDaysToLookInFuture:(unint64_t)a3
{
  self->_numberOfDaysToLookInFuture = a3;
}

- (unint64_t)numberOfDaysToFocusOnNewMemoryTypes
{
  return self->_numberOfDaysToFocusOnNewMemoryTypes;
}

- (void)setNumberOfDaysToFocusOnNewMemoryTypes:(unint64_t)a3
{
  self->_numberOfDaysToFocusOnNewMemoryTypes = a3;
}

- (unint64_t)minimumNumberOfDaysBeforeTimeDecay
{
  return self->_minimumNumberOfDaysBeforeTimeDecay;
}

- (void)setMinimumNumberOfDaysBeforeTimeDecay:(unint64_t)a3
{
  self->_minimumNumberOfDaysBeforeTimeDecay = a3;
}

- (unint64_t)minimumNumberOfCuratedAssets
{
  return self->_minimumNumberOfCuratedAssets;
}

- (void)setMinimumNumberOfCuratedAssets:(unint64_t)a3
{
  self->_minimumNumberOfCuratedAssets = a3;
}

- (NSArray)collidableSuggestions
{
  return self->_collidableSuggestions;
}

- (void)setCollidableSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_collidableSuggestions, a3);
}

- (BOOL)skipEnrichment
{
  return self->_skipEnrichment;
}

- (void)setSkipEnrichment:(BOOL)a3
{
  self->_skipEnrichment = a3;
}

- (unint64_t)requestedMemoryCategory
{
  return self->_requestedMemoryCategory;
}

- (void)setRequestedMemoryCategory:(unint64_t)a3
{
  self->_requestedMemoryCategory = a3;
}

- (unint64_t)requestedTriggerType
{
  return self->_requestedTriggerType;
}

- (void)setRequestedTriggerType:(unint64_t)a3
{
  self->_requestedTriggerType = a3;
}

- (PGFeature)requestedFeature
{
  return self->_requestedFeature;
}

- (void)setRequestedFeature:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFeature, a3);
}

- (NSString)requestedUniqueMemoryIdentifier
{
  return self->_requestedUniqueMemoryIdentifier;
}

- (void)setRequestedUniqueMemoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestedUniqueMemoryIdentifier, a3);
}

- (NSArray)moodHistory
{
  return self->_moodHistory;
}

- (void)setMoodHistory:(id)a3
{
  objc_storeStrong((id *)&self->_moodHistory, a3);
}

- (BOOL)allowGuestAsset
{
  return self->_allowGuestAsset;
}

- (void)setAllowGuestAsset:(BOOL)a3
{
  self->_allowGuestAsset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moodHistory, 0);
  objc_storeStrong((id *)&self->_requestedUniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedFeature, 0);
  objc_storeStrong((id *)&self->_collidableSuggestions, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localDate, 0);
}

@end
