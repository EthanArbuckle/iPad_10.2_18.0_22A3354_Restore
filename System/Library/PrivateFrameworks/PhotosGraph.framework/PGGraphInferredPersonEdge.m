@implementation PGGraphInferredPersonEdge

- (id)initFromPersonNode:(id)a3 toInferredPersonNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphInferredPersonEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphInferredPersonEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphInferredPersonEdge *)-[PGGraphInferredPersonEdge initFromPersonNode:toInferredPersonNode:](self, "initFromPersonNode:toInferredPersonNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("INFERRED_TO");
  return CFSTR("INFERRED_TO");
}

- (unsigned)domain
{
  return 300;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("INFERRED_TO"), 300);
}

@end
