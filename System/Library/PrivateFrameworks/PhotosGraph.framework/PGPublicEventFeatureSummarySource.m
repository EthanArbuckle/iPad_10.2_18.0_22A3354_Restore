@implementation PGPublicEventFeatureSummarySource

- (PGPublicEventFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGPublicEventFeatureSummarySource *v12;
  PGPublicEventFeatureSummarySource *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PGGraphMomentNodeCollection *momentNodesWithRelevantPublicEvent;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGPublicEventFeatureSummarySource;
  v12 = -[PGPublicEventFeatureSummarySource init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
    -[PGTitleGenerationContext appleEventsCategoryNodes](v13->_titleGenerationContext, "appleEventsCategoryNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "publicEventNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "momentNodes");
    v16 = objc_claimAutoreleasedReturnValue();
    momentNodesWithRelevantPublicEvent = v13->_momentNodesWithRelevantPublicEvent;
    v13->_momentNodesWithRelevantPublicEvent = (PGGraphMomentNodeCollection *)v16;

  }
  return v13;
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  void *v3;
  void *v4;
  PGPublicEventSummarizedFeature *v5;
  void *v6;
  PGPublicEventSummarizedFeature *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[MAElementCollection collectionByIntersecting:](self->_momentNodesWithRelevantPublicEvent, "collectionByIntersecting:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [PGPublicEventSummarizedFeature alloc];
    objc_msgSend(v3, "universalDateIntervals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGPublicEventSummarizedFeature initWithIntervalsPresent:isMandatoryForKeyAsset:publicEventLabel:](v5, "initWithIntervalsPresent:isMandatoryForKeyAsset:publicEventLabel:", v6, 0, v4);

    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesWithRelevantPublicEvent, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
