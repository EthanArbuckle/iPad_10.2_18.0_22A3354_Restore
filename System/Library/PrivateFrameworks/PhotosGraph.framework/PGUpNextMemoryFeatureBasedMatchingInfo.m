@implementation PGUpNextMemoryFeatureBasedMatchingInfo

- (PGUpNextMemoryFeatureBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3
{
  id v5;
  PGUpNextMemoryFeatureBasedMatchingInfo *v6;
  PGUpNextMemoryFeatureBasedMatchingInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGUpNextMemoryFeatureBasedMatchingInfo;
  v6 = -[PGUpNextMemoryFeatureBasedMatchingInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_memoryNodeAsCollection, a3);

  return v7;
}

- (unint64_t)nodeIdentifier
{
  void *v2;
  unint64_t v3;

  -[MAElementCollection elementIdentifiers](self->_memoryNodeAsCollection, "elementIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "firstElement");

  return v3;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return 0;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  PGGraphFeatureNodeCollection *memoryFeatureNodes;
  PGGraphFeatureNodeCollection *v4;
  PGGraphFeatureNodeCollection *v5;

  memoryFeatureNodes = self->_memoryFeatureNodes;
  if (!memoryFeatureNodes)
  {
    -[PGGraphMemoryNodeCollection featureNodes](self->_memoryNodeAsCollection, "featureNodes");
    v4 = (PGGraphFeatureNodeCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_memoryFeatureNodes;
    self->_memoryFeatureNodes = v4;

    memoryFeatureNodes = self->_memoryFeatureNodes;
  }
  return memoryFeatureNodes;
}

- (PGGraphPersonNodeCollection)personNodes
{
  void *v2;
  void *v3;

  -[PGUpNextMemoryFeatureBasedMatchingInfo memoryFeatureNodes](self, "memoryFeatureNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v3;
}

- (PGGraphSceneNodeCollection)sceneNodes
{
  PGGraphSceneNodeCollection *sceneNodes;
  void *v4;
  void *v5;
  PGGraphSceneNodeCollection *v6;
  PGGraphSceneNodeCollection *v7;

  sceneNodes = self->_sceneNodes;
  if (!sceneNodes)
  {
    v4 = (void *)objc_opt_class();
    -[PGUpNextMemoryFeatureBasedMatchingInfo memoryFeatureNodes](self, "memoryFeatureNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "representativeSceneNodesForMemoryFeatureNodes:", v5);
    v6 = (PGGraphSceneNodeCollection *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sceneNodes;
    self->_sceneNodes = v6;

    sceneNodes = self->_sceneNodes;
  }
  return sceneNodes;
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  return 0;
}

- (BOOL)isTripMemory
{
  void *v3;
  void *v4;

  if (!self->_isTripMemoryIsResolved)
  {
    -[MANodeCollection labels](self->_memoryNodeAsCollection, "labels");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphBuilder memoryLabelForCategory:](PGGraphBuilder, "memoryLabelForCategory:", 19);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isTripMemory = objc_msgSend(v3, "containsObject:", v4);

    self->_isTripMemoryIsResolved = 1;
  }
  return self->_isTripMemory;
}

- (CLLocation)representativeLocation
{
  return 0;
}

- (NSDate)representativeDate
{
  return 0;
}

- (NSString)debugInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphMemoryNodeCollection uniqueMemoryIdentifiers](self->_memoryNodeAsCollection, "uniqueMemoryIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Memory Feature Matching Info With Memory id: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
  objc_storeStrong((id *)&self->_memoryNodeAsCollection, 0);
}

+ (id)representativeSceneNodesForMemoryFeatureNodes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  PGGraphSceneNodeCollection *v17;
  PGGraphSceneNodeCollection *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[PGGraphNodeCollection subsetInCollection:](PGGraphSceneFeatureNodeCollection, "subsetInCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v20 = v4;
    objc_msgSend(v3, "labels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[PGTrendsMemoryGenerator trendsConfigurations](PGTrendsMemoryGenerator, "trendsConfigurations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "featureLabel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v5, "containsObject:", v13);

          if (v14)
          {
            objc_msgSend(v12, "positiveScenes");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObjectsFromArray:", v15);

            objc_msgSend(v12, "positiveDominantScenes");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObjectsFromArray:", v16);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v4 = v20;
    if (objc_msgSend(v6, "count"))
    {
      +[PGGraphSceneNodeCollection sceneNodesForSceneNames:inGraph:](PGGraphSceneNodeCollection, "sceneNodesForSceneNames:inGraph:", v6, v20);
      v17 = (PGGraphSceneNodeCollection *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = -[MAElementCollection initWithGraph:]([PGGraphSceneNodeCollection alloc], "initWithGraph:", v20);
    }
    v18 = v17;

  }
  else
  {
    v18 = -[MAElementCollection initWithGraph:]([PGGraphSceneNodeCollection alloc], "initWithGraph:", v4);
  }

  return v18;
}

+ (id)matchingInfosWithMemoryNodes:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PGUpNextMemoryFeatureBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke;
  v8[3] = &unk_1E84346C0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateIdentifiersAsCollectionsWithBlock:", v8);

  return v6;
}

void __71__PGUpNextMemoryFeatureBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  PGUpNextMemoryFeatureBasedMatchingInfo *v5;

  v4 = a3;
  v5 = -[PGUpNextMemoryFeatureBasedMatchingInfo initWithMemoryNodeAsCollection:]([PGUpNextMemoryFeatureBasedMatchingInfo alloc], "initWithMemoryNodeAsCollection:", v4);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

@end
