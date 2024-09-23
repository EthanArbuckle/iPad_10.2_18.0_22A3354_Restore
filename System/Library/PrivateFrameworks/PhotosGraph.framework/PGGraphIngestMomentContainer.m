@implementation PGGraphIngestMomentContainer

- (id)initMomentContainerWithFeeder:(id)a3 clueCollection:(id)a4 curationManager:(id)a5 topTierAestheticScore:(double)a6 curationContext:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PGGraphIngestMomentContainer *v17;
  PGGraphIngestMomentContainer *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PGGraphIngestMomentContainer;
  v17 = -[PGGraphIngestMomentContainer init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_feeder, a3);
    objc_storeStrong((id *)&v18->_clueCollection, a4);
    objc_storeStrong((id *)&v18->_curationManager, a5);
    v18->_topTierAestheticScore = a6;
    objc_storeStrong((id *)&v18->_curationContext, a7);
  }

  return v18;
}

- (BOOL)isInteresting
{
  -[PGGraphIngestMomentContainer _computeScoresIfNeeded](self, "_computeScoresIfNeeded");
  return -[NSNumber BOOLValue](self->_isInterestingNumber, "BOOLValue");
}

- (BOOL)isInterestingWithAlternateJunking
{
  -[PGGraphIngestMomentContainer _computeScoresIfNeeded](self, "_computeScoresIfNeeded");
  return -[NSNumber BOOLValue](self->_isInterestingWithAlternateJunkingNumber, "BOOLValue");
}

- (BOOL)isSmartInteresting
{
  -[PGGraphIngestMomentContainer _computeScoresIfNeeded](self, "_computeScoresIfNeeded");
  return -[NSNumber BOOLValue](self->_isSmartInterestingNumber, "BOOLValue");
}

- (double)contentScore
{
  double result;

  -[PGGraphIngestMomentContainer _computeScoresIfNeeded](self, "_computeScoresIfNeeded");
  -[NSNumber doubleValue](self->_contentScoreNumber, "doubleValue");
  return result;
}

- (void)_computeScoresIfNeeded
{
  NSNumber *isInterestingNumber;
  CLSInvestigationPhotoKitFeeder *feeder;
  _BOOL8 v5;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *isSmartInterestingNumber;
  void *v10;
  NSNumber *v11;
  NSNumber *contentScoreNumber;
  void *v13;
  _BOOL8 v14;
  NSNumber *v15;
  NSNumber *isInterestingWithAlternateJunkingNumber;
  NSNumber *v17;
  NSNumber *v18;
  NSNumber *v19;
  NSNumber *v20;
  char v21;

  isInterestingNumber = self->_isInterestingNumber;
  if (!isInterestingNumber
    || !self->_isInterestingWithAlternateJunkingNumber
    || !self->_isSmartInterestingNumber
    || !self->_contentScoreNumber)
  {
    feeder = self->_feeder;
    if (feeder)
    {
      v5 = -[PGCurationManager isAssetFeederInteresting:withAlternateJunking:smart:](self->_curationManager, "isAssetFeederInteresting:withAlternateJunking:smart:", feeder, 0, 0);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v7 = self->_isInterestingNumber;
      self->_isInterestingNumber = v6;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PGCurationManager isAssetFeederInteresting:withAlternateJunking:smart:](self->_curationManager, "isAssetFeederInteresting:withAlternateJunking:smart:", self->_feeder, 0, 1));
      v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      isSmartInterestingNumber = self->_isSmartInterestingNumber;
      self->_isSmartInterestingNumber = v8;

      v10 = (void *)MEMORY[0x1E0CB37E8];
      -[PGCurationManager contentScoreForAssetFeeder:](self->_curationManager, "contentScoreForAssetFeeder:", self->_feeder);
      objc_msgSend(v10, "numberWithDouble:");
      v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      contentScoreNumber = self->_contentScoreNumber;
      self->_contentScoreNumber = v11;

      objc_storeStrong((id *)&self->_isInterestingWithAlternateJunkingNumber, self->_isInterestingNumber);
      if (v5)
      {
        v21 = 0;
        +[PGMemoryGenerationHelper feederForMemoriesWithFeeder:topTierAestheticScore:didFeederChange:curationContext:](PGMemoryGenerationHelper, "feederForMemoriesWithFeeder:topTierAestheticScore:didFeederChange:curationContext:", self->_feeder, &v21, self->_curationContext, self->_topTierAestheticScore);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v14 = -[PGCurationManager isAssetFeederInteresting:withAlternateJunking:smart:](self->_curationManager, "isAssetFeederInteresting:withAlternateJunking:smart:", v13, 1, 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
          v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          isInterestingWithAlternateJunkingNumber = self->_isInterestingWithAlternateJunkingNumber;
          self->_isInterestingWithAlternateJunkingNumber = v15;

        }
      }
    }
    else
    {
      v17 = (NSNumber *)MEMORY[0x1E0C9AAB0];
      self->_isInterestingNumber = (NSNumber *)MEMORY[0x1E0C9AAB0];

      v18 = self->_isInterestingWithAlternateJunkingNumber;
      self->_isInterestingWithAlternateJunkingNumber = v17;

      v19 = self->_isSmartInterestingNumber;
      self->_isSmartInterestingNumber = v17;

      v20 = self->_contentScoreNumber;
      self->_contentScoreNumber = (NSNumber *)&unk_1E84EB218;

    }
  }
}

