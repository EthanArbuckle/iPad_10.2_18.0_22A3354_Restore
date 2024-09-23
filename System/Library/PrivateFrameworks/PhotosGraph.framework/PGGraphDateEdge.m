@implementation PGGraphDateEdge

- (id)initFromMomentNode:(id)a3 toDateNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphDateEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphDateEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphDateEdge *)-[PGGraphDateEdge initFromMomentNode:toDateNode:](self, "initFromMomentNode:toDateNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("DATE");
  return CFSTR("DATE");
}

- (unsigned)domain
{
  return 400;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("DATE"), 400);
}

@end
