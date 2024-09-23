@implementation PGGraphPersonActivityMeaningEdge

- (id)initFromMomentNode:(id)a3 toPersonActivityMeaningNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPersonActivityMeaningEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPersonActivityMeaningEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPersonActivityMeaningEdge *)-[PGGraphPersonActivityMeaningEdge initFromMomentNode:toPersonActivityMeaningNode:](self, "initFromMomentNode:toPersonActivityMeaningNode:", a4, a5);
}

- (unsigned)domain
{
  return 701;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PERSON_ACTIVITY_MEANING");
  return CFSTR("PERSON_ACTIVITY_MEANING");
}

- (id)edgeDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PGGraphPersonActivityMeaningEdge;
  -[PGGraphOptimizedEdge edgeDescription](&v8, sel_edgeDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonActivityMeaningEdge meaningLabel](self, "meaningLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)meaningLabel
{
  void *v2;
  void *v3;

  -[MAEdge targetNode](self, "targetNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PERSON_ACTIVITY_MEANING"), 701);
}

@end
