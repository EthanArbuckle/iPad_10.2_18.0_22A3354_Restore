@implementation PGGraphPublicEventNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphPublicEventNode momentOfPublicEvent](PGGraphPublicEventNode, "momentOfPublicEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphPublicEventCategoryNodeCollection)categoryNodes
{
  void *v3;
  void *v4;

  +[PGGraphPublicEventNode categoryOfPublicEvent](PGGraphPublicEventNode, "categoryOfPublicEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPublicEventCategoryNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPublicEventCategoryNodeCollection *)v4;
}

- (PGGraphPerformerNodeCollection)performerNodes
{
  void *v3;
  void *v4;

  +[PGGraphPublicEventNode performerOfPublicEvent](PGGraphPublicEventNode, "performerOfPublicEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPerformerNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPerformerNodeCollection *)v4;
}

- (PGGraphBusinessNodeCollection)businessNodes
{
  void *v3;
  void *v4;

  +[PGGraphPublicEventNode businessOfPublicEvent](PGGraphPublicEventNode, "businessOfPublicEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphBusinessNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphBusinessNodeCollection *)v4;
}

- (NSSet)eventNames
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphPublicEventNodeCollection_eventNames__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSSet *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

void __46__PGGraphPublicEventNodeCollection_eventNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)publicEventNodesWithCategories:(id)a3 inGraph:(id)a4
{
  void *v4;
  void *v5;

  +[PGGraphPublicEventCategoryNodeCollection publicEventCategoryNodesForCategories:inGraph:](PGGraphPublicEventCategoryNodeCollection, "publicEventCategoryNodesForCategories:inGraph:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicEventNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
