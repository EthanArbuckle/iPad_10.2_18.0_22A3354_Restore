@implementation PGGraphPetPresentEdge

- (id)initFromPetNode:(id)a3 toMomentNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPetPresentEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPetPresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPetPresentEdge *)-[PGGraphPetPresentEdge initFromPetNode:toMomentNode:](self, "initFromPetNode:toMomentNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("PET_IS_PRESENT");
  return CFSTR("PET_IS_PRESENT");
}

- (unsigned)domain
{
  return 304;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("PET_IS_PRESENT"), 304);
}

@end
