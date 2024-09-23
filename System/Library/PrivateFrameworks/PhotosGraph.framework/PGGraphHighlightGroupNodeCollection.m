@implementation PGGraphHighlightGroupNodeCollection

- (PGGraphHighlightNodeCollection)highlightNodes
{
  void *v3;
  void *v4;

  +[PGGraphHighlightGroupNode highlightOfHighlightGroup](PGGraphHighlightGroupNode, "highlightOfHighlightGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightNodeCollection *)v4;
}

- (id)momentNodes
{
  void *v2;
  void *v3;

  -[PGGraphHighlightGroupNodeCollection highlightNodes](self, "highlightNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PGGraphHighlightTypeNodeCollection)typeNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphHasTypeEdge filter](PGGraphHasTypeEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightTypeNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightTypeNodeCollection *)v5;
}

- (PGGraphFeatureNodeCollection)tripFeatureNodes
{
  void *v3;
  void *v4;

  +[PGGraphHighlightGroupNodeCollection featureOfHighlightGroup](PGGraphHighlightGroupNodeCollection, "featureOfHighlightGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphFeatureNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featuredLocationOrAreaNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PGGraphHighlightGroupNodeCollection locationFeatureOfHighlightGroup](PGGraphHighlightGroupNodeCollection, "locationFeatureOfHighlightGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphHighlightGroupNodeCollection areaFeatureOfHighlightGroup](PGGraphHighlightGroupNodeCollection, "areaFeatureOfHighlightGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "collectionByFormingUnionWith:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphFeatureNodeCollection *)v7;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)highlightGroupNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphHighlightGroupNode filterWithUUIDs:](PGGraphHighlightGroupNode, "filterWithUUIDs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (MARelation)featureOfHighlightGroup
{
  void *v2;
  void *v3;

  +[PGGraphTripFeatureEdge filter](PGGraphTripFeatureEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)locationFeatureOfHighlightGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphTripFeatureEdge filter](PGGraphTripFeatureEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphNamedLocationNode filter](PGGraphNamedLocationNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)areaFeatureOfHighlightGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphTripFeatureEdge filter](PGGraphTripFeatureEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  +[PGGraphAreaNode filter](PGGraphAreaNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v8;
}

+ (MARelation)momentsOfHighlightGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphHighlightGroupNode highlightOfHighlightGroup](PGGraphHighlightGroupNode, "highlightOfHighlightGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  +[PGGraphHighlightNode momentInDayHighlight](PGGraphHighlightNode, "momentInDayHighlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v6;
}

@end
