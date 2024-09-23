@implementation PLFeatureAvailabilityConfig

- (PLFeatureAvailabilityConfig)init
{
  PLFeatureAvailabilityConfig *v2;
  PLFeatureAvailabilityConfig *v3;
  PLFeatureAvailabilityConfig *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLFeatureAvailabilityConfig;
  v2 = -[PLFeatureAvailabilityConfig init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (PLFeatureAvailabilityConfig)initWithFeature:(unint64_t)a3
{
  PLFeatureAvailabilityConfig *v4;
  PLFeatureAvailabilityConfig *v5;
  PLFeatureAvailabilityConfig *v11;

  v4 = -[PLFeatureAvailabilityConfig init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3 - 2 < 2)
    {
      v4->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = 0.9;
    }
    else
    {
      if (a3 == 1)
      {
        __asm { FMOV            V0.2D, #0.75 }
        *(_OWORD *)&v4->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold = _Q0;
        v4->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold = 0.75;
        v4->_minimumNumberOfCuratedAssets = 50;
        goto LABEL_8;
      }
      if (a3 == 6)
      {
        v4->_fractionOfCuratedAssetsWithCaptionsThreshold = 0.9;
        v4->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = 0.8;
        v4->_fractionOfHighlightsEnrichedThreshold = 0.8;
LABEL_8:
        v4->_needsPhotosKnowledgeGraph = 1;
      }
    }
    v11 = v4;
  }

  return v5;
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
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("fractionOfCuratedAssetsWithCaptionsThreshold");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithCaptionsThreshold](self, "fractionOfCuratedAssetsWithCaptionsThreshold");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v17[1] = CFSTR("fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureAvailabilityConfig fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold](self, "fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  v17[2] = CFSTR("fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold](self, "fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v8;
  v17[3] = CFSTR("fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureAvailabilityConfig fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold](self, "fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v10;
  v17[4] = CFSTR("fractionOfHighlightsEnrichedThreshold");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PLFeatureAvailabilityConfig fractionOfHighlightsEnrichedThreshold](self, "fractionOfHighlightsEnrichedThreshold");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v12;
  v17[5] = CFSTR("needsPhotosKnowledgeGraph");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLFeatureAvailabilityConfig needsPhotosKnowledgeGraph](self, "needsPhotosKnowledgeGraph"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v13;
  v17[6] = CFSTR("minimumNumberOfCuratedAssets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLFeatureAvailabilityConfig minimumNumberOfCuratedAssets](self, "minimumNumberOfCuratedAssets"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v15;
}

- (double)fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold
{
  return self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold;
}

- (void)setFractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold:(double)a3
{
  self->_fractionOfAllAssetsWithMediaAnalysisInSearchIndexThreshold = a3;
}

- (double)fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold;
}

- (void)setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold:(double)a3
{
  self->_fractionOfCuratedAssetsWithSceneAnalysisInSearchIndexThreshold = a3;
}

- (double)fractionOfCuratedAssetsWithCaptionsThreshold
{
  return self->_fractionOfCuratedAssetsWithCaptionsThreshold;
}

- (void)setFractionOfCuratedAssetsWithCaptionsThreshold:(double)a3
{
  self->_fractionOfCuratedAssetsWithCaptionsThreshold = a3;
}

- (double)fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold
{
  return self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold;
}

- (void)setFractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold:(double)a3
{
  self->_fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold = a3;
}

- (double)fractionOfHighlightsEnrichedThreshold
{
  return self->_fractionOfHighlightsEnrichedThreshold;
}

- (void)setFractionOfHighlightsEnrichedThreshold:(double)a3
{
  self->_fractionOfHighlightsEnrichedThreshold = a3;
}

- (BOOL)needsPhotosKnowledgeGraph
{
  return self->_needsPhotosKnowledgeGraph;
}

- (void)setNeedsPhotosKnowledgeGraph:(BOOL)a3
{
  self->_needsPhotosKnowledgeGraph = a3;
}

- (unint64_t)minimumNumberOfCuratedAssets
{
  return self->_minimumNumberOfCuratedAssets;
}

- (void)setMinimumNumberOfCuratedAssets:(unint64_t)a3
{
  self->_minimumNumberOfCuratedAssets = a3;
}

@end
