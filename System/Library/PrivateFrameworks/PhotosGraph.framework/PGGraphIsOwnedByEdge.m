@implementation PGGraphIsOwnedByEdge

- (id)initFromHomeWorkNode:(id)a3 toPersonNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphIsOwnedByEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphIsOwnedByEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphIsOwnedByEdge *)-[PGGraphIsOwnedByEdge initFromHomeWorkNode:toPersonNode:](self, "initFromHomeWorkNode:toPersonNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("IS_OWNED_BY");
  return CFSTR("IS_OWNED_BY");
}

- (unsigned)domain
{
  return 202;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("IS_OWNED_BY"), 202);
}

@end
