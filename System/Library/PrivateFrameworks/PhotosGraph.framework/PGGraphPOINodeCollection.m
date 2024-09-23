@implementation PGGraphPOINodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphPOINode momentOfPOI](PGGraphPOINode, "momentOfPOI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)poiNodesForLabel:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphPOINode filterWithLabel:](PGGraphPOINode, "filterWithLabel:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)poiNodesForLabels:(id)a3 inGraph:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  objc_msgSend(v6, "setWithArray:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPOINode filterWithLabels:](PGGraphPOINode, "filterWithLabels:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
