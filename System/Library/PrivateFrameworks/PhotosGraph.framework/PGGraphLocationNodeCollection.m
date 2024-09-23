@implementation PGGraphLocationNodeCollection

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationNode addressOfLocation](PGGraphLocationNode, "addressOfLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (id)nearestDeepNeighborWithLabel:(id)a3 usingOutEdges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  PGGraphLocationNodeCollection *v13;
  void *v14;
  void *v15;
  PGGraphLocationNodeCollection *v16;

  v4 = a4;
  v6 = a3;
  if (v4)
    v7 = 2;
  else
    v7 = 1;
  +[PGGraphLocationEdge filter](PGGraphLocationEdge, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relationWithType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D42A50]);
  v11 = (void *)objc_msgSend(v10, "initWithLabel:domain:", v6, (unsigned __int16)*MEMORY[0x1E0D42A88]);
  objc_msgSend(v11, "relation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self;
  v14 = 0;
  do
  {
    v15 = v14;
    v16 = v13;
    +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", v13, v9);
    v13 = (PGGraphLocationNodeCollection *)objc_claimAutoreleasedReturnValue();

    +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while (!objc_msgSend(v14, "count") && -[MAElementCollection count](v13, "count"));

  return v14;
}

- (id)childLocationNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationNode childLocationOfLocation](PGGraphLocationNode, "childLocationOfLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deepChildLocationNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphLocationNode childLocationOfLocation](PGGraphLocationNode, "childLocationOfLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitiveClosure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deepChildLocationNodesWithLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphLocationNode childLocationOfLocation](PGGraphLocationNode, "childLocationOfLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitiveClosure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0D42A68];
    v15[0] = v6;
    v8 = objc_alloc(MEMORY[0x1E0D42A50]);
    v9 = (void *)objc_msgSend(v8, "initWithLabel:domain:", v4, (unsigned __int16)*MEMORY[0x1E0D42A88]);
    objc_msgSend(v9, "relation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chain:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", self, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)nearestDeepChildLocationNodesWithLabel:(id)a3
{
  return -[PGGraphLocationNodeCollection nearestDeepNeighborWithLabel:usingOutEdges:](self, "nearestDeepNeighborWithLabel:usingOutEdges:", a3, 0);
}

- (id)parentLocationNodes
{
  void *v3;
  void *v4;

  +[PGGraphLocationNode parentLocationOfLocation](PGGraphLocationNode, "parentLocationOfLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)deepParentLocationNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphLocationNode parentLocationOfLocation](PGGraphLocationNode, "parentLocationOfLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitiveClosure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deepParentLocationNodesWithLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphLocationNode parentLocationOfLocation](PGGraphLocationNode, "parentLocationOfLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitiveClosure");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0D42A68];
    v15[0] = v6;
    v8 = objc_alloc(MEMORY[0x1E0D42A50]);
    v9 = (void *)objc_msgSend(v8, "initWithLabel:domain:", v4, (unsigned __int16)*MEMORY[0x1E0D42A88]);
    objc_msgSend(v9, "relation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chain:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationNodeCollection, "nodesRelatedToNodes:withRelation:", self, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)nearestDeepParentLocationNodesWithLabel:(id)a3
{
  return -[PGGraphLocationNodeCollection nearestDeepNeighborWithLabel:usingOutEdges:](self, "nearestDeepNeighborWithLabel:usingOutEdges:", a3, 1);
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
