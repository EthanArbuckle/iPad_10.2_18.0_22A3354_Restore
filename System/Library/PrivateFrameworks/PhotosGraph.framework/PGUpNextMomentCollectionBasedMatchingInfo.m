@implementation PGUpNextMomentCollectionBasedMatchingInfo

- (PGUpNextMomentCollectionBasedMatchingInfo)initWithMomentNodes:(id)a3
{
  id v5;
  PGUpNextMomentCollectionBasedMatchingInfo *v6;
  PGUpNextMomentCollectionBasedMatchingInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGUpNextMomentCollectionBasedMatchingInfo;
  v6 = -[PGUpNextMomentCollectionBasedMatchingInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_momentNodes, a3);

  return v7;
}

- (PGUpNextMomentCollectionBasedMatchingInfo)initWithMomentNodes:(id)a3 personNodes:(id)a4 sceneNodes:(id)a5 meaningNodes:(id)a6 isTripMemory:(BOOL)a7 representativeLocation:(id)a8 representativeDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  PGUpNextMomentCollectionBasedMatchingInfo *v18;
  PGUpNextMomentCollectionBasedMatchingInfo *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)PGUpNextMomentCollectionBasedMatchingInfo;
  v18 = -[PGUpNextMomentCollectionBasedMatchingInfo init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_momentNodes, a3);
    objc_storeStrong((id *)&v19->_personNodes, a4);
    objc_storeStrong((id *)&v19->_sceneNodes, a5);
    objc_storeStrong((id *)&v19->_meaningNodes, a6);
    v19->_isTripMemory = a7;
    objc_storeStrong((id *)&v19->_representativeLocation, a8);
    objc_storeStrong((id *)&v19->_representativeDate, a9);
    *(_WORD *)&v19->_isTripMemoryIsResolved = 257;
    v19->_representativeDateIsResolved = 1;
  }

  return v19;
}

- (PGGraphPersonNodeCollection)personNodes
{
  PGGraphPersonNodeCollection *personNodes;
  PGGraphPersonNodeCollection *v4;
  PGGraphPersonNodeCollection *v5;

  personNodes = self->_personNodes;
  if (!personNodes)
  {
    objc_msgSend((id)objc_opt_class(), "representativePersonNodesForMomentNodes:", self->_momentNodes);
    v4 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_personNodes;
    self->_personNodes = v4;

    personNodes = self->_personNodes;
  }
  return personNodes;
}

