@implementation PXSearchSampleResultsFactory

+ (id)sampleAssetResults
{
  unint64_t v2;
  id i;
  void *v4;
  PXSearchResultAsset *v5;
  void *v6;

  v2 = +[PXSearchSampleResultsFactory _randomAssetCount:](PXSearchSampleResultsFactory, "_randomAssetCount:", 200);
  for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); v2; --v2)
  {
    +[PXSearchSampleResultsFactory _uniqueSampleUUID](PXSearchSampleResultsFactory, "_uniqueSampleUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXSearchResultAsset initWithAssetUUID:]([PXSearchResultAsset alloc], "initWithAssetUUID:", v4);
    objc_msgSend(i, "addObject:", v5);

  }
  v6 = (void *)objc_msgSend(i, "copy");

  return v6;
}

+ (id)samplePersonResults
{
  void *v2;
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  PXSearchResultPersonOrPet *v7;
  void *v8;

  +[PXSearchSampleResultsFactory _personTitles](PXSearchSampleResultsFactory, "_personTitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSearchSampleResultsFactory _uniqueSampleUUID](PXSearchSampleResultsFactory, "_uniqueSampleUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PXSearchResultPersonOrPet initWithTitle:assetCount:personUUID:identifier:type:subtype:]([PXSearchResultPersonOrPet alloc], "initWithTitle:assetCount:personUUID:identifier:type:subtype:", v5, +[PXSearchSampleResultsFactory _randomAssetCount:](PXSearchSampleResultsFactory, "_randomAssetCount:", 200), v6, v6, 3, 0);
      objc_msgSend(v3, "addObject:", v7);

      ++v4;
    }
    while (v4 < objc_msgSend(v2, "count"));
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

+ (id)_personTitles
{
  return &unk_1E53EA320;
}

+ (id)_momentTitles
{
  return &unk_1E53EA338;
}

+ (id)_momentSubtitles
{
  return &unk_1E53EA350;
}

+ (id)sampleMemoryResults
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PXSearchResultCollection *v9;
  void *v10;

  +[PXSearchSampleResultsFactory _memoryTitles](PXSearchSampleResultsFactory, "_memoryTitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchSampleResultsFactory _memorySubtitles](PXSearchSampleResultsFactory, "_memorySubtitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSearchSampleResultsFactory _uniqueSampleUUID](PXSearchSampleResultsFactory, "_uniqueSampleUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PXSearchResultCollection initWithTitle:subtitle:assetCount:collectionUUID:thumbnailAssetUUID:startDate:endDate:subtype:]([PXSearchResultCollection alloc], "initWithTitle:subtitle:assetCount:collectionUUID:thumbnailAssetUUID:startDate:endDate:subtype:", v6, v7, +[PXSearchSampleResultsFactory _randomAssetCount:](PXSearchSampleResultsFactory, "_randomAssetCount:", 200), v8, v8, 0, 0, 3);
      objc_msgSend(v4, "addObject:", v9);

      ++v5;
    }
    while (v5 < objc_msgSend(v2, "count"));
  }
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

+ (id)_memoryTitles
{
  return &unk_1E53EA368;
}

+ (id)_memorySubtitles
{
  return &unk_1E53EA380;
}

+ (id)sampleAlbumResults
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PXSearchResultCollection *v9;
  void *v10;

  +[PXSearchSampleResultsFactory _albumTitles](PXSearchSampleResultsFactory, "_albumTitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchSampleResultsFactory _albumSubtitles](PXSearchSampleResultsFactory, "_albumSubtitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v5 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSearchSampleResultsFactory _uniqueSampleUUID](PXSearchSampleResultsFactory, "_uniqueSampleUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PXSearchResultCollection initWithTitle:subtitle:assetCount:collectionUUID:thumbnailAssetUUID:startDate:endDate:subtype:]([PXSearchResultCollection alloc], "initWithTitle:subtitle:assetCount:collectionUUID:thumbnailAssetUUID:startDate:endDate:subtype:", v6, v7, +[PXSearchSampleResultsFactory _randomAssetCount:](PXSearchSampleResultsFactory, "_randomAssetCount:", 200), v8, v8, 0, 0, 3);
      objc_msgSend(v4, "addObject:", v9);

      ++v5;
    }
    while (v5 < objc_msgSend(v2, "count"));
  }
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

+ (id)_albumTitles
{
  return &unk_1E53EA398;
}

+ (id)_albumSubtitles
{
  return &unk_1E53EA3B0;
}

+ (id)sampleSceneResults
{
  void *v2;
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  unint64_t i;
  void *v8;
  void *v9;
  PXSearchResultAssetAggregation *v10;
  void *v11;
  PXSearchResultAssetAggregation *v12;
  void *v13;

  +[PXSearchSampleResultsFactory _categoryTitles](PXSearchSampleResultsFactory, "_categoryTitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (i = +[PXSearchSampleResultsFactory _randomAssetCount:](PXSearchSampleResultsFactory, "_randomAssetCount:", 200); i; --i)
      {
        +[PXSearchSampleResultsFactory _uniqueSampleUUID](PXSearchSampleResultsFactory, "_uniqueSampleUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "hash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = [PXSearchResultAssetAggregation alloc];
      v11 = (void *)objc_msgSend(v6, "copy");
      v12 = -[PXSearchResultAssetAggregation initWithTitle:subtitle:assetUUIDs:subtype:identifier:](v10, "initWithTitle:subtitle:assetUUIDs:subtype:identifier:", v5, &stru_1E5149688, v11, 10, v9);

      objc_msgSend(v3, "addObject:", v12);
      ++v4;
    }
    while (v4 < objc_msgSend(v2, "count"));
  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

+ (id)_categoryTitles
{
  return &unk_1E53EA3C8;
}

+ (id)samplePlaceResults
{
  void *v2;
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  unint64_t i;
  void *v8;
  void *v9;
  PXSearchResultAssetAggregation *v10;
  void *v11;
  PXSearchResultAssetAggregation *v12;
  void *v13;

  +[PXSearchSampleResultsFactory _placeTitles](PXSearchSampleResultsFactory, "_placeTitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      for (i = +[PXSearchSampleResultsFactory _randomAssetCount:](PXSearchSampleResultsFactory, "_randomAssetCount:", 200); i; --i)
      {
        +[PXSearchSampleResultsFactory _uniqueSampleUUID](PXSearchSampleResultsFactory, "_uniqueSampleUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v8);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "hash"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = [PXSearchResultAssetAggregation alloc];
      v11 = (void *)objc_msgSend(v6, "copy");
      v12 = -[PXSearchResultAssetAggregation initWithTitle:subtitle:assetUUIDs:subtype:identifier:](v10, "initWithTitle:subtitle:assetUUIDs:subtype:identifier:", v5, &stru_1E5149688, v11, 9, v9);

      objc_msgSend(v3, "addObject:", v12);
      ++v4;
    }
    while (v4 < objc_msgSend(v2, "count"));
  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

+ (id)_placeTitles
{
  return &unk_1E53EA3E0;
}

+ (id)_uniqueSampleUUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SearchResultSampleUUID#%lu"), _uniqueSampleUUID_uuidCounter++);
}

+ (unint64_t)_randomAssetCount:(unint64_t)a3
{
  return arc4random_uniform(a3) + 1;
}

@end
