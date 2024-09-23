@implementation PGGraphPersonRelationshipTagNodeCollection

- (PGGraphPersonNodeCollection)personNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonRelationshipTagNode personWithTag](PGGraphPersonRelationshipTagNode, "personWithTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (id)personNodesWithConfidence:(double)a3
{
  void *v4;
  void *v5;

  +[PGGraphPersonRelationshipTagNode personWithTagWithConfidence:](PGGraphPersonRelationshipTagNode, "personWithTagWithConfidence:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PGGraphRelationshipTagEdgeCollection)relationshipTagEdges
{
  return (PGGraphRelationshipTagEdgeCollection *)+[PGGraphEdgeCollection edgesOfType:onNodes:](PGGraphRelationshipTagEdgeCollection, "edgesOfType:onNodes:", 1, self);
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)nodesWithRelationshipTag:(unint64_t)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphPersonRelationshipTagNode filterWithTag:](PGGraphPersonRelationshipTagNode, "filterWithTag:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
