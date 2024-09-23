@implementation PXPhotosDataSourceSectionCache

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (NSDictionary)assetCollectionToSection
{
  return self->_assetCollectionToSection;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateNotEnriched
{
  return self->_estimatedAssetCountWithEnrichmentStateNotEnriched;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataOnly
{
  return self->_estimatedAssetCountWithEnrichmentStateAssetMetadataOnly;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore
{
  return self->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore;
}

- (int64_t)numberOfEnrichmentStateNotEnrichedAssetCollections
{
  return self->_numberOfEnrichmentStateNotEnrichedAssetCollections;
}

- (int64_t)numberOfEnrichmentStateAssetMetadataOnlyAssetCollections
{
  return self->_numberOfEnrichmentStateAssetMetadataOnlyAssetCollections;
}

- (int64_t)numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections
{
  return self->_numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateComplete
{
  return self->_estimatedAssetCountWithEnrichmentStateComplete;
}

- (int64_t)estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed
{
  return self->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed;
}

- (PXPhotosDataSourceSectionCache)initWithCollectionListFetchResult:(id)a3
{
  id v5;
  PXPhotosDataSourceSectionCache *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int v20;
  int64_t *p_numberOfEnrichmentStateCompleteAssetCollections;
  int64_t *p_estimatedAssetCountWithEnrichmentStateComplete;
  void *v23;
  uint64_t v24;
  NSArray *assetCollections;
  NSArray *v26;
  NSDictionary *assetCollectionToSection;
  NSDictionary *v28;
  id v30;
  id v31;
  id obj;
  NSDictionary *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PXPhotosDataSourceSectionCache;
  v6 = -[PXPhotosDataSourceSectionCache init](&v38, sel_init);
  if (v6)
  {
    v30 = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v31 = v5;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
          if ((objc_msgSend(v13, "alwaysRecalculateCounts") & 1) != 0)
          {
            v14 = 0;
            v15 = 0;
            v16 = 0;
          }
          else
          {
            v14 = objc_msgSend(v13, "estimatedAssetCount");
            v17 = objc_msgSend(v13, "estimatedPhotosCount");
            if (v17 == 0x7FFFFFFFFFFFFFFFLL)
              v15 = 0;
            else
              v15 = v17;
            v18 = objc_msgSend(v13, "estimatedVideosCount");
            if (v18 == 0x7FFFFFFFFFFFFFFFLL)
              v16 = 0;
            else
              v16 = v18;
            if (v14 == 0x7FFFFFFFFFFFFFFFLL)
              v14 = 0;
          }
          v19 = v6->_estimatedVideosCount + v16;
          v6->_estimatedPhotosCount += v15;
          v6->_estimatedVideosCount = v19;
          if (v14 < 1)
          {
            if ((objc_msgSend(v13, "isRecent") & 1) == 0)
            {
LABEL_22:
              p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateComplete;
              p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateCompleteAssetCollections;
LABEL_23:
              ++*p_numberOfEnrichmentStateCompleteAssetCollections;
              *p_estimatedAssetCountWithEnrichmentStateComplete += v14;
            }
          }
          else
          {
            v6->_estimatedOtherCount += v14 - (v15 + v16);
            if ((objc_msgSend(v13, "isRecent") & 1) == 0)
            {
              v20 = objc_msgSend(v13, "px_highlightEnrichmentState");
              p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateNotEnriched;
              p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateNotEnrichedAssetCollections;
              switch(v20)
              {
                case 0:
                  goto LABEL_23;
                case 1:
                  p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateAssetMetadataOnly;
                  p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateAssetMetadataOnlyAssetCollections;
                  goto LABEL_23;
                case 2:
                  p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScore;
                  p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateAssetMetadataAndScoreAssetCollections;
                  goto LABEL_23;
                case 3:
                  p_estimatedAssetCountWithEnrichmentStateComplete = &v6->_estimatedAssetCountWithEnrichmentStateAssetMetadataAndScenesProcessed;
                  p_numberOfEnrichmentStateCompleteAssetCollections = &v6->_numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections;
                  goto LABEL_23;
                case 4:
                  goto LABEL_22;
                default:
                  break;
              }
            }
          }
          -[NSArray addObject:](v7, "addObject:", v13);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 + v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v23, v13);

          ++v12;
        }
        while (v9 != v12);
        v10 += v12;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        v9 = v24;
      }
      while (v24);
    }

    assetCollections = v6->_assetCollections;
    v6->_assetCollections = v7;
    v26 = v7;

    assetCollectionToSection = v6->_assetCollectionToSection;
    v6->_assetCollectionToSection = v33;
    v28 = v33;

    objc_storeStrong((id *)&v6->_collectionListFetchResult, v30);
    v5 = v31;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionToSection, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

- (int64_t)estimatedPhotosCount
{
  return self->_estimatedPhotosCount;
}

- (int64_t)estimatedVideosCount
{
  return self->_estimatedVideosCount;
}

- (int64_t)estimatedOtherCount
{
  return self->_estimatedOtherCount;
}

- (int64_t)numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections
{
  return self->_numberOfEnrichmentStateAssetMetadataAndScenesProcessedAssetCollections;
}

- (int64_t)numberOfEnrichmentStateCompleteAssetCollections
{
  return self->_numberOfEnrichmentStateCompleteAssetCollections;
}

@end
