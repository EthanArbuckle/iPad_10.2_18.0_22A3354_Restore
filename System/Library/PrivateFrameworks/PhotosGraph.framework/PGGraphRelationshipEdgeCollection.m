@implementation PGGraphRelationshipEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)inferredRelationshipEdgesInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PGGraphRelationshipEdge inferredRelationshipFilter](PGGraphRelationshipEdge, "inferredRelationshipFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesMatchingFilter:inGraph:](PGGraphRelationshipEdgeCollection, "edgesMatchingFilter:inGraph:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)confirmedRelationshipEdgesInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PGGraphRelationshipEdge confirmedRelationshipFilter](PGGraphRelationshipEdge, "confirmedRelationshipFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesMatchingFilter:inGraph:](PGGraphRelationshipEdgeCollection, "edgesMatchingFilter:inGraph:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)relationshipEdgesWithInferenceSource:(id)a3 source:(unsigned __int8)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  +[PGGraphRelationshipEdge filterWithSource:](PGGraphRelationshipEdge, "filterWithSource:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAEdgeCollection edgesMatchingFilter:inGraph:](PGGraphRelationshipEdgeCollection, "edgesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
