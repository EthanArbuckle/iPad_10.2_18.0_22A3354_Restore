@implementation PGMusicCurationOptions

- (PGMusicCurationOptions)init
{
  abort();
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGMusicCurationOptions;
  return -[PGMusicCurationOptions init](&v3, sel_init);
}

- (PGMusicCurationOptions)initWithOptionsDictionary:(id)a3
{
  id v4;
  PGMusicCurationOptions *v5;
  uint64_t v6;
  NSArray *recentlyUsedSongAdamIDs;
  uint64_t v8;
  NSArray *recentlyUsedBundledSongIDs;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  PGMusicCurationSpecificationOptions *v36;
  PGMusicCurationSpecificationOptions *musicCurationSpecificationOptions;
  uint64_t v38;
  NSString *assetCollectionLocalIdentifier;
  uint64_t v40;
  NSString *backingCollectionLocalIdentifier;
  uint64_t v42;
  void *v43;
  void *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PGMusicCurationOptions;
  v5 = -[PGMusicCurationOptions init](&v46, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72200]);
    v6 = objc_claimAutoreleasedReturnValue();
    recentlyUsedSongAdamIDs = v5->_recentlyUsedSongAdamIDs;
    v5->_recentlyUsedSongAdamIDs = (NSArray *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D721F8]);
    v8 = objc_claimAutoreleasedReturnValue();
    recentlyUsedBundledSongIDs = v5->_recentlyUsedBundledSongIDs;
    v5->_recentlyUsedBundledSongIDs = (NSArray *)v8;

    v10 = *MEMORY[0x1E0D72468];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72468]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_useOnlyMusicForTopicInTopPickSuggestions = objc_msgSend(v12, "BOOLValue");

    }
    else
    {
      v5->_useOnlyMusicForTopicInTopPickSuggestions = 0;
    }

    v13 = *MEMORY[0x1E0D723F0];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D723F0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_includeChillMixInMusicForYou = objc_msgSend(v15, "BOOLValue");

    }
    else
    {
      v5->_includeChillMixInMusicForYou = 0;
    }

    v16 = *MEMORY[0x1E0D723F8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D723F8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_includeGetUpMixInMusicForYou = objc_msgSend(v18, "BOOLValue");

    }
    else
    {
      v5->_includeGetUpMixInMusicForYou = 0;
    }

    v19 = *MEMORY[0x1E0D72138];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72138]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      v23 = v22 ^ 1;
    }
    else
    {
      v23 = 1;
    }

    v5->_shouldForceShareableInBestSuggestions = v23;
    v24 = *MEMORY[0x1E0D72148];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72148]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_shouldUseSpecificationOptionsForCuration = objc_msgSend(v26, "BOOLValue");

    }
    else
    {
      v5->_shouldUseSpecificationOptionsForCuration = 0;
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D722F8]);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    v29 = (void *)MEMORY[0x1E0C9AA70];
    if (v27)
      v30 = (void *)v27;
    else
      v30 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v5->_topicKeywordsAndWeights, v30);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72140]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suggestedMood = _moodFromMoodAsNumber(v31);
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72120]);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = (void *)v32;
    else
      v34 = v29;
    v35 = v34;

    v36 = -[PGMusicCurationSpecificationOptions initWithOptionsDictionary:]([PGMusicCurationSpecificationOptions alloc], "initWithOptionsDictionary:", v35);
    musicCurationSpecificationOptions = v5->_musicCurationSpecificationOptions;
    v5->_musicCurationSpecificationOptions = v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72040]);
    v38 = objc_claimAutoreleasedReturnValue();
    assetCollectionLocalIdentifier = v5->_assetCollectionLocalIdentifier;
    v5->_assetCollectionLocalIdentifier = (NSString *)v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72048]);
    v40 = objc_claimAutoreleasedReturnValue();
    backingCollectionLocalIdentifier = v5->_backingCollectionLocalIdentifier;
    v5->_backingCollectionLocalIdentifier = (NSString *)v40;

    v42 = *MEMORY[0x1E0D72378];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72378]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_useMemoryCreationMusicCuratorConfiguration = objc_msgSend(v44, "BOOLValue");

    }
    else
    {
      v5->_useMemoryCreationMusicCuratorConfiguration = 0;
    }

  }
  return v5;
}

- (id)initForMemoryEnrichment
{
  id result;

  result = -[PGMusicCurationOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", MEMORY[0x1E0C9AA70]);
  if (result)
    *(_WORD *)((char *)result + 11) = 257;
  return result;
}

- (id)initForUpNextMemoryRequestWithOptionsDictionary:(id)a3
{
  id v4;
  PGMusicCurationOptions *v5;
  PGMusicCurationOptions *v6;
  uint64_t v7;
  NSString *rootMemoryLocalIdentifier;

  v4 = a3;
  v5 = -[PGMusicCurationOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", v4);
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_shouldForceShareableInBestSuggestions = 257;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D72350]);
    v7 = objc_claimAutoreleasedReturnValue();
    rootMemoryLocalIdentifier = v6->_rootMemoryLocalIdentifier;
    v6->_rootMemoryLocalIdentifier = (NSString *)v7;

  }
  return v6;
}

