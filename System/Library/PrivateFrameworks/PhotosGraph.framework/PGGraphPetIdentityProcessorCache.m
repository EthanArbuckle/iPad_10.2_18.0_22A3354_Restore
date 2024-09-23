@implementation PGGraphPetIdentityProcessorCache

- (PGGraphPetIdentityProcessorCache)initWithGraph:(id)a3
{
  id v5;
  PGGraphPetIdentityProcessorCache *v6;
  PGGraphPetIdentityProcessorCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphPetIdentityProcessorCache;
  v6 = -[PGGraphPetIdentityProcessorCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graph, a3);

  return v7;
}

- (NSSet)relevantAssetUUIDsForPetFaces
{
  NSSet *relevantAssetUUIDsForPetFaces;
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
  NSSet *v15;
  NSSet *v16;
  NSSet *v17;

  relevantAssetUUIDsForPetFaces = self->_relevantAssetUUIDsForPetFaces;
  if (!relevantAssetUUIDsForPetFaces)
  {
    -[PGGraph meNodeCollection](self->_graph, "meNodeCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preciseAddressNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "momentNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", self->_graph);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preciseAddressNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "collectionByFormingUnionWith:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v17 = (NSSet *)objc_claimAutoreleasedReturnValue();

      return v17;
    }
    +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneName:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneName:inGraph:", CFSTR("Pet"), self->_graph);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "featureNodeCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMomentFeaturesEdgeCollection momentFeaturesEdgesFromMomentNodes:toFeatureNodes:](PGGraphMomentFeaturesEdgeCollection, "momentFeaturesEdgesFromMomentNodes:toFeatureNodes:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "allRelevantAssetUUIDs");
    v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v16 = self->_relevantAssetUUIDsForPetFaces;
    self->_relevantAssetUUIDsForPetFaces = v15;

    relevantAssetUUIDsForPetFaces = self->_relevantAssetUUIDsForPetFaces;
  }
  v17 = relevantAssetUUIDsForPetFaces;
  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantAssetUUIDsForPetFaces, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
