@implementation PGGraphFeatureNodeCollection

- (PGGraphMemoryNodeCollection)memoryNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphMemoryFeaturesEdge filter](PGGraphMemoryFeaturesEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMemoryNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMemoryNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphFeatureNodeCollection momentOfFeature](PGGraphFeatureNodeCollection, "momentOfFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (id)allFeatures
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PGGraphFeatureNodeCollection_allFeatures__block_invoke;
  v6[3] = &unk_1E8434AB0;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return v4;
}

- (NSSet)featureIdentifiers
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphFeatureNodeCollection_featureIdentifiers__block_invoke;
  v6[3] = &unk_1E8434AD8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return (NSSet *)v4;
}

void __50__PGGraphFeatureNodeCollection_featureIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "featureIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __43__PGGraphFeatureNodeCollection_allFeatures__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF981208))
  {
    +[PGFeature featureWithType:node:](PGFeature, "featureWithType:node:", objc_msgSend(v3, "featureType"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "label");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v12;
        v17 = 2112;
        v18 = v14;
        _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "No feature found for feature node with label %@ of class %@", (uint8_t *)&v15, 0x16u);

      }
      v5 = 0;
    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loggingConnection");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_1CA237000, v5, OS_LOG_TYPE_ERROR, "Node with label %@ of class %@ in PGGraphFeatureNodeCollection does not conform to PGAssetCollectionFeature protocol", (uint8_t *)&v15, 0x16u);

    }
  }

}

+ (MARelation)momentOfFeature
{
  void *v2;
  void *v3;

  +[PGGraphMomentFeaturesEdge filter](PGGraphMomentFeaturesEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)memoryOfFeature
{
  void *v2;
  void *v3;

  +[PGGraphMemoryFeaturesEdge filter](PGGraphMemoryFeaturesEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (PGGraphFeatureNodeCollection)featureNodeCollectionWithCollection:(id)a3
{
  id v3;
  PGGraphFeatureNodeCollection *v4;
  void *v5;
  void *v6;
  PGGraphFeatureNodeCollection *v7;

  v3 = a3;
  v4 = [PGGraphFeatureNodeCollection alloc];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MAElementCollection initWithGraph:elementIdentifiers:](v4, "initWithGraph:elementIdentifiers:", v5, v6);
  return v7;
}

+ (PGGraphFeatureNodeCollection)featureNodeCollectionWithFeatures:(id)a3 inGraph:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  PGGraphFeatureNodeCollection *v19;
  __int128 v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v24;
    *(_QWORD *)&v9 = 138412290;
    v21 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "nodeInGraph:", v6, v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF981208))
          {
            objc_msgSend(v22, "addIdentifier:", objc_msgSend(v15, "identifier"));
            goto LABEL_14;
          }
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v28 = v13;
            _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "Feature node found for feature (%@) does not conform PGAssetCollectionFeature protocol", buf, 0xCu);
          }
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "loggingConnection");
          v17 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v21;
            v28 = v13;
            _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Feature node for feature (%@) not found in graph", buf, 0xCu);
          }
        }

LABEL_14:
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v10);
  }

  v19 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphFeatureNodeCollection alloc], "initWithGraph:elementIdentifiers:", v6, v22);
  return v19;
}

@end