- (NSArray)recentlyUsedSongAdamIDs
{
  if (self->_recentlyUsedSongAdamIDs)
    return self->_recentlyUsedSongAdamIDs;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)recentlyUsedBundledSongIDs
{
  if (self->_recentlyUsedBundledSongIDs)
    return self->_recentlyUsedBundledSongIDs;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)copyWithAssetCollectionLocalIdentifier:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[PGMusicCurationOptions copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[8];
  v5[8] = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = -[PGMusicCurationOptions _init]([PGMusicCurationOptions alloc], "_init");
  v4[6] = self->_suggestedMood;
  v5 = -[NSDictionary copy](self->_topicKeywordsAndWeights, "copy");
  v6 = (void *)v4[5];
  v4[5] = v5;

  v7 = -[NSString copy](self->_rootMemoryLocalIdentifier, "copy");
  v8 = (void *)v4[4];
  v4[4] = v7;

  *((_BYTE *)v4 + 11) = self->_shouldRefreshSongMetadata;
  v9 = -[NSString copy](self->_assetCollectionLocalIdentifier, "copy");
  v10 = (void *)v4[8];
  v4[8] = v9;

  v11 = -[NSString copy](self->_backingCollectionLocalIdentifier, "copy");
  v12 = (void *)v4[9];
  v4[9] = v11;

  v13 = -[PGMusicCurationSpecificationOptions copy](self->_musicCurationSpecificationOptions, "copy");
  v14 = (void *)v4[7];
  v4[7] = v13;

  *((_BYTE *)v4 + 13) = self->_shouldCurateUpNextMemories;
  v15 = -[NSArray copy](self->_recentlyUsedSongAdamIDs, "copy");
  v16 = (void *)v4[2];
  v4[2] = v15;

  v17 = -[NSArray copy](self->_recentlyUsedBundledSongIDs, "copy");
  v18 = (void *)v4[3];
  v4[3] = v17;

  *((_BYTE *)v4 + 12) = self->_shouldForceShareableInBestSuggestions;
  *((_BYTE *)v4 + 9) = self->_includeChillMixInMusicForYou;
  *((_BYTE *)v4 + 10) = self->_includeGetUpMixInMusicForYou;
  *((_BYTE *)v4 + 8) = self->_useOnlyMusicForTopicInTopPickSuggestions;
  return v4;
}

- (BOOL)useOnlyMusicForTopicInTopPickSuggestions
{
  return self->_useOnlyMusicForTopicInTopPickSuggestions;
}

- (BOOL)includeChillMixInMusicForYou
{
  return self->_includeChillMixInMusicForYou;
}

- (BOOL)includeGetUpMixInMusicForYou
{
  return self->_includeGetUpMixInMusicForYou;
}

- (BOOL)shouldRefreshSongMetadata
{
  return self->_shouldRefreshSongMetadata;
}

- (BOOL)shouldForceShareableInBestSuggestions
{
  return self->_shouldForceShareableInBestSuggestions;
}

- (BOOL)shouldCurateUpNextMemories
{
  return self->_shouldCurateUpNextMemories;
}

- (BOOL)shouldUseSpecificationOptionsForCuration
{
  return self->_shouldUseSpecificationOptionsForCuration;
}

- (NSString)rootMemoryLocalIdentifier
{
  return self->_rootMemoryLocalIdentifier;
}

- (NSDictionary)topicKeywordsAndWeights
{
  return self->_topicKeywordsAndWeights;
}

- (unint64_t)suggestedMood
{
  return self->_suggestedMood;
}

- (PGMusicCurationSpecificationOptions)musicCurationSpecificationOptions
{
  return self->_musicCurationSpecificationOptions;
}

- (NSString)assetCollectionLocalIdentifier
{
  return self->_assetCollectionLocalIdentifier;
}

- (NSString)backingCollectionLocalIdentifier
{
  return self->_backingCollectionLocalIdentifier;
}

- (BOOL)useMemoryCreationMusicCuratorConfiguration
{
  return self->_useMemoryCreationMusicCuratorConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingCollectionLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCollectionLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_musicCurationSpecificationOptions, 0);
  objc_storeStrong((id *)&self->_topicKeywordsAndWeights, 0);
  objc_storeStrong((id *)&self->_rootMemoryLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_recentlyUsedBundledSongIDs, 0);
  objc_storeStrong((id *)&self->_recentlyUsedSongAdamIDs, 0);
}

@end
