@implementation PGGraphHighlightTypeNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)tripTypeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightTypeNode tripTypeNodeFilter](PGGraphHighlightTypeNode, "tripTypeNodeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)concludedTripTypeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightTypeNode concludedTripTypeNodeFilter](PGGraphHighlightTypeNode, "concludedTripTypeNodeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)longTripTypeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightTypeNode longTripTypeNodeFilter](PGGraphHighlightTypeNode, "longTripTypeNodeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)shortTripTypeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightTypeNode shortTripTypeNodeFilter](PGGraphHighlightTypeNode, "shortTripTypeNodeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)aggregationTypeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightTypeNode aggregationTypeNodeFilter](PGGraphHighlightTypeNode, "aggregationTypeNodeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)onGoingTripTypeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightTypeNode onGoingTripTypeNodeFilter](PGGraphHighlightTypeNode, "onGoingTripTypeNodeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultTypeNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphHighlightTypeNode defaultTypeNodeFilter](PGGraphHighlightTypeNode, "defaultTypeNodeFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)typeNodesWithLabel:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphHighlightTypeNode typeNodeFilterForLabel:](PGGraphHighlightTypeNode, "typeNodeFilterForLabel:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PGGraphHighlightNodeCollection)highlightNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphHasTypeEdge filter](PGGraphHasTypeEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightNodeCollection *)v5;
}

- (PGGraphHighlightGroupNodeCollection)highlightGroupNodes
{
  void *v2;
  void *v3;

  -[PGGraphHighlightTypeNodeCollection highlightNodes](self, "highlightNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphHighlightGroupNodeCollection, "subsetInCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightGroupNodeCollection *)v3;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

@end
