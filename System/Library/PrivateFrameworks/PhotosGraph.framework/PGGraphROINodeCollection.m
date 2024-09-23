@implementation PGGraphROINodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphROINode momentOfROI](PGGraphROINode, "momentOfROI");
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

+ (id)roiNodesOfType:(unint64_t)a3 inGraph:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB36B8];
  v7 = a4;
  objc_msgSend(v6, "indexSetWithIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "roiNodesOfTypes:inGraph:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)roiNodesOfTypes:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphROINode filterForTypes:](PGGraphROINode, "filterForTypes:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphROINodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)roiNodesForLabels:(id)a3 inGraph:(id)a4
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
  +[PGGraphROINode filterWithLabels:](PGGraphROINode, "filterWithLabels:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
