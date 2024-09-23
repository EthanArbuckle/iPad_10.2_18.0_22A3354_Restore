@implementation PGGraphMusicSessionNodeCollection

+ (id)filter
{
  return +[PGGraphNode filter](PGGraphMusicSessionNode, "filter");
}

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphMusicSessionNode momentOfMusicSession](PGGraphMusicSessionNode, "momentOfMusicSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

@end
