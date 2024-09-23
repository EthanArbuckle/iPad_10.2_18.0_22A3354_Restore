@implementation PGMemoryPhotosGraphProperties

- (PGMemoryPhotosGraphProperties)initWithEnrichedMemory:(id)a3 neighborScoreComputer:(id)a4 isAppleMusicSubscriber:(BOOL)a5 photoLibrary:(id)a6 loggingConnection:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PGMemoryPhotosGraphProperties *v17;
  PGMemoryPhotosGraphProperties *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)PGMemoryPhotosGraphProperties;
  v17 = -[PGMemoryPhotosGraphProperties init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_enrichedMemory, a3);
    objc_storeStrong((id *)&v18->_photoLibrary, a6);
    v18->_isAppleMusicSubscriber = a5;
    objc_storeStrong((id *)&v18->_neighborScoreComputer, a4);
    objc_storeStrong((id *)&v18->_loggingConnection, a7);
  }

  return v18;
}

- (id)dictionary
{
  uint64_t v3;
  const __CFString *v4;
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
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[14];
  _QWORD v42[16];

  v42[14] = *MEMORY[0x1E0C80C00];
  v41[0] = CFSTR("graphMemoryIdentifier");
  -[PGEnrichedMemoryProtocol uniqueMemoryIdentifier](self->_enrichedMemory, "uniqueMemoryIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v3;
  v4 = &stru_1E8436F28;
  if (v3)
    v4 = (const __CFString *)v3;
  v42[0] = v4;
  v41[1] = CFSTR("memoryCategorySubcategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGEnrichedMemoryProtocol memoryCategorySubcategory](self->_enrichedMemory, "memoryCategorySubcategory"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v38;
  v41[2] = CFSTR("triggerTypes");
  -[PGMemoryPhotosGraphProperties triggerTypesArray](self, "triggerTypesArray");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v37;
  v41[3] = CFSTR("encodedFeatures");
  -[PGMemoryPhotosGraphProperties encodedFeatures](self, "encodedFeatures");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v36;
  v41[4] = CFSTR("featureVector_v2");
  -[PGMemoryPhotosGraphProperties featureVectorV2](self, "featureVectorV2");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v35;
  v41[5] = CFSTR("featureVector");
  -[PGMemoryPhotosGraphProperties featureVectorV1](self, "featureVectorV1");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v34;
  v41[6] = CFSTR("titleCategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PGMemoryPhotosGraphProperties phTitleCategory](self, "phTitleCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v5;
  v41[7] = CFSTR("notificationQuality");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PGEnrichedMemoryProtocol notificationLevel](self->_enrichedMemory, "notificationLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v6;
  v41[8] = CFSTR("blacklistableFeatures");
  -[PGMemoryPhotosGraphProperties encodedBlockableFeatures](self, "encodedBlockableFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v7;
  v41[9] = CFSTR("backingMoments");
  -[PGMemoryPhotosGraphProperties infoForBackingMoments](self, "infoForBackingMoments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v8;
  v41[10] = CFSTR("collectionsInfo");
  -[PGMemoryPhotosGraphProperties infoForGraphCollection](self, "infoForGraphCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v9;
  v41[11] = CFSTR("info");
  -[PGMemoryPhotosGraphProperties infoDictionary](self, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[11] = v10;
  v41[12] = CFSTR("chapterTitles");
  -[PGMemoryPhotosGraphProperties infoForChapterTitles](self, "infoForChapterTitles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[12] = v11;
  v41[13] = CFSTR("generatedWithFallbackRequirements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PGEnrichedMemoryProtocol generatedWithFallbackRequirements](self->_enrichedMemory, "generatedWithFallbackRequirements"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[13] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v13, "mutableCopy");

  if (-[PGEnrichedMemoryProtocol memoryCategory](self->_enrichedMemory, "memoryCategory") == 27)
  {
    -[PGEnrichedMemoryProtocol memoryFeatureNodes](self->_enrichedMemory, "memoryFeatureNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection subsetInCollection:](PGGraphSceneFeatureNodeCollection, "subsetInCollection:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "labels");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", CFSTR("SunriseSunset"));
    v18 = objc_msgSend(v16, "containsObject:", CFSTR("Rainbow"));
    v19 = objc_msgSend(v16, "containsObject:", CFSTR("Snow")) | v18 | v17;

LABEL_10:
    v20 = v19 ^ 1u;

    goto LABEL_11;
  }
  if (-[PGEnrichedMemoryProtocol memoryCategory](self->_enrichedMemory, "memoryCategory") == 9)
  {
    v20 = 0;
    goto LABEL_11;
  }
  if (-[PGEnrichedMemoryProtocol memoryCategory](self->_enrichedMemory, "memoryCategory") == 16
    || -[PGEnrichedMemoryProtocol memoryCategory](self->_enrichedMemory, "memoryCategory") == 17)
  {
    -[PGEnrichedMemoryProtocol memoryFeatureNodes](self->_enrichedMemory, "memoryFeatureNodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "meaningLabels");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsObject:", CFSTR("Diving"));

    objc_msgSend(v15, "meaningLabels");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "containsObject:", CFSTR("WinterSport"));

    v19 = v25 | v23;
    goto LABEL_10;
  }
  v20 = 1;
LABEL_11:
  +[PGMemoryPhotosGraphProperties _storyRecipeSongCatalogForAppleMusicSubscriber:](PGMemoryPhotosGraphProperties, "_storyRecipeSongCatalogForAppleMusicSubscriber:", self->_isAppleMusicSubscriber);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryPhotosGraphProperties _recipeFromEnrichedMemory:subscriberCatalog:applyColorGrading:loggingConnection:](self, "_recipeFromEnrichedMemory:subscriberCatalog:applyColorGrading:loggingConnection:", self->_enrichedMemory, v26, v20, self->_loggingConnection);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((_DWORD)v20)
    {
      objc_msgSend(v27, "currentStyle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "originalColorGradeCategory");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v30, CFSTR("storyColorGradeCategory"));

    }
    v31 = objc_alloc_init(MEMORY[0x1E0D752B0]);
    objc_msgSend(v31, "archivedDataWithRecipe:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v32, CFSTR("storyRecipeData"));

  }
  return v40;
}

- (id)infoDictionary
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  _QWORD v46[21];
  _QWORD v47[23];

  v47[21] = *MEMORY[0x1E0C80C00];
  v46[0] = CFSTR("sourceType");
  v3 = -[PGMemoryPhotosGraphProperties sourceType](self, "sourceType");
  if (v3 > 4)
    v4 = CFSTR("Unsupported Source Type");
  else
    v4 = off_1E84318E8[v3];
  v45 = v4;
  v47[0] = v45;
  v46[1] = CFSTR("sourceTypeEnum");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PGMemoryPhotosGraphProperties sourceType](self, "sourceType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v44;
  v46[2] = CFSTR("creationDate");
  -[PGEnrichedMemoryProtocol creationDate](self->_enrichedMemory, "creationDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v43;
  v46[3] = CFSTR("assetCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGEnrichedMemoryProtocol numberOfRelevantAssets](self->_enrichedMemory, "numberOfRelevantAssets"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v42;
  v46[4] = CFSTR("repCount");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PGEnrichedMemoryProtocol representativeAssetUUIDs](self->_enrichedMemory, "representativeAssetUUIDs");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v41, "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v40;
  v46[5] = CFSTR("relevantAssetCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGEnrichedMemoryProtocol numberOfRelevantAssets](self->_enrichedMemory, "numberOfRelevantAssets"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v39;
  v46[6] = CFSTR("curatedCount");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PGEnrichedMemoryProtocol curatedAssetUUIDs](self->_enrichedMemory, "curatedAssetUUIDs");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v37;
  v46[7] = CFSTR("extendedCuratedCount");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PGEnrichedMemoryProtocol extendedCuratedAssetUUIDs](self->_enrichedMemory, "extendedCuratedAssetUUIDs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v35;
  v46[8] = CFSTR("keyAssetUUID");
  -[PGEnrichedMemoryProtocol keyAssetUUID](self->_enrichedMemory, "keyAssetUUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v34;
  v46[9] = CFSTR("notificationQuality");
  v8 = -[PGEnrichedMemoryProtocol notificationLevel](self->_enrichedMemory, "notificationLevel");
  if ((unint64_t)(v8 - 1) > 3)
    v9 = CFSTR("PGMemoryNotificationLevelUndefined");
  else
    v9 = off_1E84318C8[v8 - 1];
  v33 = v9;
  v47[9] = v33;
  v46[10] = CFSTR("isTriggered");
  v10 = -[PGMemoryPhotosGraphProperties isTriggered](self, "isTriggered");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  v47[10] = v11;
  v46[11] = CFSTR("numberOfMoments");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGMemoryPhotosGraphProperties numberOfMoments](self, "numberOfMoments"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v32;
  v46[12] = CFSTR("numberOfCollections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PGMemoryPhotosGraphProperties numberOfMoments](self, "numberOfMoments"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v31;
  v46[13] = CFSTR("suggestedMood");
  -[PGEnrichedMemoryProtocol suggestedMood](self->_enrichedMemory, "suggestedMood");
  PHStringForMemoryMood();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[13] = v30;
  v46[14] = CFSTR("forbiddenMoods");
  -[PGEnrichedMemoryProtocol forbiddenMoods](self->_enrichedMemory, "forbiddenMoods");
  PHStringForMemoryMood();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[14] = v29;
  v46[15] = CFSTR("recommendedMoods");
  -[PGEnrichedMemoryProtocol recommendedMoods](self->_enrichedMemory, "recommendedMoods");
  PHStringForMemoryMood();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v47[15] = v28;
  v46[16] = CFSTR("moodWeights");
  -[PGEnrichedMemoryProtocol positiveMoodVector](self->_enrichedMemory, "positiveMoodVector");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = &stru_1E8436F28;
  if (v13)
    v15 = (const __CFString *)v13;
  v47[16] = v15;
  v46[17] = CFSTR("moodKeywords");
  -[PGEnrichedMemoryProtocol legacyMoodKeywords](self->_enrichedMemory, "legacyMoodKeywords");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = MEMORY[0x1E0C9AA60];
  if (v16)
    v18 = v16;
  v47[17] = v18;
  v46[18] = CFSTR("osInfo");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "operatingSystemVersionString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[18] = v20;
  v46[19] = CFSTR("meaningLabels");
  -[PGEnrichedMemoryProtocol memoryMomentNodes](self->_enrichedMemory, "memoryMomentNodes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "meaningNodes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "meaningLabels");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[19] = v24;
  v46[20] = CFSTR("musicGenreDistribution");
  -[PGMemoryPhotosGraphProperties musicGenreDistribution](self, "musicGenreDistribution");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[20] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 21);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)triggerTypesArray
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PGEnrichedMemoryProtocol triggerTypes](self->_enrichedMemory, "triggerTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PGMemoryPhotosGraphProperties_triggerTypesArray__block_invoke;
  v7[3] = &unk_1E8434FA8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);

  return v5;
}

- (int64_t)sourceType
{
  return PGMemorySourceTypeFromCategory(-[PGEnrichedMemoryProtocol memoryCategory](self->_enrichedMemory, "memoryCategory"));
}

- (id)personLocalIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[PGEnrichedMemoryProtocol memoryFeatureNodes](self->_enrichedMemory, "memoryFeatureNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)featureVectorV1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PGMemoryPhotosGraphProperties personLocalIdentifiers](self, "personLocalIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v7 = CFSTR("people");
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (id)featureVectorV2
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PGMemoryPhotosGraphProperties personLocalIdentifiers](self, "personLocalIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CD1648], "personUniversalIdentifierForPersonLocalIdentifier:photoLibrary:", v9, self->_photoLibrary, v16);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if (v10)
            v12 = (void *)v10;
          else
            v12 = v9;
          v13 = v12;

          v22[0] = CFSTR("People");
          v22[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "addObject:", v14);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v6);
    }

    v3 = v16;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (int64_t)phTitleCategory
{
  uint64_t v2;

  v2 = -[PGEnrichedMemoryProtocol titleCategory](self->_enrichedMemory, "titleCategory");
  if ((unint64_t)(v2 - 1) > 5)
    return 0;
  else
    return qword_1CA8ECA48[v2 - 1];
}

- (unint64_t)numberOfMoments
{
  void *v2;
  unint64_t v3;

  -[PGEnrichedMemoryProtocol memoryMomentNodes](self->_enrichedMemory, "memoryMomentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)musicGenreDistribution
{
  void *v2;
  void *v3;
  void *v4;

  -[PGEnrichedMemoryProtocol memoryMomentNodes](self->_enrichedMemory, "memoryMomentNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "musicGenreDistributionUsingTaggedGenres:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isTriggered
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[PGEnrichedMemoryProtocol triggerTypes](self->_enrichedMemory, "triggerTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PGMemoryPhotosGraphProperties_isTriggered__block_invoke;
  v4[3] = &unk_1E842C098;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateIndexesUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (id)encodedBlockableFeatures
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CD1648];
  -[PGEnrichedMemoryProtocol blockableFeatures](self->_enrichedMemory, "blockableFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodedBlockableFeatures:photoLibrary:", v4, self->_photoLibrary);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)encodedFeatures
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PGEnrichedMemoryProtocol memoryFeatureNodes](self->_enrichedMemory, "memoryFeatureNodes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "encodedFeature");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)infoForBackingMoments
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (-[PGMemoryPhotosGraphProperties sourceType](self, "sourceType") != 1)
    return MEMORY[0x1E0C9AA60];
  -[PGEnrichedMemoryProtocol memoryMomentNodes](self->_enrichedMemory, "memoryMomentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "graphScore");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("graphScore"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PGNeighborScoreComputer neighborScoreWithMomentNode:](self->_neighborScoreComputer, "neighborScoreWithMomentNode:", v4);
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("neighborScore"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "contentScore");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("curationScore"));

  objc_msgSend(v4, "keywordsForRelatedType:focusOnNodes:", 63, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGManager exportableDictionaryFromKeywords:](PGManager, "exportableDictionaryFromKeywords:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = v13;
  else
    v15 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("keywords"));

  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)infoForGraphCollection
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (-[PGEnrichedMemoryProtocol memoryCategory](self->_enrichedMemory, "memoryCategory") != 16)
    return MEMORY[0x1E0C9AA60];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PGEnrichedMemoryProtocol memoryMomentNodes](self->_enrichedMemory, "memoryMomentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "contentScore");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("averageContentScore"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "meaningScore");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("meaningScore"));

  -[PGEnrichedMemoryProtocol memoryFeatureNodes](self->_enrichedMemory, "memoryFeatureNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "meaningLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("meaningLabels"));

  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)infoForChapterTitles
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PGEnrichedMemoryProtocol chapterTitles](self->_enrichedMemory, "chapterTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PGEnrichedMemoryProtocol chapterTitles](self->_enrichedMemory, "chapterTitles", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_enrichedMemory, 0);
}

uint64_t __44__PGMemoryPhotosGraphProperties_isTriggered__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __50__PGMemoryPhotosGraphProperties_triggerTypesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)_recipeFromEnrichedMemory:(id)a3 subscriberCatalog:(id)a4 applyColorGrading:(BOOL)a5 loggingConnection:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v65;
  void *v66;
  _BOOL4 v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  NSObject *log;
  void *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  uint64_t v81;

  v67 = a5;
  v81 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a6;
  v74 = v8;
  objc_msgSend(v8, "flexMusicCuration");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "bestSongSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "uid");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0x1E0C99000uLL;
  log = v10;
  v70 = v12;
  if (objc_msgSend(v73, "length"))
  {
    v65 = v9;
    v14 = v12;
    v68 = v10;
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    objc_msgSend(v14, "tagIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v76 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("_"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "count") == 2)
          {
            objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v22);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v75, buf, 16);
      }
      while (v18);
    }

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Arousal"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Valence"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24 && v25)
    {
      objc_msgSend(v25, "doubleValue");
      objc_msgSend(v24, "doubleValue");
      PFStoryColorGradeCategoryFromValenceArousal();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v65;
      v28 = 0x1E0D75000;
    }
    else
    {
      v30 = v68;
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Mood"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0x1E0D75000uLL;
      if (!PHMemoryMoodForString() && os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v31;
        _os_log_error_impl(&dword_1CA237000, v30, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] unsupported Flex Mood tag '%@'", buf, 0xCu);
      }

      v9 = v65;
      PFStoryColorGradeCategoryNamed();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v14, "arousal");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valence");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if ((!v32 || !v33) && os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v80 = v73;
      _os_log_error_impl(&dword_1CA237000, v68, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign proper color grade category for key flex song (%@) because arousal OR valence information was not available.", buf, 0xCu);
    }
    v35 = *(void **)(v28 + 720);
    v36 = *MEMORY[0x1E0D759F0];
    objc_msgSend(v14, "songName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "artistName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", 1, 1, v36, v73, v37, v38, v27);
    v29 = objc_claimAutoreleasedReturnValue();

    v10 = log;
    v13 = 0x1E0C99000;
  }
  else
  {
    v29 = 0;
    v28 = 0x1E0D75000;
  }
  objc_msgSend(v74, "musicCuration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "keySongAdamID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "length"))
  {
    objc_msgSend(v39, "keySongArousal");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "keySongValence");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    v69 = v29;
    if (v41 && v42)
    {
      v44 = v40;
      v45 = v9;
      objc_msgSend(v42, "doubleValue");
      objc_msgSend(v41, "doubleValue");
      PFStoryColorGradeCategoryFromValenceArousal();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v45 = v9;
        *(_DWORD *)buf = 138412290;
        v44 = v40;
        v80 = v40;
        _os_log_error_impl(&dword_1CA237000, log, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign color grade category for key apple music song (%@) because arousal and valence information was not available.", buf, 0xCu);
      }
      else
      {
        v44 = v40;
        v45 = v9;
      }
      v46 = 0;
    }
    v48 = *(void **)(v28 + 720);
    v49 = *MEMORY[0x1E0D759E8];
    objc_msgSend(v39, "keySongTitle");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "keySongArtist");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v48;
    v40 = v44;
    objc_msgSend(v52, "createAssetWithCategory:subcategory:catalog:songID:title:subtitle:colorGradeCategory:", 1, 1, v49, v44, v50, v51, v46);
    v47 = objc_claimAutoreleasedReturnValue();

    v9 = v45;
    v10 = log;
    v13 = 0x1E0C99000uLL;
    v29 = v69;
  }
  else
  {
    v47 = 0;
  }
  if (v29 | v47)
  {
    objc_msgSend(MEMORY[0x1E0D752C8], "createRecipe");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v54, "mutableCopyWithZone:", 0);

    v55 = objc_alloc_init(*(Class *)(v13 + 3592));
    if (v47
      && (objc_msgSend(v53, "addAsset:", v47),
          objc_msgSend((id)v47, "identifier"),
          v56 = (void *)objc_claimAutoreleasedReturnValue(),
          v57 = (id)*MEMORY[0x1E0D759E8],
          objc_msgSend(v55, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0D759E8]),
          v56,
          v57 == v9))
    {
      objc_msgSend((id)v47, "colorGradeCategory");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
LABEL_46:
        v62 = (void *)objc_msgSend(v55, "copy");
        objc_msgSend(v53, "setSeedSongIdentifiersByCatalog:", v62);

        objc_msgSend(MEMORY[0x1E0D752D8], "createStyleWithOriginalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:", v58, !v67, 0, 0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setCurrentStyle:", v63);

        goto LABEL_47;
      }
    }
    else
    {
      v58 = 0;
      if (!v29)
        goto LABEL_46;
    }
    v66 = v40;
    objc_msgSend(v53, "addAsset:", v29);
    objc_msgSend((id)v29, "identifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (id)*MEMORY[0x1E0D759F0];
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v59, *MEMORY[0x1E0D759F0]);

    if (v60 == v9 || !v58)
    {
      objc_msgSend((id)v29, "colorGradeCategory");
      v61 = objc_claimAutoreleasedReturnValue();

      v58 = (void *)v61;
    }
    v40 = v66;
    goto LABEL_46;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "[PGMemoryPhotosGraphProperties] Failed to assign color grade category because music curation was not available.", buf, 2u);
  }
  v53 = 0;
LABEL_47:

  return v53;
}

+ (id)_storyRecipeSongCatalogForAppleMusicSubscriber:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id v5;

  v3 = a3;
  v4 = (id)*MEMORY[0x1E0D759F0];
  if (v3)
  {
    v5 = (id)*MEMORY[0x1E0D759E8];

    v4 = v5;
  }
  return v4;
}

@end
