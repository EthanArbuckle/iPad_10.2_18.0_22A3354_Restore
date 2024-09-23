@implementation PGGraphMomentNextEdge

- (id)initFromMomentNode:(id)a3 toMomentNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphMomentNextEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphMomentNextEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphMomentNextEdge *)-[PGGraphMomentNextEdge initFromMomentNode:toMomentNode:](self, "initFromMomentNode:toMomentNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("NEXT");
  return CFSTR("NEXT");
}

- (unsigned)domain
{
  return 101;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("NEXT"), 101);
}

@end
