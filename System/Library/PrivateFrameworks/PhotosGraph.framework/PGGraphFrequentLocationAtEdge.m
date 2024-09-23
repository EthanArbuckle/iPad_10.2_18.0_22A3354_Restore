@implementation PGGraphFrequentLocationAtEdge

- (id)initFromFrequentLocationNode:(id)a3 toAddressNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphFrequentLocationAtEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphFrequentLocationAtEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphFrequentLocationAtEdge *)-[PGGraphFrequentLocationAtEdge initFromFrequentLocationNode:toAddressNode:](self, "initFromFrequentLocationNode:toAddressNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("AT");
  return CFSTR("AT");
}

- (unsigned)domain
{
  return 204;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("AT"), 204);
}

@end
