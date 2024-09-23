@implementation PGGraphPerformerEdge

- (id)initFromPublicEventNode:(id)a3 toPerformerNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPerformerEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPerformerEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPerformerEdge *)-[PGGraphPerformerEdge initFromPublicEventNode:toPerformerNode:](self, "initFromPublicEventNode:toPerformerNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PERFORMER");
  return CFSTR("PERFORMER");
}

- (unsigned)domain
{
  return 900;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PERFORMER"), 900);
}

@end