- (NSDate)localStartDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CLSInvestigationPhotoKitFeeder localStartDate](self->_feeder, "localStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CLSClueCollection localStartDate](self->_clueCollection, "localStartDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)localEndDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CLSInvestigationPhotoKitFeeder localEndDate](self->_feeder, "localEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CLSClueCollection localEndDate](self->_clueCollection, "localEndDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)universalStartDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CLSInvestigationPhotoKitFeeder universalStartDate](self->_feeder, "universalStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CLSClueCollection universalStartDate](self->_clueCollection, "universalStartDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)universalEndDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CLSInvestigationPhotoKitFeeder universalEndDate](self->_feeder, "universalEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CLSClueCollection universalEndDate](self->_clueCollection, "universalEndDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (unint64_t)numberOfItems
{
  return -[CLSInvestigationPhotoKitFeeder numberOfItems](self->_feeder, "numberOfItems");
}

- (id)assetsInExtendedCuration
{
  PHFetchResult *assetsInExtendedCuration;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHFetchResult *v9;
  PHFetchResult *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  assetsInExtendedCuration = self->_assetsInExtendedCuration;
  if (!assetsInExtendedCuration)
  {
    -[CLSInvestigationPhotoKitFeeder assetCollection](self->_feeder, "assetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlightBeingExtendedAssets != nil"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalPredicate:", v7);

    v12[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFetchPropertySets:", v8);

    objc_msgSend(v6, "setShouldPrefetchCount:", 1);
    objc_msgSend(v6, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v6);
    v9 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v10 = self->_assetsInExtendedCuration;
    self->_assetsInExtendedCuration = v9;

    assetsInExtendedCuration = self->_assetsInExtendedCuration;
  }
  return assetsInExtendedCuration;
}

- (unint64_t)numberOfAssetsInExtendedCuration
{
  void *v2;
  unint64_t v3;

  -[PGGraphIngestMomentContainer assetsInExtendedCuration](self, "assetsInExtendedCuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)numberOfItemsWithPersons
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "clsPeopleCount"))
          ++v5;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)totalNumberOfPersons
{
  CLSInvestigationPhotoKitFeeder *feeder;

  feeder = self->_feeder;
  if (feeder)
    return -[CLSInvestigationPhotoKitFeeder numberOfAllPeople](feeder, "numberOfAllPeople");
  else
    return -[CLSClueCollection numberOfPersons](self->_clueCollection, "numberOfPersons");
}

- (double)inhabitationScore
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[CLSInvestigationPhotoKitFeeder numberOfItems](self->_feeder, "numberOfItems");
  if (!v3)
    return 0.0;
  v4 = v3;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "clsIsInhabited");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
    v11 = (double)v8;
  }
  else
  {
    v11 = 0.0;
  }

  return v11 / (double)v4;
}

