@implementation PGGraphPracticesActivityEdge

- (id)initFromPersonNode:(id)a3 toActivityNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPracticesActivityEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPracticesActivityEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPracticesActivityEdge *)-[PGGraphPracticesActivityEdge initFromPersonNode:toActivityNode:](self, "initFromPersonNode:toActivityNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PRACTICES_ACTIVITY");
  return CFSTR("PRACTICES_ACTIVITY");
}

- (unsigned)domain
{
  return 701;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PRACTICES_ACTIVITY"), 701);
}

@end
