@implementation PLFeatureProcessingSnapshot

- (PLFeatureProcessingSnapshot)init
{
  PLFeatureProcessingSnapshot *v2;
  PLFeatureProcessingSnapshot *v3;
  PLFeatureProcessingSnapshot *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLFeatureProcessingSnapshot;
  v2 = -[PLFeatureProcessingSnapshot init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (PLFeatureProcessingSnapshot)initWithDictionary:(id)a3
{
  id v4;
  PLFeatureProcessingSnapshot *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDate *dateComputed;
  PLFeatureProcessingSnapshot *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PLFeatureProcessingSnapshot;
  v5 = -[PLFeatureProcessingSnapshot init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfAllAssetsAnalyzedForScenes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_fractionOfAllAssetsAnalyzedForScenes = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfAllAssetsWithSceneAnalysisInSearchIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfAllAssetsWithMediaAnalysisInSearchIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = v11;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfAllAssetsWithCaptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v5->_fractionOfAllAssetsWithCaptions = v13;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v5->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = v15;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfCuratedAssetsWithEmbeddingsInVectorIndex"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v5->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfCuratedAssetsIndexedInVUClustering"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v5->_fractionOfCuratedAssetsIndexedInVUClustering = v19;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfCuratedAssetsWithCaptions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v5->_fractionOfCuratedAssetsWithCaptions = v21;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fractionOfHighlightsEnriched"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v5->_fractionOfHighlightsEnriched = v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("photosKnowledgeGraphIsReady"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_photosKnowledgeGraphIsReady = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalAssetCount"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalAssetCount = objc_msgSend(v25, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalCuratedAssetCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalCuratedAssetCount = objc_msgSend(v26, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalAssetForScenesCount"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalAssetForScenesCount = objc_msgSend(v27, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalCuratedAssetForScenesCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalCuratedAssetForScenesCount = objc_msgSend(v28, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateComputed"));
    v29 = objc_claimAutoreleasedReturnValue();
    dateComputed = v5->_dateComputed;
    v5->_dateComputed = (NSDate *)v29;

    v31 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PLFeatureProcessingSnapshot dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (NSDictionary)dictionary
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[14];
  _QWORD v30[16];

  v30[14] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("fractionOfAllAssetsAnalyzedForScenes");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfAllAssetsAnalyzedForScenes](self, "fractionOfAllAssetsAnalyzedForScenes");
  objc_msgSend(v3, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v28;
  v29[1] = CFSTR("fractionOfAllAssetsWithSceneAnalysisInSearchIndex");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfAllAssetsWithSceneAnalysisInSearchIndex](self, "fractionOfAllAssetsWithSceneAnalysisInSearchIndex");
  objc_msgSend(v4, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v27;
  v29[2] = CFSTR("fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfAllAssetsWithMediaAnalysisInSearchIndex](self, "fractionOfAllAssetsWithMediaAnalysisInSearchIndex");
  objc_msgSend(v5, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  v29[3] = CFSTR("fractionOfAllAssetsWithCaptions");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfAllAssetsWithCaptions](self, "fractionOfAllAssetsWithCaptions");
  objc_msgSend(v6, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v25;
  v29[4] = CFSTR("fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex](self, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex");
  objc_msgSend(v7, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v24;
  v29[5] = CFSTR("fractionOfCuratedAssetsWithEmbeddingsInVectorIndex");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfCuratedAssetsWithEmbeddingsInVectorIndex](self, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndex");
  objc_msgSend(v8, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v23;
  v29[6] = CFSTR("fractionOfCuratedAssetsIndexedInVUClustering");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfCuratedAssetsIndexedInVUClustering](self, "fractionOfCuratedAssetsIndexedInVUClustering");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v10;
  v29[7] = CFSTR("fractionOfCuratedAssetsWithCaptions");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfCuratedAssetsWithCaptions](self, "fractionOfCuratedAssetsWithCaptions");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v12;
  v29[8] = CFSTR("fractionOfHighlightsEnriched");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureProcessingSnapshot fractionOfHighlightsEnriched](self, "fractionOfHighlightsEnriched");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v14;
  v29[9] = CFSTR("photosKnowledgeGraphIsReady");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLFeatureProcessingSnapshot photosKnowledgeGraphIsReady](self, "photosKnowledgeGraphIsReady"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v15;
  v29[10] = CFSTR("totalAssetCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalAssetCount](self, "totalAssetCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v16;
  v29[11] = CFSTR("totalCuratedAssetCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalCuratedAssetCount](self, "totalCuratedAssetCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v17;
  v29[12] = CFSTR("totalAssetForScenesCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalAssetForScenesCount](self, "totalAssetForScenesCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[12] = v18;
  v29[13] = CFSTR("totalCuratedAssetForScenesCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLFeatureProcessingSnapshot totalCuratedAssetForScenesCount](self, "totalCuratedAssetForScenesCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[13] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_dateComputed)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", self->_dateComputed, CFSTR("dateComputed"));
  }
  else
  {
    v21 = v20;
  }

  return (NSDictionary *)v21;
}

- (double)fractionOfAllAssetsAnalyzedForScenes
{
  return self->_fractionOfAllAssetsAnalyzedForScenes;
}

- (void)setFractionOfAllAssetsAnalyzedForScenes:(double)a3
{
  self->_fractionOfAllAssetsAnalyzedForScenes = a3;
}

- (double)fractionOfAllAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndex
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex;
}

- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndex = a3;
}

- (double)fractionOfAllAssetsWithCaptions
{
  return self->_fractionOfAllAssetsWithCaptions;
}

- (void)setFractionOfAllAssetsWithCaptions:(double)a3
{
  self->_fractionOfAllAssetsWithCaptions = a3;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex;
}

- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndex = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndex
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex;
}

- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndex = a3;
}

- (double)fractionOfCuratedAssetsIndexedInVUClustering
{
  return self->_fractionOfCuratedAssetsIndexedInVUClustering;
}

- (void)setFractionOfCuratedAssetsIndexedInVUClustering:(double)a3
{
  self->_fractionOfCuratedAssetsIndexedInVUClustering = a3;
}

- (double)fractionOfCuratedAssetsWithCaptions
{
  return self->_fractionOfCuratedAssetsWithCaptions;
}

- (void)setFractionOfCuratedAssetsWithCaptions:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptions = a3;
}

- (double)fractionOfHighlightsEnriched
{
  return self->_fractionOfHighlightsEnriched;
}

- (void)setFractionOfHighlightsEnriched:(double)a3
{
  self->_fractionOfHighlightsEnriched = a3;
}

- (BOOL)photosKnowledgeGraphIsReady
{
  return self->_photosKnowledgeGraphIsReady;
}

- (void)setPhotosKnowledgeGraphIsReady:(BOOL)a3
{
  self->_photosKnowledgeGraphIsReady = a3;
}

- (unint64_t)totalAssetCount
{
  return self->_totalAssetCount;
}

- (void)setTotalAssetCount:(unint64_t)a3
{
  self->_totalAssetCount = a3;
}

- (unint64_t)totalCuratedAssetCount
{
  return self->_totalCuratedAssetCount;
}

- (void)setTotalCuratedAssetCount:(unint64_t)a3
{
  self->_totalCuratedAssetCount = a3;
}

- (unint64_t)totalAssetForScenesCount
{
  return self->_totalAssetForScenesCount;
}

- (void)setTotalAssetForScenesCount:(unint64_t)a3
{
  self->_totalAssetForScenesCount = a3;
}

- (unint64_t)totalCuratedAssetForScenesCount
{
  return self->_totalCuratedAssetForScenesCount;
}

- (void)setTotalCuratedAssetForScenesCount:(unint64_t)a3
{
  self->_totalCuratedAssetForScenesCount = a3;
}

- (NSDate)dateComputed
{
  return self->_dateComputed;
}

- (void)setDateComputed:(id)a3
{
  objc_storeStrong((id *)&self->_dateComputed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComputed, 0);
}

@end
