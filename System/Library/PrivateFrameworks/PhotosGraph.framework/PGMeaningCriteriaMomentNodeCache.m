@implementation PGMeaningCriteriaMomentNodeCache

- (PGMeaningCriteriaMomentNodeCache)initWithMomentNode:(id)a3
{
  id v5;
  PGMeaningCriteriaMomentNodeCache *v6;
  PGMeaningCriteriaMomentNodeCache *v7;
  uint64_t v8;
  PGGraphMomentNodeCollection *momentNodeAsCollection;
  void *v10;
  uint64_t v11;
  PGGraphMeNodeCollection *meNodeAsCollection;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGMeaningCriteriaMomentNodeCache;
  v6 = -[PGMeaningCriteriaMomentNodeCache init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_momentNode, a3);
    -[PGGraphMomentNode collection](v7->_momentNode, "collection");
    v8 = objc_claimAutoreleasedReturnValue();
    momentNodeAsCollection = v7->_momentNodeAsCollection;
    v7->_momentNodeAsCollection = (PGGraphMomentNodeCollection *)v8;

    -[MANode graph](v7->_momentNode, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    meNodeAsCollection = v7->_meNodeAsCollection;
    v7->_meNodeAsCollection = (PGGraphMeNodeCollection *)v11;

  }
  return v7;
}

