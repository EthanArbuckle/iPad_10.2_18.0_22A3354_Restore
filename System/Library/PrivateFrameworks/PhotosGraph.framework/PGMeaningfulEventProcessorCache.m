@implementation PGMeaningfulEventProcessorCache

- (PGMeaningfulEventProcessorCache)initWithMomentNodes:(id)a3
{
  id v5;
  PGMeaningfulEventProcessorCache *v6;
  PGMeaningfulEventProcessorCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMeaningfulEventProcessorCache;
  v6 = -[PGMeaningfulEventProcessorCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_momentNodes, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (id)sceneNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *sceneNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sceneNodesByMomentNode = self->_sceneNodesByMomentNode;
  if (!sceneNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode sceneOfMoment](PGGraphMomentNode, "sceneOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_sceneNodesByMomentNode;
    self->_sceneNodesByMomentNode = v10;

    sceneNodesByMomentNode = self->_sceneNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](sceneNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)reliableSceneNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *reliableSceneNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  reliableSceneNodesByMomentNode = self->_reliableSceneNodesByMomentNode;
  if (!reliableSceneNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode reliableSceneOfMoment](PGGraphMomentNode, "reliableSceneOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_reliableSceneNodesByMomentNode;
    self->_reliableSceneNodesByMomentNode = v10;

    reliableSceneNodesByMomentNode = self->_reliableSceneNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](reliableSceneNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)poiNodesWithNonzeroConfidenceForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *poiNodesByMomentNode;
  void *v7;
  _BOOL8 v8;
  void *v9;
  PGGraphMomentNodeCollection *momentNodes;
  void *v11;
  MABinaryAdjacency *v12;
  MABinaryAdjacency *v13;
  void *v14;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  poiNodesByMomentNode = self->_poiNodesByMomentNode;
  if (!poiNodesByMomentNode)
  {
    objc_msgSend(v4, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)(objc_msgSend(v7, "version") - 1) < 0x18F;

    v9 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode poiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:](PGGraphMomentNode, "poiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", momentNodes, v11, objc_opt_class());
    v12 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v13 = self->_poiNodesByMomentNode;
    self->_poiNodesByMomentNode = v12;

    poiNodesByMomentNode = self->_poiNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](poiNodesByMomentNode, "targetsForSources:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (id)roiNodesWithNonzeroConfidenceForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *roiNodesByMomentNode;
  void *v7;
  _BOOL8 v8;
  void *v9;
  PGGraphMomentNodeCollection *momentNodes;
  void *v11;
  MABinaryAdjacency *v12;
  MABinaryAdjacency *v13;
  void *v14;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  roiNodesByMomentNode = self->_roiNodesByMomentNode;
  if (!roiNodesByMomentNode)
  {
    objc_msgSend(v4, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)(objc_msgSend(v7, "version") - 1) < 0x18F;

    v9 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode roiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:](PGGraphMomentNode, "roiWithNonzeroConfidenceOfMomentWithHasLegacyWeights:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", momentNodes, v11, objc_opt_class());
    v12 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v13 = self->_roiNodesByMomentNode;
    self->_roiNodesByMomentNode = v12;

    roiNodesByMomentNode = self->_roiNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](roiNodesByMomentNode, "targetsForSources:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (id)addressNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *addressNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  addressNodesByMomentNode = self->_addressNodesByMomentNode;
  if (!addressNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_addressNodesByMomentNode;
    self->_addressNodesByMomentNode = v10;

    addressNodesByMomentNode = self->_addressNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](addressNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)preciseAddressNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *preciseAddressNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preciseAddressNodesByMomentNode = self->_preciseAddressNodesByMomentNode;
  if (!preciseAddressNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode preciseAddressOfMoment](PGGraphMomentNode, "preciseAddressOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_preciseAddressNodesByMomentNode;
    self->_preciseAddressNodesByMomentNode = v10;

    preciseAddressNodesByMomentNode = self->_preciseAddressNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](preciseAddressNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)dateNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *dateNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dateNodesByMomentNode = self->_dateNodesByMomentNode;
  if (!dateNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode dateOfMoment](PGGraphMomentNode, "dateOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_dateNodesByMomentNode;
    self->_dateNodesByMomentNode = v10;

    dateNodesByMomentNode = self->_dateNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](dateNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)peopleNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *personNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  personNodesByMomentNode = self->_personNodesByMomentNode;
  if (!personNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_personNodesByMomentNode;
    self->_personNodesByMomentNode = v10;

    personNodesByMomentNode = self->_personNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](personNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)socialGroupNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *socialGroupNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  socialGroupNodesByMomentNode = self->_socialGroupNodesByMomentNode;
  if (!socialGroupNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode socialGroupInMoment](PGGraphMomentNode, "socialGroupInMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_socialGroupNodesByMomentNode;
    self->_socialGroupNodesByMomentNode = v10;

    socialGroupNodesByMomentNode = self->_socialGroupNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](socialGroupNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)publicEventCategoryNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *publicEventCategoryNodesByMomentNode;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MABinaryAdjacency *v12;
  MABinaryAdjacency *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  publicEventCategoryNodesByMomentNode = self->_publicEventCategoryNodesByMomentNode;
  if (!publicEventCategoryNodesByMomentNode)
  {
    v7 = objc_alloc(MEMORY[0x1E0D429E0]);
    +[PGGraphMomentNode publicEventOfMoment](PGGraphMomentNode, "publicEventOfMoment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    +[PGGraphPublicEventNode categoryOfPublicEvent](PGGraphPublicEventNode, "categoryOfPublicEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithSteps:", v10);

    objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", self->_momentNodes, v11, objc_opt_class());
    v12 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v13 = self->_publicEventCategoryNodesByMomentNode;
    self->_publicEventCategoryNodesByMomentNode = v12;

    publicEventCategoryNodesByMomentNode = self->_publicEventCategoryNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](publicEventCategoryNodesByMomentNode, "targetsForSources:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (unint64_t)partsOfDayForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *partOfDayNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  partOfDayNodesByMomentNode = self->_partOfDayNodesByMomentNode;
  if (!partOfDayNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode partOfDayOfMoment](PGGraphMomentNode, "partOfDayOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_partOfDayNodesByMomentNode;
    self->_partOfDayNodesByMomentNode = v10;

    partOfDayNodesByMomentNode = self->_partOfDayNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](partOfDayNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v12, "partsOfDay", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    v17 = 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v17 |= objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v17;
}

- (unint64_t)significantPartsOfDayForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *significantPartOfDayNodesByMomentNode;
  void *v7;
  _BOOL8 v8;
  void *v9;
  PGGraphMomentNodeCollection *momentNodes;
  void *v11;
  MABinaryAdjacency *v12;
  MABinaryAdjacency *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  significantPartOfDayNodesByMomentNode = self->_significantPartOfDayNodesByMomentNode;
  if (!significantPartOfDayNodesByMomentNode)
  {
    objc_msgSend(v4, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (unint64_t)(objc_msgSend(v7, "version") - 1) < 0x18F;

    v9 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode significantPartOfDayOfMomentWithHasLegacyWeights:](PGGraphMomentNode, "significantPartOfDayOfMomentWithHasLegacyWeights:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "adjacencyWithSources:relation:targetsClass:", momentNodes, v11, objc_opt_class());
    v12 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v13 = self->_significantPartOfDayNodesByMomentNode;
    self->_significantPartOfDayNodesByMomentNode = v12;

    significantPartOfDayNodesByMomentNode = self->_significantPartOfDayNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](significantPartOfDayNodesByMomentNode, "targetsForSources:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v14, "partsOfDay", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    v19 = 1;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v19 |= objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "unsignedIntegerValue");
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }
  else
  {
    v19 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v19;
}

- (id)mobilityNodesForMomentNodes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  MABinaryAdjacency *mobilityNodesByMomentNode;
  void *v7;
  PGGraphMomentNodeCollection *momentNodes;
  void *v9;
  MABinaryAdjacency *v10;
  MABinaryAdjacency *v11;
  void *v12;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mobilityNodesByMomentNode = self->_mobilityNodesByMomentNode;
  if (!mobilityNodesByMomentNode)
  {
    v7 = (void *)MEMORY[0x1E0D429D8];
    momentNodes = self->_momentNodes;
    +[PGGraphMomentNode mobilityOfMoment](PGGraphMomentNode, "mobilityOfMoment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjacencyWithSources:relation:targetsClass:", momentNodes, v9, objc_opt_class());
    v10 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v11 = self->_mobilityNodesByMomentNode;
    self->_mobilityNodesByMomentNode = v10;

    mobilityNodesByMomentNode = self->_mobilityNodesByMomentNode;
  }
  -[MABinaryAdjacency targetsForSources:](mobilityNodesByMomentNode, "targetsForSources:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_mobilityNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_significantPartOfDayNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_partOfDayNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_publicEventCategoryNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_socialGroupNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_personNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_dateNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_preciseAddressNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_addressNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_roiNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_poiNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_reliableSceneNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_sceneNodesByMomentNode, 0);
}

@end
