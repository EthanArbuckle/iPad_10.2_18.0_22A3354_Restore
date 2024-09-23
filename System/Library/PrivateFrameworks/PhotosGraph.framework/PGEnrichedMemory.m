@implementation PGEnrichedMemory

- (PGEnrichedMemory)initWithTriggeredMemory:(id)a3
{
  id v5;
  PGEnrichedMemory *v6;
  PGEnrichedMemory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGEnrichedMemory;
  v6 = -[PGEnrichedMemory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_triggeredMemory, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGEnrichedMemory;
  -[PGEnrichedMemory description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@, Key asset: %@, %lu curated assets, %lu extended curated assets, %lu representative assets, "), v4, self->_triggeredMemory, self->_keyAssetUUID, -[NSArray count](self->_curatedAssetUUIDs, "count"), -[NSArray count](self->_extendedCuratedAssetUUIDs, "count"), -[NSArray count](self->_representativeAssetUUIDs, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)memoryCategory
{
  return -[PGTriggeredMemoryProtocol memoryCategory](self->_triggeredMemory, "memoryCategory");
}

- (unint64_t)memoryCategorySubcategory
{
  return -[PGTriggeredMemoryProtocol memoryCategorySubcategory](self->_triggeredMemory, "memoryCategorySubcategory");
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  return (PGGraphMomentNodeCollection *)-[PGTriggeredMemoryProtocol memoryMomentNodes](self->_triggeredMemory, "memoryMomentNodes");
}

- (BOOL)generatedWithFallbackRequirements
{
  return -[PGTriggeredMemoryProtocol generatedWithFallbackRequirements](self->_triggeredMemory, "generatedWithFallbackRequirements");
}

- (NSDate)creationDate
{
  return (NSDate *)-[PGTriggeredMemoryProtocol creationDate](self->_triggeredMemory, "creationDate");
}

- (NSIndexSet)triggerTypes
{
  return (NSIndexSet *)-[PGTriggeredMemoryProtocol triggerTypes](self->_triggeredMemory, "triggerTypes");
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  return (id)-[PGTriggeredMemoryProtocol memoryFeatureNodesInGraph:](self->_triggeredMemory, "memoryFeatureNodesInGraph:", a3);
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return (PGGraphFeatureNodeCollection *)-[PGTriggeredMemoryProtocol memoryFeatureNodes](self->_triggeredMemory, "memoryFeatureNodes");
}

- (NSString)uniqueMemoryIdentifier
{
  return (NSString *)-[PGTriggeredMemoryProtocol uniqueMemoryIdentifier](self->_triggeredMemory, "uniqueMemoryIdentifier");
}

- (int64_t)photosGraphVersion
{
  return -[PGTriggeredMemoryProtocol photosGraphVersion](self->_triggeredMemory, "photosGraphVersion");
}

- (NSArray)blockableFeatures
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  -[PGTriggeredMemoryProtocol blockableFeatures](self->_triggeredMemory, "blockableFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "-[PGEnrichedMemory blockableFeatures] Blockable features was not already computed on triggered memory, this should only happen from CLI/testing, not during overnight election", v9, 2u);
    }

    -[PGEnrichedMemory memoryFeatureNodes](self, "memoryFeatureNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGEnrichedMemory memoryMomentNodes](self, "memoryMomentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGMemoryFeatureBlocking blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:](PGMemoryFeatureBlocking, "blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:", v6, v7, -[PGEnrichedMemory memoryCategory](self, "memoryCategory"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v3;
}

- (void)setBlockableFeatures:(id)a3
{
  -[PGTriggeredMemoryProtocol setBlockableFeatures:](self->_triggeredMemory, "setBlockableFeatures:", a3);
}

- (double)electionScore
{
  double result;

  -[PGTriggeredMemoryProtocol electionScore](self->_triggeredMemory, "electionScore");
  return result;
}

- (void)setElectionScore:(double)a3
{
  -[PGTriggeredMemoryProtocol setElectionScore:](self->_triggeredMemory, "setElectionScore:", a3);
}

- (NSDictionary)validityIntervalByTriggerType
{
  return (NSDictionary *)-[PGTriggeredMemoryProtocol validityIntervalByTriggerType](self->_triggeredMemory, "validityIntervalByTriggerType");
}

- (id)enrichedDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEnrichedMemory triggerTypes](self, "triggerTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __39__PGEnrichedMemory_enrichedDescription__block_invoke;
  v22 = &unk_1E8434FA8;
  v23 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v19);

  v6 = (void *)MEMORY[0x1E0CB37A0];
  -[PGEnrichedMemory title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEnrichedMemory subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", -[PGEnrichedMemory memoryCategory](self, "memoryCategory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGEnrichedMemory curatedAssetUUIDs](self, "curatedAssetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[PGEnrichedMemory extendedCuratedAssetUUIDs](self, "extendedCuratedAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[PGEnrichedMemory keyAssetUUID](self, "keyAssetUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[__CFString length](v5, "length");
  v16 = CFSTR("none");
  if (v15)
    v16 = v5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@, %@ (%@), %tu curated assets, %tu extended assets, key asset: %@, trigger: %@\n"), v7, v8, v9, v11, v13, v14, v16, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), &stru_1E8436F28, 2, 0, objc_msgSend(v17, "length"));
  return v17;
}

- (BOOL)failedEnrichment
{
  return self->_failureReason != 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)chapterTitles
{
  return self->_chapterTitles;
}

- (void)setChapterTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)keyAssetUUID
{
  return self->_keyAssetUUID;
}

- (void)setKeyAssetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)curatedAssetUUIDs
{
  return self->_curatedAssetUUIDs;
}

- (void)setCuratedAssetUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)representativeAssetUUIDs
{
  return self->_representativeAssetUUIDs;
}

- (void)setRepresentativeAssetUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)extendedCuratedAssetUUIDs
{
  return self->_extendedCuratedAssetUUIDs;
}

- (void)setExtendedCuratedAssetUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)legacyMoodKeywords
{
  return self->_legacyMoodKeywords;
}

- (void)setLegacyMoodKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)suggestedMood
{
  return self->_suggestedMood;
}

- (void)setSuggestedMood:(unint64_t)a3
{
  self->_suggestedMood = a3;
}

- (unint64_t)recommendedMoods
{
  return self->_recommendedMoods;
}

- (void)setRecommendedMoods:(unint64_t)a3
{
  self->_recommendedMoods = a3;
}

- (unint64_t)forbiddenMoods
{
  return self->_forbiddenMoods;
}

- (void)setForbiddenMoods:(unint64_t)a3
{
  self->_forbiddenMoods = a3;
}

- (PGMoodVector)positiveMoodVector
{
  return self->_positiveMoodVector;
}

- (void)setPositiveMoodVector:(id)a3
{
  objc_storeStrong((id *)&self->_positiveMoodVector, a3);
}

- (int64_t)notificationLevel
{
  return self->_notificationLevel;
}

- (void)setNotificationLevel:(int64_t)a3
{
  self->_notificationLevel = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (BOOL)featuresGuestAssets
{
  return self->_featuresGuestAssets;
}

- (void)setFeaturesGuestAssets:(BOOL)a3
{
  self->_featuresGuestAssets = a3;
}

- (unint64_t)numberOfRelevantAssets
{
  return self->_numberOfRelevantAssets;
}

- (void)setNumberOfRelevantAssets:(unint64_t)a3
{
  self->_numberOfRelevantAssets = a3;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (void)setTitleCategory:(int64_t)a3
{
  self->_titleCategory = a3;
}

- (PGFlexMusicCuration)flexMusicCuration
{
  return self->_flexMusicCuration;
}

- (void)setFlexMusicCuration:(id)a3
{
  objc_storeStrong((id *)&self->_flexMusicCuration, a3);
}

- (PGMusicCuration)musicCuration
{
  return self->_musicCuration;
}

- (void)setMusicCuration:(id)a3
{
  objc_storeStrong((id *)&self->_musicCuration, a3);
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(unint64_t)a3
{
  self->_failureReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicCuration, 0);
  objc_storeStrong((id *)&self->_flexMusicCuration, 0);
  objc_storeStrong((id *)&self->_positiveMoodVector, 0);
  objc_storeStrong((id *)&self->_legacyMoodKeywords, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_representativeAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_curatedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_keyAssetUUID, 0);
  objc_storeStrong((id *)&self->_chapterTitles, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_triggeredMemory, 0);
}

void __39__PGEnrichedMemory_enrichedDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[PGMemoryTrigger stringFromTriggerType:](PGMemoryTrigger, "stringFromTriggerType:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@ "), v3);

}

@end