- (id)preciseAddressNodeCollection
{
  PGGraphAddressNodeCollection *preciseAddressNodeCollection;
  PGGraphAddressNodeCollection *v4;
  PGGraphAddressNodeCollection *v5;

  preciseAddressNodeCollection = self->_preciseAddressNodeCollection;
  if (!preciseAddressNodeCollection)
  {
    -[PGGraphMomentNodeCollection preciseAddressNodes](self->_momentNodeAsCollection, "preciseAddressNodes");
    v4 = (PGGraphAddressNodeCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_preciseAddressNodeCollection;
    self->_preciseAddressNodeCollection = v4;

    preciseAddressNodeCollection = self->_preciseAddressNodeCollection;
  }
  return preciseAddressNodeCollection;
}

- (BOOL)hasAddressNodes
{
  char hasAddressNodes;
  void *v4;
  uint64_t v5;

  hasAddressNodes = self->_hasAddressNodes;
  if (!hasAddressNodes)
  {
    -[PGGraphMomentNodeCollection addressNodes](self->_momentNodeAsCollection, "addressNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
      hasAddressNodes = 2;
    else
      hasAddressNodes = 1;
    self->_hasAddressNodes = hasAddressNodes;
  }
  return hasAddressNodes == 2;
}

- (void)_computeHomeWork
{
  void *v3;
  void *v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  id v11;

  -[PGMeaningCriteriaMomentNodeCache preciseAddressNodeCollection](self, "preciseAddressNodeCollection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonNodeCollection homeNodes](self->_meNodeAsCollection, "homeNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addressNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "intersectsCollection:", v4);

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  self->_happensPartiallyAtMyHome = v6;
  -[PGGraphPersonNodeCollection workNodes](self->_meNodeAsCollection, "workNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addressNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v11, "intersectsCollection:", v8);

  if (v9)
    v10 = 2;
  else
    v10 = 1;
  self->_happensPartiallyAtMyWork = v10;

}

- (BOOL)happensPartiallyAtMyHome
{
  int happensPartiallyAtMyHome;

  happensPartiallyAtMyHome = self->_happensPartiallyAtMyHome;
  if (!self->_happensPartiallyAtMyHome)
  {
    -[PGMeaningCriteriaMomentNodeCache _computeHomeWork](self, "_computeHomeWork");
    happensPartiallyAtMyHome = self->_happensPartiallyAtMyHome;
  }
  return happensPartiallyAtMyHome == 2;
}

- (BOOL)happensPartiallyAtMyWork
{
  int happensPartiallyAtMyWork;

  happensPartiallyAtMyWork = self->_happensPartiallyAtMyWork;
  if (!self->_happensPartiallyAtMyWork)
  {
    -[PGMeaningCriteriaMomentNodeCache _computeHomeWork](self, "_computeHomeWork");
    happensPartiallyAtMyWork = self->_happensPartiallyAtMyWork;
  }
  return happensPartiallyAtMyWork == 2;
}

- (BOOL)happensAtFrequentLocation
{
  char happensAtFrequentLocation;
  void *v4;
  uint64_t v5;

  happensAtFrequentLocation = self->_happensAtFrequentLocation;
  if (!happensAtFrequentLocation)
  {
    -[PGGraphMomentNodeCollection frequentLocationNodes](self->_momentNodeAsCollection, "frequentLocationNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
      happensAtFrequentLocation = 2;
    else
      happensAtFrequentLocation = 1;
    self->_happensAtFrequentLocation = happensAtFrequentLocation;
  }
  return happensAtFrequentLocation == 2;
}

- (BOOL)happensPartiallyAtMyHomeOrWork
{
  return -[PGMeaningCriteriaMomentNodeCache happensPartiallyAtMyHome](self, "happensPartiallyAtMyHome")
      || -[PGMeaningCriteriaMomentNodeCache happensPartiallyAtMyWork](self, "happensPartiallyAtMyWork");
}

- (unint64_t)partsOfDay
{
  unint64_t result;

  result = self->_partsOfDay;
  if (!result)
  {
    result = -[PGGraphMomentNode partsOfDay](self->_momentNode, "partsOfDay");
    self->_partsOfDay = result;
  }
  return result;
}

- (unint64_t)significantPartsOfDay
{
  unint64_t result;

  result = self->_significantPartsOfDay;
  if (!result)
  {
    result = -[PGGraphMomentNode significantPartsOfDay](self->_momentNode, "significantPartsOfDay");
    self->_significantPartsOfDay = result;
  }
  return result;
}

- (NSSet)personNodes
{
  NSSet *personNodes;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  personNodes = self->_personNodes;
  if (!personNodes)
  {
    -[PGGraphMomentNodeCollection personNodes](self->_momentNodeAsCollection, "personNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_personNodes;
    self->_personNodes = v5;

    personNodes = self->_personNodes;
  }
  return personNodes;
}

- (NSSet)preciseAddressNodes
{
  NSSet *preciseAddressNodes;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  preciseAddressNodes = self->_preciseAddressNodes;
  if (!preciseAddressNodes)
  {
    -[PGMeaningCriteriaMomentNodeCache preciseAddressNodeCollection](self, "preciseAddressNodeCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_preciseAddressNodes;
    self->_preciseAddressNodes = v5;

    preciseAddressNodes = self->_preciseAddressNodes;
  }
  return preciseAddressNodes;
}

- (NSSet)preciseAreaNodes
{
  NSSet *preciseAreaNodes;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  preciseAreaNodes = self->_preciseAreaNodes;
  if (!preciseAreaNodes)
  {
    -[PGMeaningCriteriaMomentNodeCache preciseAddressNodeCollection](self, "preciseAddressNodeCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "areaNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set");
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_preciseAreaNodes;
    self->_preciseAreaNodes = v6;

    preciseAreaNodes = self->_preciseAreaNodes;
  }
  return preciseAreaNodes;
}

- (NSSet)poiNodes
{
  NSSet *poiNodes;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  poiNodes = self->_poiNodes;
  if (!poiNodes)
  {
    -[PGGraphMomentNodeCollection poiNodes](self->_momentNodeAsCollection, "poiNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_poiNodes;
    self->_poiNodes = v5;

    poiNodes = self->_poiNodes;
  }
  return poiNodes;
}

- (NSSet)specialPOINodes
{
  NSSet *specialPOINodes;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  specialPOINodes = self->_specialPOINodes;
  if (!specialPOINodes)
  {
    -[PGGraphMomentNodeCollection specialPOINodes](self->_momentNodeAsCollection, "specialPOINodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_specialPOINodes;
    self->_specialPOINodes = v5;

    specialPOINodes = self->_specialPOINodes;
  }
  return specialPOINodes;
}

- (NSSet)roiNodes
{
  NSSet *roiNodes;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  roiNodes = self->_roiNodes;
  if (!roiNodes)
  {
    -[PGGraphMomentNodeCollection roiNodes](self->_momentNodeAsCollection, "roiNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_roiNodes;
    self->_roiNodes = v5;

    roiNodes = self->_roiNodes;
  }
  return roiNodes;
}

- (PGGraphPublicEventCategoryNodeCollection)publicEventCategoryNodes
{
  PGGraphPublicEventCategoryNodeCollection *publicEventCategoryNodes;
  void *v4;
  PGGraphPublicEventCategoryNodeCollection *v5;
  PGGraphPublicEventCategoryNodeCollection *v6;

  publicEventCategoryNodes = self->_publicEventCategoryNodes;
  if (!publicEventCategoryNodes)
  {
    -[PGGraphMomentNodeCollection publicEventNodes](self->_momentNodeAsCollection, "publicEventNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "categoryNodes");
    v5 = (PGGraphPublicEventCategoryNodeCollection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_publicEventCategoryNodes;
    self->_publicEventCategoryNodes = v5;

    publicEventCategoryNodes = self->_publicEventCategoryNodes;
  }
  return publicEventCategoryNodes;
}

- (void)enumerateSceneEdgesAndNodesUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *, _BYTE *);
  NSArray *sceneEdges;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, void *, _BYTE *))a3;
  sceneEdges = self->_sceneEdges;
  if (!sceneEdges)
  {
    +[PGGraphEdgeCollection edgesFromNodes:](PGGraphSceneEdgeCollection, "edgesFromNodes:", self->_momentNodeAsCollection);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "array");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sceneEdges;
    self->_sceneEdges = v7;

    sceneEdges = self->_sceneEdges;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = sceneEdges;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
      objc_msgSend(v14, "oppositeNode:", self->_momentNode);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v4[2](v4, v14, v15, &v16);
      LODWORD(v14) = v16;

      if ((_DWORD)v14)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          goto LABEL_5;
        break;
      }
    }
  }

}

- (NSArray)sceneEdges
{
  return self->_sceneEdges;
}

- (void)setSceneEdges:(id)a3
{
  objc_storeStrong((id *)&self->_sceneEdges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventCategoryNodes, 0);
  objc_storeStrong((id *)&self->_roiNodes, 0);
  objc_storeStrong((id *)&self->_specialPOINodes, 0);
  objc_storeStrong((id *)&self->_poiNodes, 0);
  objc_storeStrong((id *)&self->_preciseAreaNodes, 0);
  objc_storeStrong((id *)&self->_preciseAddressNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_preciseAddressNodeCollection, 0);
  objc_storeStrong((id *)&self->_meNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_momentNodeAsCollection, 0);
  objc_storeStrong((id *)&self->_sceneEdges, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
}

@end
