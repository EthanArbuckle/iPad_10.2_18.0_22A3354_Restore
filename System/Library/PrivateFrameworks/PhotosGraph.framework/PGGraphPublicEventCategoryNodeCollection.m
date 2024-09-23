@implementation PGGraphPublicEventCategoryNodeCollection

- (PGGraphPublicEventNodeCollection)publicEventNodes
{
  void *v3;
  void *v4;

  +[PGGraphPublicEventCategoryNode publicEventOfCategory](PGGraphPublicEventCategoryNode, "publicEventOfCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPublicEventNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPublicEventNodeCollection *)v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)publicEventCategoryNodesForCategory:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphPublicEventCategoryNode filterWithCategory:](PGGraphPublicEventCategoryNode, "filterWithCategory:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPublicEventCategoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)publicEventCategoryNodesForCategories:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphPublicEventCategoryNode filterWithCategories:](PGGraphPublicEventCategoryNode, "filterWithCategories:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPublicEventCategoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
