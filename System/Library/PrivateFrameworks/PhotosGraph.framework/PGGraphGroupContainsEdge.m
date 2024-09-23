@implementation PGGraphGroupContainsEdge

- (id)initFromHighlightGroupNode:(id)a3 toHighlightNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphGroupContainsEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphGroupContainsEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphGroupContainsEdge *)-[PGGraphGroupContainsEdge initFromHighlightGroupNode:toHighlightNode:](self, "initFromHighlightGroupNode:toHighlightNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("GROUP_CONTAINS");
  return CFSTR("GROUP_CONTAINS");
}

- (unsigned)domain
{
  return 102;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("GROUP_CONTAINS"), 102);
}

@end
