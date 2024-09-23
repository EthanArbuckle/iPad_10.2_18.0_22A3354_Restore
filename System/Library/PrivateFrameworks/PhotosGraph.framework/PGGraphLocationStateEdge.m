@implementation PGGraphLocationStateEdge

- (id)initFromLocationNode:(id)a3 toStateNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphLocationStateEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphLocationStateEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLocationStateEdge *)-[PGGraphLocationStateEdge initFromLocationNode:toStateNode:](self, "initFromLocationNode:toStateNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("STATE");
  return CFSTR("STATE");
}

- (unsigned)domain
{
  return 200;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("STATE"), 200);
}

@end
