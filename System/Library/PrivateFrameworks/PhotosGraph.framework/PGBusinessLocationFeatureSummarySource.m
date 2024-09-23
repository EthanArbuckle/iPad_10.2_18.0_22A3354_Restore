@implementation PGBusinessLocationFeatureSummarySource

- (PGBusinessLocationFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGBusinessLocationFeatureSummarySource *v12;
  PGBusinessLocationFeatureSummarySource *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MABinaryAdjacency *businessNodesByMomentNode;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PGBusinessLocationFeatureSummarySource;
  v12 = -[PGBusinessLocationFeatureSummarySource init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
    v14 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphNodeCollection nodesInGraph:](PGGraphBusinessNodeCollection, "nodesInGraph:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphBusinessNode momentOfBusiness](PGGraphBusinessNode, "momentOfBusiness");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "adjacencyWithSources:relation:targetsClass:", v15, v16, objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "transposed");
    v18 = objc_claimAutoreleasedReturnValue();
    businessNodesByMomentNode = v13->_businessNodesByMomentNode;
    v13->_businessNodesByMomentNode = (MABinaryAdjacency *)v18;

  }
  return v13;
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__PGBusinessLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke;
  v11[3] = &unk_1E8428C40;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateIdentifiersAsCollectionsWithBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)summarizedBusinessNodesForMomentNode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  NSObject *loggingConnection;
  NSObject *v16;
  void *v17;
  void *v18;
  PGBusinessLocationSummarizedFeature *v19;
  void *v20;
  PGBusinessLocationSummarizedFeature *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGLocationTitleUtility businessNodeForTitlingFromMomentNodes:businessNodesByMomentNode:](PGLocationTitleUtility, "businessNodeForTitlingFromMomentNodes:businessNodesByMomentNode:", v4, self->_businessNodesByMomentNode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "collection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPlaceBusinessEdgeCollection, "edgesFromNodes:toNodes:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "anyEdge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "universalStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "universalEndDate");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v11)
        v14 = v12 == 0;
      else
        v14 = 1;
      if (v14)
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
        {
          v16 = loggingConnection;
          *(_DWORD *)buf = 134217984;
          v24 = objc_msgSend(v6, "muid");
          _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[PGBusinessLocationFeatureSummarySource] No start and end date found for business edge for business node %llu", buf, 0xCu);

        }
        v20 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v12);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v17, 0);
        v19 = -[PGBusinessLocationSummarizedFeature initWithIntervalsPresent:isMandatoryForKeyAsset:businessNode:]([PGBusinessLocationSummarizedFeature alloc], "initWithIntervalsPresent:isMandatoryForKeyAsset:businessNode:", v18, 1, v6);
        v22 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __75__PGBusinessLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "summarizedBusinessNodesForMomentNode:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v2);

}

@end
