@implementation PGGraphPublicEventCategoryEdge

- (id)initFromPublicEventNode:(id)a3 toCategoryNode:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPublicEventCategoryEdge;
  return -[PGGraphEdge initWithSourceNode:targetNode:](&v5, sel_initWithSourceNode_targetNode_, a3, a4);
}

- (PGGraphPublicEventCategoryEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPublicEventCategoryEdge *)-[PGGraphPublicEventCategoryEdge initFromPublicEventNode:toCategoryNode:](self, "initFromPublicEventNode:toCategoryNode:", a4, a5);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("CATEGORY");
  return CFSTR("CATEGORY");
}

- (unsigned)domain
{
  return 901;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", CFSTR("CATEGORY"), 901);
}

@end
