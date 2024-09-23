@implementation PGGraphMeNodeCollection

- (id)inferredPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphMeNode inferredPersonOfMe](PGGraphMeNode, "inferredPersonOfMe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end
