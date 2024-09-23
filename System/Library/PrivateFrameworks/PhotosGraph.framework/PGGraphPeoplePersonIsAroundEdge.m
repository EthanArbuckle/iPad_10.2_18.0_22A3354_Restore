@implementation PGGraphPeoplePersonIsAroundEdge

- (id)initFromPersonNode:(id)a3 toMomentNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPeoplePersonIsAroundEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPeoplePersonIsAroundEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPeoplePersonIsAroundEdge *)-[PGGraphPeoplePersonIsAroundEdge initFromPersonNode:toMomentNode:](self, "initFromPersonNode:toMomentNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("IS_AROUND");
  return CFSTR("IS_AROUND");
}

- (unsigned)domain
{
  return 300;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("IS_AROUND"), 300);
}

@end
