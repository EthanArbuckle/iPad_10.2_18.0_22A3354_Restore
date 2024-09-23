@implementation PGGraphPartOfWeekNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphPartOfWeekEdge filter](PGGraphPartOfWeekEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v5;
}

@end
