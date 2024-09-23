@implementation PGGraphMeaningNodeCollection

- (PGGraphMeaningNodeCollection)childMeaningNodes
{
  void *v3;
  void *v4;

  +[PGGraphMeaningNode childMeaningOfMeaning](PGGraphMeaningNode, "childMeaningOfMeaning");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)parentMeaningNodes
{
  void *v3;
  void *v4;

  +[PGGraphMeaningNode parentMeaningOfMeaning](PGGraphMeaningNode, "parentMeaningOfMeaning");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphMeaningNode momentOfMeaning](PGGraphMeaningNode, "momentOfMeaning");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMeaningEdgeCollection)reliableMeaningEdges
{
  void *v3;
  void *v4;

  +[PGGraphMeaningEdge reliableFilter](PGGraphMeaningEdge, "reliableFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesToNodes:matchingFilter:](PGGraphMeaningEdgeCollection, "edgesToNodes:matchingFilter:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMeaningEdgeCollection *)v4;
}

- (id)localizedNames
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  -[MANodeCollection labels](self, "labels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PGGraphMeaningNodeCollection_localizedNames__block_invoke;
  v7[3] = &unk_1E8432160;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (id)distinctMeaningNodesSubset
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  PGGraphMeaningNodeCollection *v11;
  void *v12;
  PGGraphMeaningNodeCollection *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v18[0] = CFSTR("Performance");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Concert"), 0);
  v19[0] = v4;
  v18[1] = CFSTR("SportEvent");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Concert"), 0);
  v19[1] = v5;
  v18[2] = CFSTR("Festival");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Concert"), 0);
  v19[2] = v6;
  v18[3] = CFSTR("NightOut");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Concert"), CFSTR("Festival"), CFSTR("Theater"), CFSTR("Dance"), 0);
  v19[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__PGGraphMeaningNodeCollection_distinctMeaningNodesSubset__block_invoke;
  v15[3] = &unk_1E842C5B8;
  v15[4] = self;
  v16 = v8;
  v17 = v3;
  v9 = v3;
  v10 = v8;
  -[MAElementCollection enumerateIdentifiersAsCollectionsWithBlock:](self, "enumerateIdentifiersAsCollectionsWithBlock:", v15);
  v11 = [PGGraphMeaningNodeCollection alloc];
  -[MAElementCollection graph](self, "graph");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MAElementCollection initWithGraph:elementIdentifiers:](v11, "initWithGraph:elementIdentifiers:", v12, v9);

  return v13;
}

void __58__PGGraphMeaningNodeCollection_distinctMeaningNodesSubset__block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "childMeaningNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intersectsCollection:", a1[4]);

  if ((v7 & 1) == 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(a1[5], "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          objc_msgSend(v5, "meaningLabels");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v13);

          if (v15)
          {
            objc_msgSend(a1[5], "objectForKeyedSubscript:", v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "meaningLabels");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "intersectsSet:", v16);

            if ((v18 & 1) != 0)
            {

              goto LABEL_13;
            }
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }

    objc_msgSend(a1[6], "addIdentifier:", a2);
  }
LABEL_13:

}

void __46__PGGraphMeaningNodeCollection_localizedNames__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  +[PGGraphMeaningNode _localizedNameForLabel:](PGGraphMeaningNode, "_localizedNameForLabel:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)meaningNodesWithMeaning:(unint64_t)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  PGGraphMeaningNodeCollection *v8;
  PGGraphMeaningNodeCollection *v9;

  v6 = a4;
  +[PGGraphMeaningNode filterWithMeaning:](PGGraphMeaningNode, "filterWithMeaning:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
    v8 = (PGGraphMeaningNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[MAElementCollection initWithGraph:]([PGGraphMeaningNodeCollection alloc], "initWithGraph:", v6);
  }
  v9 = v8;

  return v9;
}

+ (id)meaningNodesWithMeaningLabels:(id)a3 inGraph:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0D42A50];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithLabels:domain:properties:", v9, 700, MEMORY[0x1E0C9AA70]);
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphMeaningNodeCollection, "nodesMatchingFilter:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
