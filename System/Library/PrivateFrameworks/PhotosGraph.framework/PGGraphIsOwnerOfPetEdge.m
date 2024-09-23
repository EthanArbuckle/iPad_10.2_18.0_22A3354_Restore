@implementation PGGraphIsOwnerOfPetEdge

- (id)initFromPersonNode:(id)a3 toPetNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphIsOwnerOfPetEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphIsOwnerOfPetEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphIsOwnerOfPetEdge *)-[PGGraphIsOwnerOfPetEdge initFromPersonNode:toPetNode:](self, "initFromPersonNode:toPetNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("IS_OWNER_OF");
  return CFSTR("IS_OWNER_OF");
}

- (unsigned)domain
{
  return 304;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("IS_OWNER_OF"), 304);
}

@end
