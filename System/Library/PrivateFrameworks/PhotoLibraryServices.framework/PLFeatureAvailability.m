@implementation PLFeatureAvailability

- (PLFeatureAvailability)initWithProcessingSnapshot:(id)a3
{
  id v5;
  PLFeatureAvailability *v6;
  PLFeatureAvailability *v7;
  uint64_t v8;
  NSDictionary *availabilityByFeature;
  PLFeatureAvailability *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLFeatureAvailability;
  v6 = -[PLFeatureAvailability init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processingSnapshot, a3);
    +[PLFeatureAvailability _computeAvailabilityStatusFromSnapshot:](PLFeatureAvailability, "_computeAvailabilityStatusFromSnapshot:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    availabilityByFeature = v7->_availabilityByFeature;
    v7->_availabilityByFeature = (NSDictionary *)v8;

    v10 = v7;
  }

  return v7;
}

- (PLFeatureAvailability)initWithDictionary:(id)a3
{
  id v4;
  PLFeatureAvailability *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *availabilityByFeature;
  void *v10;
  PLFeatureProcessingSnapshot *v11;
  PLFeatureProcessingSnapshot *processingSnapshot;
  PLFeatureAvailability *v13;

  v4 = a3;
  v5 = -[PLFeatureAvailability init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availabilityByFeature"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    availabilityByFeature = v5->_availabilityByFeature;
    v5->_availabilityByFeature = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snapshotDictionary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = -[PLFeatureProcessingSnapshot initWithDictionary:]([PLFeatureProcessingSnapshot alloc], "initWithDictionary:", v10);
    else
      v11 = objc_alloc_init(PLFeatureProcessingSnapshot);
    processingSnapshot = v5->_processingSnapshot;
    v5->_processingSnapshot = v11;

    v13 = v5;
  }

  return v5;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("snapshotDictionary");
  -[PLFeatureProcessingSnapshot dictionary](self->_processingSnapshot, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("availabilityByFeature");
  v7[0] = v3;
  v7[1] = self->_availabilityByFeature;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)fractionForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[PLFeatureProcessingSnapshot fractionOfAllAssetsWithMediaAnalysisInSearchIndex](self->_processingSnapshot, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = objc_msgSend(v4, "intValue");
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Requesting fractionForFeature:%d not implemented", (uint8_t *)v9, 8u);
    }

    v6 = 0;
  }

  return v6;
}

- (PLFeatureProcessingSnapshot)processingSnapshot
{
  return self->_processingSnapshot;
}

- (NSDictionary)availabilityByFeature
{
  return self->_availabilityByFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityByFeature, 0);
  objc_storeStrong((id *)&self->_processingSnapshot, 0);
}

+ (id)availabilityFromFeatureAvailability:(id)a3 withGraphIsAvailable:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  PLFeatureAvailability *v7;

  v4 = a4;
  objc_msgSend(a3, "processingSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "setPhotosKnowledgeGraphIsReady:", v4);
  v7 = -[PLFeatureAvailability initWithProcessingSnapshot:]([PLFeatureAvailability alloc], "initWithProcessingSnapshot:", v6);

  return v7;
}

+ (id)_computeAvailabilityStatusFromSnapshot:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  PLFeatureAvailabilityConfig *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  unsigned int v36;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  unsigned int v52;
  _BOOL4 v53;
  uint64_t v54;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v5 = objc_msgSend(&unk_1E3763F38, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v58;
    v56 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v58 != v7)
          objc_enumerationMutation(&unk_1E3763F38);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v8), "unsignedIntegerValue");
        v10 = v3;
        v11 = -[PLFeatureAvailabilityConfig initWithFeature:]([PLFeatureAvailabilityConfig alloc], "initWithFeature:", v9);
        switch(v9)
        {
          case 0:
          case 4:
          case 5:
            goto LABEL_9;
          case 1:
            objc_msgSend(v10, "fractionOfCuratedAssetsWithCaptions");
            v19 = v18;
            -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithCaptionsThreshold](v11, "fractionOfCuratedAssetsWithCaptionsThreshold");
            v21 = v20;
            objc_msgSend(v10, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndex");
            v23 = v22;
            -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold](v11, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
            v25 = v24;
            objc_msgSend(v10, "fractionOfCuratedAssetsIndexedInVUClustering");
            v27 = v26;
            -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold](v11, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
            v29 = v28;
            objc_msgSend(v10, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex");
            v31 = v30;
            -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold](v11, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold");
            v33 = v32;
            v34 = objc_msgSend(v10, "totalCuratedAssetCount");
            v35 = -[PLFeatureAvailabilityConfig minimumNumberOfCuratedAssets](v11, "minimumNumberOfCuratedAssets");
            v36 = objc_msgSend(v10, "photosKnowledgeGraphIsReady");
            if (v19 < v21 || v23 < v25 || v27 < v29 || v31 < v33)
            {
              v15 = 0;
            }
            else if (v34 >= v35)
            {
              v15 = v36;
            }
            else
            {
              v15 = 0;
            }
            v4 = v56;
            break;
          case 2:
          case 3:
            objc_msgSend(v10, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
            v13 = v12;
            -[PLFeatureAvailabilityConfig fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold](v11, "fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold");
            v15 = v13 >= v14;
            break;
          case 6:
            objc_msgSend(v10, "fractionOfCuratedAssetsWithCaptions");
            v41 = v40;
            -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithCaptionsThreshold](v11, "fractionOfCuratedAssetsWithCaptionsThreshold");
            v43 = v41 >= v42;
            objc_msgSend(v10, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
            v45 = v44;
            -[PLFeatureAvailabilityConfig fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold](v11, "fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold");
            v47 = v46;
            objc_msgSend(v10, "fractionOfHighlightsEnriched");
            v49 = v48;
            -[PLFeatureAvailabilityConfig fractionOfHighlightsEnrichedThreshold](v11, "fractionOfHighlightsEnrichedThreshold");
            v51 = v50;
            v52 = objc_msgSend(v10, "photosKnowledgeGraphIsReady");
            v53 = v45 >= v47 && v43;
            if (v49 < v51)
              v53 = 0;
            v15 = v53 & v52;
            break;
          default:
            if (v9 == 100)
LABEL_9:
              v15 = 1;
            else
              v15 = 0;
            break;
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v17);

        ++v8;
      }
      while (v6 != v8);
      v54 = objc_msgSend(&unk_1E3763F38, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      v6 = v54;
    }
    while (v54);
  }

  return v4;
}

@end
