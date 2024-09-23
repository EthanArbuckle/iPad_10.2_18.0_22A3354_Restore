@implementation PGGraphBusinessCategoryNodeCollection

- (PGGraphBusinessNodeCollection)businessNodes
{
  void *v3;
  void *v4;

  +[PGGraphBusinessCategoryNode businessOfCategory](PGGraphBusinessCategoryNode, "businessOfCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphBusinessNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphBusinessNodeCollection *)v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)businessCategoryNodesForCategories:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphBusinessCategoryNode filterWithCategories:](PGGraphBusinessCategoryNode, "filterWithCategories:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)businessCategoryNodesForCategory:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphBusinessCategoryNode filterWithCategory:](PGGraphBusinessCategoryNode, "filterWithCategory:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphBusinessCategoryNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
