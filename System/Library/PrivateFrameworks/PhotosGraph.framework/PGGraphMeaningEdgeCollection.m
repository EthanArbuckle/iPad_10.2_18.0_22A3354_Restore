@implementation PGGraphMeaningEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (id)meaningEdgesWithConfidenceThreshold:(double)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[PGGraphMeaningEdge filter](PGGraphMeaningEdge, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("confidence");
  v8 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithComparator:value:", 6, v9);
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterBySettingProperties:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "edgesMatchingFilter:inGraph:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return (PGGraphMomentNodeCollection *)+[MANodeCollection sourceNodesOfEdges:](PGGraphMomentNodeCollection, "sourceNodesOfEdges:", self);
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  return (PGGraphMeaningNodeCollection *)+[MANodeCollection targetNodesOfEdges:](PGGraphMeaningNodeCollection, "targetNodesOfEdges:", self);
}

@end