- (BOOL)hasHigherThanImprovedAssets
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t i;
  void *v7;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    v5 = *MEMORY[0x1E0D77DE8];
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "clsContentScore");
        if (v8 > v5 && !objc_msgSend(v7, "clsIsUtility"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)hasAssetsWithInterestingScenes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "clsIsUtility") & 1) == 0 && (objc_msgSend(v6, "clsHasInterestingScenes") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)containsBetterScoringAsset
{
  return -[CLSInvestigationPhotoKitFeeder hasBestScoringAssets](self->_feeder, "hasBestScoringAssets");
}

- (BOOL)containsNonJunkAssets
{
  return -[CLSInvestigationPhotoKitFeeder hasNonJunkAssets](self->_feeder, "hasNonJunkAssets");
}

- (NSString)uuid
{
  void *v2;
  void *v3;

  -[CLSInvestigationPhotoKitFeeder assetCollection](self->_feeder, "assetCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)numberOfShinyGemItems
{
  return -[CLSInvestigationPhotoKitFeeder numberOfShinyGemItems](self->_feeder, "numberOfShinyGemItems");
}

- (unint64_t)numberOfRegularGemItems
{
  return -[CLSInvestigationPhotoKitFeeder numberOfRegularGemItems](self->_feeder, "numberOfRegularGemItems");
}

- (double)behavioralScore
{
  double result;

  -[CLSInvestigationPhotoKitFeeder behavioralScore](self->_feeder, "behavioralScore");
  return result;
}

- (double)scenesProcessedRatio
{
  NSNumber *scenesProcessedRatioAsNumber;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double result;
  NSNumber *v14;
  NSNumber *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  scenesProcessedRatioAsNumber = self->_scenesProcessedRatioAsNumber;
  if (!scenesProcessedRatioAsNumber)
  {
    -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      return 1.0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v9 += objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "clsIsSceneProcessed");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
      v12 = (double)v9;
    }
    else
    {
      v12 = 0.0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 / (double)v5);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v15 = self->_scenesProcessedRatioAsNumber;
    self->_scenesProcessedRatioAsNumber = v14;

    scenesProcessedRatioAsNumber = self->_scenesProcessedRatioAsNumber;
  }
  -[NSNumber doubleValue](scenesProcessedRatioAsNumber, "doubleValue");
  return result;
}

- (double)facesProcessedRatio
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 1.0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CLSInvestigationPhotoKitFeeder allItems](self->_feeder, "allItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "clsIsFaceProcessed");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
    v11 = (double)v8;
  }
  else
  {
    v11 = 0.0;
  }

  return v11 / (double)v4;
}

