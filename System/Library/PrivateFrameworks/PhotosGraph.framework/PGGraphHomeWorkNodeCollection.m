@implementation PGGraphHomeWorkNodeCollection

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphHomeWorkNode addressOfHomeWork](PGGraphHomeWorkNode, "addressOfHomeWork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)preciseAddressNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphHomeWorkNode addressOfHomeWork](PGGraphHomeWorkNode, "addressOfHomeWork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[PGGraphAddressNode preciseFilter](PGGraphAddressNode, "preciseFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v9;
}

- (PGGraphPersonNodeCollection)ownerNodes
{
  void *v3;
  void *v4;

  +[PGGraphHomeWorkNode ownerOfHomeWork](PGGraphHomeWorkNode, "ownerOfHomeWork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)homeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHomeWorkNode homeFilter](PGGraphHomeWorkNode, "homeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)workNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHomeWorkNode workFilter](PGGraphHomeWorkNode, "workFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
