@implementation PGGraphPublicEventEdge

- (id)initFromMomentNode:(id)a3 toPublicEventNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPublicEventEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPublicEventEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPublicEventEdge *)-[PGGraphPublicEventEdge initFromMomentNode:toPublicEventNode:](self, "initFromMomentNode:toPublicEventNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PUBLIC_EVENT");
  return CFSTR("PUBLIC_EVENT");
}

- (unsigned)domain
{
  return 900;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PUBLIC_EVENT"), 900);
}

@end