- (unsigned)sharingComposition
{
  void *v3;
  char isKindOfClass;
  void *v5;
  unsigned __int16 v6;

  -[CLSInvestigationPhotoKitFeeder assetCollection](self->_feeder, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[CLSInvestigationPhotoKitFeeder assetCollection](self->_feeder, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sharingComposition");

  return v6;
}

- (BOOL)happensAtSensitiveLocation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CLSClueCollection *clueCollection;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[PGGraphIngestMomentContainer localStartDate](self, "localStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestMomentContainer localEndDate](self, "localEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  clueCollection = self->_clueCollection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PGGraphIngestMomentContainer_happensAtSensitiveLocation__block_invoke;
  v10[3] = &unk_1E8428C18;
  v10[4] = self;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  -[CLSClueCollection enumerateLocationClues:](clueCollection, "enumerateLocationClues:", v10);
  LOBYTE(v6) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

- (BOOL)location:(id)a3 isSensitiveDuringDateInterval:(id)a4
{
  return +[PGSensitiveLocationBlocklistConfiguration isSensitiveLocation:duringDateInterval:](PGSensitiveLocationBlocklistConfiguration, "isSensitiveLocation:duringDateInterval:", a3, a4);
}

- (NSString)encodedCLIPFeatureVector
{
  PGMomentIngestCLIPFeatureVectorExtractor *v3;
  void *v4;
  id v5;
  __CFString *v6;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!+[PGUserDefaults enableMomentCLIPFeatureGraphIngest](PGUserDefaults, "enableMomentCLIPFeatureGraphIngest"))return (NSString *)&stru_1E8436F28;
  v3 = -[PGMomentIngestCLIPFeatureVectorExtractor initWithIngestMomentContainer:]([PGMomentIngestCLIPFeatureVectorExtractor alloc], "initWithIngestMomentContainer:", self);
  v10 = 0;
  -[PGMomentIngestCLIPFeatureVectorExtractor extractCLIPFeatureVectorWithError:](v3, "extractCLIPFeatureVectorWithError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    +[PGMomentIngestCLIPFeatureVectorExtractor encodeCLIPFeatureVector:](PGMomentIngestCLIPFeatureVectorExtractor, "encodeCLIPFeatureVector:", v4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PGCurationManager curationLoggingConnection](self->_curationManager, "curationLoggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PGGraphIngestMomentContainer uuid](self, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Failed to extract moment CLIP feature vector for moment with uuid: %@, error: %@", buf, 0x16u);

    }
    v6 = &stru_1E8436F28;
  }

  return (NSString *)v6;
}

- (CLSClueCollection)clueCollection
{
  return self->_clueCollection;
}

- (void)setClueCollection:(id)a3
{
  objc_storeStrong((id *)&self->_clueCollection, a3);
}

- (CLSInvestigationPhotoKitFeeder)feeder
{
  return self->_feeder;
}

- (NSNumber)isInterestingNumber
{
  return self->_isInterestingNumber;
}

- (void)setIsInterestingNumber:(id)a3
{
  objc_storeStrong((id *)&self->_isInterestingNumber, a3);
}

- (NSNumber)isInterestingWithAlternateJunkingNumber
{
  return self->_isInterestingWithAlternateJunkingNumber;
}

- (void)setIsInterestingWithAlternateJunkingNumber:(id)a3
{
  objc_storeStrong((id *)&self->_isInterestingWithAlternateJunkingNumber, a3);
}

- (NSNumber)isSmartInterestingNumber
{
  return self->_isSmartInterestingNumber;
}

- (void)setIsSmartInterestingNumber:(id)a3
{
  objc_storeStrong((id *)&self->_isSmartInterestingNumber, a3);
}

- (NSNumber)contentScoreNumber
{
  return self->_contentScoreNumber;
}

- (void)setContentScoreNumber:(id)a3
{
  objc_storeStrong((id *)&self->_contentScoreNumber, a3);
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (void)setCurationContext:(id)a3
{
  objc_storeStrong((id *)&self->_curationContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_contentScoreNumber, 0);
  objc_storeStrong((id *)&self->_isSmartInterestingNumber, 0);
  objc_storeStrong((id *)&self->_isInterestingWithAlternateJunkingNumber, 0);
  objc_storeStrong((id *)&self->_isInterestingNumber, 0);
  objc_storeStrong((id *)&self->_feeder, 0);
  objc_storeStrong((id *)&self->_clueCollection, 0);
  objc_storeStrong((id *)&self->_assetsInExtendedCuration, 0);
  objc_storeStrong((id *)&self->_scenesProcessedRatioAsNumber, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
}

void __58__PGGraphIngestMomentContainer_happensAtSensitiveLocation__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;

  objc_msgSend(a2, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    v7 = objc_msgSend(*(id *)(a1 + 32), "location:isSensitiveDuringDateInterval:", v6, *(_QWORD *)(a1 + 40));
    v6 = v8;
    if (v7)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }

}

@end