- (PGGraphSceneNodeCollection)sceneNodes
{
  PGGraphSceneNodeCollection *sceneNodes;
  PGGraphSceneNodeCollection *v4;
  PGGraphSceneNodeCollection *v5;

  sceneNodes = self->_sceneNodes;
  if (!sceneNodes)
  {
    objc_msgSend((id)objc_opt_class(), "representativeSceneNodesForMomentNodes:", self->_momentNodes);
    v4 = (PGGraphSceneNodeCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_sceneNodes;
    self->_sceneNodes = v4;

    sceneNodes = self->_sceneNodes;
  }
  return sceneNodes;
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  PGGraphMeaningNodeCollection *meaningNodes;
  PGGraphMeaningNodeCollection *v4;
  PGGraphMeaningNodeCollection *v5;

  meaningNodes = self->_meaningNodes;
  if (!meaningNodes)
  {
    objc_msgSend((id)objc_opt_class(), "representativeMeaningNodesForMomentNodes:", self->_momentNodes);
    v4 = (PGGraphMeaningNodeCollection *)objc_claimAutoreleasedReturnValue();
    v5 = self->_meaningNodes;
    self->_meaningNodes = v4;

    meaningNodes = self->_meaningNodes;
  }
  return meaningNodes;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  return 0;
}

- (BOOL)isTripMemory
{
  BOOL result;

  if (self->_isTripMemoryIsResolved)
    return self->_isTripMemory;
  result = -[PGUpNextMomentCollectionBasedMatchingInfo _implIsTripMemory](self, "_implIsTripMemory");
  self->_isTripMemory = result;
  self->_isTripMemoryIsResolved = 1;
  return result;
}

- (BOOL)_implIsTripMemory
{
  return 0;
}

- (CLLocation)representativeLocation
{
  CLLocation *v3;
  CLLocation *representativeLocation;

  if (!self->_representativeLocationIsResolved)
  {
    objc_msgSend((id)objc_opt_class(), "representativeLocationForMomentNodes:", self->_momentNodes);
    v3 = (CLLocation *)objc_claimAutoreleasedReturnValue();
    representativeLocation = self->_representativeLocation;
    self->_representativeLocation = v3;

    self->_representativeLocationIsResolved = 1;
  }
  return self->_representativeLocation;
}

- (NSDate)representativeDate
{
  NSDate *v3;
  NSDate *representativeDate;

  if (!self->_representativeDateIsResolved)
  {
    objc_msgSend((id)objc_opt_class(), "representativeDateForMomentNodes:", self->_momentNodes);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    representativeDate = self->_representativeDate;
    self->_representativeDate = v3;

    self->_representativeDateIsResolved = 1;
  }
  return self->_representativeDate;
}

- (NSString)debugInfo
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PGGraphMomentNodeCollection uuids](self->_momentNodes, "uuids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Moment uuids %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_representativeDate, 0);
  objc_storeStrong((id *)&self->_representativeLocation, 0);
  objc_storeStrong((id *)&self->_meaningNodes, 0);
  objc_storeStrong((id *)&self->_sceneNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
}

+ (id)representativePersonNodesForMomentNodes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0D429D8];
  v5 = a3;
  +[PGGraphMomentNode personExcludingMeInMoment](PGGraphMomentNode, "personExcludingMeInMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjacencyWithSources:relation:targetsClass:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "representativePersonNodesForPersonNodesByMomentNode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)representativePersonNodesForPersonNodesByMomentNode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "targetsWithMinimumCount:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v3, "sourcesCount") * 0.25));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)representativeSceneNodesForMomentNodes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0D429D8];
  v5 = a3;
  +[PGGraphMomentNode sceneOfMoment](PGGraphMomentNode, "sceneOfMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjacencyWithSources:relation:targetsClass:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "representativeSceneNodesForSceneNodesByMomentNode:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)representativeSceneNodesForSceneNodesByMomentNode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "targetsWithMinimumCount:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v3, "sourcesCount") * 0.25));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)representativeMeaningNodesForMomentNodes:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0D429D8];
  v5 = a3;
  +[PGGraphMomentNode meaningOfMoment](PGGraphMomentNode, "meaningOfMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjacencyWithSources:relation:targetsClass:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMeaningNodeCollection meaningNodesWithMeaning:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaning:inGraph:", 16, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "subtractingTargetsWith:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "representativeMeaningNodesForEligibleMeaningNodesByMomentNode:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)representativeMeaningNodesForEligibleMeaningNodesByMomentNode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "targetsWithMinimumCount:", vcvtps_u32_f32((float)(unint64_t)objc_msgSend(v3, "sourcesCount") * 0.25));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)representativeLocationForMomentNodes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "addressNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "representativeLocationForLocations:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)representativeLocationForLocations:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  double v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 > 1)
  {
    v6 = (double)v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      v11 = 0.0;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v14, "coordinate");
          v12 = v12 + v15;
          objc_msgSend(v14, "coordinate");
          v11 = v11 + v16;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
      v12 = 0.0;
    }

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v12 / v6, v11 / v6);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = v7;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "distanceFromLocation:", v17, (_QWORD)v25);
          if (v23 > 50000.0)
          {

            v5 = 0;
            goto LABEL_22;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v20)
          continue;
        break;
      }
    }

    v5 = v17;
LABEL_22:

  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)representativeDateForMomentNodes:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "universalDateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "representativeDateForMomentNodesUniversalDateInterval:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)representativeDateForMomentNodesUniversalDateInterval:(id)a3
{
  id v3;
  double v4;
  void *v5;
  void *v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "duration");
  if (v4 <= 2592000.0)
  {
    objc_msgSend(v3, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "duration");
    objc_msgSend(v6, "dateByAddingTimeInterval:", v7 * 0.5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
