@implementation PGGraphRelationshipTagEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

- (PGGraphPersonNodeCollection)personNodes
{
  return (PGGraphPersonNodeCollection *)+[MANodeCollection sourceNodesOfEdges:](PGGraphPersonNodeCollection, "sourceNodesOfEdges:", self);
}

- (PGGraphPersonRelationshipTagNodeCollection)tagNodes
{
  return (PGGraphPersonRelationshipTagNodeCollection *)+[MANodeCollection targetNodesOfEdges:](PGGraphPersonRelationshipTagNodeCollection, "targetNodesOfEdges:", self);
}

@end
