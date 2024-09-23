@implementation PGGraphHasTypeEdge

- (id)initFromHighlightGroupNode:(id)a3 toHighlightTypeNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphHasTypeEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphHasTypeEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphHasTypeEdge *)-[PGGraphHasTypeEdge initFromHighlightGroupNode:toHighlightTypeNode:](self, "initFromHighlightGroupNode:toHighlightTypeNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("HAS_TYPE");
  return CFSTR("HAS_TYPE");
}

- (unsigned)domain
{
  return 103;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("HAS_TYPE"), 103);
}

@end
