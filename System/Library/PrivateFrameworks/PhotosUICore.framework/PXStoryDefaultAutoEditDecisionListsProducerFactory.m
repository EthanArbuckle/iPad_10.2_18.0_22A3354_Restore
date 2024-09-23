@implementation PXStoryDefaultAutoEditDecisionListsProducerFactory

- (PXStoryDefaultAutoEditDecisionListsProducerFactory)initWithStoryConfiguration:(id)a3
{
  id v5;
  PXStoryDefaultAutoEditDecisionListsProducerFactory *v6;
  PXStoryDefaultAutoEditDecisionListsProducerFactory *v7;
  uint64_t v8;
  PFStoryAutoEditConfiguration *configuration;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryDefaultAutoEditDecisionListsProducerFactory;
  v6 = -[PXStoryDefaultAutoEditDecisionListsProducerFactory init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storyConfiguration, a3);
    +[PXStoryAutoEditConfigurationFactory autoEditConfiguration](PXStoryAutoEditConfigurationFactory, "autoEditConfiguration");
    v8 = objc_claimAutoreleasedReturnValue();
    configuration = v7->_configuration;
    v7->_configuration = (PFStoryAutoEditConfiguration *)v8;

  }
  return v7;
}

- (id)autoEditDecisionListsProducerForAssetCollection:(id)a3 displayAssets:(id)a4 movieHighlights:(id)a5 chapterCollection:(id)a6 targetOverallDurationInfo:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PXStorySongsAutoEditDecisionListsProducer *v16;
  PFStoryAutoEditConfiguration *configuration;
  void *v18;
  __int128 v19;
  __int128 v20;
  PXStorySongsAutoEditDecisionListsProducer *v21;
  _OWORD v23[5];

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = [PXStorySongsAutoEditDecisionListsProducer alloc];
  configuration = self->_configuration;
  -[PXStoryDefaultAutoEditDecisionListsProducerFactory storyConfiguration](self, "storyConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)&a7->var1.var1.var3;
  v23[2] = *(_OWORD *)&a7->var1.var1.var0;
  v23[3] = v19;
  v23[4] = *(_OWORD *)&a7->var1.var2.var1;
  v20 = *(_OWORD *)&a7->var1.var0.var1;
  v23[0] = *(_OWORD *)&a7->var0;
  v23[1] = v20;
  v21 = -[PXStorySongsAutoEditDecisionListsProducer initWithAssetCollection:displayAssets:movieHighlights:chapterCollection:targetOverallDurationInfo:configuration:storyConfiguration:](v16, "initWithAssetCollection:displayAssets:movieHighlights:chapterCollection:targetOverallDurationInfo:configuration:storyConfiguration:", v15, v14, v13, v12, v23, configuration, v18);

  return v21;
}

- (id)fallbackAutoEditDecisionListsProducer
{
  void *v3;
  void *v4;
  Float64 v5;
  void *v6;
  uint64_t v7;
  PXStoryConcreteAutoEditDecisionList *v8;
  PXStoryConcreteAutoEditDecisionList *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  PXStoryConcreteAutoEditDecisionList *v16;
  PXStoryConcreteAutoEditDecisionList *v17;
  PXStoryPassthroughAutoEditDecisionListsProducer *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CMTime v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  PFStoryColorGradeSupportedCategories();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
  memset(&v35, 0, sizeof(v35));
  -[PFStoryAutoEditConfiguration outroDurationForSongPace:](self->_configuration, "outroDurationForSongPace:", 2);
  CMTimeMakeWithSeconds(&v35, v5, 600);
  -[PXStoryDefaultAutoEditDecisionListsProducerFactory storyConfiguration](self, "storyConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "disableNUp") ^ 1;

  v8 = [PXStoryConcreteAutoEditDecisionList alloc];
  v23 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 48);
  v24 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 32);
  v32 = v24;
  v33 = v23;
  v22 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 64);
  v34 = v22;
  v20 = *MEMORY[0x1E0D759B0];
  v21 = *(_OWORD *)(MEMORY[0x1E0D759B0] + 16);
  v30 = *MEMORY[0x1E0D759B0];
  v31 = v21;
  v29 = v35;
  v9 = -[PXStoryConcreteAutoEditDecisionList initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:](v8, "initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:", 0, 0, 0, &v30, &v29, v7);
  objc_msgSend(v4, "addObject:", v9);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v16 = [PXStoryConcreteAutoEditDecisionList alloc];
        v32 = v24;
        v33 = v23;
        v34 = v22;
        v30 = v20;
        v31 = v21;
        v29 = v35;
        v17 = -[PXStoryConcreteAutoEditDecisionList initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:](v16, "initWithColorGradeCategory:song:clipCatalog:constrainedOverallDurationInfo:outroDuration:allowsNUp:", v15, 0, 0, &v30, &v29, v7);
        objc_msgSend(v4, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v12);
  }

  v18 = -[PXStoryPassthroughAutoEditDecisionListsProducer initWithAutoEditDecisionLists:]([PXStoryPassthroughAutoEditDecisionListsProducer alloc], "initWithAutoEditDecisionLists:", v4);
  return v18;
}

- (PXStoryConfiguration)storyConfiguration
{
  return self->_storyConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storyConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
